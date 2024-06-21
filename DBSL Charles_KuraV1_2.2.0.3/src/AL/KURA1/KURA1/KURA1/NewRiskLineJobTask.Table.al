#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95128 "New Risk Line Job Task"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Risk Voucher,Risk Status Report';
            OptionMembers = " ","New Risk Voucher","Risk Status Report";
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Risk ID";Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;
        }
        field(4;"Job No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(5;"Job Task No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field("Job No"));
        }
        field(6;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Plan Line No";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Planning Line"."Line No." where ("Job Task No."=field("Job Task No"));

            trigger OnValidate()
            begin
                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Line No.","Plan Line No");
                if JobPlanningLine.FindSet then begin
                  No:=JobPlanningLine."No.";
                  Description:=JobPlanningLine.Description;
                  end;
            end;
        }
        field(8;No;Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Risk ID","Job No","Job Task No")
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

