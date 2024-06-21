#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72175 "Inspection & Payment Line"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Measurement Sheeet,Works Inspection,Payment Certificate';
            OptionMembers = " ","Measurement Sheeet","Works Inspection","Payment Certificate";
        }
        field(3;"Bill No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Item Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
        }
        field(5;Type;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item),Service';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)",Service;
        }
        field(6;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Unit Of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(8;"BoQ Quantity";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Bill Item Amount":="BoQ Quantity"*"Bid Rate(LCY)";
            end;
        }
        field(9;"Bid Rate(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate("BoQ Quantity");
            end;
        }
        field(10;"Bill Item Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Previous Qty";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Previous Qty"<> 0 then
                "Previous %":="Previous Qty"/"BoQ Quantity";
            end;
        }
        field(12;"Previous %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"This Qty";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "This Qty" <> 0 then
                "This Qty %":=ROUND("This Qty"/"BoQ Quantity")*100;
                "Done ToDate Qty":="Previous Qty"+"This Qty";
                "Done ToDate %":="Previous %"+"This Qty %";
            end;
        }
        field(14;"This Qty %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Done ToDate Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Done ToDate %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(18;Accepted;Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Accepted=true then
                  Rejected:=false;
            end;
        }
        field(19;Rejected;Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Rejected= true then
                  Accepted:=false;
                if Rejected = true then
                TestField("Reason For Rejection");
            end;
        }
        field(20;"Reason For Rejection";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Document Type","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Type:=Type::Item;
    end;
}

