#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72017 "Road Study Initiative"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Study ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Study Area Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Overall Owner";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Progress;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Not Started,In Progress,Completed';
            OptionMembers = " ","Not Started","In Progress",Completed;
        }
        field(9;"Completion Percentage";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Study ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

