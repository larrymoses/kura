#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72248 "DWR Meeting Agenda"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Agenda Code";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Meeting Agenda"."Agenda code";
        }
        field(4;"Agenda Description";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Owner;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,All,Client,Contractor';
            OptionMembers = " ",All,Client,Contractor;
        }
        field(6;"Estimate Time (Minutes)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.","Agenda Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

