#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72310 "Checklist Status Report"
{
    DrillDownPageID = "Mobilization Checklists";
    LookupPageID = "Mobilization Checklists";

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Order-To-Commence,Work Execution Programme,Mobilization Checklist,Mobilization Checklist Status Report';
            OptionMembers = " ","Order-To-Commence","Work Execution Programme","Mobilization Checklist","Mobilization Checklist Status Report";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Requirement ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Pending,Ongoing,Complete';
            OptionMembers = " ",Pending,Ongoing,Complete;

            trigger OnValidate()
            begin
                if Status=Status::Complete then
                  "Percentage Completion":=100;
            end;
        }
        field(6;"Additional Remarks/Comments";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Percentage Completion";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if (("Percentage Completion" >0) and ("Percentage Completion"<100)) then
                  Status:=Status::Ongoing;
                if "Percentage Completion" =0 then
                  Status:=Status::Pending;
                if "Percentage Completion" =100 then
                  Status:=Status::Complete;
            end;
        }
        field(8;"Mobilization Checlist No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

