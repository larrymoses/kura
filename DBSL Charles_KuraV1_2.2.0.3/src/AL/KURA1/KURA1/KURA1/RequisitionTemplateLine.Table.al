#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72131 "Requisition Template Line"
{
    DrillDownPageID = "BoQ Template Line";
    LookupPageID = "BoQ Template Line";

    fields
    {
        field(1;"Requisition Template ID";Code[20])
        {

        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;

        }
        field(3;Type;Option)
        {

            OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)";
        }
        field(4;"No.";Code[20])
        {

            TableRelation = if (Type=const(" ")) "Standard Text"
                            else if (Type=const("G/L Account")) "G/L Account"
                            else if (Type=const(Item)) Item where (Blocked=const(false))
                            else if (Type=const("Fixed Asset")) "Fixed Asset"
                            else if (Type=const("Charge (Item)")) "Item Charge";

            trigger OnValidate()
            begin
                Item.Reset;
                Item.SetRange(Item."No.","No.");
                if Item.FindSet then begin
                  Description:=Item.Description;
                  "Unit of Measure Code":=Item."Base Unit of Measure";
                  "BoQ No":=Item."BoQ No";
                  "BOQ Type":=Item."BOQ Type";
                  "Gen. Prod. Posting Group":=Item."Gen. Prod. Posting Group";
                  "VAT Prod. Posting Group":=Item."VAT Prod. Posting Group";
                  "Item Category Code":=Item."Item Category Code";
                  end;
            end;
        }
        field(5;Description;Text[2048])
        {

        }
        field(6;Quantity;Decimal)
        {

        }
        field(7;"Unit of Measure Code";Code[20])
        {

            Description = '"Unit of Measure"';
            TableRelation = "Unit of Measure";
        }
        field(8;"Technology Type";Code[20])
        {

            TableRelation = "Road Technology".Code;

            trigger OnValidate()
            begin
                RoadTechnology.Reset;
                RoadTechnology.SetRange(Code,"Technology Type");
                if RoadTechnology.FindSet then
                  "Labour %":=RoadTechnology."Labour Percentage";
            end;
        }
        field(9;"Unit Amount Excl. VAT";Decimal)
        {


            trigger OnValidate()
            begin
                Amount:=Quantity*"Unit Amount Excl. VAT";
            end;
        }
        field(10;"Shortcut Dimension 1 Code";Code[50])
        {

            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(11;"Shortcut Dimension 2 Code";Code[50])
        {

            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(12;"Variant Code";Code[40])
        {

        }
        field(13;"Dimension Set ID";Integer)
        {

        }
        field(14;"Item Category Code";Code[20])
        {

            Description = '"Item Category"';
            TableRelation = "Item Category".Code;
            trigger OnValidate()
            var
                BOQTemplateBillCode: Record "BoQ Template Bill Code";
                BOQTemplateBillCode1: Record "BoQ Template Bill Code";
                BOQTemplateBillCode2: Record "BoQ Template Bill Code";
                RequisitionTemplateLine: Record "Requisition Template Line";
            begin
                BOQTemplateBillCode.Reset();
                BOQTemplateBillCode.SetRange("Bill Item Category Code", Rec."Item Category Code");
                BOQTemplateBillCode.SetRange("BoQ Template Code", Rec."Requisition Template ID");
                if not BOQTemplateBillCode.FindFirst() then begin
                    BOQTemplateBillCode1.Init();
                    BOQTemplateBillCode1."BoQ Template Code" := Rec."Requisition Template ID";
                    BOQTemplateBillCode1.Validate("Bill Item Category Code", Rec."Item Category Code");
                    BOQTemplateBillCode1.Insert(true);
                end;
                BOQTemplateBillCode2.Reset();
                BOQTemplateBillCode2.SetRange("BoQ Template Code", Rec."Requisition Template ID");
                BOQTemplateBillCode2.SetFilter("Bill Item Category Code",'<>%1',Rec."Item Category Code");
                if BOQTemplateBillCode2.FindSet() then begin
                    repeat
                        RequisitionTemplateLine.Reset();
                        RequisitionTemplateLine.SetRange("Requisition Template ID", BOQTemplateBillCode2."BoQ Template Code");
                        RequisitionTemplateLine.SetRange("Item Category Code", BOQTemplateBillCode2."Bill Item Category Code");

                        if not RequisitionTemplateLine.FindFirst() then
                            BOQTemplateBillCode2.Delete();
                    until BOQTemplateBillCode2.Next() = 0;
                end;
             //   RequisitionTemplateLine.Reset();

            end;
        }
        field(15;"Default Contingency %";Decimal)
        {

        }
        field(16;"Gen. Prod. Posting Group";Code[20])
        {

        }
        field(17;"VAT Prod. Posting Group";Code[20])
        {

        }
        field(18;"Default Job Task No.";Code[20])
        {

        }
        field(19;"Begin-Total Job Task No.";Code[20])
        {

        }
        field(20;"End-Total Job Task No.";Code[20])
        {

        }
        field(21;"Labour %";Decimal)
        {

        }
        field(22;Amount;Decimal)
        {

        }
        field(23;"BOQ Type";Option)
        {

            OptionCaption = ' ,New Construction,PBRM';
            OptionMembers = " ","New Construction",PBRM;
        }
        field(24;"BoQ No";Code[20])
        {

        }
        field(25;"Reversion Type";Option)
        {

            OptionCaption = 'To Contractor,To Authority';
            OptionMembers = "To Contractor","To Authority";
        }
    }

    keys
    {
        key(Key1;"Requisition Template ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RoadTechnology: Record "Road Technology";
        Item: Record Item;
}

