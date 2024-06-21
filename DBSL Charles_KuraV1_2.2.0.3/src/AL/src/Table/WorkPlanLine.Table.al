#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Table 72316 "Work Plan Line"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Daily,Weekly,Monthly';
            OptionMembers = " ",Daily,Weekly,Monthly;
        }
        field(3;"Activity Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field("Project ID"));

            trigger OnValidate()
            begin
                JobTask.Reset;
                //JobTask.SETRANGE(JobTask."Job No.","Project ID");
                JobTask.SetRange(JobTask."Job Task No.","Activity Code");
                if JobTask.FindSet then begin
                   "Activity Description":=JobTask.Description;
                  end;
            end;
        }
        field(4;"Activity Description";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;"Total Done To date";Decimal)
        {
            FieldClass = Normal;
        }
        field(7;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(8;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Monthly Work Plan";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Target Quantity";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Document Type","Activity Code","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        WorkPlanHeader.Reset;
        WorkPlanHeader.SetRange(WorkPlanHeader."Document No.","Document No.");
        if WorkPlanHeader.FindSet then begin
            "Project ID":=WorkPlanHeader."Project ID";
          end;
    end;

    var
        WorkPlanHeader: Record "Work Plan Header";
        JobTask: Record "Job Task";
}
