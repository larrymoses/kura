#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57024 "Inter Bank Transfer"
{
    DrillDownPageID = "Inter Bank Requisitions";
    LookupPageID = "Inter Bank Requisitions";

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,InterBank Requisition Voucher,AIE Funds Transfer';
            OptionMembers = " ","InterBank Requisition Voucher","AIE Funds Transfer";
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Source Bank Account No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No." where("Global Dimension 1 Code" = filter('R48'));

            trigger OnValidate()
            begin
                if ObjBankAcc.Get("Source Bank Account No") then
                    "Source Bank Account Name" := ObjBankAcc.Name;
            end;
        }
        field(6; "Source Bank Account Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Destination Bank Account No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                if ObjBankAcc.Get("Destination Bank Account No") then
                    "Destination Bank Name" := ObjBankAcc.Name;
            end;
        }
        field(8; "Destination Bank Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Direct Transfer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                if ObjRC.Get("Region Code") then
                    "Region Name" := ObjRC.Name;
            end;
        }
        field(11; "Region Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Branch Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Branch));

            trigger OnValidate()
            begin
                if ObjRC.Get("Branch Code") then
                    "Branch Name" := ObjRC.Name;
            end;
        }
        field(13; "Branch Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Constituency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                          Blocked = const(false),
                                                          "Region Code" = field("Region Code"));

            trigger OnValidate()
            begin
                if ObjRC.Get("Constituency Code") then
                    "Constituency Name" := ObjRC.Name
            end;
        }
        field(15; "Constituency Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(17; "Originating Trans. Voucher No"; Code[20])
        {
            Caption = 'AIE Voucher No';
            DataClassification = ToBeClassified;
            TableRelation = "Inter Bank Transfer"."Document No" where("Document Type" = filter("AIE Funds Transfer"),
                                                                       "Approval Status" = filter(Released));

            trigger OnValidate()
            begin
                InterBankTransLine.Reset;
                InterBankTransLine.SetRange(InterBankTransLine."Document No", "Originating Trans. Voucher No");
                InterBankTransLine.SetRange(InterBankTransLine."Document Type", InterBankTransLine."document type"::"InterBank Requisition Voucher");
                if InterBankTransLine.FindSet then
                    InterBankTransLine.DeleteAll;


                InterBankTransLine.Reset;
                InterBankTransLine.SetRange(InterBankTransLine."Document No", "Originating Trans. Voucher No");
                InterBankTransLine.SetRange(InterBankTransLine."Document Type", InterBankTransLine."document type"::"AIE Funds Transfer");
                if InterBankTransLine.FindSet(true) then
                    repeat
                        ObjInterBTLine.Init;
                        ObjInterBTLine.TransferFields(InterBankTransLine);
                        ObjInterBTLine."Document No" := "Document No";
                        ObjInterBTLine."Document Type" := ObjInterBTLine."document type"::"InterBank Requisition Voucher";
                        ObjInterBTLine.Insert(true);
                    until InterBankTransLine.Next = 0;
            end;
        }
        field(18; Amount; Decimal)
        {
            CalcFormula = sum("Inter Bank Transfer Line".Amount where("Document No" = field("Document No"),
                                                                       "Document Type" = field("Document Type")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                if "Currency Code" = '' then
                    "Amount(LCY)" := Amount;
            end;
        }
        field(19; "Amount(LCY)"; Decimal)
        {
            CalcFormula = sum("Inter Bank Transfer Line"."Amount(LCY)" where("Document No" = field("Document No"),
                                                                              "Document Type" = field("Document Type")));
            FieldClass = FlowField;
        }
        field(20; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Open;

            OptionCaption = ' ,Open,Pending Approval,Cancelled,Released';
            OptionMembers = " ",Open,"Pending Approval",Cancelled,Released;
        }
        field(21; "Disbursement Posted"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Disbursement Posted" = true then begin
                    Cinfo.Get;
                    InterBankTransLine.Reset;
                    InterBankTransLine.SetRange("Document No", Rec."Document No");
                    InterBankTransLine.SetRange("Document Type", Rec."Document Type");
                    if InterBankTransLine.FindSet then
                        repeat
                            SenderEmailAddress := Cinfo."Administrator Email";
                            SenderName := UpperCase(COMPANYNAME);
                            if Bank.Get(InterBankTransLine."Bank Account No") then
                                RecepientsMail := Bank."AIE Email Address";
                            Subject := 'FUNDS DISBURSEMENT';
                            Body := '<br>Dear Sir/Madam,</br>';
                            Body := Body + 'Please note that funds amounting to' + ' KES ' + Format(Amount) + ' ' + 'has been disbursed into your bank account.';
                        //  Factory.FnSendEmail(SenderEmailAddres SenderName, RecepientsMail, Subject, t,Body);
                        until InterBankTransLine.Next = 0;
                end;
            end;
        }
        field(22; "Receipt Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(29; Select; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Select = true then
                    "Selected By" := UserId
                else
                    "Selected By" := '';
                if Select = true then begin
                    ObjInterBTLine.Reset;
                    ObjInterBTLine.SetRange(ObjInterBTLine."Document No", "Document No");
                    ObjInterBTLine.SetRange(ObjInterBTLine."Document Type", "Document Type");
                    if ObjInterBTLine.FindSet then begin
                        repeat
                            ObjInterBTLine.Selected := true;
                            ObjInterBTLine.Modify;
                        until ObjInterBTLine.Next = 0;
                    end;
                end;

                if Select = false then begin
                    ObjInterBTLine.Reset;
                    ObjInterBTLine.SetRange(ObjInterBTLine."Document No", "Document No");
                    ObjInterBTLine.SetRange(ObjInterBTLine."Document Type", "Document Type");
                    if ObjInterBTLine.FindSet then begin
                        repeat
                            ObjInterBTLine.Selected := false;
                            ObjInterBTLine.Modify;
                        until ObjInterBTLine.Next = 0;
                    end;
                end;
            end;
        }
        field(30; "Selected By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Responsibility Center"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(32; "Payables Account(HQ)"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(33; "Funding Source Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));
        }
        field(34; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                          Blocked = const(false));
        }
        field(35; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where(exchequer = filter(true));
        }
        field(36; "Project Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "From Doc Number"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(38; Suggested; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "From Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,InterBank Requisition Voucher,AIE Funds Transfer';
            OptionMembers = " ","InterBank Requisition Voucher","AIE Funds Transfer";
        }
        field(50; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Region Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(52; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 2 Code");
            end;
        }
        field(53; "Region Trasnsfered To"; Text[250])
        {
            CalcFormula = lookup("Inter Bank Transfer Line"."Region Name" where("Document No" = field("Document No"),
                                                                                 "Document Type" = field("Document Type")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(54; "Activity Description"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "AIE Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No" = '' then begin
            ObjCashSetup.Get();
            if "Document Type" = "document type"::"InterBank Requisition Voucher" then begin
                ObjCashSetup.TestField("AIE Requisition Nos");
                ObjNoSeriesMgt.InitSeries(ObjCashSetup."AIE Requisition Nos", xRec."No. Series", Today, "Document No", "No. Series");
            end;
        end;

        if "Document No" = '' then begin
            ObjCashSetup.Get();
            if "Document Type" = "document type"::"AIE Funds Transfer" then begin
                ObjCashSetup.TestField("AIE Funds Transfer Nos");
                ObjNoSeriesMgt.InitSeries(ObjCashSetup."AIE Funds Transfer Nos", xRec."No. Series", Today, "Document No", "No. Series");
            end;
        end;

        "Document Date" := Today;
        "Created By" := UpperCase(UserId);
        "Created Date" := Today;
        "Created Time" := Time;
        //MESSAGE('%1', "Document Type");

        if UserSetup.Get(UserId) then begin
            UserSetup.TestField(UserSetup."Purchase Resp. Ctr. Filter");
            "Responsibility Center" := UserSetup."Purchase Resp. Ctr. Filter";
            if Emp.Get(UserSetup."Employee No.") then begin
                "Region Code" := "Responsibility Center";
                //VALIDATE("Region Code");
                //"Constituency Code":=Emp."Global Dimension 2 Code";
                //VALIDATE("Constituency Code");
                //"Department Code":=Emp."Department Code";
            end;
        end;

        if UserSetup.Get(UserId) then begin
            if ((UserSetup."Region Code" <> 'R11') or (UserSetup."Purchase Resp. Ctr. Filter" <> 'R11')) then
                Error('This document is only limited to HQ');
        end;
    end;

    var
        ObjCashSetup: Record "Cash Management Setup";
        ObjNoSeriesMgt: Codeunit NoSeriesManagement;
        ObjBankAcc: Record "Bank Account";
        ObjRC: Record "Responsibility Center";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CashMgt: Record "Cash Management Setup";
        JobRec: Record Job;
        ResourceRec: Record Resource;
        TaskRec: Record "Job Task";
        UserSetup: Record "User Setup";
        ImprestMemo: Record "Imprest Memo";
        CustRec: Record Customer;
        varDaysApplied: Integer;
        ReturnDateLoop: Boolean;
        mWeekDay: Integer;
        mMinDays: Integer;
        HRSetup: Record "Human Resources Setup";
        BaseCalendarChange: Record "Base Calendar Change";
        Weekend: Boolean;
        VarDate: Date;
        test: Integer;
        TargetDate: Date;
        SourceDate: Date;
        CalendarMgt: Codeunit "Calendar Management";
        NonWorking: Boolean;
        DateDscr: Text[30];
        CurrencyCode: Code[10];
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        safTeam: Record "Project Members";
        others: Record "Other Costs";
        Bank: Record "Bank Account";
        DimMgt: Codeunit DimensionManagement;
        InterBankTransLine: Record "Inter Bank Transfer Line";
        Emp: Record Employee;
        Text000: label 'Cash management setup does''nt exist';
        Text001: label 'Create an Imprest A/C for Employee No. %1 under the Employee Card \Please contact system Administrator';
        Text002: label 'Cheque No. already exists';
        Text003: label 'Another Project Imprest Memo No %1 you created is still Open, Please check or reuse it!';
        Text004: label 'Deleting Imprest memo No. %1 Will create a gap in number series for Imprest memos which will Raise Audit Queries. ';
        Text005: label 'You are currently not allowed to Apply for Imprest, Kindly seek advice from Accounts and Finance office.';
        Text006: label 'Another Project Imprest Surrender Memo No %1 you created is still Open, Please check or reuse it!';
        Text007: label 'You have an Outstanding Imprest Amounting to %1 that you need to clear before raising another imprest. Kindly clear with Finance.';
        Text008: label 'Days Applied For cannot be negative';
        Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
        Factory: Codeunit "Insurance Notifications";
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        RecepientsMail: Text[250];
        Subject: Text[250];
        Body: Text[250];
        Cinfo: Record "Company Information";
        ObjInterBTLine: Record "Inter Bank Transfer Line";
        InterBankTransfer: Record "Inter Bank Transfer";
        LineNo: Integer;
        BankListAll: Page "Bank List All";


    procedure FnPostInterFundTransfer(ObjInterBTrans: Record "Inter Bank Transfer")
    var
        ObjInterBTLines: Record "Inter Bank Transfer Line";
        GenJournalLine: Record "Gen. Journal Line";
    begin

        ObjCashSetup.Get;
        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", ObjCashSetup."PV Journal Template");
        GenJournalLine.SetRange("Journal Batch Name", ObjCashSetup."PV Journal Batch Name");
        if GenJournalLine.FindSet then
            GenJournalLine.DeleteAll;




        //Cr HQ Source Account
        GenJournalLine.Init;
        GenJournalLine."Journal Template Name" := ObjCashSetup."PV Journal Template";
        GenJournalLine."Journal Batch Name" := ObjCashSetup."PV Journal Batch Name";
        GenJournalLine."Document No." := ObjInterBTrans."Document No";
        GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
        GenJournalLine."Account No." := ObjInterBTrans."Source Bank Account No";
        GenJournalLine.Validate("Account No.");
        Message(GenJournalLine."Account No.");
        ObjInterBTrans.CalcFields(Amount, "Amount(LCY)");
        GenJournalLine.Amount := -ObjInterBTrans.Amount;
        Message(Format(GenJournalLine.Amount));
        GenJournalLine.Validate(Amount);
        GenJournalLine."Posting Date" := ObjInterBTrans."Posting Date";
        GenJournalLine.Description := ObjInterBTrans.Description;
        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", ObjCashSetup."PV Journal Template");
        GenJournalLine.SetRange("Journal Batch Name", ObjCashSetup."PV Journal Batch Name");
        if GenJournalLine.FindLast then
            GenJournalLine."Line No." := GenJournalLine."Line No." + 1000
        else
            GenJournalLine."Line No." := 1000;
        if GenJournalLine.Amount <> 0 then
            GenJournalLine.Insert(true);

        //Dr InterFund Control Account
        ObjCashSetup.Get;
        GenJournalLine.Init;
        GenJournalLine."Journal Template Name" := ObjCashSetup."PV Journal Template";
        GenJournalLine."Journal Batch Name" := ObjCashSetup."PV Journal Batch Name";
        GenJournalLine."Document No." := ObjInterBTrans."Document No";
        GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
        GenJournalLine."Account No." := ObjCashSetup."AIE Inter Fund Bank Account";
        Message(GenJournalLine."Account No.");
        GenJournalLine.Validate("Account No.");
        ObjInterBTrans.CalcFields(Amount, "Amount(LCY)");
        GenJournalLine.Amount := ObjInterBTrans.Amount;
        Message(Format(GenJournalLine.Amount));
        GenJournalLine.Validate(Amount);
        GenJournalLine."Posting Date" := ObjInterBTrans."Posting Date";
        GenJournalLine.Description := ObjInterBTrans.Description;
        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", ObjCashSetup."PV Journal Template");
        GenJournalLine.SetRange("Journal Batch Name", ObjCashSetup."PV Journal Batch Name");
        if GenJournalLine.FindLast then
            GenJournalLine."Line No." := GenJournalLine."Line No." + 1000
        else
            GenJournalLine."Line No." := 1000;
        if GenJournalLine.Amount <> 0 then
            GenJournalLine.Insert;
    end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        // OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set I D",StrSubstNo('%1 % "Document Type", e","Document No"),
        //     "Shortcut Dimension 1 Cod e","Shortcut Dimension 2 Code");

        // if OldDimSetID <> "Dimension Set ID" then begin
        //     Modify;

        // end;
    end;

    local procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        NewDimSetID: Integer;
        ReceivedShippedItemLineDimChangeConfirmed: Boolean;
    begin
        // Update all lines with changed dimensions.

        if NewParentDimSetID = OldParentDimSetID then
            exit;
        if not Confirm(Text051) then
            exit;

        InterBankTransLine.Reset;
        InterBankTransLine.SetRange("Document Type", "Document Type");
        InterBankTransLine.SetRange("Document No", "Document No");
        InterBankTransLine.LockTable;
        if InterBankTransLine.Find('-') then
            repeat
                NewDimSetID := DimMgt.GetDeltaDimSetID(InterBankTransLine."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
                if InterBankTransLine."Dimension Set ID" <> NewDimSetID then begin
                    InterBankTransLine."Dimension Set ID" := NewDimSetID;


                    DimMgt.UpdateGlobalDimFromDimSetID(
                      InterBankTransLine."Dimension Set ID", InterBankTransLine."Shortcut Dimension 1 Code", InterBankTransLine."Shortcut Dimension 2 Code");
                    InterBankTransLine.Modify;
                end;
            until InterBankTransLine.Next = 0;
    end;

    procedure PurchLinesExist(): Boolean
    begin
        InterBankTransLine.Reset;
        InterBankTransLine.SetRange("Document Type", "Document Type");
        InterBankTransLine.SetRange("Document No", "Document No");
        exit(InterBankTransLine.FindFirst);
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        //VerifyItemLineDim;
    end;

    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
    end;

    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;

    procedure ShowDimensions() IsChanged: Boolean
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', "Document Type", "Document No"));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        IsChanged := OldDimSetID <> "Dimension Set ID";
    end;
}

