#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72335 "Project Eval Time Line"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Evaluation Report,Professional Opinion,Notice of Award';
            OptionMembers = "Evaluation Report","Professional Opinion","Notice of Award";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Job No.";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Variation Header"."Project ID";
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
                  "Original Planning Date":=JobPlanningLine."Planning Date";
                  "Revised Planning Date":=JobPlanningLine."Planning Date";
                  //:=JobPlanningLine.Quantity;

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

            trigger OnValidate()
            begin
                Item.Reset;
                Item.SetRange(Item."No.","No.");
                if Item.FindSet then begin
                  Description:=Item.Description;
                  end;
            end;
        }
        field(8;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Original Planning Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Extension Period (Days)";DateFormula)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Original Planning Date"<>0D then begin
                  "Revised Planning Date":=CalcDate("Extension Period (Days)","Original Planning Date");
                  end;
            end;
        }
        field(11;"Revised Planning Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;Remarks;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Shortcut Dimension 1 Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Shortcut Dimension 2 Code";Code[20])
        {
            DataClassification = ToBeClassified;
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
         ProjectVariationHeader.SetRange(ProjectVariationHeader."Document No.","Document No.");
         if ProjectVariationHeader.FindSet then begin
          "Job No.":=ProjectVariationHeader."Project ID";


          end;
    end;

    var
        JobPlanningLine: Record "Job Planning Line";
        Item: Record Item;
        ProjectVariationHeader: Record "Project Variation Header";
}

