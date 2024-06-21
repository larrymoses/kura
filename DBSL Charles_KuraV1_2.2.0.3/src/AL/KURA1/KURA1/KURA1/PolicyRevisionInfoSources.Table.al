#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80129 "Policy Revision Info Sources"
{

    fields
    {
        field(1;"Policy ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;
        }
        field(2;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Source Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Intranet,Organization Website,Other Website,3rd Party Sources';
            OptionMembers = " ",Intranet,"Organization Website","Other Website","3rd Party Sources";
        }
        field(4;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"URL Link";Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Revision No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Policy ID","Line No.","Revision No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

