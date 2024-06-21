#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 65051 "Project Templates"
{
    DrillDownPageID = "Project Templates";
    LookupPageID = "Project Templates";

    fields
    {
        field(1;"Project  Task No.";Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = ToBeClassified;
            NotBlank = true;

            trigger OnValidate()
            var
                Job: Record Job;
                Cust: Record Customer;
            begin
            end;
        }
        field(2;"Project Description";Text[100])
        {
            Caption = 'Description';
        }
        field(3;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Project  Task No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(test;"Project  Task No.","Project Description")
        {
        }
    }
}

