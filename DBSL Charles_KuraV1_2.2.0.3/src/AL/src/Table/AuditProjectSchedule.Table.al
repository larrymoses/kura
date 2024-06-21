#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95198 "Audit Project Schedule"
{
    DrillDownPageID = "Audit Project Schedules";
    LookupPageID = "Audit Project Schedules";

    fields
    {
        field(1;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Audit Phase";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planning,Fieldwork,Reporting & Exit,Followup';
            OptionMembers = " ",Planning,Fieldwork,"Reporting & Exit",Followup;
        }
        field(3;"Task No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Audit Duration (Days)";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(9;"Completion %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Lead Auditor ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Team"."Resource No." where (Blocked=filter(false),
                                                                       "Engagement ID"=field("Engagement ID"),
                                                                       "Audit Team Type"=filter("Auditor Team"));
        }
        field(11;"Lead Auditee Representative ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Team"."Resource No." where (Blocked=filter(false),
                                                                       "Engagement ID"=field("Engagement ID"),
                                                                       "Audit Team Type"=filter("Auditee Team"));
        }
    }

    keys
    {
        key(Key1;"Engagement ID","Audit Phase","Task No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditProject: Record "Audit Project";
        AuditExecutionHeader: Record "Audit Execution Header";
        AuditSurveyHeader: Record "Audit Survey Header";
        AuditFollowupHeader: Record "Audit Followup Header";
}

