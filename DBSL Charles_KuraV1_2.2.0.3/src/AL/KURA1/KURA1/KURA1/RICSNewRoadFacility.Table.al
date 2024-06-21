#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72126 "RICS New Road Facility"
{

    fields
    {
        field(1;"RICS No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RICS Existing Road Link"."Road Code";
        }
        field(4;"Road Section No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"RICS Existing Road Section"."Road Section No." WHERE (Road Code=FIELD(Road Code))';
        }
        field(5;"Road Facility Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Structure,Furniture';
            OptionMembers = " ",Structure,Furniture;
        }
        field(6;"Road Facility Type";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"RICS Existing Road Facility"."Facility  No." WHERE (Road Code=FIELD(Road Code))';
        }
        field(7;"Road Facility SubType";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"RICS Existing Road Facility"."Road Facility SubType" WHERE (Road Code=FIELD(Road Code))';
        }
        field(8;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Facility Label";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Facility Location";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Material Type";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"General Facility Condition";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Excellent,Good,Fair,Poor,Very Poor';
            OptionMembers = " ",Excellent,Good,Fair,Poor,"Very Poor";
        }
        field(13;"Construction Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Job.No.';
        }
        field(14;"Construction Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Last Maintenance Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"RICS No.","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

