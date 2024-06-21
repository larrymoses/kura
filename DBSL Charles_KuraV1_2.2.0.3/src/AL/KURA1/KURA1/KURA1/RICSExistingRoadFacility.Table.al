#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72121 "RICS Existing Road Facility"
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
        field(3;"Entry Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Existing,New';
            OptionMembers = " ",Existing,New;

            trigger OnValidate()
            begin
                "Entry Type":="entry type"::Existing;
            end;
        }
        field(4;"Facility  No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RICS Existing Road Link"."Road Code";
        }
        field(6;"Road Section No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"RICS Existing Road Section"."Road Section No." WHERE (Road Code=FIELD(Road Code))';
        }
        field(7;"Road Facility Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Structure,Furniture';
            OptionMembers = " ",Structure,Furniture;
        }
        field(8;"Road Facility Type";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"RICS Existing Road Facility"."Facility  No." WHERE (Road Code=FIELD(Road Code))';
        }
        field(9;"Road Facility SubType";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"RICS Existing Road Facility"."Road Facility SubType" WHERE (Road Code=FIELD(Road Code))';
        }
        field(10;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Facility Label";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Facility Location";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Material Type";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"General Facility Condition";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Excellent,Good,Fair,Poor,Very Poor';
            OptionMembers = " ",Excellent,Good,Fair,Poor,"Very Poor";
        }
        field(15;"Construction Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Job.No.';
        }
        field(16;"Construction Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Last Maintenance Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"RICS No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

