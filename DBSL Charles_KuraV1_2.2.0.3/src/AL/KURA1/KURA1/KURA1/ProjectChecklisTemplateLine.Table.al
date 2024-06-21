#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72215 "Project Checklis Template Line"
{

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Requirement ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID","Requirement ID")
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

