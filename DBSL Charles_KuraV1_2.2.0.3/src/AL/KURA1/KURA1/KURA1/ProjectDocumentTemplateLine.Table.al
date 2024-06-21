#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72163 "Project Document Template Line"
{

    fields
    {
        field(1; "Template ID"; Code[20])
        {

        }
        field(2; "Document Type"; Code[20])
        {

            TableRelation = "Project Document Type".Code where(Blocked = filter(false));

            trigger OnValidate()
            begin
                ProjectDocumentType.Reset;
                ProjectDocumentType.SetRange(Code, "Document Type");
                if ProjectDocumentType.FindSet then begin
                    Description := ProjectDocumentType.Description;
                    "Program of Works" := ProjectDocumentType."Program of Works";
                    "Mobilization Document" := ProjectDocumentType."Mobilization Document";
                end;
            end;
        }
        field(3; Description; Text[250])
        {

        }
        field(4; "Document Class"; Enum "Project Document Class")
        {

            // OptionCaption = ' ,Mobilization,Execution & Monitoring,Subcontracting/Assignee,Project Closure,Defects Liability,General Admin,Program of Works';
            // OptionMembers = " ",Mobilization,"Execution & Monitoring","Subcontracting/Assignee","Project Closure","Defects Liability","General Admin","Program of Works";
        }
        field(5; "Requirement Type"; Option)
        {

            OptionCaption = ' ,Mandatory,Optional';
            OptionMembers = " ",Mandatory,Optional;
        }
        field(6; "Guidelines/Instructions"; Text[250])
        {

        }
        field(7; "Program of Works"; Boolean)
        {

        }
        field(8; "Mobilization Document"; Boolean)
        {

        }
    }

    keys
    {
        key(Key1; "Template ID", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProjectDocumentType: Record "Project Document Type";
}

