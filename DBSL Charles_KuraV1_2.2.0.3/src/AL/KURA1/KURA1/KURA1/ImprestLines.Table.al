#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57001 "Imprest Lines"
{
    DrillDownPageID = "Imprest Lines";
    LookupPageID = "Imprest Lines";

    fields
    {
        field(1; No; Code[20])
        {
            TableRelation = payments;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(4; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account" where(Blocked = filter(false))
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset" where(Blocked = filter(false))
            else
            if ("Account Type" = const(Customer)) Customer
            else
            if ("Account Type" = const("Bank Account")) "Bank Account Ledger Entry"
            else
            if ("Account Type" = const(Vendor)) Vendor;

            trigger OnValidate()
            begin
                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            GLAccount.Get("Account No.");
                            GLAccount.TestField("Direct Posting", true);
                            "Account Name" := GLAccount.Name;
                            UpdateCommitment();
                        end;
                    "account type"::Vendor:
                        begin
                            Vendor.Get("Account No.");
                            "Account Name" := Vendor.Name;
                        end;
                    "account type"::Customer:
                        begin
                            Customer.Get("Account No.");
                            "Account Name" := Customer.Name;
                        end;
                    "account type"::"Bank Account":
                        begin
                            Bank.Get("Account No.");
                            "Account Name" := Bank.Name;
                        end;
                    "account type"::"Fixed Asset":
                        begin
                            FixedAsset.Get("Account No.");
                            "Account Name" := FixedAsset.Description;
                        end;
                end;

                Validate(Amount);

                ImprestHeader.Reset;
                ImprestHeader.SetRange(ImprestHeader."No.", No);
                if ImprestHeader.FindSet() then begin
                    //IF ImprestHeader."Account Type"=ImprestHeader."Account Type"::Employee THEN BEGIN
                    if ImprestHeader."Account No." <> '' then begin
                        "Employee No" := ImprestHeader."Account No.";
                    end;
                end;
                //END;
            end;
        }
        field(5; "Account Name"; Text[100])
        {
        }
        field(6; Description; Text[200])
        {
        }
        field(7; Amount; Decimal)
        {

            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
                GenLedSetup: Record "General Ledger Setup";
                BudgetAmount: Decimal;
                Expenses: Decimal;
                BudgetAvailable: Decimal;
                Committments: Record "Committment Entries";
                CommittedAmount: Decimal;
                CommitmentEntries: Record "Committment Entries";
                ImprestHeader: Record payments;
                TotalCommittedAmount: Decimal;
                CurrExchRate: RECORD "Currency Exchange Rate";
                "Exchange Factor": Decimal;
                "Exchange Rate": Decimal;
            begin

                if rec."Currency Code" <> '' then begin
                    CurrExchRate.Reset();
                    CurrExchRate.SetRange(CurrExchRate."Currency Code", rec."Currency Code");
                    CurrExchRate.SetRange(CurrExchRate."Starting Date", 0D, Today);
                    if CurrExchRate.find('+') then begin
                        "Exchange Rate" := CurrExchRate."Relational Exch. Rate Amount";
                        if CurrExchRate."Relational Exch. Rate Amount" <> 0 then
                            "Exchange Factor" := CurrExchRate."Exchange Rate Amount" / CurrExchRate."Relational Exch. Rate Amount";
                    end;
                  ConvertedAmount:=  CurrExchRate.ExchangeAmtFCYToLCY(Today, "Currency Code", Amount, "Exchange Factor");
                end else
                    ConvertedAmount := rec."Amount";
                //MESSAGE('%1', ConvertedAmount);

                CashMgt.Get;
                if CashMgt."Check for Committment" then begin
                    //Confirm the Amount to be issued does not exceed the budget and amount Committed
                    //Get Budget for the G/L
                    CashMgt.Get;
                    GLAccount.SetFilter(GLAccount."Budget Filter", CashMgt."Current Budget");
                    GLAccount.SetRange(GLAccount."No.", "Account No.");
                    //Get budget amount avaliable
                    GLAccount.SetRange(GLAccount."Date Filter", CashMgt."Current Budget Start Date", CashMgt."Current Budget End Date");
                    if GLAccount.Find('-') then begin
                        GLAccount.CalcFields(GLAccount."Budgeted Amount", GLAccount."Net Change");
                        BudgetAmount := GLAccount."Budgeted Amount";
                        Expenses := GLAccount."Net Change";
                        BudgetAvailable := GLAccount."Budgeted Amount" - GLAccount."Net Change";
                    end;
                    //Get committed Amount
                    CommittedAmount := 0;
                    CommitmentEntries.Reset;
                    CommitmentEntries.SetCurrentkey(CommitmentEntries.Account);
                    CommitmentEntries.SetRange(CommitmentEntries.Account, "Account No.");

                    ImprestHeader.Reset;
                    ImprestHeader.SetRange(ImprestHeader."No.", No);
                    if ImprestHeader.Find('-') then begin
                        if ImprestHeader.Date = 0D then
                            Error(Text000);
                        CommitmentEntries.SetRange(CommitmentEntries."Commitment Date", CashMgt."Current Budget Start Date",
                                                  ImprestHeader.Date);
                        CommitmentEntries.CalcSums(CommitmentEntries."Committed Amount");
                        CommittedAmount := CommitmentEntries."Committed Amount";

                        /*IF LineBudget(No,"Account No.","Line No")THEN
                           MESSAGE('Line No %1 has been included in the Budget',"Line No")
                        ELSE*/
                        /*
                     IF Rec."Account Type" = "Account Type"::"G/L Account" THEN
                         IF CommittedAmount + Amount>BudgetAvailable THEN
                             ERROR(Text001,"Account No.",ABS(BudgetAvailable - (CommittedAmount+Amount)),BudgetAvailable,CommittedAmount);
                    END;*/
                    end;
                end;

            end;
        }
        field(8; "Applies- to Doc. No."; Code[20])
        {
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger onvalidate()
            begin
                if "Account Type" = "Account Type"::"G/L Account" then
                    UpdateCommitment();
            end;
        }
        field(10; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            trigger onvalidate()
            begin
                if "Account Type" = "Account Type"::"G/L Account" then
                    UpdateCommitment();
            end;
        }
        field(11; "Actual Spent"; Decimal)
        {

            trigger OnValidate()
            begin
                "Remaining Amount" := Amount - "Actual Spent" - "Cash Receipt Amount";
                /*IF "Remaining Amount"<0 THEN
                  ERROR('Remaining amount must not be less than 0');*/

                ImprestHeader.Reset;
                ImprestHeader.SetRange(ImprestHeader."No.", Rec.No);
                // ImprestHeader.SETRANGE(ImprestHeader."Account Type",ImprestHeader."Account Type"::Employee);
                if ImprestHeader.FindSet then begin
                    "Employee No" := ImprestHeader."Account No.";
                    Message("Employee No");
                end;

            end;
        }
        field(12; "Remaining Amount"; Decimal)
        {
        }
        field(13; Committed; Boolean)
        {
        }
        field(14; "Advance Type"; Code[20])
        {
            TableRelation = "Receipts and Payment Types1" where("Appear on Imprest?" = filter(true));

            trigger OnValidate()
            begin
                if TransType.Get("Advance Type") then begin
                    "Account Type" := TransType."Account Type";
                    "Account No." := TransType."G/L Account";
                    Validate("Account No.");
                    Description := TransType."Transation Remarks";
                end;
                Validate(Amount);
            end;
        }
        field(15; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(16; "Currency Factor"; Decimal)
        {
        }
        field(17; "Amount LCY"; Decimal)
        {
        }
        field(18; "Expense Type"; Option)
        {
            OptionCaption = 'Accountable Expenses,Non-Accountable Expenses';
            OptionMembers = "Accountable Expenses","Non-Accountable Expenses";
        }
        field(19; "Work Type"; Code[20])
        {
            TableRelation = "Work Type";
        }
        field(20; "Resource No."; Code[20])
        {
            TableRelation = Resource;
        }
        field(21; "Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field(Project));
        }
        field(22; Project; Code[20])
        {
            FieldClass = Normal;
            TableRelation = Job;
        }
        field(23; "Due Date"; Date)
        {
        }
        field(24; "Imprest Holder"; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                /*
                ImprestHeader.RESET;
                ImprestHeader.SETRANGE(ImprestHeader."No.",No);
                IF ImprestHeader.FIND('-') THEN
                REPEAT
                "Imprest Holder":=ImprestHeader."Account No.";
                  UNTIL ImprestLines.NEXT=0;
                  */

            end;
        }
        field(42; "Job No."; Code[20])
        {
            FieldClass = Normal;
            TableRelation = Job;
        }
        field(54; Purpose; Text[1000])
        {
            NotBlank = true;
        }
        field(79; "Budgetary Control A/C"; Boolean)
        {
        }
        field(88; Destination; Code[20])
        {
            TableRelation = "Split Header";

            trigger OnValidate()
            begin
                /*
                IF Master.GET(No) AND Subsistence THEN
                IF Cust.GET(Master."Account No.") THEN
                IF HREmp.GET(Cust."Staff No.") THEN BEGIN
                LocalT.GET(Destination);
                CASE HREmp.Grade OF
                 LocalT.FIELDNAME(LocalT."1"):
                      "Daily Rate":=LocalT."1";
                 LocalT.FIELDNAME(LocalT."2"):
                       "Daily Rate":=LocalT."2";
                 LocalT.FIELDNAME(LocalT."3"):
                       "Daily Rate":=LocalT."3";
                 LocalT.FIELDNAME(LocalT."4"):
                       "Daily Rate":=LocalT."4";
                 LocalT.FIELDNAME(LocalT."5"):
                       "Daily Rate":=LocalT."5";
                 LocalT.FIELDNAME(LocalT."6"):
                       "Daily Rate":=LocalT."6";
                 LocalT.FIELDNAME(LocalT."7"):
                       "Daily Rate":=LocalT."7";
                 LocalT.FIELDNAME(LocalT."8"):
                       "Daily Rate":=LocalT."8";
                 LocalT.FIELDNAME(LocalT."9"):
                       "Daily Rate":=LocalT."9";
                 LocalT.FIELDNAME(LocalT."10"):
                       "Daily Rate":=LocalT."10";
                 LocalT.FIELDNAME(LocalT."11"):
                       "Daily Rate":=LocalT."11";
                 LocalT.FIELDNAME(LocalT."12"):
                       "Daily Rate":=LocalT."12";
                 LocalT.FIELDNAME(LocalT.A):
                       "Daily Rate":=LocalT.A;
                 LocalT.FIELDNAME(LocalT.B):
                       "Daily Rate":=LocalT.B;
                 LocalT.FIELDNAME(LocalT.C):
                       "Daily Rate":=LocalT.C;
                 LocalT.FIELDNAME(LocalT.D):
                       "Daily Rate":=LocalT.D;
                 LocalT.FIELDNAME(LocalT.E):
                       "Daily Rate":=LocalT.E;
                 LocalT.FIELDNAME(LocalT.F):
                       "Daily Rate":=LocalT.F;
                 LocalT.FIELDNAME(LocalT.G):
                       "Daily Rate":=LocalT.G;
                 LocalT.FIELDNAME(LocalT.H):
                       "Daily Rate":=LocalT.H;
                 LocalT.FIELDNAME(LocalT.I):
                       "Daily Rate":=LocalT.I;
                 LocalT.FIELDNAME(LocalT.J):
                       "Daily Rate":=LocalT.J;
                 LocalT.FIELDNAME(LocalT.K):
                      "Daily Rate":=LocalT.K;
                 LocalT.FIELDNAME(LocalT.L):
                       "Daily Rate":=LocalT.L;
                 LocalT.FIELDNAME(LocalT.M):
                       "Daily Rate":=LocalT.M;
                 LocalT.FIELDNAME(LocalT.N):
                       "Daily Rate":=LocalT.N;
                 LocalT.FIELDNAME(LocalT.O):
                       "Daily Rate":=LocalT.O;
                 LocalT.FIELDNAME(LocalT.P):
                       "Daily Rate":=LocalT.P;
                 LocalT.FIELDNAME(LocalT.Q):
                       "Daily Rate":=LocalT.Q;
                 LocalT.FIELDNAME(LocalT.R):
                      "Daily Rate":=LocalT.R;
                 LocalT.FIELDNAME(LocalT.S):
                      "Daily Rate":=LocalT.S;
                 LocalT.FIELDNAME(LocalT.T):
                       "Daily Rate":=LocalT.T;
                END;
                //MODIFY;
                END;
                */

            end;
        }
        field(89; "Daily Rate"; Decimal)
        {

            trigger OnValidate()
            begin
                Validate("No. of Days");
            end;
        }
        field(90; "No. of Days"; Integer)
        {

            trigger OnValidate()
            var
                othercosts: record "Other costs";
                qty: integer;
                ImpMemo: Code[20];
                PaymentsV: Record Payments;
            begin
                //cc

                PaymentsV.Reset();
                PaymentsV.SetRange("No.", Rec.No);
                if PaymentsV.FindFirst() then begin
                    ImpMemo := PaymentsV."Imprest Memo No";
                    qty := 1;
                    othercosts.reset;
                    othercosts.setrange(othercosts."Required For", rec.Purpose);
                    othercosts.setrange(othercosts."Employee No To Surrender", rec."Employee No");
                    othercosts.SetRange("No.", ImpMemo);
                    if othercosts.FindFirst() then begin
                        quantity := othercosts."Quantity Required";
                    end;
                end;
                qty := 1;
                if Rec.Quantity = 0 then
                    Rec.Quantity := qty;

                Amount := Rec."No. of Days" * Rec."Daily Rate" * Rec.Quantity;
                Validate(Amount);
            end;
        }
        field(91; Subsistence; Boolean)
        {
        }
        field(92; "Cash Receipt Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                Validate("Actual Spent");
            end;
        }
        field(93; "Receipt No."; Code[20])
        {
            TableRelation = if ("Employee No" = filter(<> '')) "Receipts Header1"."No." where("Employee No" = field("Employee No"), Posted = filter(true));

            trigger OnValidate()
            begin
                ReceiptRec.Reset;
                ReceiptRec.SetRange("No.", "Receipt No.");
                if ReceiptRec.FindFirst then
                    ReceiptRec.CalcFields(Amount);
                "Cash Receipt Amount" := ReceiptRec.Amount;
                "Fully Allocated" := true;
                Validate("Cash Receipt Amount");
            end;
        }
        field(94; "Fully Allocated"; Boolean)
        {
        }
        field(1001; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));

            trigger OnValidate()
            begin
                /*IF "Job Task No." <> xRec."Job Task No." THEN
                  VALIDATE("Job Planning Line No.",0);
                IF "Job Task No." = '' THEN BEGIN
                  "Job Quantity" := 0;
                  "Job Currency Factor" := 0;
                  "Job Currency Code" := '';
                  "Job Unit Price" := 0;
                  "Job Total Price" := 0;
                  "Job Line Amount" := 0;
                  "Job Line Discount Amount" := 0;
                  "Job Unit Cost" := 0;
                  "Job Total Cost" := 0;
                  "Job Line Discount %" := 0;
                
                  "Job Unit Price (LCY)" := 0;
                  "Job Total Price (LCY)" := 0;
                  "Job Line Amount (LCY)" := 0;
                  "Job Line Disc. Amount (LCY)" := 0;
                  "Job Unit Cost (LCY)" := 0;
                  "Job Total Cost (LCY)" := 0;
                  EXIT;
                END;
                
                IF JobTaskIsSet THEN BEGIN
                  CreateTempJobJnlLine;
                  CopyDimensionsFromJobTaskLine;
                  UpdatePricesFromJobJnlLine;
                END;
                */

            end;
        }
        field(1004; "Job Quantity"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            Caption = 'Job Quantity';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                /*IF JobTaskIsSet THEN BEGIN
                  IF "Job Planning Line No." <> 0 THEN
                    VALIDATE("Job Planning Line No.");
                  CreateTempJobJnlLine;
                  UpdatePricesFromJobJnlLine;
                END;
                */

            end;
        }
        field(1005; "Employee No"; Code[20])
        {

            TableRelation = Employee."No.";
        }
        field(50000; Status; Option)
        {
            CalcFormula = lookup(payments.Status where("No." = field(No)));
            Editable = true;
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,Closed;
        }
        field(50001; "Job Task Description"; Text[250])
        {
            Caption = 'Job Task Description';
            Editable = false;
        }
        field(50002; "Payment Type"; Option)
        {
            CalcFormula = lookup(payments."Payment Type" where("No." = field(No)));
            FieldClass = FlowField;
            OptionCaption = 'Payment Voucher,Imprest,Staff Claim,Imprest Surrender,Petty Cash,Bank Transfer,Petty Cash Surrender';
            OptionMembers = "Payment Voucher",Imprest,"Staff Claim","Imprest Surrender","Petty Cash","Bank Transfer","Petty Cash Surrender";
        }
        field(50003; "ConvertedAmount"; Decimal)
        {

        }
        field(50004; Quantity; Decimal)
        {
            Editable = false;
        }
        field(50005; "Committed Amount"; Decimal)
        {

        }
        field(50006; "Budgeted Amount"; Decimal)
        {

        }
        field(50007; "Available Amount"; Decimal)
        {

        }
        field(50008; "Account Actual Spent"; Decimal)
        {

        }

    }

    keys
    {
        key(Key1; No, "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //RESTRICT DELETE OF APPROVED LINES ON IMPREST DAVID
        TestField(Status, Status::Open);
        UpdateEntries(Rec);
    end;

    trigger OnInsert()
    begin
        ImprestHeader.Reset;
        ImprestHeader.SetRange(ImprestHeader."No.", Rec.No);
        // ImprestHeader.SETRANGE(ImprestHeader."Account Type",ImprestHeader."Account Type"::Employee);
        if ImprestHeader.FindSet then begin
            "Employee No" := ImprestHeader."Account No.";
            Message("Employee No");
        end;
    end;

    trigger OnModify()
    begin
        //Ushindi...Only modify lines if Imprest is OPEN
        // IF ImprestHeader.GET(No) THEN BEGIN
        //   IF ImprestHeader.Status=ImprestHeader.Status::"Pending Approval"
        //     THEN ERROR('%1 is Pending Approval, You are not allowed to modify it!',No);
        // END;
    end;


    var
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        Amt: Decimal;
        ImprestHeader: Record payments;
        TransType: Record "Receipts and Payment Types1";
        CashMgt: Record "Cash Management Setup";
        Text000: label 'Please insert the imprest date';
        Text001: label 'You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4';
        ReceiptRec: Record "Receipts Header1";
        Text002: label 'You cannot delete this document! Document number No. %1 Is already approved or pending approval.';
        PVHeader: Record payments;

    Local Procedure UpdateCommitment()
    var
        CustomFunction: Codeunit "Custom Function";
        Payments: Record Payments;
    begin
        Payments.Reset();
        Payments.SetRange("No.", No);
        if Payments.findfirst() then begin
            "Budgeted Amount" := CustomFunction.GetBudgtedAmount("Account No.", Payments."Shortcut Dimension 1 Code", Payments."Shortcut Dimension 2 Code", Payments."Shortcut Dimension 3 Code");
            "Account Actual Spent" := CustomFunction.GetActualSpent("Account No.", Payments."Shortcut Dimension 1 Code", Payments."Shortcut Dimension 2 Code", Payments."Shortcut Dimension 3 Code");

            "Committed Amount" := CustomFunction.GetCommittedAmount("Account No.", CustomFunction.GetBudgetYear(Payments.Date), Payments."Shortcut Dimension 1 Code", Payments."Shortcut Dimension 2 Code", Payments."Shortcut Dimension 3 Code");
        end;
        "Available Amount" := "Budgeted Amount" - ("Account Actual Spent" + "Committed Amount");
    end;

    procedure UpdateEntries(ImpLines: Record "Imprest Lines")
    var
        ProjectMembers: Record "Project Members";
        LineNo: Integer;
        ProjectMembers2: Record "Project Members";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
        PaymentRec: Record payments;
    begin
        if PaymentRec.Get(ImpLines.No) then;
        //Fetch Imprest Line based on Employee
        ProjectMembers.Reset;
        ProjectMembers.SetRange("No.", PaymentRec."Account No.");
        ProjectMembers.SetRange(Posted, true);
        ProjectMembers.SetRange(Linked, true);
        if ProjectMembers.Find('-') then begin
            repeat
                if not ProjectMembers."Project Lead" then//Check whether Project lead or not
                 begin
                    if (ProjectMembers."Work Type" = ImpLines."Work Type") and (ProjectMembers."No." = ImpLines."Resource No.") then begin
                        ProjectMembers.Linked := false;
                        //ProjectMembers.MODIFY;
                    end;
                end else begin

                    //Insert Machinery Costs
                    ProjectMembers2.Reset;
                    ProjectMembers2.SetRange(Type, ProjectMembers2.Type::Machine);
                    ProjectMembers2.SetRange(Posted, true);
                    ProjectMembers2.SetRange(Linked, true);
                    if ProjectMembers2.Find('-') then
                        repeat
                            if (ProjectMembers."Work Type" = ImpLines."Work Type") and (ProjectMembers2."No." = ImpLines."Resource No.") then begin
                                ProjectMembers2.Linked := false;
                                ProjectMembers2.Modify;
                            end;
                        until ProjectMembers2.Next = 0;

                    //Insert Casuals
                    Casuals.Reset;
                    Casuals.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                    Casuals.SetRange(Posted, true);
                    Casuals.SetRange(Linked, true);
                    if Casuals.Find('-') then
                        repeat
                            if (Casuals."Work Type" = ImpLines."Work Type") and (Casuals."Resource No." = ImpLines."Resource No.") then begin
                                Casuals.Linked := false;
                                Casuals.Modify;
                            end;
                        until Casuals.Next = 0;
                    //

                    //Insert Other Costs
                    OtherCosts.Reset;
                    OtherCosts.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                    OtherCosts.SetRange(Posted, true);
                    OtherCosts.SetRange(Linked, true);
                    if OtherCosts.Find('-') then
                        repeat
                            if OtherCosts."No." = ImpLines."Account No." then begin
                                OtherCosts.Linked := false;
                                OtherCosts.Modify;
                            end;
                        until OtherCosts.Next = 0;
                    //
                end;
                if (ProjectMembers."Work Type" = ImpLines."Work Type") and (ProjectMembers."No." = ImpLines."Resource No.") then begin
                    ProjectMembers.Linked := false;
                    ProjectMembers.Modify;
                end;
            until ProjectMembers.Next = 0;
        end;
    end;
}

