#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72202 "Health Safety Plan HeaderS"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Plan,Template';
            OptionMembers = " ",Plan,Template;
        }
        field(3; "Plan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Company,Project';
            OptionMembers = " ",Company,Project;
        }
        field(4; "Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Health Safety Plan HeaderS".Code where("Document Type" = const(Template),
                                                                     Blocked = filter(false),
                                                                     Status = filter(Released));
        }
        field(5; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            // trigger OnValidate()
            // begin
            //     Job.Reset;
            //     Job.SetRange("No.", "Project ID");
            //     if Job.FindSet then begin
            //         "Project Name" := Job.Description;
            //         "Project End Date" := Job."Ending Date";
            //         "Project Start Date" := Job."Starting Date";
            //         if "Plan Type" = "plan type"::Company then
            //             Description := 'Corporate Health & Safety Management Plan';
            //         // if "Plan Type"="plan type"::"3" then
            //         //  Description:='Health & Safety (H&S) Management Plan'+'-' +"Project ID";
            //     end;
            // end;
        }
        field(6; "Work Execution Plan No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where("Document Type" = filter("Work Execution Programme"));
        }
        field(7; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Primary Mission"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Project Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Project End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(14; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Code", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
        Status := Status::Open;
    end;

    var
        Job: Record Job;
}

