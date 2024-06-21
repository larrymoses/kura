#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 52021 "Axle Load Permit Application"
{

    fields
    {
        field(1;No;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Applicant Name";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Applicant Address";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Vehicle/Trailer Reg No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Tare Weight (KG)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Vehicle Model/Make";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Axel Vehicle Model";
        }
        field(8;"Total No of Axle";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Total No of Wheels Per Axle";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Journey Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Journey End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Route to be folowed";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Width(M)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Height(M)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Length(M)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Weight of the Cargo(KG)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Gross Vehicle Weight(KG)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Description of Load";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Escort Details";Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

