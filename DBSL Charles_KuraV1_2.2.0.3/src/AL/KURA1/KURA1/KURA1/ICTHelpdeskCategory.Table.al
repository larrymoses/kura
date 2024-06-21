#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56055 "ICT Helpdesk Category"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "No. Series"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Category Head"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(5; "Issue Category Department Code"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;

            trigger OnValidate()
            var
                ResponsibilityCenter: Record "Responsibility Center";
            begin
                ResponsibilityCenter.RESET;
                ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, "Issue Category Department Code");
                IF ResponsibilityCenter.FINDSET THEN
                    "Issue Category Department Code" := ResponsibilityCenter.Name;
            end;
        }
    }

    keys
    {
        key(Key1; "Code")//,"Category Head","Issue Category Department Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Issue Category Department Code", Description)
        {
        }
        fieldgroup(Brick; "Issue Category Department Code", Description)
        {
        }
    }
}

