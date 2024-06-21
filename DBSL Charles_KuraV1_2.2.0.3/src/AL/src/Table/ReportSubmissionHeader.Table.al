#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Table 72368 "Report Submission Header"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Consultant No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if Vendor.Get("Consultant No.") then
                    "Consultant Name" := Vendor.Name;
            end;
        }
        field(4; "Consultant Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Project ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where("Type of Project" = filter("Survey/Study"));

            trigger OnValidate()
            begin
                if Job.Get("Project ID") then begin
                    "Project Name" := Job.Description;
                    "Consultant No." := Job."Contractor No.";
                    Validate("Consultant No.");
                    "Study/Survey Type" := Job."Study/Survey Type";
                    "Purchase Contract ID" := Job."Purchase Contract ID";
                    //VALIDATE("Purchase Contract ID");
                    Job.CalcFields("Total Approved Budget");
                    "Contract Sum" := Job."Total Approved Budget";
                end;
            end;
        }
        field(6; "Project Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Committee No."; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Tender Committee"."Document No.";//where ("Application Area"=filter(Evaluation));
        }
        field(8; "Report Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Studies/Surveys&Design Report"."Report Type" where("Project Type" = field("Study/Survey Type"));
        }
        field(9; "Study/Survey Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,ESIA Study,Topographic Survey,Traffic Census,Road Safety Audit,Design Works';
            OptionMembers = " ","ESIA Study","Topographic Survey","Traffic Census","Road Safety Audit","Design Works";
        }
        field(10; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Approved';
            OptionMembers = " ",Open,"Pending Approval",Approved;
        }
        field(14; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Purchase Contract ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Purchase Contract ID");
                if PurchaseHeader.FindSet then begin
                    "Contract Sum" := PurchaseHeader."Contract Sum";
                end;
            end;
        }
        field(16; "Contract Sum"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Rejection Remarks"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(18; Rejected; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Rejected By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Meeting Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Meeting Type".Code where(Blocked = filter(false));

            trigger OnValidate()
            begin
                ProjectMeetingType.Reset;
                ProjectMeetingType.SetRange(Code, "Meeting Type");
                if ProjectMeetingType.FindSet then
                    "Meeting Name" := ProjectMeetingType.Description;
            end;
        }
        field(21; "Meeting Venue"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Meeting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Meeting Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Meeting Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No." = '' then begin
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("Report Submission Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Report Submission Nos", xRec."No. Series", Today, "Document No.", "No. Series");
        end;


        Status := Status::Open;
        "Document Date" := Today;
        "Created By" := UserId;
        "Created DateTime" := CurrentDatetime;
    end;

    var
        Vendor: Record Vendor;
        Job: Record Job;
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PurchaseHeader: Record "Purchase Header";
        ProjectMeetingType: Record "Project Meeting Type";
}
