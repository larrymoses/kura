#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70100 "Procurement Plan Lines"
{

    fields
    {
        field(1; "Procurement Plan ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code;
        }
        field(2; "Planning Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category";

            trigger OnValidate()
            begin
                if ProcurementCategory.Get("Planning Category") then begin
                    Description := ProcurementCategory.Description;
                end;
            end;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Procurement Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types".Code;
        }
        field(5; "Solicitation Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Solicitation Type".Code;
        }
        field(6; "Procurement Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(7; "Primary Source of Funds"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source";
        }
        field(8; "Total Quantity"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry".Quantity where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                       "Planning Category" = field("Planning Category"),
                                                                       Blocked = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Total Budgeted Cost"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                                 "Planning Category" = field("Planning Category"),
                                                                                 Blocked = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Total Actual Cost"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Total Actual Costs" where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                                   "Planning Category" = field("Planning Category")));
            FieldClass = FlowField;
        }
        field(11; "PP Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(12; "Plan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Functional,Consolidated,...';
            OptionMembers = Functional,Consolidated,"...";
        }
        field(50000; Budget; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Budget';
        }
        field(70000; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Procurement Plan,Revision Voucher';
            OptionMembers = "Procurement Plan","Revision Voucher";
        }
        field(80000; "AWP No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan".No;
        }
        field(80001; "Select"; Boolean)
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Annual Strategy Workplan".No;
        }
        field(80002; "Total Budgeted Cost lCY"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost (LCY)" where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                                 "Planning Category" = field("Planning Category"),
                                                                                 Blocked = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }

    }

    keys
    {
        key(Key1; "PP Line No", "Procurement Plan ID", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementCategory: Record "Procurement Category";
}

