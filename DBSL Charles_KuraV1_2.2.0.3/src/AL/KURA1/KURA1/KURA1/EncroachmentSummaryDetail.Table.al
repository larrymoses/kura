#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72406 "Encroachment Summary Detail"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Encroachment Stop Order, Encroachment Close-Out Report';
            OptionMembers = " ","Encroachment Stop Order"," Encroachment Close-Out Report";
        }
        field(3;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Instructions,Recovery Details,Disputes';
            OptionMembers = Instructions,"Recovery Details",Disputes;
        }
        field(6;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Dispute Resolved?";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Resolution Details";Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Document Type","Line No","Entry No",Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

