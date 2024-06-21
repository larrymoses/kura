#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72182 "WEP Execution Schedule"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Order-To-Commence,Work Execution Programme';
            OptionMembers = " ","Order-To-Commence","Work Execution Programme";
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Job No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(4;"Job Task No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field("Job No"));

            trigger OnValidate()
            begin
                JobTask.Reset;
                JobTask.SetRange(JobTask."Job Task No.","Job Task No");
                if JobTask.FindSet then begin
                  Description:=JobTask.Description;
                  end;
            end;
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Scheduled Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Scheduled End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Budget (Total Cost)";Decimal)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Planning Line"."Total Cost (LCY)";
        }
        field(9;"Job Task Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = " ",Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(10;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Job No","Job Task No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobTask: Record "Job Task";
}

