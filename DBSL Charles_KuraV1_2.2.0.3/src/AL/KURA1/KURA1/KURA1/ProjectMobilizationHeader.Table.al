
Table 72157 "Project Mobilization Header"
{
    DrillDownPageID = "Posted Proj. Comence Oders";
    LookupPageID = "Posted Proj. Comence Oders";

    fields
    {
        field(1; "Document Type"; Option)
        {

            OptionCaption = ' ,Order-To-Commence,Work Execution Programme,Mobilization Checklist,Mobilization Checklist Status Report';
            OptionMembers = " ","Order-To-Commence","Work Execution Programme","Mobilization Checklist","Mobilization Checklist Status Report";
        }
        field(2; "Document No."; Code[20])
        {

            Editable = false;
        }
        field(3; "Document Date"; Date)
        {

            //Editable = false;
        }
        field(4; "Commencement Order ID"; Code[20])
        {

            TableRelation = "Project Mobilization Header"."Document No." where("Document Type" = filter("Order-To-Commence"),
                                                                                Status = filter(Released),
                                                                                Posted = filter(true));
        }
        field(5; "Purchase Contract ID"; Code[20])
        {

            Description = '"Purchase Header".No. WHERE (Document Type=CONST(Blanket Order))';
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));

            trigger OnValidate()
            var
            RMS: Record "Road Management Setup";
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Purchase Contract ID");
                if PurchaseHeader.FindSet then begin
                    "Contractor No." := PurchaseHeader."Buy-from Vendor No.";
                    Validate("Contractor No.");
                    "Contract End Date" := PurchaseHeader."Contract End Date";
                    "Contract Start Date" := PurchaseHeader."Contract Start Date";
                    "Award Tend Sum Inc Taxes (LCY)" := PurchaseHeader."Award Tender Sum Inc Taxes";
                    "Project ID" := PurchaseHeader.Job;
                    "IFS Code" := PurchaseHeader."IFS Code";
                    RMS.Get();
                    "Implementing Agency ID" := RMS."Current Road Authority Code";
                    Validate("Project ID");
                end;
            end;
        }
        field(6; "Project ID"; Code[20])
        {

            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                Description := Format("Document Type") + '-' + "Project ID" + ('Contract No:' + "Purchase Contract ID");
                ProjectStaffVoucher.Reset;
                ProjectStaffVoucher.SetRange(ProjectStaffVoucher."Project ID", "Project ID");
                if ProjectStaffVoucher.FindSet then
                    "Staff Appointment Voucher No." := ProjectStaffVoucher."Document No.";

                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindSet then begin
                    "Project Name" := Job.Description;
                    "Project End  Date" := Job."Ending Date";
                    "Project Start Date" := Job."Starting Date";
                    //"Road Code":=Job."Road Code";
                    //"Road Section No.":=Job."Road Section No";
                    //"Section Name":=Job."Section Name";
                    //"Region ID":=Job."Region ID";
                    //"Constituency ID":=Job."Constituency ID";
                    "Department ID" := Job."Department ID";
                    "Directorate ID" := Job."Directorate Code";
                    RoadManagementSetup.Get;
                    if Job."Type of Project" <> Job."type of project"::"Survey/Study" then
                        "Commencement Date" := CalcDate(RoadManagementSetup."Order to Commence(RoadWorks)", "Document Date")
                    else
                        "Commencement Date" := CalcDate(RoadManagementSetup."Order to Commence(Consultancy)", "Document Date");
                end;
                Validate("Commencement Date");
                //  VALIDATE("Staff Appointment Voucher No.");

                //Insert Project Road Links
                if "Document Type" = "document type"::"Order-To-Commence" then begin
                    ProjectRoadLink.Reset;
                    ProjectRoadLink.SetRange(ProjectRoadLink."Global Budget Book Code", "Project ID");
                    if ProjectRoadLink.FindSet then begin
                        repeat
                            PCOProjectRoadLink.Init;
                            PCOProjectRoadLink."Document No" := "Document No.";
                            PCOProjectRoadLink."Document Type" := "Document Type";
                            PCOProjectRoadLink."Line No." := ProjectRoadLink."Line No";
                            PCOProjectRoadLink."Road Code" := ProjectRoadLink."Road Code";
                            PCOProjectRoadLink."Road Name" := ProjectRoadLink."Link Name";
                            PCOProjectRoadLink."Start Chainage" := ProjectRoadLink."Start Chainage(KM)";
                            PCOProjectRoadLink."End Chainage" := ProjectRoadLink."End Chainage(KM)";
                            PCOProjectRoadLink."Workplanned Length" := ProjectRoadLink."Workplanned Length(KM)";
                            PCOProjectRoadLink."Project ID" := "Project ID";
                            PCOProjectRoadLink.Insert;
                        until ProjectRoadLink.Next = 0;
                    end;
                end;
            end;
        }
        field(7; Description; Text[250])
        {

        }
        field(8; "Project Mission"; Text[250])
        {

        }
        field(9; "Staff Appointment Voucher No."; Code[20])
        {

            TableRelation = "Project Staff Voucher"."Document No." where("Document Type" = filter(Appointment),
                                                                          Posted = filter(true));

            trigger OnValidate()
            begin
                //Insert PCO Internal Project Team
                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Appointment Document No.", "Staff Appointment Voucher No.");
                InternalProjectResource.SetRange(InternalProjectResource.Status, InternalProjectResource.Status::Active);
                if InternalProjectResource.FindSet then begin
                    repeat
                        PCOInternalProjectTeam.Init;
                        PCOInternalProjectTeam."Commencement Order No." := "Document No.";
                        PCOInternalProjectTeam."Resource No." := InternalProjectResource."Resource No.";
                        PCOInternalProjectTeam.Name := InternalProjectResource.Name;
                        PCOInternalProjectTeam.Email := InternalProjectResource.Email;
                        //PCOInternalProjectTeam.Address:=InternalProjectResource.
                        PCOInternalProjectTeam."Role Code" := InternalProjectResource."Role Code";
                        PCOInternalProjectTeam.Designation := InternalProjectResource.Designation;
                        PCOInternalProjectTeam.Insert;
                    until InternalProjectResource.Next = 0;
                end;
            end;
        }
        field(10; "Contractor No."; Code[20])
        {

            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.", "Contractor No.");
                if Vendor.FindSet then begin
                    "Contractor Name" := Vendor.Name;
                    "Vendor Address" := Vendor.Address;
                    "Vendor Address 2" := Vendor."Address 2";
                    "Vendor Post Code" := Vendor."Post Code";
                    "Vendor City" := Vendor.City;
                    Vendor.TestField("E-Mail");
                    "Primary E-mail" := Vendor."E-Mail";
                end;
            end;
        }
        field(11; "Contractor Name"; Text[250])
        {

        }
        field(12; "Vendor Address"; Text[250])
        {

        }
        field(13; "Vendor Address 2"; Text[250])
        {

        }
        field(14; "Vendor Post Code"; Text[250])
        {

        }
        field(15; "Primary E-mail"; Text[250])
        {

        }
        field(17; "Vendor City"; Code[50])
        {

        }
        field(18; "Project Delivery Strategy"; Code[20])
        {

            TableRelation = "Project Delivery Strategy".Code where(Blocked = filter(false));
        }
        field(19; "IFS Code"; Code[20])
        {

        }
        field(20; "Tender Date"; Date)
        {

        }
        field(21; "Tender Name"; Text[250])
        {

        }
        field(22; "Notice of Award No."; Code[20])
        {

        }
        field(23; "Award Date"; Date)
        {

        }
        field(24; "Contract Start Date"; Date)
        {

        }
        field(25; "Contract End Date"; Date)
        {

        }
        field(26; "Award Tend Sum Inc Taxes (LCY)"; Decimal)
        {

            Description = 'Award Tend Sum Inc Taxes (LCY)';
        }
        field(27; "Project Name"; Text[250])
        {

        }
        field(28; "Project Start Date"; Date)
        {

        }
        field(29; "Project End  Date"; Date)
        {

        }
        field(30; "Defect Liability Start Date"; Date)
        {

        }
        field(31; "Defect Liability End Date"; Date)
        {

        }
        field(32; "Project Engineer No."; Code[20])
        {

        }
        field(33; "Project Manager"; Text[250])
        {

        }
        field(34; "Project Engineer Name"; Text[250])
        {

        }
        field(35; "Engineer Representative No."; Code[20])
        {

        }
        field(36; "Engineer Representative Name"; Text[250])
        {

        }
        field(37; "Implementing Agency ID"; Code[20])
        {

        }
        field(38; "Region ID"; Code[20])
        {

        }
        field(39; "Directorate ID"; Code[20])
        {

        }
        field(40; "Department ID"; Code[20])
        {

        }
        field(41; "Constituency ID"; Code[20])
        {

        }
        field(42; "County ID"; Code[20])
        {

        }
        field(43; "Funding Agency No."; Code[20])
        {

        }
        field(44; "Funder Name"; Text[250])
        {

        }
        field(45; "Funder Address"; Text[250])
        {

        }
        field(46; "Funder Address 2"; Text[250])
        {

        }
        field(47; "Funder Post Code"; Code[100])
        {

        }
        field(48; "Funder City"; Code[20])
        {

        }
        field(49; "Funder County"; Code[20])
        {

        }
        field(50; "Road Code"; Code[20])
        {


            trigger OnValidate()
            begin
                RoadInventory.Reset;
                RoadInventory.SetRange(RoadInventory."Road Code", "Road Code");
                if RoadInventory.FindSet then begin

                end;

            end;
        }
        field(51; "Road Section No."; Code[20])
        {


            trigger OnValidate()
            begin
                RoadSection.Reset;
                RoadSection.SetRange(RoadSection."Road Section No.", "Road Section No.");
                if RoadSection.FindSet then
                    "Section Name" := RoadSection."Section Name";
            end;
        }
        field(52; "Section Name"; Text[250])
        {

        }
        field(53; Status; Option)
        {

            Editable = true;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(54; Posted; Boolean)
        {

            Editable = true;
        }
        field(55; "Created By"; Code[100])
        {

            Editable = false;
        }
        field(56; "Created DateTime"; DateTime)
        {

            Editable = false;
        }
        field(57; "Project Site Description"; Text[250])
        {

        }
        field(58; "Start Chainage"; Decimal)
        {

        }
        field(59; "End  Chainage"; Decimal)
        {

        }
        field(60; "Start Point Longitude"; Decimal)
        {

            DecimalPlaces = 10 : 10;
        }
        field(61; "Start  Point Latitude"; Decimal)
        {

            DecimalPlaces = 10 : 10;
        }
        field(62; "End Point Latitude"; Decimal)
        {

            DecimalPlaces = 10 : 10;
        }
        field(63; "End  Point Longitude"; Decimal)
        {

            DecimalPlaces = 10 : 10;
        }
        field(64; "Work Execution Plan ID"; Code[20])
        {

        }
        field(65; "No. Series"; Code[20])
        {

        }
        field(66; "Default CheckList Template ID"; Code[20])
        {

            TableRelation = "Project Checklist  Template"."Template ID";

            trigger OnValidate()
            begin
                PCOPreKickOffCheckList.Reset;
                PCOPreKickOffCheckList.SetRange("Document No.", "Document No.");
                if PCOPreKickOffCheckList.FindSet then
                    PCOPreKickOffCheckList.DeleteAll;

                ProjectChecklistTemplate.Reset;
                ProjectChecklistTemplate.SetRange("Template ID", "Default CheckList Template ID");
                if ProjectChecklistTemplate.FindSet then begin
                    ProjectChecklisTemplateLine.Reset;
                    ProjectChecklisTemplateLine.SetRange("Template ID", "Default CheckList Template ID");
                    if ProjectChecklisTemplateLine.FindSet then begin
                        repeat
                            PCOPreKickOffCheckList.Init;
                            PCOPreKickOffCheckList."Document Type" := "Document Type";
                            PCOPreKickOffCheckList."Document No." := "Document No.";
                            PCOPreKickOffCheckList."Requirement ID" := PCOPreKickOffCheckList.Count + 1;
                            PCOPreKickOffCheckList.Description := ProjectChecklisTemplateLine.Description;
                            if not PCOPreKickOffCheckList.Get(PCOPreKickOffCheckList."Document Type", PCOPreKickOffCheckList."Document No.") then
                                PCOPreKickOffCheckList.Insert(true);
                        until ProjectChecklisTemplateLine.Next = 0;
                    end;
                end;


                if "Document Type" = "document type"::"Mobilization Checklist" then begin
                    ProjectChecklisTemplateLine.Reset;
                    ProjectChecklisTemplateLine.SetRange("Template ID", "Default CheckList Template ID");
                    if ProjectChecklisTemplateLine.FindSet then begin
                        repeat
                            MobilizationChecklist.Init;
                            MobilizationChecklist."Document Type" := "Document Type";
                            MobilizationChecklist."Document No." := "Document No.";
                            //MobilizationChecklist."Project ID":="Project ID";
                            MobilizationChecklist."Requirement ID" := ProjectChecklisTemplateLine."Requirement ID";
                            MobilizationChecklist.Description := ProjectChecklisTemplateLine.Description;
                            MobilizationChecklist.Status := MobilizationChecklist.Status::Pending;
                            MobilizationChecklist."Percentage Completion" := 0;
                            if not MobilizationChecklist.Insert(true) then
                                MobilizationChecklist.Modify(true);
                        until ProjectChecklisTemplateLine.Next = 0;
                    end;
                end;
            end;
        }
        field(67; "Required Documents Template ID"; Code[20])
        {

            TableRelation = "Project Document Template"."Template ID" where(Blocked = filter(false));

            trigger OnValidate()
            begin
                ProjectDocumentTemplateLine.Reset;
                ProjectDocumentTemplateLine.SetRange(ProjectDocumentTemplateLine."Template ID", "Required Documents Template ID");
                ProjectDocumentTemplateLine.SetRange(ProjectDocumentTemplateLine."Document Class", ProjectDocumentTemplateLine."document class"::Mobilization);
                if ProjectDocumentTemplateLine.FindSet then begin
                    repeat
                        PCORequiredDocument.Init;
                        PCORequiredDocument."Notice No." := "Document No.";
                        PCORequiredDocument."Document Type" := ProjectDocumentTemplateLine."Document Type";
                        PCORequiredDocument.Description := ProjectDocumentTemplateLine.Description;
                        PCORequiredDocument."Requirement Type" := ProjectDocumentTemplateLine."Requirement Type";
                        PCORequiredDocument."Guidelines/Instructions" := ProjectDocumentTemplateLine."Guidelines/Instructions";
                        PCORequiredDocument."Due Date" := Today;
                        PCORequiredDocument."Program of Works" := ProjectDocumentTemplateLine."Program of Works";
                        PCORequiredDocument."Mobilization Document" := ProjectDocumentTemplateLine."Mobilization Document";
                        PCORequiredDocument.Insert(true);
                    until ProjectDocumentTemplateLine.Next = 0;
                end;
            end;
        }
        field(68; "Representative ID"; Integer)
        {

            TableRelation = "Purchase Contract Signatory"."Entry No" where("Document Type" = filter("Blanket Order"),
                                                                            "Signatory Type" = filter("Vendor Authorizer" | "Vendor Witness"),
                                                                            No = field("Purchase Contract ID"));

            trigger OnValidate()
            begin
                PurchaseContractSignatory.Reset;
                PurchaseContractSignatory.SetRange(PurchaseContractSignatory."Entry No", "Representative ID");
                if PurchaseContractSignatory.FindSet then begin
                    "Representative Name" := PurchaseContractSignatory."Representative Name";
                    "Contract Signing Role" := PurchaseContractSignatory."Contract Signing Role";
                    Email := PurchaseContractSignatory.Email;
                end;
            end;
        }
        field(69; "Representative Name"; Text[250])
        {

        }
        field(70; "Contract Signing Role"; Text[100])
        {

        }
        field(71; Email; Text[100])
        {

        }
        field(72; "Acknowledgement Status"; Option)
        {

            InitValue = "Pending Acknowledgement";
            OptionCaption = ' ,Pending Acknowledgement,Acknowledged';
            OptionMembers = " ","Pending Acknowledgement",Acknowledged;
        }
        field(73; "Acknowledgement Date"; Date)
        {

        }
        field(74; "Acknowledged By"; Code[100])
        {

        }
        field(75; "Communication Plan ID"; Code[20])
        {

            // TableRelation = "Communication Plan Header"."Document No" where ("Document Type"=filter(Project),
            //                                                                  "Project ID"=field("Project ID"),
            //                                                                  "Work Execution Plan ID"=field("Document Type"));
        }
        field(76; "Risk Management Plan ID"; Code[20])
        {

            TableRelation = "Risk Management Plan"."Document No" where("Document Type" = filter(Project),
                                                                        "Project ID" = field("Project ID"),
                                                                        "Work Execution Plan ID" = field("Document No."));
        }
        field(77; "HSE Plan ID"; Code[20])
        {

            Description = 'Health/Safety/Environment Plan ID';
            TableRelation = "HSE Plan"."Plan ID" where("Plan Type" = filter(Project),
                                                        "Risk Management Plan ID" = field("Risk Management Plan ID"));
        }
        field(78; "Quality Management Plan ID"; Code[20])
        {

        }
        field(79; "Portal Status"; Option)
        {

            InitValue = Draft;
            OptionCaption = ',Draft,Submitted';
            OptionMembers = ,Draft,Submitted;
        }
        field(80; "Mobilization Checklist No"; Code[20])
        {

            TableRelation = "Project Mobilization Header"."Document No." where("Document Type" = filter("Mobilization Checklist"),
                                                                                "Project ID" = field("Project ID"));

            trigger OnValidate()
            begin
                MobilizationChecklist.Reset;
                MobilizationChecklist.SetRange(MobilizationChecklist."Document No.", "Mobilization Checklist No");
                //MobilizationChecklist.SETFILTER(MobilizationChecklist.Status,'%1|%2',MobilizationChecklist.Status::Ongoing,MobilizationChecklist.Status::Pending);
                if MobilizationChecklist.FindSet then
                    repeat
                        ChecklistStatusReport.Init;
                        ChecklistStatusReport.TransferFields(MobilizationChecklist);
                        ChecklistStatusReport."Document No." := "Document No.";
                        ChecklistStatusReport."Document Type" := "Document Type";
                        ChecklistStatusReport."Mobilization Checlist No." := "Mobilization Checklist No";
                        if not ChecklistStatusReport.Insert(true) then
                            ChecklistStatusReport.Modify(true);
                    until MobilizationChecklist.Next = 0;
            end;
        }
        field(81; "Order to Commence Reference"; Code[50])
        {

        }
        field(82; "Possession of Site Reference"; Code[50])
        {

        }
        field(83; "Possession of Site Date"; Date)
        {

        }
        field(84; "Possession of Site Issued"; Boolean)
        {

            Editable = false;
        }
        field(85; "WEP Submission Date"; Date)
        {

        }
        field(86; "Assigned To"; Code[100])
        {

            TableRelation = "User Setup"."User ID";
        }
        field(87; "Commencement Date"; Date)
        {

            Editable = false;

            trigger OnValidate()
            begin
                Validate("Project Start Date", "Commencement Date");
            end;
        }
        field(88; "Time for Completion"; DateFormula)
        {


            trigger OnValidate()
            begin
                "Project End  Date" := CalcDate("Time for Completion", "Project Start Date");
            end;
        }
        field(89; "Assigned To:"; Code[100])
        {

            TableRelation = "User Setup"."User ID";
        }
        field(90; "Work Group"; Code[100])
        {

        }
        field(91; "User Group"; Code[30])
        {
            TableRelation = "User Group".Code;
        }
        field(92; "Commencement Period"; DateFormula)
        {
            trigger OnValidate()
            begin
                if "Document Date" <> 0D then
                    "Commencement Date" := CalcDate("Commencement Period", "Document Date");
            end;
        }


    }

    keys
    {
        key(Key1; "Document Type", "Document No.")
        {
            Clustered = true;
        }
        key(Key2; "Contractor No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document Type" = "document type"::"Order-To-Commence" then begin
            if "Document No." = '' then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Commencement Order Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Commencement Order Nos", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document Type" = "document type"::"Work Execution Programme" then begin
            if "Document No." = '' then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Work Execution Plan  Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Work Execution Plan  Nos", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document Type" = "document type"::"Mobilization Checklist" then begin
            if "Document No." = '' then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Moblization Checklist Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Moblization Checklist Nos", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document Type" = "document type"::"Mobilization Checklist Status Report" then begin
            if "Document No." = '' then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Mobllization Checklist Status");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Mobllization Checklist Status", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        "Document Date" := Today;
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
        Status := Status::Open;
    end;

    var
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Job: Record Job;
        InternalProjectResource: Record "Internal Project Resource";
        PCOInternalProjectTeam: Record "PCO Internal Project Team";
        RoadSection: Record "Road Section";
        Vendor: Record Vendor;
        ProjectStaffTemplateLine: Record "Project Staff Template Line";
        ProjectStaffAppointmentLine: Record "Project Staff Appointment Line";
        PurchaseHeader: Record "Purchase Header";
        RoadInventory: Record "Road Inventory";
        ProjectChecklistTemplate: Record "Project Checklist  Template";
        ProjectChecklisTemplateLine: Record "Project Checklis Template Line";
        PCOPreKickOffCheckList: Record "PCO Kick Off CheckList";
        PCORequiredDocument: Record "PCO Required Document";
        ProjectDocumentTemplateLine: Record "Project Document Template Line";
        ProjectStaffVoucher: Record "Project Staff Voucher";
        PurchaseContractSignatory: Record "Purchase Contract Signatory";
        MobilizationChecklist: Record "Mobilization Checklist";
        RequirementLineNo: Integer;
        ObjMobilizationChecklist: Record "Mobilization Checklist";
        ChecklistStatusReport: Record "Checklist Status Report";
        ProjectRoadLink: Record "Project Road Link";
        PCOProjectRoadLink: Record "PCO Project Road Link";


    procedure FnPopulateProjectTeam()
    begin
    end;


    procedure FnPostAcknowledgement(PMobiHeader: Record "Project Mobilization Header")
    begin
        PMobiHeader."Acknowledgement Status" := PMobiHeader."acknowledgement status"::Acknowledged;
        PMobiHeader."Acknowledgement Date" := Today;
        PMobiHeader."Acknowledged By" := Format(UpperCase(PMobiHeader."Representative Name"));
        PMobiHeader.Modify(true);
    end;
}

