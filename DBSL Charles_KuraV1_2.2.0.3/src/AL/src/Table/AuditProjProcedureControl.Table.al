#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95206 "Audit Proj  Procedure Control"
{

    fields
    {
        field(1;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Business Risk ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Control ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Nature of Control";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Manual Control,Automated Control,Hybrid Control';
            OptionMembers = " ","Manual Control","Automated Control","Hybrid Control";
        }
        field(6;"Control Frequency";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,N/A,Multple times a day,Daily,Weekly,Monthly,Quarterly,Semi-Annual,Annual,At all times';
            OptionMembers = " ","N/A","Multple times a day",Daily,Weekly,Monthly,Quarterly,"Semi-Annual",Annual,"At all times";
        }
        field(7;"Control Owner ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Internal Control Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Preventive,Detective,Corrective';
            OptionMembers = " ",Preventive,Detective,Corrective;
        }
        field(9;"Audit Procedure ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Audit Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Engagement ID","Business Risk ID","Control ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

