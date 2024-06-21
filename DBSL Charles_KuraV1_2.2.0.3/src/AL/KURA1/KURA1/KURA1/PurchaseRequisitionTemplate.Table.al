#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70139 "Purchase Requisition Template"
{
    DrillDownPageID = 72184;
    LookupPageID = 72184;

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.TestField("Bid Req Template No. Series");
                    NoMgt.TestManual(ProcurementSetup."Bid Req Template No. Series");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; Description; Text[900])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Procurement Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types".Code;
        }
        field(4; "Template Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Standard,BoQ';
            OptionMembers = Standard,BoQ;
        }
        field(6; "Effective Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(8; "Primary Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(9; "Primary Directorate"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(10; "Primary Department"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"),
                                                                "Direct Reports To" = field("Primary Directorate"));
        }
        field(11; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Total Amount Excl.VAT"; Decimal)
        {
            CalcFormula = sum("Requisition Template Line".Amount where("Requisition Template ID" = field(Code)));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                VATPostingSetup.Reset;
                VATPostingSetup.SetRange(VATPostingSetup."VAT Bus. Posting Group", "VAT Bus. Posting Group");
                VATPostingSetup.SetRange(VATPostingSetup."VAT Prod. Posting Group", "VAT Prod. Posting Group");
                if VATPostingSetup.FindSet then begin
                    "VAT Amount" := VATPostingSetup."VAT %" / 100 * ("Total Amount Excl.VAT" + "Contingency Amount" + "Variation of Price Amount");
                    "Total Estimated Bid Sum 1" := ((100 + VATPostingSetup."VAT %") / 100 * ("Total Amount Excl.VAT" + "Contingency Amount" + "Variation of Price Amount"));
                end;
            end;
        }
        field(17; "Road Project Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Maintenance,Road Construction,Survey/Study,Structure Construction';
            OptionMembers = " ",Maintenance,"Road Construction","Survey/Study","Structure Construction";

            trigger OnValidate()
            begin
                if xRec."Road Project Category" <> "Road Project Category" then
                    "Works Category" := '';


                Description := 'BOQ Template For' + ' ' + Format("Road Project Category");
            end;
        }
        field(18; "Works Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Category".Code;// where("Road Project Category" = field("Road Project Category"));
        }
        field(19; "Effective End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(21; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Standard,Project,PBRM';
            OptionMembers = " ",Standard,Project,PBRM;
        }
        field(22; "PBRM BoQ"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code where(Type = filter(PBRM));
        }
        field(23; "Variation of Price Rate(%)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                CalcFields("Total Amount Excl.VAT");
                if "Variation of Price Rate(%)" <> 0 then begin
                    "Total Estimated Bid Sum 1" := (("Variation of Price Rate(%)" / 100) * "Total Amount Excl.VAT") + "Total Amount Excl.VAT";
                    "Variation of Price Amount" := "Variation of Price Rate(%)" / 100 * "Total Amount Excl.VAT";
                end;
                "VAT Amount" := "Total Estimated Bid Sum 1" - ("Total Amount Excl.VAT" + "Contingency Amount" + "Variation of Price Amount");
            end;
        }
        field(24; "Variation of Price Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "Contingency Rate(%)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                CalcFields("Total Amount Excl.VAT");
                if "Contingency Rate(%)" <> 0 then begin
                    "Total Estimated Bid Sum 1" := (("Contingency Rate(%)" / 100) * "Total Amount Excl.VAT") + "Total Estimated Bid Sum 1";
                    "Contingency Amount" := "Contingency Rate(%)" / 100 * "Total Amount Excl.VAT";
                end;
                "VAT Amount" := "Total Estimated Bid Sum 1" - ("Total Amount Excl.VAT" + "Contingency Amount" + "Variation of Price Amount");

                VATPostingSetup.Reset;
                VATPostingSetup.SetRange(VATPostingSetup."VAT Bus. Posting Group", "VAT Bus. Posting Group");
                VATPostingSetup.SetRange(VATPostingSetup."VAT Prod. Posting Group", "VAT Prod. Posting Group");
                if VATPostingSetup.FindSet then begin
                    "Total Estimated Bid Sum 1" := ROUND(((100 + VATPostingSetup."VAT %") / 100 * ("Total Amount Excl.VAT" + "Variation of Price Amount" + "Contingency Amount")), 1, '>');
                end;
            end;
        }
        field(26; "Contingency Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'Default VAT Bus. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "VAT Business Posting Group";

            trigger OnValidate()
            begin
                Validate("Total Amount Excl.VAT");
            end;
        }
        field(28; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'Default VAT Prod. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                Validate("Total Amount Excl.VAT");
            end;
        }
        field(29; "VAT Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(30; "Total Estimated Bid Sum 1"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Description)
        {
        }
        fieldgroup(Brick; "Code", Description)
        {
        }
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("Bid Req Template No. Series");
            NoMgt.InitSeries(ProcurementSetup."Bid Req Template No. Series", xRec."No. Series", 0D, Code, "No. Series");
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record 70060;
        NoMgt: Codeunit NoSeriesManagement;
        "BoQ Template Line": Record 72025;
        VATPostingSetup: Record "VAT Posting Setup";
}
