#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72280 "WEP Contractor Submission"
{

    fields
    {
        field(1; "Document No"; Code[20])
        {
            
            Editable = false;
        }
        field(2; "Document Type"; Option)
        {
            
            Editable = false;
            OptionCaption = ' ,Site Agent Nomination,Contractor Personnel Appointment,Plan of Equipment Delivery to Site,Contractor Staff Disengagement';
            OptionMembers = " ","Site Agent Nomination","Contractor Personnel Appointment","Plan of Equipment Delivery to Site","Contractor Staff Disengagement";
        }
        field(3; "Contract ID"; Code[20])
        {
            
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Contract ID");
                if PurchaseHeader.FindSet then begin
                    "IFS Code" := PurchaseHeader."IFS Code";
                    "Bid Response No" := PurchaseHeader."Awarded Bid No";
                end;
            end;
        }
        field(4; "Project No"; Code[20])
        {
            
            TableRelation = Job."No." where(Status = filter("Completed/Under DLP" | Ongoing | "Under PBRM"));

            trigger OnValidate()
            begin
                if Job.Get("Project No") then begin
                    "Project No" := Job."No.";
                    "Project Name" := Job.Description;
                    "Contract ID" := Job."Purchase Contract ID";
                    Validate("Contract ID");
                    "Contractor No" := Job."Contractor No.";
                    Validate("Contractor No");
                    "Contractor Name" := Job."Contractor Name";
                    "Work Execution Plan" := Job."Work Execution Plan ID";
                end;
            end;
        }
        field(5; "Contractor No"; Code[20])
        {
            
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.", "Contractor No");
                if Vendor.FindSet then begin
                    "Contractor Name" := Vendor.Name;
                    "Contractor Address" := Vendor.Address;
                    "Contractor Address 2" := Vendor."Address 2";
                    "Contractor Email Address" := Vendor."E-Mail";
                    "Contractor City" := Vendor.City;
                end;
            end;
        }
        field(6; "Contractor Name"; Text[250])
        {
            
            Editable = false;
        }
        field(7; "Project Name"; Text[250])
        {
            
            Editable = false;
        }
        field(8; "Work Execution Plan"; Code[20])
        {
            
        }
        field(9; "Created By"; Code[100])
        {
            
            Editable = false;
        }
        field(10; "Created DateTime"; DateTime)
        {
            
            Editable = false;
        }
        field(11; "Document Date"; Date)
        {
            
            Editable = false;
        }
        field(12; Status; Option)
        {
            
            OptionCaption = ' ,Open,Pending Approval,Released,Rejected,Temporary Approval';
            OptionMembers = " ",Open,"Pending Approval",Rejected,"TemporaryApproval",Released;
        }
        field(13; "Site Agent Staff No"; Code[20])
        {
            
        }
        field(14; "Site Agent Name"; Text[250])
        {
            
        }
        field(15; "Telephone No"; Code[100])
        {
            NotBlank = true;
        }
        field(16; "E-mail"; Code[100])
        {
            NotBlank = true;
        }
        field(17; Address; Code[50])
        {
            
        }
        field(18; "Address 2"; Code[200])
        {
            
        }
        field(19; City; Code[20])
        {
            
        }
        field(20; "No Series"; Code[20])
        {
            
        }
        field(21; "IFS Code"; Code[20])
        {
            
        }
        field(22; "Bid Response No"; Code[20])
        {
            
        }
        field(23; "Approval Type"; Option)
        {
            
            OptionCaption = ' ,Approved,Temporary Approval,Rejected';
            OptionMembers = " ",Approved,"Temporary Approval",Rejected;

            trigger OnValidate()
            begin
                if "Approval Type" = "approval type"::"Temporary Approval" then begin
                    Dialog.Message('Please specify the Validity Period');
                end;
            end;
        }
        field(24; "Validity Period"; DateFormula)
        {
            

            trigger OnValidate()
            begin
                "Expiry Date" := CalcDate("Validity Period", "Document Date");
            end;
        }
        field(25; "Expiry Date"; Date)
        {
            
            Editable = false;
        }
        field(26; "Appointment Voucher No"; Code[20])
        {
            
            TableRelation = "WEP Contractor Submission"."Document No" where("Document Type" = filter("Contractor Personnel Appointment"),
                                                                             "Project No" = field("Project No"));
        }
        field(27; "Portal Status"; Option)
        {
            
            OptionCaption = 'Draft,Submitted,Realeased';
            OptionMembers = Draft,Submitted,Realesed;
        }
        field(28; "Contractor Email Address"; Code[200])
        {
            
            ExtendedDatatype = EMail;
        }
        field(29; "Contractor Address"; Code[200])
        {
            
        }
        field(30; "Contractor Address 2"; Code[200])
        {
            
        }
        field(31; "Contractor City"; Code[200])
        {
            
        }
        field(32; "Rejection Remarks"; Text[2048])
        {
            
        }
        field(33; "Rejected By"; Code[150])
        {
            
        }
        field(34; Rejected; Boolean)
        {
            
        }
        field(35; "Assigned To."; Code[100])
        {
            
            TableRelation = "User Setup"."User ID";
        }
        field(36; "Global Dimension 1 Code"; Code[20])
        {
            
        }
    }

    keys
    {
        key(Key1; "Document No", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No" = '' then begin
            if "Document Type" = "document type"::"Plan of Equipment Delivery to Site" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Contractor Equipment Reg Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Contractor Equipment Reg Nos", xRec."No Series", Today, "Document No", "No Series");
            end;
        end;
        if "Document No" = '' then begin
            if "Document Type" = "document type"::"Contractor Personnel Appointment" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Contractor Personnel App Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Contractor Personnel App Nos", xRec."No Series", Today, "Document No", "No Series");
            end;
        end;
        if "Document No" = '' then begin
            if "Document Type" = "document type"::"Site Agent Nomination" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Site Agent Appointment Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Site Agent Appointment Nos", xRec."No Series", Today, "Document No", "No Series");
            end;
        end;
        if "Document No" = '' then begin
            if "Document Type" = "document type"::"Contractor Staff Disengagement" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Contractor Staff Disengagement");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Contractor Staff Disengagement", xRec."No Series", Today, "Document No", "No Series");
            end;
        end;
        "Document Date" := Today;
        Status := Status::Open;
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        Job: Record Job;
        PurchaseHeader: Record "Purchase Header";
        WEPContractorTeam: Record "WEP Contractor Team";
        ContrStaffDisengagementLine: Record "Contr Staff Disengagement Line";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        Vendor: Record Vendor;
}

