#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72251 "Daily Works Progress Ledger"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Daily Work Record ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Document No.";
        }
        field(3;"Job No.";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Project ID";
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
                 // Type:=JobPlanningLine.Type;
                  "No.":=JobPlanningLine."No.";
                  Description:=JobPlanningLine.Description;
                  end;
            end;
        }
        field(6;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Resource,Item,G/L Account,Text/L Account,Text';
            OptionMembers = " ",Resource,Item,"G/L Account","Text/L Account",Text;
        }
        field(7;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type=const(Resource)) Resource
                            else if (Type=const(Item)) Item where (Blocked=const(false))
                            else if (Type=const("G/L Account")) "G/L Account"
                            else if (Type=const(Text)) "Standard Text";

            trigger OnValidate()
            begin
                Item.Reset;
                Item.SetRange(Item."No.","No.");
                if Item.FindSet then begin
                  "Unit of Measure Code":=Item."Base Unit of Measure";
                  "Bill Item Category Code":=Item."Item Category Code";
                  "Contract Quantity":=Item.Quantity;
                  end;
            end;
        }
        field(8;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Unit of Measure Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(10;"Bill Item Category Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code where (Blocked=filter(false));
        }
        field(11;"Contract Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Quantity Done";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Works Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Works End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Additional Comments/Note";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Photo No.";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Photo Record"."Photo ID" where ("Project ID"=field("Job No."));
        }
        field(17;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Work Execution Programme ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where ("Document Type"=filter("Work Execution Programme"),
                                                                                "Project ID"=field("Job No."));
        }
        field(19;"Road Side";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",LHS,RHS;
        }
        field(20;"Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(22;Repeated;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobPlanningLine: Record "Job Planning Line";
        Item: Record Item;
}

