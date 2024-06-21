#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72130 "BoQ Template Bill Code"
{
    LookupPageId = "BoQ Template Bill Codes";
    DrillDownPageId = "BoQ Template Bill Codes";
    fields
    {
        field(1; "BoQ Template Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code;
        }
        field(2; "Bill Item Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Item Category".Code WHERE (Indentation=FILTER(1))';
            TableRelation = "Item Category".Code;//where ("Bill Item Group"=const(false),
                                                 //    Blocked=const(false),
                                                 //  Indentation=const(1));

            trigger OnValidate()
            begin
                BoQTemplateBillCode.Reset;
                BoQTemplateBillCode.SetRange(Code, "Bill Item Category Code");
                if BoQTemplateBillCode.FindSet then begin
                    Description := BoQTemplateBillCode.Description;
                    "Default Job Task No" := BoQTemplateBillCode."Default Job Task No";
                end;
            end;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Begin-Total Job Task No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "End-Total Job Task No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "No. of Bill Activities"; Integer)
        {
            CalcFormula = count("Requisition Template Line" where("Item Category Code" = field("Bill Item Category Code"),
                                                                   "Requisition Template ID" = field("BoQ Template Code")));
            FieldClass = FlowField;
        }
        field(7; "Default Job Task No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "BoQ Template Code", "Bill Item Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BoQTemplateBillCode: Record "Item Category";
}

