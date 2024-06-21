#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 50006 "Road Activities"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Descrption; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Open Cost Claims"; Integer)
        {
            //),
            // "Document Type" = filter('Cost Claim')));
            CalcFormula = Count("Project Variation Header" WHERE(Status = CONST(Open)));//
            Caption = 'Open Cost Claim';
            Editable = true;
            FieldClass = FlowField;
        }
        field(4; "Pending Cost Claims"; Integer)
        {
            CalcFormula = Count("Project Variation Header" WHERE(Status = CONST("Pending Approval")));
            ///  "Document Type" = filter('Cost Claim')));
            Caption = 'Pending Cost Claim';
            Editable = false;
            FieldClass = FlowField;
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
    }
}

