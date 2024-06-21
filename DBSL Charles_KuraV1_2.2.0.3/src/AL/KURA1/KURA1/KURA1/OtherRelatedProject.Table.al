#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72417 "Other Related Project"
{
    Caption = 'Other Related Project';
    DataCaptionFields = "Project No.", Description;
    DrillDownPageID = "Other Related Projects";
    LookupPageID = "Other Related Projects";

    fields
    {
        field(1; "Project No."; Code[50])
        {
            Caption = 'No.';
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.", "Project No.");
                if ObjJob.FindSet then begin
                    Description := ObjJob.Description;
                    "Search Description" := ObjJob.Description;
                    "Starting Date" := ObjJob."Starting Date";
                    "Ending Date" := ObjJob."Ending Date";
                end;
            end;
        }
        field(2; "Search Description"; Code[250])
        {
            Caption = 'Search Description';
            Editable = false;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(4; "Description 2"; Text[250])
        {
            Caption = 'Description 2';
            Editable = false;
        }
        field(5; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            NotBlank = false;
            TableRelation = Customer;
            ValidateTableRelation = true;
        }
        field(12; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            Editable = false;
        }
        field(13; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            Editable = false;
        }
        field(14; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            Editable = false;
        }
        field(55; "Resource Gr. Filter"; Code[20])
        {
            Caption = 'Resource Gr. Filter';
            FieldClass = FlowFilter;
            TableRelation = "Resource Group";
        }
        field(56; "Scheduled Res. Gr. Qty."; Decimal)
        {
            Caption = 'Scheduled Res. Gr. Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = Normal;
        }
    }

    keys
    {
        key(Key1; "Project No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Description")
        {
        }
    }

    fieldgroups
    {
        // fieldgroup(DropDown;"Project No.",Description,"Bill-to Customer No.",Field70044,"Starting Date",Field19)
        // {
        // }
        // fieldgroup(Brick;"Project No.",Description,"Bill-to Customer No.","Starting Date",Field19,Field140)
        // {
        // }
    }

    trigger OnDelete()
    var
        CommentLine: Record "Comment Line";
        JobTask: Record "Job Task";
        JobResPrice: Record "Job Resource Price";
        JobItemPrice: Record "Job Item Price";
        JobGLAccPrice: Record "Job G/L Account Price";
    begin
    end;

    var
        AssociatedEntriesExistErr: label 'You cannot change %1 because one or more entries are associated with this %2.', Comment = '%1 = Name of field used in the error; %2 = The name of the Job table';
        JobsSetup: Record "Jobs Setup";
        PostCode: Record "Post Code";
        ObjJob: Record Job;
        Cust: Record Customer;
        Cont: Record Contact;
        ContBusinessRelation: Record "Contact Business Relation";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
        StatusChangeQst: label 'This will delete any unposted WIP entries for this job and allow you to reverse the completion postings for this job.\\Do you wish to continue?';
        ContactBusRelDiffCompErr: label 'Contact %1 %2 is related to a different company than customer %3.', Comment = '%1 = The contact number; %2 = The contact''s name; %3 = The Bill-To Customer Number associated with this job';
        ContactBusRelErr: label 'Contact %1 %2 is not related to customer %3.', Comment = '%1 = The contact number; %2 = The contact''s name; %3 = The Bill-To Customer Number associated with this job';
        ContactBusRelMissingErr: label 'Contact %1 %2 is not related to a customer.', Comment = '%1 = The contact number; %2 = The contact''s name';
        TestBlockedErr: label '%1 %2 must not be blocked with type %3.', Comment = '%1 = The Job table name; %2 = The Job number; %3 = The value of the Blocked field';
        ReverseCompletionEntriesMsg: label 'You must run the %1 function to reverse the completion entries that have already been posted for this job.', Comment = '%1 = The name of the Job Post WIP to G/L report';
        MoveEntries: Codeunit MoveEntries;
        OnlineMapMsg: label 'Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.';
        CheckDateErr: label '%1 must be equal to or earlier than %2.', Comment = '%1 = The job''s starting date; %2 = The job''s ending date';
        BlockedCustErr: label 'You cannot set %1 to %2, as this %3 has set %4 to %5.', Comment = '%1 = The Bill-to Customer No. field name; %2 = The job''s Bill-to Customer No. value; %3 = The Customer table name; %4 = The Blocked field name; %5 = The job''s customer''s Blocked value';
        ApplyUsageLinkErr: label 'A usage link cannot be enabled for the entire %1 because usage without the usage link already has been posted.', Comment = '%1 = The name of the Job table';
        WIPMethodQst: label 'Do you want to set the %1 on every %2 of type %3?', Comment = '%1 = The WIP Method field name; %2 = The name of the Job Task table; %3 = The current job task''s WIP Total type';
        WIPAlreadyPostedErr: label '%1 must be %2 because job WIP general ledger entries already were posted with this setting.', Comment = '%1 = The name of the WIP Posting Method field; %2 = The previous WIP Posting Method value of this job';
        WIPAlreadyAssociatedErr: label '%1 cannot be modified because the job has associated job WIP entries.', Comment = '%1 = The name of the WIP Posting Method field';
        WIPPostMethodErr: label 'The selected %1 requires the %2 to have %3 enabled.', Comment = '%1 = The name of the WIP Posting Method field; %2 = The name of the WIP Method field; %3 = The field caption represented by the value of this job''s WIP method';
        EndingDateChangedMsg: label '%1 is set to %2.', Comment = '%1 = The name of the Ending Date field; %2 = This job''s Ending Date value';
        UpdateJobTaskDimQst: label 'You have changed a dimension.\\Do you want to update the lines?';
        DocTxt: label 'Job Quote';
        RunWIPFunctionsQst: label 'You must run the %1 function to create completion entries for this job. \Do you want to run this function now?', Comment = '%1 = The name of the Job Calculate WIP report';
        FundOp: Record "Funding Oportunity";
        GrantsSetup: Record "Grants Setup";
        GFA: Record "Grant Funding Application";
        Res: Record Resource;
        PemissionDenied: label 'User Account is not Setup for Project Creation. Contact System Administrator.';
        UserNotFound: label 'User Setup %1 not found.';
        PemissionDeniedd: label 'User Account is not Setup for Project Modification. Contact System Administrator.';
        Usersetup: Record "User Setup";
        RMSetup: Record "Roads Management Setup";
        // RoadInventory: Record "Road Inventory";
        // RoadSection: Record "Road Section";
        WorksCategory: Record "Works Category";
        Vendor: Record Vendor;
        PurchaseHeader: Record "Purchase Header";
        ResponsibilityCenter: Record "Responsibility Center";
}

