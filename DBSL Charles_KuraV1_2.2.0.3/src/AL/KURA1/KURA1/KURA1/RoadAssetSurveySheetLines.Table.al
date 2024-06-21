#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72045 "Road Asset Survey Sheet Lines"
{

    fields
    {
        field(1;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Carriage Way Width(M)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Shoulder Width(L)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Shoulder Width(R)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"SideWalk Width(L)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"SideWalk Width(R)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Pavement Thickness(cm)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Unit;Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(10;"Simple Quantity";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Actual Quantity";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Dimension & Condition";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13;Remark;Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Ex. Quantity to be Instructed Works';
        }
        field(14;Item;Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Asset Survey Items".Item;
        }
        field(15;"Header No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Header No","Road Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

