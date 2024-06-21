#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69109 "Applicant Referees"
{

    fields
    {
        field(1;"Job Application No";Code[20])
        {
            TableRelation = "Job Application Table";
        }
        field(2;Names;Text[200])
        {
        }
        field(3;Occupation;Text[100])
        {
        }
        field(4;Institution;Text[100])
        {
        }
        field(5;Address;Text[200])
        {
        }
        field(6;"Telephone No";Text[100])
        {
        }
        field(7;"E-Mail";Text[100])
        {
        }
        field(8;"Employee No";Code[30])
        {
        }
        field(9;"Post Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;City;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Period Known";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Job ID";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Code";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(14;RefereeEmail;Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Job Application No",Names,"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

