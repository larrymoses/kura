#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69435 "Safety Equipment Register"
{

    fields
    {
        field(1;"Equipment ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;SubType;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Fixed Asset,Item,Resource';
            OptionMembers = "Fixed Asset",Item,Resource;
        }
        field(3;"SubType No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (SubType=const("Fixed Asset")) "Fixed Asset"."No."
                            else if (SubType=const(Resource)) Resource."No." where (Type=const(Machine),
                                                                                    Blocked=const(false))
                                                                                    else if (SubType=const(Item)) Item."No.";

            trigger OnValidate()
            begin
                if SubType=Subtype::"Fixed Asset" then begin
                  FixedAssets.Reset;
                  FixedAssets.SetRange("No.","SubType No.");
                  if FixedAssets.FindSet then
                    Description:=FixedAssets.Description;
                  "FA Location Code":=FixedAssets."Location Code";
                  "Maintenance Vendor No.":=FixedAssets."Maintenance Vendor No.";
                  "Serial No.":=FixedAssets."Serial No.";
                  "Warranty Date":=FixedAssets."Warranty Date";
                  "Next Service Date":=FixedAssets."Next Service Date";
                  Insured:=Insured;
                  end;

                if SubType=Subtype::Item then begin
                  Items.Reset;
                  Items.SetRange("No.","SubType No.");
                  if Items.FindSet then
                    Description:=Items.Description;
                  Items.CalcFields(Inventory);
                "Inventory Quantity":=Items.Inventory;
                  end;

                if SubType=Subtype::Resource then begin
                   Resources.Reset;
                   Resources.SetRange("No.","SubType No.");
                   if Resources.FindSet then
                     Description:=Resources.Name;
                    //"Fixed Asset/Resource Quantity":=Resources.
                  end;
            end;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Safety Equipment Category";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Equipment Category".Code;
        }
        field(6;"Safety Notes/Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"FA Location Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "FA Location".Code;
        }
        field(8;"Serial No.";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Next Service Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Inventory Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Fixed Asset/Resource Quantity";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Maintenance Vendor No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(13;"Warranty Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;Insured;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Equipment ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resources: Record Resource;
        Items: Record Item;
        FixedAssets: Record "Fixed Asset";
}
