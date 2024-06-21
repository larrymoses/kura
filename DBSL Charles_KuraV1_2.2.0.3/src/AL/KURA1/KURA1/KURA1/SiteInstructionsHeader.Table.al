#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72342 "Site Instructions Header"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {

            Editable = false;
        }
        field(2; "Document Date"; Date)
        {

            Editable = false;
        }
        field(3; "Project ID"; Code[20])
        {

            TableRelation = Job."No.";

            trigger OnValidate()
            var
                SiteInstructionsLine: Record "Site Instructions Line";
            begin
                Job.Reset;
                Job.SetRange("No.", "Project ID");
                if Job.FindSet then begin
                    "Project Name" := Job.Description;
                    "Contract No" := Job."Purchase Contract ID";
                    Validate("Contract No");
                    "Contractor No." := Job."Contractor No.";
                    Validate("Contractor No.");
                    "Region ID" := Job."Region ID";
                    Validate("Region ID");
                    "Directorate ID" := Job."Directorate Code";
                    Validate("Directorate ID");
                    "Department ID" := Job."Department ID";
                    Validate("Department ID");
                    "Site Instruction No" := Job."Last Site Inst No" + 1;
                end;
                WEPContractorSubmission.Reset;
                WEPContractorSubmission.SetCurrentkey("Document Type", Status, "Project No");
                WEPContractorSubmission.SetRange(WEPContractorSubmission."Project No", "Project ID");
                WEPContractorSubmission.SetRange(WEPContractorSubmission."Document Type", WEPContractorSubmission."document type"::"Site Agent Nomination");
                WEPContractorSubmission.SetRange(WEPContractorSubmission.Status, WEPContractorSubmission.Status::Released);
                if WEPContractorSubmission.FindSet then begin
                    "Site Agent No." := WEPContractorSubmission."Site Agent Staff No";
                    "Site Agent Name" := WEPContractorSubmission."Site Agent Name";
                end;
                if xRec."Project ID" <> Rec."Project ID" then begin
                    SiteInstructionsLine.Reset();
                    SiteInstructionsLine.SetRange("Document No.", Rec."Document No.");
                    if SiteInstructionsLine.FindSet() then begin
                        repeat
                            SiteInstructionsLine.Validate("Project ID", Rec."Project ID");
                            SiteInstructionsLine.modify();
                        until SiteInstructionsLine.Next() = 0;
                    end
                end
            end;
        }
        field(4; "Project Name"; Text[250])
        {

            Editable = false;
        }
        field(5; "Contract No"; Code[20])
        {


            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange("No.", "Contract No");
                if PurchaseHeader.FindSet then begin
                    "Contractor No." := PurchaseHeader."Buy-from Vendor No."
                end;
            end;
        }
        field(6; "Contractor No."; Code[20])
        {


            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange("No.", "Contractor No.");
                if Vendor.FindSet then begin

                    "Contractor Name" := Vendor.Name;
                end;
            end;
        }
        field(7; "Contractor Name"; Text[250])
        {

            Editable = false;
        }
        field(8; "Start Chainage"; Decimal)
        {

        }
        field(9; "End Chainage"; Decimal)
        {

        }
        field(10; "Chainage Description"; Text[250])
        {

        }
        field(11; "Works Instructions(Descriptio)"; Text[2048])
        {

        }
        field(12; "Region ID"; Code[20])
        {

            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, "Region ID");
                if ResponsibilityCenter.FindSet then
                    "Region Name" := ResponsibilityCenter.Name;
            end;
        }
        field(13; "Region Name"; Text[250])
        {

            Editable = false;
        }
        field(14; "Directorate ID"; Code[20])
        {

            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, "Directorate ID");
                if ResponsibilityCenter.FindSet then
                    "Directorate Name" := ResponsibilityCenter.Name;
            end;
        }
        field(15; "Directorate Name"; Text[250])
        {

            Editable = false;
        }
        field(16; "Department ID"; Code[20])
        {

            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, "Department ID");
                if ResponsibilityCenter.FindSet then
                    "Department Name" := ResponsibilityCenter.Name;
            end;
        }
        field(17; "Department Name"; Text[250])
        {

            Editable = false;
        }
        field(18; "Created By"; Code[100])
        {

            Editable = false;
        }
        field(19; "Created DateTime"; DateTime)
        {

            Editable = false;
        }
        field(20; Posted; Boolean)
        {

            Editable = false;
        }
        field(21; "Site Agent No."; Code[100])
        {

            TableRelation = "WEP Contractor Submission"."Site Agent Staff No" where("Contractor No" = field("Contractor No."),
                                                                                     "Project No" = field("Project ID"));

            trigger OnValidate()
            begin
                WEPContractorSubmission.RESET;
                WEPContractorSubmission.SETRANGE(WEPContractorSubmission."Project No", "Project ID");
                WEPContractorSubmission.SETRANGE(WEPContractorSubmission."Contractor No", "Contractor No.");
                IF WEPContractorSubmission.FINDSET THEN
                    "Site Agent Name" := WEPContractorSubmission."Site Agent Name";
            end;
        }
        field(22; "Site Agent Name"; Text[250])
        {

            Editable = false;
        }
        field(23; Status; Option)
        {

            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Appoved,Rejected';
            OptionMembers = " ",Open,"Pending Approval",Appoved,Rejected;
        }
        field(24; "Portal Status"; Option)
        {

            Editable = false;
            OptionCaption = ' ,Draft,Submitted';
            OptionMembers = " ",Draft,Submitted;
        }
        field(25; "No. Series"; Code[20])
        {

            Editable = false;
        }
        field(26; "Total Amount Exclusive VAT"; Decimal)
        {
            CalcFormula = sum("Site Instructions Line".Amount where("Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "Total Amount Inclusive VAT"; Decimal)
        {
            CalcFormula = sum("Site Instructions Line"."Total Amount" where("Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Site Instruction No"; Integer)
        {

            Editable = false;
        }
        field(29; "Acknowledgement Status"; Option)
        {

            Editable = false;
            OptionCaption = ' ,Draft,Acknowledged';
            OptionMembers = " ",Draft,Acknowledged;
        }
        field(30; "Acknowledged By"; Code[200])
        {

            Editable = false;
        }
        field(31; "Acknowledment DateTime"; DateTime)
        {

            Editable = false;
        }
        field(32; "Rejection Remarks"; Text[2048])
        {

        }
        field(33; "Rejected By"; Code[100])
        {

            Editable = false;
        }
        field(34; "Date Time Rejected"; DateTime)
        {

            Editable = false;
        }
        field(35; "Road Code"; Code[50])
        {
            TableRelation = "Project Road Link"."Road Code" where("Global Budget Book Code" = field("Project ID"));
            trigger OnValidate()
            var
                RoadInventory: Record "Road Inventory";
            begin
                RoadInventory.Reset();
                RoadInventory.SetRange("Road Code", Rec."Road Code");
                if RoadInventory.FindFirst() then
                    "Road Name" := RoadInventory."Link Name";
            end;
        }
        field(36; "Road Name"; Text[150])
        {

        }
        field(37; "Posted Date Time"; Datetime)
        {
            
        }
        field(38; "Reference No."; Code[50])
        {
            
        }
        field(39; "Site Instruction Type"; Enum "SIte Instruction Type")
        {
            
        }
        field(40; "Site Instruction Heading"; Text[500])
        {
            
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
            RoadManagementSetup.TestField("Site Instructions Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Site Instructions Nos", xRec."No. Series", Today, "Document No.", "No. Series");
        end;

        "Document Date" := Today;
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
        Status := Status::Open;
        "Portal Status" := "portal status"::Draft;
        "Acknowledgement Status" := "acknowledgement status"::Draft;
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        Job: Record Job;
        Vendor: Record Vendor;
        ResponsibilityCenter: Record "Responsibility Center";
        PurchaseHeader: Record "Purchase Header";
        WEPContractorSubmission: Record "WEP Contractor Submission";
}

