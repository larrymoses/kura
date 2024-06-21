#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72374 "Project Template Line"
{

    fields
    {
        field(1; "Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Region Code"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Assignment Area ID" = field("Assignment Area ID"),
                                                                "Operating Unit Type" = filter(Region));
        }
        field(4; "Region Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Commenncement Order,Communication Plan,Staff Appointments,Internal Staff Disengement,Staff Disengagement,Mobilization Checklist,Mobilization Checklist Status Report,Professional Indemnity,Work Execution Plan,HSE Plan,RMP,QMP,Contract Supervision Requirement,Site Agent Nomination,Contractor Key Personnel Appointment,Equipment Delivery To Site,Insurance of Works,Advance Payment Guarantee,Performance Guarantee,Equipment Tracking';
            OptionMembers = " ","Commenncement Order","Communication Plan","Staff Appointments","Internal Staff Disengement","Staff Disengagement","Mobilization Checklist","Mobilization Checklist Status Report","Professional Indemnity","Work Execution Plan","HSE Plan",RMP,QMP,"Contract Supervision Requirement","Site Agent Nomination","Contractor Key Personnel Appointment","Equipment Delivery To Site","Insurance of Works","Advance Payment Guarantee","Performance Guarantee","Equipment Tracking";
        }
        field(6; "Sequence No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Project Role Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where("Team Type" = filter("Internal Project Team"));
        }
        field(8; "Table ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Assignment Area ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Duty Station"));
        }
        field(10; "First Approver Role Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where("Team Type" = filter("Internal Project Team"));
        }
        field(11; "Second Approver Role Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where("Team Type" = filter("Internal Project Team"));
        }
        field(12; "Third Approver Role Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where("Team Type" = filter("Internal Project Team"));
        }
        field(13; "Forth Approver Role Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where("Team Type" = filter("Internal Project Team"));
        }
        field(14; "Fifth Approver Role Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where("Team Type" = filter("Internal Project Team"));
        }
        field(15; "Sixth Approver Role Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where("Team Type" = filter("Internal Project Team"));
        }
        field(16; "No Of Approvers"; Integer)
        {
            //  CalcFormula = count(Table72377 where (Field1=field("Template ID"),
            //                                                  Field5=field("Document Type")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Template ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Table ID" := 72373;


        ProjectTemplateHeader.Reset;
        ProjectTemplateHeader.SetRange(ProjectTemplateHeader."Template ID", "Template ID");
        if ProjectTemplateHeader.FindSet then begin
            "Assignment Area ID" := ProjectTemplateHeader."Assignment Area ID";
        end;
    end;

    var
        ProjectTemplateHeader: Record "Project Template Header";
}

