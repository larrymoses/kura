#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72192 "Payment Certificate Line"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Measurement Sheet,Contractor Notice of Works,Works Inspection,Payment Certificate,Contractor Payment Request';
            OptionMembers = " ","Measurement Sheet","Contractor Notice of Works","Works Inspection","Payment Certificate","Contractor Payment Request";
        }
        field(2; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(4; "Job Task No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));
        }
        field(5; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item),Service,Customer';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)",Service,Customer;
        }
        field(7; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type = filter(Customer)) Customer."No.";
        }
        field(8; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Unit of Measure Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(10; "Measurement Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Linear/Unit,Areal,Volumetric';
            OptionMembers = " ","Linear/Unit",Areal,Volumetric;
        }
        field(11; "Linear/Unit Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            //  MaxValue = 999999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Measurement Type" = "measurement type"::"Linear/Unit" then
                    "Measured Quantity" := "Linear/Unit Quantity";
                Validate("Measured Quantity");
                if (("Measurement Type" = "measurement type"::Areal) or ("Measurement Type" = "measurement type"::Volumetric)) then
                    Error('Not Allowed');
            end;
        }
        field(12; "Length (m)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            //MaxValue = 999999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Measurement Type" = "measurement type"::Areal then begin
                    "Measured Quantity" := "Length (m)" * "Width (m)";
                end;

                if "Measurement Type" = "measurement type"::Volumetric then begin
                    "Measured Quantity" := "Length (m)" * "Width (m)" * "Height/Depth (m)";
                end;
                Validate("Measured Quantity");

                if "Measurement Type" = "measurement type"::"Linear/Unit" then
                    Error('Not Allowed');
            end;
        }
        field(13; "Width (m)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            //  MaxValue = 999999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Measurement Type" = "measurement type"::Areal then begin
                    "Measured Quantity" := "Length (m)" * "Width (m)";
                end;
                if "Measurement Type" = "measurement type"::Volumetric then begin
                    "Measured Quantity" := "Length (m)" * "Width (m)" * "Height/Depth (m)";
                end;
                Validate("Measured Quantity");

                if "Measurement Type" = "measurement type"::"Linear/Unit" then
                    Error('Not Allowed');
            end;
        }
        field(14; "Height/Depth (m)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            //   MaxValue = 999999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Measurement Type" = "measurement type"::Volumetric then begin
                    "Measured Quantity" := "Length (m)" * "Width (m)" * "Height/Depth (m)";
                end;

                Validate("Measured Quantity");

                if (("Measurement Type" = "measurement type"::"Linear/Unit") or ("Measurement Type" = "measurement type"::Areal)) then
                    Error('Not Allowed');
            end;
        }
        field(15; "Measured Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
            MaxValue = 999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Total Cost (LCY)" := "Measured Quantity" * "Direct Unit Cost (LCY)";
            end;
        }
        field(16; "Contract Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
            MaxValue = 999999999;
            MinValue = 0;
        }
        field(17; "Direct Unit Cost (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
            //  MaxValue = 999999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                Validate("Measured Quantity");
            end;
        }
        field(18; "Unit Cost (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(19; "Total Cost (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(20; "Gen. Prod. Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Gen. Prod. Posting Group';
        }
        field(21; "Technology Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Bill Item Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code;

            trigger OnValidate()
            begin
                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Road Activity Categories", "Bill Item Category Code");
                if not JobPlanningLine.FindSet then
                    Error('The bill %1 is not planned for');
            end;
        }
        field(23; "Works Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
        }
        field(24; "Works End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
        }
        field(25; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Direct Unit Cost Excl. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate(Qunatity);
                Validate("Line Discount %");
            end;
        }
        field(27; "Line Discount %"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Line Discount %" <> 0 then
                    "Line Amount Excl. VAT" := "Line Discount %" / 100 * "Direct Unit Cost Excl. VAT";
            end;
        }
        field(28; "Line Amount Excl. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate("Line Discount %");
            end;
        }
        field(29; Qunatity; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Line Amount Excl. VAT" := Qunatity * "Direct Unit Cost Excl. VAT";
                Validate("Line Discount %");
            end;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Type := Type::"G/L Account";
    end;

    var
        ObjUOM: Record "Unit of Measure";
        JobPlanningLine: Record "Job Planning Line";
}

