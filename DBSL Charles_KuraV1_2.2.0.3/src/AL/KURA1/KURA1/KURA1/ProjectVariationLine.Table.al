#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72262 "Project Variation Line"
{
    DrillDownPageID = "Project Variation Lines";
    LookupPageID = "Project Variation Lines";

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Extension of Time Request,Contractor Variation Request,Project Variation Order,Budget Reallocation Voucher,Engineer Variation Request';
            OptionMembers = " ","Extension of Time Request","Contractor Variation Request","Project Variation Order","Budget Reallocation Voucher","Engineer Variation Request";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Job No.";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(4;"Job Task No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field("Job No."),
                                                             "Job Task Type"=filter(Posting));
        }
        field(5;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Planning Line"."Line No." where ("Job No."=field("Job No."),
                                                                  "Job Task No."=field("Job Task No."));

            trigger OnValidate()
            begin
                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.","Job No.");
                JobPlanningLine.SetRange(JobPlanningLine."Job Task No.","Job Task No.");
                JobPlanningLine.SetRange(JobPlanningLine."Line No.","Line No.");
                if JobPlanningLine.FindSet then begin
                  Type:=JobPlanningLine.Type;
                  "No.":=JobPlanningLine."No.";
                  Description:=JobPlanningLine.Description;
                  "Original Quantity":=JobPlanningLine.Quantity;
                  "Original Total Cost (LCY)":=JobPlanningLine."Total Cost (LCY)";
                  "Unit Cost (LCY)":=JobPlanningLine."Unit Cost (LCY)";
                  Validate("Original Quantity");
                  "Unit of Measure Code":=JobPlanningLine."Unit of Measure";
                  "Bill Item Category Code":=JobPlanningLine."Road Activity Categories";
                   "Gen. Prod. Posting Group":=JobPlanningLine."Gen. Prod. Posting Group";
                   "Gen. Bus. Posting Group":=JobPlanningLine."Gen. Bus. Posting Group";
                  end;
            end;
        }
        field(6;Type;Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Item;
            OptionCaption = 'Resource,Item,G/L Account,Text';
            OptionMembers = Resource,Item,"G/L Account",Text;
        }
        field(7;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type=const(Resource)) Resource
                            else if (Type=const(Item)) Item where (Blocked=const(false))
                            else if (Type=const("G/L Account")) "G/L Account"
                            else if (Type=const(Text)) "Standard Text";
        }
        field(8;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Original Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if "Original Quantity"<>0 then begin
                "New Quantity":="Original Quantity";
                "New Total Cost (LCY)":="New Quantity"*"Unit Cost (LCY)";
                "Net Change (Quantity)":="New Quantity"-"Original Quantity";
                "Net Change (Total Cost LCY)":="Net Change (Quantity)"*"Unit Cost (LCY)";
                end;
            end;
        }
        field(10;"Unit Cost (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Original Total Cost (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Unit of Measure Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Unit of Measure";
        }
        field(13;"New Quantity";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "New Quantity"<>0 then begin
                //"New Quantity":="Original Quantity";
                "New Total Cost (LCY)":="New Quantity"*"Unit Cost (LCY)";
                "Net Change (Quantity)":="New Quantity"-"Original Quantity";
                "Net Change (Total Cost LCY)":="Net Change (Quantity)"*"Unit Cost (LCY)";
                end;
            end;
        }
        field(14;"New Total Cost (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Net Change (Quantity)";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;"Net Change (Total Cost LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17;"Gen. Prod. Posting Group";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Gen. Product Posting Group".Code;
        }
        field(18;"Bill Item Category Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Item Category".Code where (Blocked=filter(false));
        }
        field(19;"Purchase Contract ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Purchase Header"."No." where ("Document Type"=filter("Blanket Order"),
                                                           "Contract Status"=filter(" "));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.","Purchase Contract ID");
                if PurchaseHeader.FindSet then
                  begin
                    "External Contract Reference":=PurchaseHeader."Your Reference";
                    "Contract End Date":=PurchaseHeader."Contract End Date";
                    "Contract Start Date":=PurchaseHeader."Contract Start Date";

                    end;
            end;
        }
        field(20;"Contractor No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Vendor."No.";
        }
        field(21;"Gen. Bus. Posting Group";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Gen. Business Posting Group".Code;
        }
        field(22;"Contract Start Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23;"Contract End Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24;"External Contract Reference";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25;"Planning Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Road Technology";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Technology".Code where (Blocked=filter(false));
        }
        field(27;"Total Project Cost Excl. VAT";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(28;"Total Project Cost Incl. VAT";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29;"Contingency Amount";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(30;"Variation of Price Amount";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Job No.","Job Task No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ProjectVariationHeader.Reset;
        ProjectVariationHeader.SetRange(ProjectVariationHeader."Document Type","Document Type");
        ProjectVariationHeader.SetRange(ProjectVariationHeader."Document No.","Document No.");
        if ProjectVariationHeader.FindSet then begin
          "Job No.":=ProjectVariationHeader."Project ID";
           "Contract End Date":=ProjectVariationHeader."Original Project Ending Date";
           "Contract Start Date":=ProjectVariationHeader."Original Project Starting Date";
           "Contractor No.":=ProjectVariationHeader."Contractor No.";
           "Purchase Contract ID":=ProjectVariationHeader."Purchase Contract ID";
           Validate("Contractor No.");
          end;
    end;

    var
        ProjectVariationHeader: Record "Project Variation Header";
        JobPlanningLine: Record "Job Planning Line";
        PurchaseHeader: Record "Purchase Header";
}

