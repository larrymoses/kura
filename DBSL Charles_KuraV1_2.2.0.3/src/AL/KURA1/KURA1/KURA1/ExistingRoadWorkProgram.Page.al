#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72205 "Existing Road Work Program"
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
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Gloabal Budget Book ID"; "Gloabal Budget Book ID")
                {
                    ApplicationArea = Basic;
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
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Type"; "Planning Type")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan ID"; "Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control26; "Existing Road WP Package")
            {
                SubPageLink = "Road Work Program ID" = field(Code),
                              "Planning Type" = filter("Bottom-Up (Existing Works)");
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
            action("Suggest Existing WP")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SuggestBin;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    /*//Insert Tasks

                    NewRoadWorkProgramPackage.RESET;
                    NewRoadWorkProgramPackage.SETRANGE(NewRoadWorkProgramPackage."Road Work Program ID",Code);
                    IF NewRoadWorkProgramPackage.FINDSET THEN BEGIN
                       PurchaseRequisitionTemplate.RESET;
                       PurchaseRequisitionTemplate.SETRANGE(PurchaseRequisitionTemplate.Code,NewRoadWorkProgramPackage."BoQ Template Code");
                      IF PurchaseRequisitionTemplate.FINDSET THEN BEGIN
                        RequisitionTemplateLine.RESET;
                        RequisitionTemplateLine.SETRANGE(RequisitionTemplateLine."BoQ Template ID",PurchaseRequisitionTemplate.Code);
                        IF RequisitionTemplateLine.FINDSET THEN BEGIN

                      REPEAT
                      NewRoadWorkProgramTask.INIT;
                      NewRoadWorkProgramTask."Road Work Program ID":=Code;
                      NewRoadWorkProgramTask.RESET;
                      NewRoadWorkProgramTask.SETRANGE("Road Work Program ID",Code);
                      IF NewRoadWorkProgramTask.FINDLAST THEN
                        NewRoadWorkProgramTask."Entry No":=NewRoadWorkProgramTask."Entry No"+1000
                      ELSE
                        NewRoadWorkProgramTask."Entry No":=1000;
                      NewRoadWorkProgramTask."Package No.":=NewRoadWorkProgramPackage."Package No.";
                      NewRoadWorkProgramTask."BoQ Template Code":=NewRoadWorkProgramPackage."BoQ Template Code";
                      NewRoadWorkProgramTask."Bill Item Category Code":=RequisitionTemplateLine."Item Category Code";
                      NewRoadWorkProgramTask.Description:=RequisitionTemplateLine.Description;
                      NewRoadWorkProgramTask.INSERT;
                      UNTIL RequisitionTemplateLine.NEXT =0;
                      END;
                      END;
                      END;

                    //Insert Activities
                    TariffCodes1.GET('T14%');
                    NewRoadWorkProgramTask.RESET;
                    NewRoadWorkProgramTask.SETRANGE(NewRoadWorkProgramTask."Road Work Program ID",Code);
                    IF NewRoadWorkProgramTask.FINDSET THEN BEGIN
                      PurchaseRequisitionTemplate.RESET;
                      PurchaseRequisitionTemplate.SETRANGE(PurchaseRequisitionTemplate.Code,NewRoadWorkProgramTask."BoQ Template Code");
                      IF PurchaseRequisitionTemplate.FINDSET THEN BEGIN
                        RequisitionTemplateLine.RESET;
                        RequisitionTemplateLine.SETRANGE(RequisitionTemplateLine."BoQ Template ID",PurchaseRequisitionTemplate.Code);
                        IF RequisitionTemplateLine.FINDSET THEN BEGIN
                          REPEAT
                            NewRoadWorkProgramActivity.INIT;
                            NewRoadWorkProgramActivity."Road Work Program ID":=Code;
                            NewRoadWorkProgramActivity.RESET;
                            NewRoadWorkProgramActivity.SETRANGE(NewRoadWorkProgramActivity."Road Work Program ID",Code);
                            IF NewRoadWorkProgramActivity.FINDLAST THEN
                            NewRoadWorkProgramActivity."Entry No":=NewRoadWorkProgramActivity."Entry No"+1000
                            ELSE NewRoadWorkProgramActivity."Entry No":=1000;
                            NewRoadWorkProgramActivity."Package No.":=NewRoadWorkProgramTask."Package No.";
                            NewRoadWorkProgramActivity."BoQ Template Code":=RequisitionTemplateLine."BoQ Template ID";
                            NewRoadWorkProgramActivity."Bill Item Category Code":=RequisitionTemplateLine."Item Category Code";
                            NewRoadWorkProgramActivity."Activity Code":=RequisitionTemplateLine."No.";
                            NewRoadWorkProgramActivity."Planned Quantity":=1;
                            NewRoadWorkProgramActivity.VALIDATE("Planned Quantity");
                            NewRoadWorkProgramActivity."Unit of Measure Code":=RequisitionTemplateLine."Unit of Measure Code";
                            NewRoadWorkProgramActivity."Planned Rate (Unit Cost)":=RequisitionTemplateLine."Amount Excl. VAT";
                            //NewRoadWorkProgramActivity."Contingency %":=RequisitionTemplateLine."Default Contingency %";
                           // NewRoadWorkProgramActivity."Default Job Task No.":=RequisitionTemplateLine."Default Job Task No.";
                            NewRoadWorkProgramActivity.Description:=RequisitionTemplateLine.Description;
                            NewRoadWorkProgramActivity."Technology Type":=RequisitionTemplateLine.Technology;
                            NewRoadWorkProgramActivity.VALIDATE("Technology Type");
                            NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)":=RequisitionTemplateLine."Amount Excl. VAT";
                            NewRoadWorkProgramActivity.VALIDATE("Engineer's Rate (Unit Cost)");
                            NewRoadWorkProgramActivity."Packaged Quantity":=NewRoadWorkProgramActivity."Planned Quantity";
                            //NewRoadWorkProgramActivity."Gen. Prod. Posting Group":=RequisitionTemplateLine."Gen. Prod. Posting Group";
                            //NewRoadWorkProgramActivity."VAT Prod. Posting Group":=RequisitionTemplateLine."VAT Prod. Posting Group";
                            //NewRoadWorkProgramActivity."Variant Code":=RequisitionTemplateLine."Variant Code";
                            NewRoadWorkProgramActivity."VAT %":=TariffCodes1.Percentage;
                            NewRoadWorkProgramActivity."VAT Amount":=ROUND(NewRoadWorkProgramActivity."Line Amount Excl. VAT"*TariffCodes1.Percentage/100);
                            NewRoadWorkProgramActivity."Line Amount Incl. VAT":=NewRoadWorkProgramActivity."Line Amount Excl. VAT"+NewRoadWorkProgramActivity."VAT Amount";
                            IF NOT NewRoadWorkProgramActivity.GET(NewRoadWorkProgramActivity."Road Work Program ID",NewRoadWorkProgramActivity."Package No.",NewRoadWorkProgramActivity."BoQ Template Code",
                              NewRoadWorkProgramActivity."Bill Item Category Code",NewRoadWorkProgramActivity."Activity Code",NewRoadWorkProgramActivity."Entry No") THEN
                            NewRoadWorkProgramActivity.INSERT(TRUE)
                            ELSE
                            NewRoadWorkProgramActivity.MODIFY(TRUE);

                            UNTIL RequisitionTemplateLine.NEXT=0;
                            END;
                            END;
                            END;
                            MESSAGE('Successfully suggested');
                            */

                    //Insert Job
                    with WPExistingConstituency do begin
                        repeat
                            Job.Reset;
                            Job.SetRange(Job."Constituency ID", WPExistingConstituency."Constituency Code");
                            if Job.FindSet then begin
                                repeat
                                    ExistingRoadWPPackage.Init;
                                    ExistingRoadWPPackage.Reset;
                                    if ExistingRoadWPPackage.FindLast then
                                        ExistingRoadWPPackage."Entry No" := ExistingRoadWPPackage."Entry No" + 100
                                    else
                                        ExistingRoadWPPackage."Entry No" := 100;
                                    ExistingRoadWPPackage."Road Work Program ID" := Code;
                                    ExistingRoadWPPackage."Job No." := Job."No.";
                                    ExistingRoadWPPackage.Description := '';
                                    ExistingRoadWPPackage."Road Code" := Job."Road Code";
                                    ExistingRoadWPPackage."Road Section No." := Job."Road Section No";
                                    ExistingRoadWPPackage."Road Class" := Job."Road Class ID";
                                    ExistingRoadWPPackage."Section Name" := Job."Section Name";
                                    ExistingRoadWPPackage."Start Chainage" := Job."Section Start Chainage(Km)";
                                    ExistingRoadWPPackage."End Chainage" := Job."Section End Chainage(KM)";
                                    ExistingRoadWPPackage."Road Works Category" := Job."Road Works Category";
                                    ExistingRoadWPPackage."Workplanned Length (Km)" := Job."Total Road Section Length (KM)";
                                    ExistingRoadWPPackage."Constituency ID" := Job."Constituency ID";
                                    ExistingRoadWPPackage."County ID" := Job."County ID";
                                    ExistingRoadWPPackage."Region ID" := Job."Region ID";
                                    ExistingRoadWPPackage.Insert;
                                until Job.Next = 0;
                            end;
                        until WPExistingConstituency.Next = 0;
                    end;

                    //Insert Tasks
                    with ExistingRoadWPPackage do begin
                        JobTask.Reset;
                        JobTask.SetRange(JobTask."Job No.", ExistingRoadWPPackage."Job No.");
                        if JobTask.FindSet then
                            repeat
                                ExistingRoadWorkPrograTask.Init;
                                ExistingRoadWorkPrograTask."Road Work Program ID" := Code;
                                ExistingRoadWorkPrograTask."Job No." := ExistingRoadWPPackage."Job No.";
                                ExistingRoadWorkPrograTask."Job Task No." := JobTask."Job Task No.";
                                ExistingRoadWorkPrograTask.Description := JobTask.Description;
                                ExistingRoadWorkPrograTask."Job Task Type" := JobTask."Job Task Type";
                                ExistingRoadWorkPrograTask."Job Posting Group" := JobTask."Job Posting Group";
                                //ExistingRoadWorkPrograTask."Bill Item Category Code":=JobTask.
                                ExistingRoadWorkPrograTask.Insert;
                            until JobTask.Next = 0;
                    end;

                    //Insert Planning Lines
                    with ExistingRoadWorkPrograTask do begin
                        JobPlanningLine.Reset;
                        JobPlanningLine.SetRange(JobPlanningLine."Job No.", ExistingRoadWorkPrograTask."Job No.");
                        if JobPlanningLine.FindSet then
                            repeat
                                ExistingRoadWPActivity.Init;
                                ExistingRoadWPActivity."Road Work Program ID" := Code;
                                ExistingRoadWPActivity."Job No." := ExistingRoadWorkPrograTask."Job No.";
                                ExistingRoadWPActivity."Job Task No." := JobPlanningLine."Job Task No.";
                                ExistingRoadWPActivity."Line No." := JobPlanningLine."Line No.";
                                ExistingRoadWPActivity."Planning Date" := JobPlanningLine."Planning Date";
                                ExistingRoadWPActivity."Document No." := JobPlanningLine."Document No.";
                                //ExistingRoadWPActivity.Type:=JobPlanningLine.Type;
                                ExistingRoadWPActivity."No." := JobPlanningLine."No.";
                                ExistingRoadWPActivity.Description := JobPlanningLine.Description;
                                ExistingRoadWPActivity.Quantity := JobPlanningLine.Quantity;
                                ExistingRoadWPActivity."Direct Unit Cost (LCY)" := JobPlanningLine."Direct Unit Cost (LCY)";
                                ExistingRoadWPActivity."Unit Cost (LCY)" := JobPlanningLine."Unit Cost (LCY)";
                                ExistingRoadWPActivity.Insert;
                            until JobPlanningLine.Next = 0;
                    end;

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

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    /*//Insert Jobs
                    JobsSetup.GET;
                    NewRoadWorkProgramPackage.RESET;
                    NewRoadWorkProgramPackage.SETRANGE(NewRoadWorkProgramPackage."Road Work Program ID",Code);
                    IF NewRoadWorkProgramPackage.FINDSET THEN BEGIN
                      REPEAT
                      Job.INIT;
                      Job."No.":='';//NoSeriesManagement.GetNextNo(JobsSetup."Job Nos.",TODAY,TRUE);
                      Job.Description:=Description;
                      Job."Road Code":=NewRoadWorkProgramPackage."Road Code";
                      Job."Record Type":=Job."Record Type"::"Road Project";
                      Job.VALIDATE("Road Code");
                      Job."Road Section No":=NewRoadWorkProgramPackage."Road Section No.";
                      Job.VALIDATE("Road Section No");
                      Job."Road Class ID":=NewRoadWorkProgramPackage."Road Class";
                      Job."Bill-to Customer No.":='CUST2006';
                      Job.INSERT(TRUE);
                      UNTIL NewRoadWorkProgramPackage.NEXT =0;
                      END;

                    //Insert Tasks
                       NewRoadWorkProgramTask.RESET;
                       NewRoadWorkProgramTask.SETRANGE(NewRoadWorkProgramTask."Road Work Program ID",NewRoadWorkProgramPackage."Road Work Program ID");
                       IF NewRoadWorkProgramTask.FINDSET(TRUE) THEN
                       REPEAT
                         JobTask.INIT;
                         JobTask."Job No.":=Job."No.";
                         JobTask."Job Task No.":=NewRoadWorkProgramTask."Begin-Total Job Task No.";
                         JobTask.Description:=NewRoadWorkProgramTask.Description;
                         JobTask."Job Task Type":=JobTask."Job Task Type"::"Begin-Total";
                         IF NOT JobTask.GET(JobTask."Job No.",JobTask."Job Task No.") THEN
                         JobTask.INSERT(TRUE);

                         JobTask.INIT;
                         JobTask."Job No.":=Job."No.";
                         JobTask."Job Task No.":=NewRoadWorkProgramTask."Package No.";
                         JobTask.Description:=NewRoadWorkProgramTask.Description;
                         JobTask."Job Task Type":=JobTask."Job Task Type"::Posting;
                         IF NOT JobTask.GET(JobTask."Job No.",JobTask."Job Task No.") THEN
                         JobTask.INSERT(TRUE);

                         JobTask.INIT;
                         JobTask."Job No.":=Job."No.";
                         JobTask."Job Task No.":=NewRoadWorkProgramTask."End-Total Job Task No.";
                         JobTask.Description:=NewRoadWorkProgramTask.Description;
                         JobTask."Job Task Type":=JobTask."Job Task Type"::"End-Total";
                         IF NOT JobTask.GET(JobTask."Job No.",JobTask."Job Task No.") THEN
                         JobTask.INSERT(TRUE);
                        UNTIL NewRoadWorkProgramTask.NEXT =0;

                         //Create Job Planning Lines
                        NewRoadWorkProgramActivity.RESET;
                        NewRoadWorkProgramActivity.SETRANGE(NewRoadWorkProgramActivity."Road Work Program ID",Code);
                        IF NewRoadWorkProgramActivity.FINDSET THEN BEGIN
                        REPEAT
                        JobPlanningLine.INIT;
                        JobPlanningLine."Job No.":=Job."No.";
                        JobPlanningLine."Job Task No.":=NewRoadWorkProgramTask."Package No.";
                        JobPlanningLine.RESET;
                        JobPlanningLine.SETRANGE(JobPlanningLine."Job No.",Job."No.");
                        IF JobPlanningLine.FINDLAST THEN
                        JobPlanningLine."Line No.":=JobPlanningLine."Line No."+1000
                        ELSE
                        JobPlanningLine."Line No.":=1000;
                        JobPlanningLine.Type:=JobPlanningLine.Type::Item;
                        JobPlanningLine."No.":=NewRoadWorkProgramActivity."Activity Code";
                        JobPlanningLine.Status:=JobPlanningLine.Status::Planning;
                        JobPlanningLine."Budget Type":=JobPlanningLine."Budget Type"::Original;
                        JobPlanningLine."Ledger Entry Type":=JobPlanningLine."Ledger Entry Type"::Item;
                        JobPlanningLine.Description:=NewRoadWorkProgramActivity.Description;
                        JobPlanningLine.Quantity:=NewRoadWorkProgramActivity."Packaged Quantity";
                        JobPlanningLine.VALIDATE(Quantity);
                        JobPlanningLine."Road Technology":=NewRoadWorkProgramActivity."Technology Type";
                        JobPlanningLine.VALIDATE("Road Technology");
                        JobPlanningLine."Road Activity Categories":=NewRoadWorkProgramActivity."Bill Item Category Code";
                        JobPlanningLine."Direct Unit Cost (LCY)":=NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
                        JobPlanningLine."Unit Cost":=NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
                        JobPlanningLine.VALIDATE("Unit Cost");
                        JobPlanningLine.INSERT(TRUE);
                        UNTIL NewRoadWorkProgramActivity.NEXT =0;
                        END;

                    MESSAGE('Success');
                    Job.RESET;
                    Job.SETRANGE(Job."No.",Job."No.");
                    IF Job.FINDSET THEN
                      JobList.SETTABLEVIEW(Job);
                    JobList.RUN();
                    */

                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Post To Consolidated WP")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    // RoadWorkProgram.TRANSFERFIELDS(ConsolidatedRoadWorkProgram);
                    // RoadWorkProgram.Code:="Consolidated Road W_Program ID";
                    // RoadWorkProgram."Work Program Type":=RoadWorkProgram."Work Program Type"::Consolidated;
                    // RoadWorkProgram.INS




                    /*ConsolidatedExistingRoadWPPackage.TRANSFERFIELDS(ExistingRoadWPPackage);
                    ConsolidatedExistingRoadWPPackage."Road Work Program ID":="Consolidated Road W_Program ID";
                    ConsolidatedExistingRoadWPPackage.INSERT;*/

                end;
            }
            action(Constituencies)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Components;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "WP Existing Constituenies";
                RunPageLink = "Wp No." = field(Code);
            }
        }
    }

    var
        WPExistingConstituency: Record "WP Existing Constituency";
        Job: Record Job;
        JobTask: Record "Job Task";
        JobPlanningLine: Record "Job Planning Line";
        RoadWorkProgram: Record "Road Work Program";
        ExistingRoadWPPackage: Record "Existing Road WP Package";
        ExistingRoadWorkPrograTask: Record "Existing Road Work Progra Task";
        ExistingRoadWPActivity: Record "Existing Road WP Activity";
        ConsolidatedRoadWorkProgram: Record "Road Work Program";
        ConsolidatedExistingRoadWPPackage: Record "Existing Road WP Package";
        ConsolidatedExistingRoadWorkPrograTask: Record "Existing Road Work Progra Task";
        ConsolidatedExistingRoadWPActivity: Record "Existing Road WP Activity";
}

