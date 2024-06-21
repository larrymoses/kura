#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69149 "Career Developement Plan"
{

    fields
    {
        field(1;"Employee No";Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then
                "Job ID":=Employee.Position;
            end;
        }
        field(2;"Appraisal Type";Code[20])
        {
            TableRelation = "Appraisal Types".Code;
        }
        field(3;"Appraisal Period";Code[20])
        {
            NotBlank = true;
            TableRelation = "Appraisal Periods".Period;
        }
        field(4;"Job ID";Code[20])
        {
            TableRelation = "ManPower Planning Lines"."Entry No";
        }
        field(5;Type;Option)
        {
            OptionMembers = "Major Strenghts","Areas for Development","Training Needs","On Job Activities","Job Rotation";
        }
        field(6;Description;Code[20])
        {
            NotBlank = true;
            TableRelation = if (Type=const("Major Strenghts")) "Vacancy  Requisitions Table"."Manpower Plan ID" where (Description=const('4'),
                                                                                                                       Description=const('5'),
                                                                                                                       "No."=field("Job ID"))
                                                                                                                       else if (Type=const("Areas for Development")) "Vacancy  Requisitions Table"."Manpower Plan ID" where ("No."=field("Job ID"))
                                                                                                                       else if (Type=const("Training Needs")) "Advertisement Channels".Code;

            trigger OnValidate()
            begin
                if Type=Type::"Training Needs" then
                begin
                TrainingReq.Init;
                TrainingReq."Employee No":=xRec."Employee No";
                TrainingReq."Course Title":=Description;
                TrainingReq.Validate(TrainingReq."Course Title");
                TrainingReq."Need Source":=TrainingReq."need source"::Appraisal;
                TrainingReq.Insert(true);
                end;
            end;
        }
        field(7;Remarks;Text[250])
        {
        }
        field(8;"Remarks Appraisee";Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Employee No","Appraisal Type","Appraisal Period","Job ID",Type,Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
        TrainingReq: Record "Training Request";
}

