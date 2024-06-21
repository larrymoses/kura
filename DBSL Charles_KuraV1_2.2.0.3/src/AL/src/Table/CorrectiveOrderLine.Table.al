#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72285 "Corrective Order Line"
{

    fields
    {
        field(1;"Order No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Job."No.";
        }
        field(3;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Job Task No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field("Project ID"));
        }
        field(5;"Plan Line No";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Planning Line"."Line No." where ("Job No."=field("Project ID"),
                                                                  "Job Task No."=field("Job Task No"));

            trigger OnValidate()
            begin
                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.","Project ID");
                JobPlanningLine.SetRange(JobPlanningLine."Job Task No.","Job Task No");
                JobPlanningLine.SetRange(JobPlanningLine."Line No.","Plan Line No");
                if JobPlanningLine.FindSet then begin
                  No:=JobPlanningLine."No.";
                  "Unit Of Measure":=JobPlanningLine."Unit of Measure";
                  "Bill Item Description":=JobPlanningLine.Description;
                  end;
                "Rework Status":="rework status"::Pending;
            end;
        }
        field(6;No;Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Job Planning Line"."No." where ("Job No."=field("Project ID"),
                                                             "Job Task No."=field("Job Task No"),
                                                             "Line No."=field("Plan Line No"));
        }
        field(7;"Bill Item Description";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Unit Of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(9;"Chainage Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Comments;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Rework Status";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Pending,Completed';
            OptionMembers = " ",Pending,Completed;
        }
        field(12;"Contractor Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Photo Number";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Photo Record"."Photo ID" where ("Project ID"=field("Project ID"));
        }
        field(14;"Closure Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Completion Percentage";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Completion Percentage"=100 then begin
                  "Rework Status":="rework status"::Completed;
                   "Closure Date":=Today;
                   end
                   else
                  "Rework Status":="rework status"::Pending;
                   "Closure Date":=0D;
            end;
        }
        field(16;"Category ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supervision Template Category"."Category ID";
        }
        field(17;"Requirement ID";Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;
        }
        field(18;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Response Option";Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Yes;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
    }

    keys
    {
        key(Key1;"Order No","Project ID","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobPlanningLine: Record "Job Planning Line";
}

