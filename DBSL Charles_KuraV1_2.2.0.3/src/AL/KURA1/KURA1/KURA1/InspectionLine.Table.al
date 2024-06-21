#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72292 "Inspection Line"
{

    fields
    {
        field(1;"Inspection No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Inspection Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Daily Works Inspection,Taking Over Inspection,End of DLP Inspection';
            OptionMembers = " ","Daily Works Inspection","Taking Over Inspection","End of DLP Inspection";
        }
        field(3;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Category ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supervision Template Category"."Category ID";
        }
        field(5;"Project ID";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(6;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No. of Requirements";Integer)
        {
            CalcFormula = count("Inspection Plan Line" where ("Inspection No"=field("Inspection No"),
                                                              "Inspection Type"=field("Inspection Type"),
                                                              "Line No"=field("Line No"),
                                                              "Category ID"=field("Category ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"Total Weight";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"No. of Corrective Orders";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Works Inspection,Lab Works,Survey Works';
            OptionMembers = " ","Works Inspection","Lab Works","Survey Works";
        }
    }

    keys
    {
        key(Key1;"Inspection No","Inspection Type","Category ID","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

