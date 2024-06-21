#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 91999 "Pending Company Rename"
{
    Caption = 'Pending Company Rename';
    DataPerCompany = false;

    fields
    {
        field(1; "Current Company Name"; Text[30])
        {
            Caption = 'Current Company Name';
            TableRelation = Company;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(2; "New Company Name"; Text[30])
        {
            Caption = 'New Company Name';
        }
    }

    keys
    {
        key(Key1; "Current Company Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

