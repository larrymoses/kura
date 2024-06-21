#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80086 "Performance Target Line"
{

    fields
    {
        field(1;"Workplan No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Initiative No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Year Reporting Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code;
        }
        field(6;"Quarter Reporting Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Planning Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Primary Directorate";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Primary Department";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Perfomance Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Workplan No.","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

