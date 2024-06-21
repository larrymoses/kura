#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 92428 "Schedule of PP Requirements"
{
    Caption = 'Schedule of PP Tender Requirements';

    fields
    {
        field(1; "Requirement Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Equipment Specifications,Personnel Specifications,Past Experience,Financials,Litigation,Risk Register';
            OptionMembers = "Equipment Specifications","Personnel Specifications","Past Experience",Financials,Litigation,"Risk Register";
        }
        field(2; "Document No"; Code[20])
        {
            Caption = 'Document No';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
            Editable = false;
        }
        field(4; "Project No"; Code[40])
        {
            Caption = 'Project No';
            Editable = false;
        }
        field(5; "KeRRA Budget Code"; Code[50])
        {
            Caption = 'KeRRA Budget Code';
            Editable = false;
        }
        field(6; "Project Scope Summary"; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Scope of Goods/Works/Services Offered';
        }
        field(7; "Type of Engagement"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Main Contractor,Assignee,Sub Contractor,Main Contractor/Subcontractor/Assignee';
            OptionMembers = ,"Main Contractor",Assignee,"Sub Contractor","Main Contractor/Subcontractor/Assignee";
        }
        field(8; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Equipment Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Category; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Equipment Description"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Minimum Required Qty (Equip)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Staff Role Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Title/Designation"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Min No of Recommended Staff"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Staff Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Others';
            OptionMembers = " ","Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Others;
        }
        field(17; "Litigation History Requirement"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Financial Requirement"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Financial Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Annual Average Construction Turnover,Working Capital,Credit Line,Audited Financial Accounts';
            OptionMembers = "Annual Average Construction Turnover","Working Capital","Credit Line","Audited Financial Accounts";
        }
        field(20; "Risk ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Risk Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Category".Code;

            trigger OnValidate()
            begin
                RiskCategory.Reset;
                RiskCategory.SetRange(RiskCategory.Code, "Risk Category");
                if RiskCategory.FindSet then begin
                    "Risk Title" := RiskCategory.Description;
                    "Risk Source ID" := RiskCategory."Risk Source ID";
                    //VALIDATE("Risk Source ID");
                end;
            end;
        }
        field(22; "Risk Title"; Text[440])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Risk Source ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Risk Source"."Source ID" where(Blocked = filter(FALSE));
        }
        field(24; "Risk Allocation"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Contractor,Employer';
            OptionMembers = " ",Contractor,Employer;
        }
        field(25; "Contractual Reference Clause"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Requirement Type", "Document No", "Line No", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Requirement Type", "Document No", "Type of Engagement", "Equipment Type")
        {
        }
        fieldgroup(Brick; "Requirement Type", "Document No", "Type of Engagement", "Equipment Type")
        {
        }
    }

    trigger OnDelete()
    var
        Task: Record "To-do";
        SegLine: Record "Segment Line";
        ContIndustGrp: Record "Contact Industry Group";
        ContactWebSource: Record "Contact Web Source";
        ContJobResp: Record "Contact Job Responsibility";
        ContMailingGrp: Record "Contact Mailing Group";
        ContProfileAnswer: Record "Contact Profile Answer";
        RMCommentLine: Record "Rlshp. Mgt. Comment Line";
        ContAltAddr: Record "Contact Alt. Address";
        ContAltAddrDateRange: Record "Contact Alt. Addr. Date Range";
        InteractLogEntry: Record "Interaction Log Entry";
        Opp: Record Opportunity;
        Cont: Record Contact;
        ContBusRel: Record "Contact Business Relation";
        IntrastatSetup: Record "Intrastat Setup";
        CampaignTargetGrMgt: Codeunit "Campaign Target Group Mgt";
        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
    begin
    end;

    trigger OnInsert()
    begin
        RoadWorkPlanPackage.Reset;
        RoadWorkPlanPackage.SetRange(RoadWorkPlanPackage."Road Work Program ID", Rec."Document No");
        //RoadWorkPlanPackage.SETRANGE(RoadWorkPlanPackage."Project No",Rec."Project No");
        RoadWorkPlanPackage.SetRange(RoadWorkPlanPackage."Entry No", Rec."Line No");
        if RoadWorkPlanPackage.FindSet then begin
            "Project No" := RoadWorkPlanPackage."Project No";
            "KeRRA Budget Code" := RoadWorkPlanPackage."KeRRA Budget Code";
        end;
    end;

    var
        CannotDeleteWithOpenTasksErr: label 'You cannot delete contact %1 because there are one or more tasks open.', Comment = '%1 = Contact No.';
        Text001: label 'You cannot delete the %2 record of the %1 because the contact is assigned one or more unlogged segments.';
        Text002: label 'You cannot delete the %2 record of the %1 because one or more opportunities are in not started or progress.';
        Text003: label '%1 cannot be changed because one or more interaction log entries are linked to the contact.';
        CannotChangeWithOpenTasksErr: label '%1 cannot be changed because one or more tasks are linked to the contact.', Comment = '%1 = Contact No.';
        Text006: label '%1 cannot be changed because one or more opportunities are linked to the contact.';
        Text007: label '%1 cannot be changed because there are one or more related people linked to the contact.';
        RelatedRecordIsCreatedMsg: label 'The %1 record has been created.', Comment = 'The Customer record has been created.';
        Text010: label 'The %2 record of the %1 is not linked with any other table.';
        RMSetup: Record "Marketing Setup";
        Salesperson: Record "Salesperson/Purchaser";
        PostCode: Record "Post Code";
        DuplMgt: Codeunit DuplicateManagement;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UpdateCustVendBank: Codeunit "CustVendBank-Update";
        CampaignMgt: Codeunit "Campaign Target Group Mgt";
        ContChanged: Boolean;
        SkipDefaults: Boolean;
        Text012: label 'You cannot change %1 because one or more unlogged segments are assigned to the contact.';
        Text019: label 'The %2 record of the %1 already has the %3 with %4 %5.';
        CreateCustomerFromContactQst: label 'Do you want to create a contact as a customer using a customer template?';
        Text021: label 'You have to set up formal and informal salutation formulas in %1  language for the %2 contact.';
        Text022: label 'The creation of the customer has been aborted.';
        Text033: label 'Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.';
        SelectContactErr: label 'You must select an existing contact.';
        AlreadyExistErr: label '%1 %2 already has a %3 with %4 %5.', Comment = '%1=Contact table caption;%2=Contact number;%3=Contact Business Relation table caption;%4=Contact Business Relation Link to Table value;%5=Contact Business Relation number';
        HideValidationDialog: Boolean;
        PrivacyBlockedPostErr: label 'You cannot post this type of document because contact %1 is blocked due to privacy.', Comment = '%1=contact no.';
        PrivacyBlockedCreateErr: label 'You cannot create this type of document because contact %1 is blocked due to privacy.', Comment = '%1=contact no.';
        PrivacyBlockedGenericErr: label 'You cannot use contact %1 because they are marked as blocked due to privacy.', Comment = '%1=contact no.';
        ParentalConsentReceivedErr: label 'Privacy Blocked cannot be cleared until Parental Consent Received is set to true for minor contact %1.', Comment = '%1=contact no.';
        ProfileForMinorErr: label 'You cannot use profiles for contacts marked as Minor.';
        RoadWorkPlanPackage: Record 72204;
        RiskCategory: Record 95104;
}
