#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72189 "Functional Work Program(T-D)"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Road Work Program";
    SourceTableView = where("Document Type"=filter("Global Budget Book"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Gloabal Budget Book ID";"Gloabal Budget Book ID")
                {
                    ApplicationArea = Basic;
                }
                field(Authority;Authority)
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID";"Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code";"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Code";"Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID";"Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code";"Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Budget ID";"Financial Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Budget Line/ Vote Item";"Budget Line/ Vote Item")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Workplanned Length (Km)";"Total Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Financial Budget";"Total Financial Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Budget Ceiling";"Total Budget Ceiling")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Work Plan Amount';
                }
                field("Total Actual Costs";"Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date";"Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time";"Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control22;"Work Plan Lines")
            {
                SubPageLink = "Road Work Program ID"=field(Code);
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
                RunPageView = where(Code=const('ROADPACKAGE'));

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

                trigger OnAction()
                begin
                    //Insert Tasks

                    NewRoadWorkProgramPackage.Reset;
                    NewRoadWorkProgramPackage.SetRange(NewRoadWorkProgramPackage."Road Work Program ID",Code);
                    if NewRoadWorkProgramPackage.FindSet then begin
                       PurchaseRequisitionTemplate.Reset;
                       PurchaseRequisitionTemplate.SetRange(PurchaseRequisitionTemplate.Code,NewRoadWorkProgramPackage."BoQ Template Code");
                      if PurchaseRequisitionTemplate.FindSet then begin
                        RequisitionTemplateLine.Reset;
                        RequisitionTemplateLine.SetRange(RequisitionTemplateLine."BoQ Template ID",PurchaseRequisitionTemplate.Code);
                        if RequisitionTemplateLine.FindSet then begin

                      repeat
                      NewRoadWorkProgramTask.Init;
                      NewRoadWorkProgramTask."Road Work Program ID":=Code;
                      NewRoadWorkProgramTask.Reset;
                      NewRoadWorkProgramTask.SetRange("Road Work Program ID",Code);
                      if NewRoadWorkProgramTask.FindLast then
                        NewRoadWorkProgramTask."Entry No":=NewRoadWorkProgramTask."Entry No"+1000
                      else
                        NewRoadWorkProgramTask."Entry No":=1000;
                     // NewRoadWorkProgramTask."Package No.":=NewRoadWorkProgramPackage."Package No.";
                      NewRoadWorkProgramTask."BoQ Template Code":=NewRoadWorkProgramPackage."BoQ Template Code";
                      NewRoadWorkProgramTask."Bill Item Category Code":=RequisitionTemplateLine."Item Category Code";
                      NewRoadWorkProgramTask.Description:=RequisitionTemplateLine.Description;
                      //NewRoadWorkProgramTask.Description:=BoQTemplateBillCode.Description;
                      NewRoadWorkProgramTask.Insert;
                      until RequisitionTemplateLine.Next =0;
                      end;
                      end;
                      end;

                    //Insert Activities
                    TariffCodes1.Get('T14%');
                    NewRoadWorkProgramTask.Reset;
                    NewRoadWorkProgramTask.SetRange(NewRoadWorkProgramTask."Road Work Program ID",Code);
                    if NewRoadWorkProgramTask.FindSet then begin
                      PurchaseRequisitionTemplate.Reset;
                      PurchaseRequisitionTemplate.SetRange(PurchaseRequisitionTemplate.Code,NewRoadWorkProgramTask."BoQ Template Code");
                      if PurchaseRequisitionTemplate.FindSet then begin
                        RequisitionTemplateLine.Reset;
                        RequisitionTemplateLine.SetRange(RequisitionTemplateLine."BoQ Template ID",PurchaseRequisitionTemplate.Code);
                        if RequisitionTemplateLine.FindSet then begin
                          repeat
                            NewRoadWorkProgramActivity.Init;
                            NewRoadWorkProgramActivity."Road Work Program ID":=Code;
                            NewRoadWorkProgramActivity.Reset;
                            NewRoadWorkProgramActivity.SetRange(NewRoadWorkProgramActivity."Road Work Program ID",Code);
                            if NewRoadWorkProgramActivity.FindLast then
                            NewRoadWorkProgramActivity."Entry No":=NewRoadWorkProgramActivity."Entry No"+1000
                            else NewRoadWorkProgramActivity."Entry No":=1000;
                          //  NewRoadWorkProgramActivity."Budget Entry No":=NewRoadWorkProgramTask."Package No.";
                            NewRoadWorkProgramActivity."BoQ Template Code":=RequisitionTemplateLine."BoQ Template ID";
                            NewRoadWorkProgramActivity."Bill Item Category Code":=RequisitionTemplateLine."Item Category Code";
                            NewRoadWorkProgramActivity."Activity Code":=RequisitionTemplateLine."No.";
                            NewRoadWorkProgramActivity."Planned Quantity":=1;
                            NewRoadWorkProgramActivity.Validate("Planned Quantity");
                            NewRoadWorkProgramActivity."Unit of Measure Code":=RequisitionTemplateLine."Unit of Measure Code";
                            NewRoadWorkProgramActivity."Planned Rate (Unit Cost)":=RequisitionTemplateLine."Amount Excl. VAT";
                            //NewRoadWorkProgramActivity."Contingency %":=RequisitionTemplateLine."Default Contingency %";
                           // NewRoadWorkProgramActivity."Default Job Task No.":=RequisitionTemplateLine."Default Job Task No.";
                            NewRoadWorkProgramActivity.Description:=RequisitionTemplateLine.Description;
                            NewRoadWorkProgramActivity."Technology Type":=RequisitionTemplateLine.Technology;
                            NewRoadWorkProgramActivity.Validate("Technology Type");
                            NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)":=RequisitionTemplateLine."Amount Excl. VAT";
                            NewRoadWorkProgramActivity.Validate("Engineer's Rate (Unit Cost)");
                            NewRoadWorkProgramActivity."Packaged Quantity":=NewRoadWorkProgramActivity."Planned Quantity";
                            //NewRoadWorkProgramActivity."Gen. Prod. Posting Group":=RequisitionTemplateLine."Gen. Prod. Posting Group";
                            //NewRoadWorkProgramActivity."VAT Prod. Posting Group":=RequisitionTemplateLine."VAT Prod. Posting Group";
                            //NewRoadWorkProgramActivity."Variant Code":=RequisitionTemplateLine."Variant Code";
                            NewRoadWorkProgramActivity."VAT %":=TariffCodes1.Percentage;
                            NewRoadWorkProgramActivity."VAT Amount":=ROUND(NewRoadWorkProgramActivity."Line Amount Excl. VAT"*TariffCodes1.Percentage/100);
                            NewRoadWorkProgramActivity."Line Amount Incl. VAT":=NewRoadWorkProgramActivity."Line Amount Excl. VAT"+NewRoadWorkProgramActivity."VAT Amount";
                            if not NewRoadWorkProgramActivity.Get(NewRoadWorkProgramActivity."Road Work Program ID",NewRoadWorkProgramActivity."Budget Entry No",NewRoadWorkProgramActivity."BoQ Template Code",
                              NewRoadWorkProgramActivity."Bill Item Category Code",NewRoadWorkProgramActivity."Activity Code",NewRoadWorkProgramActivity."Entry No") then
                            NewRoadWorkProgramActivity.Insert(true)
                            else
                            NewRoadWorkProgramActivity.Modify(true);

                            until RequisitionTemplateLine.Next=0;
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

                trigger OnAction()
                begin
                    //if ApprovalsMgmt.CheckRWPReqApprovalPossible(Rec) then
                    //  ApprovalsMgmt.OnSendRWPReqForApproval(Rec);
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
                   // ApprovalsMgmt.OnCancelRWPReqApprovalRequest(Rec);
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
                  ///  ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                    //Insert Jobs
                    JobsSetup.Get;
                    NewRoadWorkProgramPackage.Reset;
                    NewRoadWorkProgramPackage.SetRange(NewRoadWorkProgramPackage."Road Work Program ID",Code);
                    if NewRoadWorkProgramPackage.FindSet then begin
                      repeat
                      Job.Init;
                      Job."No.":='';//NoSeriesManagement.GetNextNo(JobsSetup."Job Nos.",TODAY,TRUE);
                      Job.Description:=Description;
                      Job."Road Code":=NewRoadWorkProgramPackage."Road Code";
                      Job."Record Type":=Job."record type"::"Road Project";
                      Job.Validate("Road Code");
                      Job."Road Section No":=NewRoadWorkProgramPackage."Road Section No.";
                      Job.Validate("Road Section No");
                      Job."Road Length(KM)":=NewRoadWorkProgramPackage."Total Road Section Length";
                      Job."Road Class ID":=NewRoadWorkProgramPackage."Road Class";
                      Job."Bill-to Customer No.":='CUST2006';
                      Job.Insert(true);
                      NewRoadWorkProgramPackage."Posted Job No.":=Job."No.";
                      until NewRoadWorkProgramPackage.Next =0;
                      end;

                    //Insert Tasks
                      NewRoadWorkProgramPackage.Reset;
                      NewRoadWorkProgramPackage.SetRange(NewRoadWorkProgramPackage."Road Work Program ID",Code);
                      if NewRoadWorkProgramPackage.FindSet then begin
                       NewRoadWorkProgramTask.Reset;
                       NewRoadWorkProgramTask.SetRange(NewRoadWorkProgramTask."Road Work Program ID",NewRoadWorkProgramPackage."Road Work Program ID");
                       if NewRoadWorkProgramTask.FindSet(true) then
                       repeat


                         JobTask.Init;
                         JobTask."Job No.":=Job."No.";
                         JobTask."Job Task No.":=NewRoadWorkProgramTask."Package No.";
                         JobTask.Description:=NewRoadWorkProgramPackage."Package Name";
                         JobTask."Road Section ID":=NewRoadWorkProgramPackage."Road Section No.";
                         JobTask."Road Section  Name":=NewRoadWorkProgramPackage."Section Name";
                         JobTask.Validate("Road Section ID");
                         JobTask."Job Task Type":=JobTask."job task type"::Posting;
                         JobTask."Global Dimension 1 Code":=NewRoadWorkProgramPackage."Region ID";
                         JobTask."Directorate Code":=NewRoadWorkProgramPackage."Directorate ID";
                         JobTask."Department Code":=NewRoadWorkProgramPackage."Department ID";
                         JobTask."Global Dimension 1 Code":=NewRoadWorkProgramPackage."Region ID";

                         //JobTask.VALIDATE("Global Dimension 1 Code");
                         JobTask."Global Dimension 2 Code":=NewRoadWorkProgramPackage."Constituency ID";
                         //JobTask.VALIDATE("Global Dimension 2 Code");
                         if not JobTask.Get(JobTask."Job No.",JobTask."Job Task No.") then
                         JobTask.Insert(true)
                         else
                         JobTask.Modify;
                        until NewRoadWorkProgramTask.Next =0;
                        end;

                         //Create Job Planning Lines
                        NewRoadWorkProgramActivity.Reset;
                        NewRoadWorkProgramActivity.SetRange(NewRoadWorkProgramActivity."Road Work Program ID",Code);
                        if NewRoadWorkProgramActivity.FindSet then begin
                        repeat
                        JobPlanningLine.Init;
                        JobPlanningLine."Job No.":=Job."No.";
                        JobPlanningLine."Job Task No.":=NewRoadWorkProgramTask."Package No.";
                        JobPlanningLine.Reset;
                        JobPlanningLine.SetRange(JobPlanningLine."Job No.",Job."No.");
                        if JobPlanningLine.FindLast then
                        JobPlanningLine."Line No.":=JobPlanningLine."Line No."+1000
                        else
                        JobPlanningLine."Line No.":=1000;
                        JobPlanningLine.Type:=JobPlanningLine.Type::Item;
                        JobPlanningLine."No.":=NewRoadWorkProgramActivity."Activity Code";
                       // MESSAGE(JobPlanningLine."No.");
                        JobPlanningLine.Validate("No.");
                        JobPlanningLine.Status:=JobPlanningLine.Status::Planning;
                        JobPlanningLine."Budget Type":=JobPlanningLine."budget type"::Original;
                        JobPlanningLine."Ledger Entry Type":=JobPlanningLine."ledger entry type"::Item;
                        JobPlanningLine.Description:=NewRoadWorkProgramActivity.Description;
                        JobPlanningLine.Quantity:=NewRoadWorkProgramActivity."Planned Quantity";
                        JobPlanningLine.Validate(Quantity);
                        JobPlanningLine."Road Technology":=NewRoadWorkProgramActivity."Technology Type";
                        JobPlanningLine.Validate("Road Technology");
                        JobPlanningLine."Road Activity Categories":=NewRoadWorkProgramActivity."Bill Item Category Code";
                        JobPlanningLine."Direct Unit Cost (LCY)":=NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
                        JobPlanningLine."Line Amount":=NewRoadWorkProgramActivity."Line Amount Incl. VAT";
                        JobPlanningLine."Unit Cost":=NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
                        JobPlanningLine.Validate("Unit Cost");
                        JobPlanningLine.Insert(true);
                        until NewRoadWorkProgramActivity.Next =0;
                        end;

                    ///Modify On posting
                    Posted:=true;
                    Modify;

                    //MESSAGE('Success');
                    Job.Reset;
                    Job.SetRange(Job."No.",Job."No.");
                    if Job.FindSet then
                      JobList.SetTableview(Job);
                    JobList.Run();
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
                    Reset;
                    SetRange(Code,Code);
                    if FindSet then
                    Report.Run(72006,true,false,Rec);
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
                    //Insert Package Lines
                     NewRoadWorkProgramPackage.Reset;
                     NewRoadWorkProgramPackage.SetRange(NewRoadWorkProgramPackage."Road Work Program ID",Code);
                     if NewRoadWorkProgramPackage.FindSet then begin
                         repeat
                        ConsRoadWorkProgramPackage.Init;
                        ConsRoadWorkProgramPackage.TransferFields(NewRoadWorkProgramPackage);
                        ConsRoadWorkProgramPackage."Road Work Program ID":="Gloabal Budget Book ID";
                        ConsRoadWorkProgramPackage.Insert(true)
                       until NewRoadWorkProgramPackage.Next =0;
                      end;

                    //Insert Tasks
                    NewRoadWorkProgramTask.Reset;
                    NewRoadWorkProgramTask.SetRange(NewRoadWorkProgramTask."Road Work Program ID",Code);
                    if NewRoadWorkProgramTask.FindSet then begin
                      repeat
                        ConsRoadWorkProgramTask.Init;
                        ConsRoadWorkProgramTask.TransferFields(NewRoadWorkProgramTask);
                        ConsRoadWorkProgramTask."Road Work Program ID":="Gloabal Budget Book ID";
                         ConsRoadWorkProgramTask.Insert(true);
                      until NewRoadWorkProgramTask.Next =0;
                      end;

                    //Insert Planning Lines
                    NewRoadWorkProgramActivity.Reset;
                    NewRoadWorkProgramActivity.SetRange(NewRoadWorkProgramActivity."Road Work Program ID",Code);
                    if NewRoadWorkProgramActivity.FindSet then begin
                      repeat
                        ConRoadWorkProgramActivity.Init;
                        ConRoadWorkProgramActivity.TransferFields(NewRoadWorkProgramActivity);
                        ConRoadWorkProgramActivity."Road Work Program ID":="Gloabal Budget Book ID";
                        ConRoadWorkProgramActivity.Insert(true);
                     until NewRoadWorkProgramActivity.Next=0;
                    end;
                    Message('Posted Succcessfully');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"Global Budget Book";
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
        Procurement: Codeunit "Procurement Processing";
        ConsRoadWorkProgram: Record "Road Work Program";
        ExistingRoadWPPackage: Record "Existing Road WP Package";
        ExistingRoadWorkPrograTask: Record "Existing Road Work Progra Task";
        ExistingRoadWPActivity: Record "Existing Road WP Activity";
        ConsRoadWorkProgramPackage: Record "Cons Road Work Program Package";
        ConsRoadWorkProgramTask: Record "Cons Road Work Program Task";
        ConRoadWorkProgramActivity: Record "Con Road Work Program Activity";
      ///  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        RoadWorkProgram: Record "Road Work Program";
}

