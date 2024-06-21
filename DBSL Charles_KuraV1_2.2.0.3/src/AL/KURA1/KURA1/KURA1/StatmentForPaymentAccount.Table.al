#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72075 "Statment For Payment Account"
{

    fields
    {
        field(1;"Contract No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Contract Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;No;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Contractor No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Certificate No";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Valuation As At";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Region Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Region Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Financial Year";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Administrative Boundary";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;Month;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Submitted By";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Checked By";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Contract No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

