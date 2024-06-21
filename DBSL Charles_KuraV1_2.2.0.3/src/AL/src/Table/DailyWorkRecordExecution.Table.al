#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72239 "Daily Work Record Execution"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Record No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Job No.";Code[40])
        {
            DataClassification = ToBeClassified;
            Description = '"Daily Work Record"."Project ID"';
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
                  "Unit of Measure Code":=JobPlanningLine."Unit of Measure";
                   "No.":=JobPlanningLine."No.";
                   Validate("No.");
                   Description:=JobPlanningLine.Description;
                  "Contract Quantity":=JobPlanningLine.Quantity;
                  "Quantity Done":=JobPlanningLine.Quantity;
                  end;
            end;
        }
        field(6;Type;Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Item;
            OptionCaption = ' ,Resource,Item,G/L Account,Text';
            OptionMembers = " ",Resource,Item,"G/L Account",Text;
        }
        field(7;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No." where (Blocked=filter(false));

            trigger OnValidate()
            begin
                ObjItem.Reset;
                ObjItem.SetRange(ObjItem."No.","No.");
                if ObjItem.FindSet then begin
                  "Bill Item Category Code":=ObjItem."Item Category Code";
                  Description:=ObjItem.Description;
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
            Editable = false;
        }
        field(12;"Quantity Done";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Works Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                 if "Works Start Chainage"< 0 then
                  Error(FieldCaption("Works End Chainage")+'  '+'cannot be less than zero')
            end;
        }
        field(14;"Works End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                   if "Works Start Chainage" >="Works End Chainage" then
                    Error(FieldCaption("Works Start Chainage")+' '+'cannot be less than or equal to'+' '+FieldCaption("Works End Chainage"));
            end;
        }
        field(15;"Additional Comments/Notes";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Photo No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Photo Record"."Photo ID" where ("Project ID"=field("Job No."));
        }
        field(17;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Shortcut Dimension 1 Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=filter(1));
        }
        field(19;"Shortcut Dimension 2 Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=filter(2));
        }
        field(20;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Road Side";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",LHS,RHS;
        }
        field(22;"Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(24;Repeated;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Record No.","Job No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        DailyWorkRecord.Reset;
        DailyWorkRecord.SetRange(DailyWorkRecord."Document No.","Document No.");
        if DailyWorkRecord.FindSet then begin
          "Job No.":=DailyWorkRecord."Project ID";
          "Works Start Chainage":=DailyWorkRecord."Works Start Chainage";
          "Works End Chainage":=DailyWorkRecord."Works End Chainage";
          "Document Date":=DailyWorkRecord."Document Date";
          end;
    end;

    var
        JobPlanningLine: Record "Job Planning Line";
        ObjItem: Record Item;
        DailyWorkRecord: Record "Daily Work Record";
}

