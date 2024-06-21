#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72325 "Extension of Time Reason"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Extension of Time Request,Contractor Variation Request,Project Variation Order,Budget Reallocation Voucher';
            OptionMembers = " ","Extension of Time Request","Contractor Variation Request","Project Variation Order","Budget Reallocation Voucher";
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
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                // JobPlanningLine.RESET;
                // JobPlanningLine.SETRANGE(JobPlanningLine."Job No.","Job No.");
                // JobPlanningLine.SETRANGE(JobPlanningLine."Job Task No.","Job Task No.");
                // JobPlanningLine.SETRANGE(JobPlanningLine."Line No.","Line No.");
                // IF JobPlanningLine.FINDSET THEN BEGIN
                //  Type:=JobPlanningLine.Type;
                //  "No.":=JobPlanningLine."No.";
                //  Description:=JobPlanningLine.Description;
                //  "Original Planning Date":=JobPlanningLine."Planning Date";
                //  "Revised Planning Date":=JobPlanningLine."Planning Date";
                //  //:=JobPlanningLine.Quantity;
                //
                //  END;
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
                // Item.RESET;
                // Item.SETRANGE(Item."No.","No.");
                // IF Item.FINDSET THEN BEGIN
                //  Description:=Item.Description;
                //  END;
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
                // IF "Original Planning Date"<>0D THEN BEGIN
                //  "Revised Planning Date":=CALCDATE("Extension Period (Days)","Original Planning Date");
                //  END;
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
        field(16;"Cause of Delay";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"EOT Requested Days";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"EOT Recommended Days";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19;Status;Option)
        {
            CalcFormula = lookup("Project Variation Header".Status where ("Document Type"=field("Document Type"),
                                                                          "Document No."=field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(25;"Original Project Starting Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26;"Original Project Ending Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                "Extended Project End Date":="Original Project Ending Date";
            end;
        }
        field(27;"Requested Extension Period";DateFormula)
        {
            Caption = 'Requested Extension Period (Days)';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Extended Project End Date":=CalcDate("Requested Extension Period","Original Project Ending Date");
            end;
        }
        field(28;"Extended Project End Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(58;"Approved Extension Period";Decimal)
        {
            CalcFormula = sum("Extension of Time Reason"."EOT Recommended Days" where ("Document No."=field("Document No."),
                                                                                       "Document Type"=field("Document Type")));
            FieldClass = FlowField;
        }
        field(59;"Revised Project End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Line No.")
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
        RecommendedVisible: Boolean;
}

