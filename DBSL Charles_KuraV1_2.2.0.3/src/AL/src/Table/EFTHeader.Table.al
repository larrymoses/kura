#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57018 "EFT Header"
{
    //DrillDownPageID = UnknownPage39004357;
    //  LookupPageID = UnknownPage39004357;

    fields
    {
        field(1; No; Code[20])
        {

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    NoSetup.Get();
                    NoSeriesMgt.TestManual(NoSetup."EFT Header Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(3; Transferred; Boolean)
        {
            Editable = false;
        }
        field(4; "Date Transferred"; Date)
        {
            Editable = false;
        }
        field(5; "Time Transferred"; Time)
        {
            Editable = false;
        }
        field(6; "Transferred By"; Text[20])
        {
            Editable = false;
        }
        field(7; "Date Entered"; Date)
        {
        }
        field(8; "Time Entered"; Time)
        {
        }
        field(9; "Entered By"; Text[30])
        {
        }
        field(10; Remarks; Text[150])
        {
        }
        field(11; "Payee Bank Name"; Text[50])
        {
        }
        field(12; "Bank  No"; Code[20])
        {
            TableRelation = "Bank Account";

            trigger OnValidate()
            begin

                Banks.Reset;
                if Banks.Get("Bank  No") then begin
                    "Payee Bank Name" := Banks.Name;
                end;
            end;
        }
        field(13; "Salary Processing No."; Code[20])
        {
        }
        field(14; "Salary Options"; Option)
        {
            OptionMembers = "Add To Existing","Replace Lines";
        }
        field(15; Total; Decimal)
        {
            CalcFormula = sum("EFT Details".Amount where("Header No" = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Total Count"; Integer)
        {
            CalcFormula = count("EFT Details" where("Header No" = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; RTGS; Boolean)
        {

            trigger OnValidate()
            begin
                EFTDetails.Reset;
                EFTDetails.SetRange(EFTDetails."Header No", No);
                if EFTDetails.Find('-') then begin
                    repeat
                        if Accounts.Get(EFTDetails."Account No") then begin

                            /*
                          IF AccountTypes.GET(Accounts."Account Type") THEN BEGIN
                          IF EFTDetails."Destination Account Type" = EFTDetails."Destination Account Type"::External THEN
                          EFTDetails.Charges:=AccountTypes."External EFT Charges"
                          ELSE
                          EFTDetails.Charges:=AccountTypes."Internal EFT Charges";

                          AccountTypes.TESTFIELD(AccountTypes."EFT Charges Account");
                          EFTDetails."EFT Charges Account":=AccountTypes."EFT Charges Account";

                          IF RTGS = TRUE THEN BEGIN
                          EFTDetails.Charges:=AccountTypes."RTGS Charges";
                          AccountTypes.TESTFIELD(AccountTypes."RTGS Charges Account");
                          EFTDetails."EFT Charges Account":=AccountTypes."RTGS Charges Account";
                          END;

                          END;
                          */
                        end;


                        EFTDetails.Modify;
                    until EFTDetails.Next = 0;
                end;

            end;
        }
        field(18; "Document No. Filter"; Code[250])
        {
            FieldClass = FlowFilter;
        }
        field(19; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(20; "Cheque No"; Code[20])
        {
        }
        field(21; "Responsibility Center"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Transferred = true then
            Error('You cannot delete an already posted record.');
    end;

    trigger OnInsert()
    begin
        if No = '' then begin
            NoSetup.Get();
            NoSetup.TestField(NoSetup."EFT Header Nos.");
            NoSeriesMgt.InitSeries(NoSetup."EFT Header Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;


        "Date Entered" := Today;
        "Time Entered" := Time;
        "Entered By" := UserId;


        //Fred Rc
        if UserSetup.Get(UserId) then
            "Responsibility Center" := UserSetup."Purchase Resp. Ctr. Filter";
    end;

    trigger OnModify()
    begin
        if Transferred = true then
            Error('You cannot modify an already posted record.');
    end;

    var
        NoSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Accounts: Record Vendor;
        Members: Record Vendor;
        AccountHolders: Record Vendor;
        Banks: Record "Bank Account";
        BanksList: Record "Bank Account";
        EFTDetails: Record "EFT Details";
        UserSetup: Record "User Setup";
}

