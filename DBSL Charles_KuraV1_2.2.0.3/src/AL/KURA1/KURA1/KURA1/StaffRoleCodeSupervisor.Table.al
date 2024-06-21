#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72349 "Staff Role Code Supervisor"
{

    fields
    {
        field(1;"Staff Role Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Supervisor Job ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions"."Position ID" where (Blocked=filter(false));

            trigger OnValidate()
            begin
                CompanyPositions.Reset;
                CompanyPositions.SetRange(CompanyPositions."Position ID","Supervisor Job ID");
                if CompanyPositions.FindSet then
                  "Supervisor Job Title":=CompanyPositions."Job Title";
            end;
        }
        field(4;"Supervisor Job Title";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Supervisor Email";Code[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
    }

    keys
    {
        key(Key1;"Staff Role Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CompanyPositions: Record "Company Positions";
}

