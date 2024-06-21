#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72194 "Consolidated Work Program"
{
    PageType = Card;
    SourceTable = "Road Work Program";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Gloabal Budget Book ID"; "Gloabal Budget Book ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Authority; Authority)
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; "Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID"; "Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Budget ID"; "Financial Budget ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan ID"; "Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Workplanned Length (Km)"; "Total Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budget Ceiling"; "Total Budget Ceiling")
                {
                    ApplicationArea = Basic;
                }
                field("Total Actual Costs"; "Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control22; "Cons Road Work Program Package")
            {
                SubPageLink = "Road Work Program ID" = field(Code);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Import Work Package")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Config. Packages";
                RunPageView = where(Code = const('ROADPACKAGE'));
                Visible = false;

                trigger OnAction()
                begin
                    //MESSAGE('Success');
                end;
            }
            action("Suggest Bill Activities")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SuggestBin;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    //Insert Tasks

                    NewRoadWorkProgramPackage.Reset;
                    NewRoadWorkProgramPackage.SetRange(NewRoadWorkProgramPackage."Road Work Program ID", Code);
                    if NewRoadWorkProgramPackage.FindSet then begin
                        PurchaseRequisitionTemplate.Reset;
                        PurchaseRequisitionTemplate.SetRange(PurchaseRequisitionTemplate.Code, NewRoadWorkProgramPackage."BoQ Template Code");
                        if PurchaseRequisitionTemplate.FindSet then begin
                            RequisitionTemplateLine.Reset;
                            RequisitionTemplateLine.SetRange(RequisitionTemplateLine."BoQ Template ID", PurchaseRequisitionTemplate.Code);
                            if RequisitionTemplateLine.FindSet then begin

                                repeat
                                    NewRoadWorkProgramTask.Init;
                                    NewRoadWorkProgramTask."Road Work Program ID" := Code;
                                    NewRoadWorkProgramTask.Reset;
                                    NewRoadWorkProgramTask.SetRange("Road Work Program ID", Code);
                                    if NewRoadWorkProgramTask.FindLast then
                                        NewRoadWorkProgramTask."Entry No" := NewRoadWorkProgramTask."Entry No" + 1000
                                    else
                                        NewRoadWorkProgramTask."Entry No" := 1000;
                                    // NewRoadWorkProgramTask."Package No.":=NewRoadWorkProgramPackage."Package No.";
                                    NewRoadWorkProgramTask."BoQ Template Code" := NewRoadWorkProgramPackage."BoQ Template Code";
                                    NewRoadWorkProgramTask."Bill Item Category Code" := RequisitionTemplateLine."Item Category Code";
                                    NewRoadWorkProgramTask.Description := RequisitionTemplateLine.Description;
                                    NewRoadWorkProgramTask.Insert;
                                until RequisitionTemplateLine.Next = 0;
                            end;
                        end;
                    end;

                    //Insert Activities
                    TariffCodes1.Get('T14%');
                    NewRoadWorkProgramTask.Reset;
                    NewRoadWorkProgramTask.SetRange(NewRoadWorkProgramTask."Road Work Program ID", Code);
                    if NewRoadWorkProgramTask.FindSet then begin
                        PurchaseRequisitionTemplate.Reset;
                        PurchaseRequisitionTemplate.SetRange(PurchaseRequisitionTemplate.Code, NewRoadWorkProgramTask."BoQ Template Code");
                        if PurchaseRequisitionTemplate.FindSet then begin
                            RequisitionTemplateLine.Reset;
                            RequisitionTemplateLine.SetRange(RequisitionTemplateLine."BoQ Template ID", PurchaseRequisitionTemplate.Code);
                            if RequisitionTemplateLine.FindSet then begin
                                repeat
                                    NewRoadWorkProgramActivity.Init;
                                    NewRoadWorkProgramActivity."Road Work Program ID" := Code;
                                    NewRoadWorkProgramActivity.Reset;
                                    NewRoadWorkProgramActivity.SetRange(NewRoadWorkProgramActivity."Road Work Program ID", Code);
                                    if NewRoadWorkProgramActivity.FindLast then
                                        NewRoadWorkProgramActivity."Entry No" := NewRoadWorkProgramActivity."Entry No" + 1000
                                    else
                                        NewRoadWorkProgramActivity."Entry No" := 1000;
                                    // NewRoadWorkProgramActivity."Budget Entry No":=NewRoadWorkProgramTask."Package No.";
                                    NewRoadWorkProgramActivity."BoQ Template Code" := RequisitionTemplateLine."BoQ Template ID";
                                    NewRoadWorkProgramActivity."Bill Item Category Code" := RequisitionTemplateLine."Item Category Code";
                                    NewRoadWorkProgramActivity."Activity Code" := RequisitionTemplateLine."No.";
                                    NewRoadWorkProgramActivity."Planned Quantity" := 1;
                                    NewRoadWorkProgramActivity.Validate("Planned Quantity");
                                    NewRoadWorkProgramActivity."Unit of Measure Code" := RequisitionTemplateLine."Unit of Measure Code";
                                    NewRoadWorkProgramActivity."Planned Rate (Unit Cost)" := RequisitionTemplateLine."Amount Excl. VAT";
                                    //NewRoadWorkProgramActivity."Contingency %":=RequisitionTemplateLine."Default Contingency %";
                                    // NewRoadWorkProgramActivity."Default Job Task No.":=RequisitionTemplateLine."Default Job Task No.";
                                    NewRoadWorkProgramActivity.Description := RequisitionTemplateLine.Description;
                                    NewRoadWorkProgramActivity."Technology Type" := RequisitionTemplateLine.Technology;
                                    NewRoadWorkProgramActivity.Validate("Technology Type");
                                    NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)" := RequisitionTemplateLine."Amount Excl. VAT";
                                    NewRoadWorkProgramActivity.Validate("Engineer's Rate (Unit Cost)");
                                    NewRoadWorkProgramActivity."Packaged Quantity" := NewRoadWorkProgramActivity."Planned Quantity";
                                    //NewRoadWorkProgramActivity."Gen. Prod. Posting Group":=RequisitionTemplateLine."Gen. Prod. Posting Group";
                                    //NewRoadWorkProgramActivity."VAT Prod. Posting Group":=RequisitionTemplateLine."VAT Prod. Posting Group";
                                    //NewRoadWorkProgramActivity."Variant Code":=RequisitionTemplateLine."Variant Code";
                                    NewRoadWorkProgramActivity."VAT %" := TariffCodes1.Percentage;
                                    NewRoadWorkProgramActivity."VAT Amount" := ROUND(NewRoadWorkProgramActivity."Line Amount Excl. VAT" * TariffCodes1.Percentage / 100);
                                    NewRoadWorkProgramActivity."Line Amount Incl. VAT" := NewRoadWorkProgramActivity."Line Amount Excl. VAT" + NewRoadWorkProgramActivity."VAT Amount";
                                    if not NewRoadWorkProgramActivity.Get(NewRoadWorkProgramActivity."Road Work Program ID", NewRoadWorkProgramActivity."Budget Entry No", NewRoadWorkProgramActivity."BoQ Template Code",
                                      NewRoadWorkProgramActivity."Bill Item Category Code", NewRoadWorkProgramActivity."Activity Code", NewRoadWorkProgramActivity."Entry No") then
                                        NewRoadWorkProgramActivity.Insert(true)
                                    else
                                        NewRoadWorkProgramActivity.Modify(true);

                                until RequisitionTemplateLine.Next = 0;
                            end;
                        end;
                    end;
                    Message('Successfully suggested');
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Post Procurement Entries")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
            }
            action("Print Consolidated Work Plan")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Reset;
                    SetRange(Code, Code);
                    if FindSet then
                        Report.Run(72005, true, false, Rec)
                end;
            }
            action("Post To Procurement Plan")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Planning;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    FnInsertPlanningCategory();


                    LineNo := 0;
                    ProcurementPlanEntry.Reset;
                    if ProcurementPlanEntry.FindLast then
                        ProcurementPlanEntry."Entry No." := LineNo + 1;

                    FnInsertIntoPPlanEntry();




                end;
            }
        }
    }

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        "Document Type" := "document type"::"Schedule Of Projects";
    end;

    var
        NewRoadWorkProgramTask: Record "New Road Work Program Task";
        NewRoadWorkProgramPackage: Record "New Road Work Program Package";
        PurchaseRequisitionTemplate: Record "Purchase Requisition Template";
        RequisitionTemplateLine: Record "BoQ Template Line1";
        BoQTemplateBillCode: Record "BoQ Template Bill Code";
        NewRoadWorkProgramActivity: Record "New Road Work Program Activity";
        TariffCodes1: Record "Tariff Codes1";
        Job: Record Job;
        JobTask: Record "Job Task";
        JobPlanningLine: Record "Job Planning Line";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        JobsSetup: Record "Jobs Setup";
        TAskNo: Integer;
        Item: Record Item;
        JobList: Page "Job List";
        ProcurementPlanLines: Record "Procurement Plan Lines";
        ProcurementPlanEntry: Record "Procurement Plan Entry";
        ProcurementPlan: Record "Procurement Plan";
        ConsRoadWorkProgramPackage: Record "Cons Road Work Program Package";
        LineNo: Integer;
        LinNo2: Integer;

    local procedure FnPostNewRoadWorkPlan()
    begin
        //Insert Jobs
        JobsSetup.Get;
        NewRoadWorkProgramPackage.Reset;
        NewRoadWorkProgramPackage.SetRange(NewRoadWorkProgramPackage."Road Work Program ID", Code);
        if NewRoadWorkProgramPackage.FindSet then begin
            repeat
                Job.Init;
                Job."No." := '';//NoSeriesManagement.GetNextNo(JobsSetup."Job Nos.",TODAY,TRUE);
                Job.Description := Description;
                Job."Road Code" := NewRoadWorkProgramPackage."Road Code";
                Job."Record Type" := Job."record type"::"Road Project";
                Job.Validate("Road Code");
                Job."Road Section No" := NewRoadWorkProgramPackage."Road Section No.";
                Job.Validate("Road Section No");
                Job."Road Class ID" := NewRoadWorkProgramPackage."Road Class";
                Job."Bill-to Customer No." := 'CUST2006';
                Job.Insert(true);
            until NewRoadWorkProgramPackage.Next = 0;
        end;

        //Insert Tasks
        NewRoadWorkProgramTask.Reset;
        NewRoadWorkProgramTask.SetRange(NewRoadWorkProgramTask."Road Work Program ID", NewRoadWorkProgramPackage."Road Work Program ID");
        if NewRoadWorkProgramTask.FindSet(true) then
            repeat
                JobTask.Init;
                JobTask."Job No." := Job."No.";
                JobTask."Job Task No." := NewRoadWorkProgramTask."Begin-Total Job Task No.";
                JobTask.Description := NewRoadWorkProgramTask.Description;
                JobTask."Job Task Type" := JobTask."job task type"::"Begin-Total";
                if not JobTask.Get(JobTask."Job No.", JobTask."Job Task No.") then
                    JobTask.Insert(true);

                JobTask.Init;
                JobTask."Job No." := Job."No.";
                JobTask."Job Task No." := NewRoadWorkProgramTask."Package No.";
                JobTask.Description := NewRoadWorkProgramTask.Description;
                JobTask."Job Task Type" := JobTask."job task type"::Posting;
                if not JobTask.Get(JobTask."Job No.", JobTask."Job Task No.") then
                    JobTask.Insert(true);

                JobTask.Init;
                JobTask."Job No." := Job."No.";
                JobTask."Job Task No." := NewRoadWorkProgramTask."End-Total Job Task No.";
                JobTask.Description := NewRoadWorkProgramTask.Description;
                JobTask."Job Task Type" := JobTask."job task type"::"End-Total";
                if not JobTask.Get(JobTask."Job No.", JobTask."Job Task No.") then
                    JobTask.Insert(true);
            until NewRoadWorkProgramTask.Next = 0;

        //Create Job Planning Lines
        NewRoadWorkProgramActivity.Reset;
        NewRoadWorkProgramActivity.SetRange(NewRoadWorkProgramActivity."Road Work Program ID", Code);
        if NewRoadWorkProgramActivity.FindSet then begin
            repeat
                JobPlanningLine.Init;
                JobPlanningLine."Job No." := Job."No.";
                JobPlanningLine."Job Task No." := NewRoadWorkProgramTask."Package No.";
                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.", Job."No.");
                if JobPlanningLine.FindLast then
                    JobPlanningLine."Line No." := JobPlanningLine."Line No." + 1000
                else
                    JobPlanningLine."Line No." := 1000;
                JobPlanningLine.Type := JobPlanningLine.Type::Item;
                JobPlanningLine."No." := NewRoadWorkProgramActivity."Activity Code";
                JobPlanningLine.Status := JobPlanningLine.Status::Planning;
                JobPlanningLine."Budget Type" := JobPlanningLine."budget type"::Original;
                JobPlanningLine."Ledger Entry Type" := JobPlanningLine."ledger entry type"::Item;
                JobPlanningLine.Description := NewRoadWorkProgramActivity.Description;
                JobPlanningLine.Quantity := NewRoadWorkProgramActivity."Packaged Quantity";
                JobPlanningLine.Validate(Quantity);
                JobPlanningLine."Road Technology" := NewRoadWorkProgramActivity."Technology Type";
                JobPlanningLine.Validate("Road Technology");
                JobPlanningLine."Road Activity Categories" := NewRoadWorkProgramActivity."Bill Item Category Code";
                JobPlanningLine."Direct Unit Cost (LCY)" := NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
                JobPlanningLine."Unit Cost" := NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
                JobPlanningLine.Validate("Unit Cost");
                JobPlanningLine.Insert(true);
            until NewRoadWorkProgramActivity.Next = 0;
        end;

        Message('Success');
        Job.Reset;
        Job.SetRange(Job."No.", Job."No.");
        if Job.FindSet then
            JobList.SetTableview(Job);
        JobList.Run();
    end;

    local procedure FnInsertPlanningCategory()
    begin
        LinNo2 := 0;
        ProcurementPlanLines.Reset;
        if ProcurementPlanLines.FindLast then
            LinNo2 := ProcurementPlanLines."PP Line No" + 1;

        ConsRoadWorkProgramPackage.Reset;
        ConsRoadWorkProgramPackage.SetRange(ConsRoadWorkProgramPackage."Road Work Program ID", Code);
        if ConsRoadWorkProgramPackage.FindSet then begin
            repeat
                ProcurementPlan.Reset;
                ProcurementPlan.SetRange(ProcurementPlan."Plan Type", ProcurementPlan."plan type"::Consolidated);
                ProcurementPlan.SetRange(ProcurementPlan.Code, Rec."Procurement Plan ID");
                if ProcurementPlan.FindSet then begin
                    ProcurementPlanLines.Reset;
                    ProcurementPlanLines.SetCurrentkey("Procurement Plan ID", "Planning Category");
                    ProcurementPlanLines.SetRange(ProcurementPlanLines."Procurement Plan ID", "Procurement Plan ID");
                    ProcurementPlanLines.SetRange(ProcurementPlanLines."Planning Category", ConsRoadWorkProgramPackage."Procurement Category");
                    if not ProcurementPlanLines.FindSet then begin
                        ProcurementPlanLines.Init;

                        ProcurementPlanLines."PP Line No" := LinNo2 + 1;
                        ProcurementPlanLines."Procurement Plan ID" := ProcurementPlan.Code;
                        //MESSAGE('ProcPlanID %1',ProcurementPlanLines."Procurement Plan ID");
                        ProcurementPlanLines."Planning Category" := ConsRoadWorkProgramPackage."Procurement Category";
                        ProcurementPlanLines.Validate("Planning Category");
                        ProcurementPlanLines."Procurement Type" := 'WORKS';
                        ProcurementPlanLines."Solicitation Type" := 'OPENTENDER';
                        ProcurementPlanLines."Procurement Method" := ProcurementPlanLines."procurement method"::"Open Tender";
                        ProcurementPlanLines."Primary Source of Funds" := ConsRoadWorkProgramPackage."Funding Source ID";
                        if not ProcurementPlanLines.Get(ProcurementPlanLines."Procurement Plan ID", ProcurementPlanLines."PP Line No") then
                            ProcurementPlanLines.Insert(true);
                        //MESSAGE('ProcPlanID %1',ProcurementPlanLines."Procurement Plan ID");

                    end;
                end;
            until ConsRoadWorkProgramPackage.Next = 0;
            //MESSAGE(FORMAT(ProcurementPlanLines));

        end;
    end;

    local procedure FnInsertIntoPPlanEntry()
    begin
        // //Insert In the Procurement Plan Entry Tables
        ConsRoadWorkProgramPackage.Reset;
        ConsRoadWorkProgramPackage.SetRange(ConsRoadWorkProgramPackage."Road Work Program ID", Code);
        if ConsRoadWorkProgramPackage.FindSet then
            repeat
                ProcurementPlanEntry.Init;
                ProcurementPlanEntry."Entry No." := LineNo;
                ProcurementPlanEntry."Procurement Plan ID" := "Procurement Plan ID";
                ProcurementPlanEntry."Planning Category" := ConsRoadWorkProgramPackage."Procurement Category";
                ProcurementPlanEntry."Work Plan Project ID" := ConsRoadWorkProgramPackage."Road Work Program ID";
                ProcurementPlanEntry.Description := ConsRoadWorkProgramPackage."Package Name";
                ProcurementPlanEntry."Procurement Type" := 'WORKS';
                ProcurementPlanEntry."Solicitation Type" := 'OPENTENDER';
                ProcurementPlanEntry."Requisition Product Group" := ProcurementPlanEntry."requisition product group"::Works;
                ProcurementPlanEntry."Procurement Use" := ProcurementPlanEntry."procurement use"::"Project-Specific Use";
                ProcurementPlanEntry."Procurement Method" := ProcurementPlanEntry."procurement method"::"Open Tender";
                ProcurementPlanEntry."Preference/Reservation Code" := 'LOC';
                ProcurementPlanEntry."Funding Source ID" := ConsRoadWorkProgramPackage."Funding Source ID";
                ProcurementPlanEntry."Start Chainage(Km)" := ConsRoadWorkProgramPackage."Start Chainage";
                ProcurementPlanEntry."End Chainage(Km)" := ConsRoadWorkProgramPackage."End Chainage";
                ProcurementPlanEntry."Planning Date" := Today;
                ProcurementPlanEntry.Quantity := 1;
                ConsRoadWorkProgramPackage.CalcFields(ConsRoadWorkProgramPackage."Budget (Cost) Excl. VAT", ConsRoadWorkProgramPackage."Budget (Cost) Incl. VAT", ConsRoadWorkProgramPackage."Budget (VAT Amount)");
                ProcurementPlanEntry."Unit Cost" := ConsRoadWorkProgramPackage."Budget (Cost) Incl. VAT";
                ProcurementPlanEntry."Line Budget Cost" := ConsRoadWorkProgramPackage."Budget (Cost) Incl. VAT";
                ProcurementPlanEntry."Section Length(Km)" := ConsRoadWorkProgramPackage."Total Road Section Length";
                ProcurementPlanEntry.Region := ConsRoadWorkProgramPackage."Region ID";
                ProcurementPlanEntry.Constituency := ConsRoadWorkProgramPackage."Constituency ID";
                ProcurementPlanEntry.Department := ConsRoadWorkProgramPackage."Department ID";
                ProcurementPlanEntry.Directorate := ConsRoadWorkProgramPackage."Directorate ID";
                ProcurementPlanEntry."Road No." := ConsRoadWorkProgramPackage."Road Code";
                ProcurementPlanEntry.Validate("Road No.");
                ProcurementPlanEntry."Workplan Task No." := ConsRoadWorkProgramPackage."Package No.";
                JobTask.Reset;
                JobTask.SetRange(JobTask."Job Task No.", ConsRoadWorkProgramPackage."Package No.");
                if JobTask.FindSet then begin
                    ProcurementPlanEntry."Budget Control Job No" := JobTask."Job No.";
                    ProcurementPlanEntry."Budget Control Job Task No." := JobTask."Job Task No.";
                end;
                ProcurementPlanEntry.Status := ProcurementPlanEntry.Status::Approved;
                //MESSAGE(ConsRoadWorkProgramPackage."Package Name");
                if not ProcurementPlanEntry.Get(ProcurementPlanEntry."Procurement Plan ID", ProcurementPlanEntry."Entry No.") then
                    ProcurementPlanEntry.Insert(true);

            //       ELSE
            //         ProcurementPlanEntry.MODIFY;

            until ConsRoadWorkProgramPackage.Next = 0;
        Message('Posted Successfully');
    end;
}

