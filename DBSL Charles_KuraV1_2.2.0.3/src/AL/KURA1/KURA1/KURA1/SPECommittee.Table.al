#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80108 "SPE Committee"
{
    DrillDownPageID = "SPE Commitee";
    LookupPageID = "SPE Commitee";

    fields
    {
        field(1;"Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;Description;Text[30])
        {
        }
        field(3;"Minimum Members";Integer)
        {
        }
        field(4;"Process Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Direct,RFQ,RFP,Tender,Low Value,Specially Permitted,EOI';
            OptionMembers = " ",Direct,RFQ,RFP,Tender,"Low Value","Specially Permitted",EOI;
        }
        field(5;"RFQ Same Openinng_ Evaluation";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"RFP Same Openinng_ Evaluation";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Tend Same Openinng_ Evaluation";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Evaluation Opening";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Evaluation Process";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

