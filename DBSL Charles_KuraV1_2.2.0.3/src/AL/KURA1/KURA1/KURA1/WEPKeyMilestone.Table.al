#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72183 "WEP Key Milestone"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Order-To-Commence,Work Execution Programme';
            OptionMembers = " ","Order-To-Commence","Work Execution Programme";
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Milestone Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Descrption;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Payment Certificate Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Advance,Interim,Final';
            OptionMembers = " ",Advance,Interim,Final;
        }
        field(6;"Payment %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Planned Amount (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Milestone Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

