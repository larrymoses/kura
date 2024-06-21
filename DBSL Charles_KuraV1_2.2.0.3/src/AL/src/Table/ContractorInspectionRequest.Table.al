#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72318 "Contractor Inspection Request"
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
        field(3; "Requires Lab Test"; Boolean)
        {

        }
        field(4; "Project ID"; Code[20])
        {

            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindSet then begin
                    "Project Name" := Job.Description;
                    "Resident Engineer ID" := Job."Project Manager";
                    "Residnet Engineer Name" := Job."Project Manager";
                    Validate("Resident Engineer ID");
                    "Purchase Contract ID" := Job."Purchase Contract ID";
                    Validate("Purchase Contract ID");
                    "Contractor No." := Job."Contractor No.";
                    Validate("Contractor No.");
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
            end;
        }
        field(5; "Project Name"; Text[250])
        {

            Editable = false;
        }
        field(6; "Purchase Contract ID"; Code[20])
        {

            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Purchase Contract ID");
                if PurchaseHeader.FindSet then begin
                    "Contract Name" := PurchaseHeader."Tender Name";
                    "Contractor No." := PurchaseHeader."Buy-from Vendor No.";
                    Validate("Contractor No.");
                end;
            end;
        }
        field(7; "Contract Name"; Text[250])
        {

            Editable = false;
        }
        field(8; "Contractor No."; Code[20])
        {

            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.", "Contractor No.");
                if Vendor.FindSet then
                    "Contractor Name" := Vendor.Name;
            end;
        }
        field(9; "Contractor Name"; Text[250])
        {

            Editable = false;
        }
        field(10; "Daily/Weekly/Monthly W/Plan No"; Code[20])
        {

            TableRelation = "Work Plan Header"."Document No." where("Project ID" = field("Project ID"));

            trigger OnValidate()
            begin
                WorkPlanHeader.Reset;
                WorkPlanHeader.SetRange(WorkPlanHeader."Document No.", "Daily/Weekly/Monthly W/Plan No");
                if WorkPlanHeader.FindSet then begin
                    "Project ID" := WorkPlanHeader."Project ID";
                    Validate("Project ID");
                    "Contractor No." := WorkPlanHeader."Contractor No.";
                    Validate("Contractor No.");
                    "Purchase Contract ID" := WorkPlanHeader."Purchase Contract ID";
                    Validate("Purchase Contract ID");
                    "Resident Engineer ID" := WorkPlanHeader."Resident Engineer ID";
                    Validate("Resident Engineer ID");
                    "Site Agent No." := WorkPlanHeader."Site Agent ID";
                    Validate("Site Agent No.");
                end;
                //CC
                WorkPlanHeader.Reset;
                WorkPlanHeader.SetRange(WorkPlanHeader."Document No.", "Daily/Weekly/Monthly W/Plan No");
                IF WorkPlanHeader.FindSet() THEN BEGIN

                    PlanningWorkPlanLine.Reset;
                    PlanningWorkPlanLine.SetRange(PlanningWorkPlanLine."Document No.", WorkPlanHeader."Document No.");
                    if PlanningWorkPlanLine.FindSet then
                        repeat
                            TestRequestLine.Init;
                            //    TestRequestLine.TRANSFERFIELDS(PlanningWorkPlanLine);
                            TestRequestLine."Document No." := "Document No.";
                            TestRequestLine."Project ID" := "Project ID";
                            TestRequestLine."Contractor No." := "Contractor No.";
                            TestRequestLine."Activity Code" := PlanningWorkPlanLine."Activity Code";
                            TestRequestLine."Line No." := PlanningWorkPlanLine."Entry No";
                            TestRequestLine."Activity Description" := PlanningWorkPlanLine."Works Description";
                            TestRequestLine."Total Done Todate" := PlanningWorkPlanLine."Total Done Todate";
                            TestRequestLine."Works Start Chainage(KM)" := PlanningWorkPlanLine."Works Start Chainage(KM)";
                            TestRequestLine."Works End Chanage(KM)" := PlanningWorkPlanLine."Works End Chanage(KM)";
                            TestRequestLine."Unit Of Measure" := PlanningWorkPlanLine."Unit Of Measure";
                            TestRequestLine."Foreman ID" := PlanningWorkPlanLine."Foreman ID";
                            TestRequestLine."Foreman Name" := PlanningWorkPlanLine."Foreman Name";
                            if not TestRequestLine.Insert(true) then
                                TestRequestLine.Modify(true);
                        until PlanningWorkPlanLine.Next = 0;
                end;
            END;
        }
        field(11; "Resident Engineer ID"; Code[100])
        {

        }
        field(12; "Residnet Engineer Name"; Text[250])
        {

            Editable = false;
        }
        field(13; "Site Agent No."; Code[20])
        {

        }
        field(14; "Site Agent Name"; Text[250])
        {

            Editable = false;
        }
        field(15; "Created By"; Code[100])
        {

            Editable = false;
        }
        field(16; "Prepared By"; Code[100])
        {

            Editable = false;
        }
        field(17; "Created Date Time"; DateTime)
        {

            Editable = false;
        }
        field(18; "Last Modified By"; Code[100])
        {

            Editable = false;
        }
        field(19; "Last Modified Date Time"; DateTime)
        {

            Editable = false;
        }
        field(20; "No. Series"; Code[20])
        {

            Editable = false;
        }
        field(21; "Lab Remarks"; Text[250])
        {


            trigger OnValidate()
            begin
                if "Lab Remarks" <> '' then begin
                    "Lab Remarks By" := UserId;
                    "Lab Remarks DateTime Entered" := CreateDatetime(Today, Time);
                end;
            end;
        }
        field(22; "RE Remarks"; Text[250])
        {


            trigger OnValidate()
            begin
                if "RE Remarks" <> '' then begin
                    "RE Remarks By" := UserId;
                    "RE Remarks Datetime Entered" := CreateDatetime(Today, Time);
                end;
            end;
        }
        field(23; "Survey Remarks"; Text[250])
        {


            trigger OnValidate()
            begin
                if "Survey Remarks" <> '' then begin
                    "Survey Remarks By" := UserId;
                    "Survey Remarks Date Time Enter" := CreateDatetime(Today, Time);
                end;
            end;
        }
        field(24; "Lab Remarks DateTime Entered"; DateTime)
        {

            Editable = false;
        }
        field(25; "Lab Remarks By"; Code[100])
        {

            Editable = false;
        }
        field(26; "RE Remarks Datetime Entered"; DateTime)
        {

            Editable = false;
        }
        field(27; "Survey Remarks Date Time Enter"; DateTime)
        {

            Editable = false;
        }
        field(28; "Survey Remarks By"; Code[100])
        {

        }
        field(29; "RE Remarks By"; Code[100])
        {

        }
        field(30; "Inspectorate Remarks"; Text[250])
        {


            trigger OnValidate()
            begin
                if "Inspectorate Remarks" <> '' then begin
                    "Inspected By" := UserId;
                    "Inspected Date Time" := CreateDatetime(Today, Time);
                end;
            end;
        }
        field(31; "Inspected By"; Code[100])
        {

            Editable = false;
        }
        field(32; "Inspected Date Time"; DateTime)
        {

            Editable = false;
        }
        field(33; Inspected; Boolean)
        {

        }
        field(34; Tested; Boolean)
        {

        }
        field(35; Measured; Boolean)
        {

        }
        field(36; Approved; Boolean)
        {

        }
        field(37; "Inspected But Not Approved"; Boolean)
        {

        }
        field(38; "Requires Survey"; Boolean)
        {

        }
        field(39; "Portal Status"; Option)
        {

            OptionCaption = 'Draft,Submitted';
            OptionMembers = Draft,Submitted;
        }
        field(40; "ARE Remarks Date Time"; DateTime)
        {

            Editable = false;
        }
        field(41; "ARE Remarks By"; Code[50])
        {
            TableRelation = User."User Name";
        }
        field(42; "ARE Remarks"; Text[200])
        {
            trigger OnValidate()
            begin
                if "ARE Remarks" <> '' then begin
                    "ARE Remarks By" := UserId;
                    "ARE Remarks Date Time" := CreateDatetime(Today, Time);
                end;
            end;
        }
        field(43; "Resident Engineer Name"; Text[100])
        {

        }
        field(44; "Submission Date"; Date)
        {

        }
        field(45; "Road Code"; Code[20])
        {
            TableRelation = "Project Road Link"."Road Code" where("Global Budget Book Code" = field("Project ID"));
            trigger OnValidate()
            var
                Roads: Record "Road Inventory";
            begin
                Roads.Reset();
                Roads.SetRange("Road Code", Rec."Road Code");
                if Roads.FindFirst() then
                    "Road Name" := Roads.Description;
            end;
        }
        field(46; "Road Name"; Text[100])
        {
            Editable = false;
        }
        field(47; "Approval Status"; Enum "App Status")
        {
            
        }
        field(48; "Global Dimension 1 Code"; Code[20])
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

    trigger OnDelete()
    begin
        Error('You do not have permission to delete this record');
    end;

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created Date Time" := CreateDatetime(Today, Time);
        "Prepared By" := UserId;
        "Document Date" := Today;

        if "Document No." = '' then begin
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("Daily Test Request Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Daily Test Request Nos", xRec."No. Series", Today, "Document No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin
        "Last Modified By" := UserId;
        "Last Modified Date Time" := CreateDatetime(Today, Time);
    end;

    trigger OnRename()
    begin
        Error('You do not have permission to rename this record');
    end;

    var
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Vendor: Record Vendor;
        Job: Record Job;
        PurchaseHeader: Record "Purchase Header";
        WorkPlanHeader: Record "Work Plan Header";
        PlanningWorkPlanLine: Record "Planning Work Plan Line";
        TestRequestLine: Record "Test Request Line";
        WEPContractorSubmission: Record "WEP Contractor Submission";
}

