#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95101 "Risk Mgt Framework Detail"
{

    fields
    {
        field(1;"Primary Key";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"RMF Section";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,RMF Overview,Benefits/Importance,RMF Guiding Principle';
            OptionMembers = " ","RMF Overview","Benefits/Importance","RMF Guiding Principle";

            trigger OnValidate()
            begin
                Validate("RMF Section");
            end;
        }
        field(3;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Guiding Principle Statement";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Primary Key","RMF Section","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

