#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72613 "Final Account"
{
    PageType = Card;
    SourceTable = "Final Account";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID"; "Contract ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date"; "Project Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project End Date"; "Project End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Template ID"; "Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; "Contractor No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Contractor Name"; "Contractor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Defects Liability Period"; "Defects Liability Period")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("DLP Start Date"; "DLP Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("DLP End Date"; "DLP End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Workplanned Length"; "Workplanned Length")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Sum"; "Contract Sum")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payments to Date"; "Payments to Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Completed Issues"; "Completed Issues")
                {
                    ApplicationArea = Basic;
                }
                field("Pending Issues"; "Pending Issues")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created DateTime"; "Created DateTime")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control19; "Final Account Lines")
            {
                SubPageLink = "Document No" = field("Document No"),
                              "Project ID" = field("Project ID");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Submit)
            {
                ApplicationArea = Basic;
                Image = SendEmailPDF;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Document Submitted Successfully');
                end;
            }
            action("Project Vendors")
            {
                ApplicationArea = Basic;
                Caption = 'Project Contractors';
                Image = Vendor;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Project Vendors";
                RunPageLink = "Contract No" = field("Contract ID");
            }
            action("Attach Docs")
            {
                ApplicationArea = Basic;
                Caption = 'Attach Documents';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition", Rec."Document No", 'Testing', RecordId, '');
                    //Attached:=TRUE;
                    Modify();
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    FinalAccountLine.Reset;
                    FinalAccountLine.SetRange(FinalAccountLine."Document No", "Document No");
                    if FinalAccountLine.FindSet then
                        repeat
                            FinalAccountLine.TestField(FinalAccountLine."Response Type", FinalAccountLine."response type"::Completed);
                        until FinalAccountLine.Next = 0;

                    //Notify RE,Contractor,Subcontractor,Assignee, and send acceptance letter as an attachment
                    ProcurementProcessing.FnNotifyREFinalAccount(Rec);
                    ProcurementProcessing.FnNotifyMainContractorFinalAccount(Rec);
                    ProcurementProcessing.FnNotifyAssigneeFinalAccount(Rec);

                    //Mark the project as completed
                    ObjJob.Reset;
                    ObjJob.SetRange(ObjJob."No.", "Project ID");
                    if ObjJob.FindSet then begin
                        ObjJob.CalcFields("Actual Project Costs");
                        ObjJob.Status := ObjJob.Status::Completed;
                        ObjJob.Modify();
                    end;

                    //Update Road Inventory
                    // ObjJob.RESET;
                    // ObjJob.SETRANGE(ObjJob."No.","Project ID");
                    // IF ObjJob.FINDSET THEN
                    //  BEGIN
                    //    ObjJob.CALCFIELDS("Actual Project Costs");
                    TotalWorkPlannedLength := 0;
                    ProjectRoadLink.Reset;
                    ProjectRoadLink.SetRange(ProjectRoadLink."Global Budget Book Code", Rec."Project ID");
                    ProjectRoadLink.SetFilter(ProjectRoadLink."Workplanned Length(KM)", '<>%1', 0);
                    if ProjectRoadLink.FindSet then
                        repeat
                            TotalWorkPlannedLength += ProjectRoadLink."Workplanned Length(KM)";
                        until ProjectRoadLink.Next = 0;
                    Message('Total Workplanned Length %1', Format(TotalWorkPlannedLength));

                    if "Payments to Date" <> 0 then begin
                        ProjectRoadLink.Reset;
                        ProjectRoadLink.SetRange(ProjectRoadLink."Global Budget Book Code", "Project ID");
                        if ProjectRoadLink.FindSet then begin
                            repeat
                                RoadInventory.Reset;
                                RoadInventory.SetRange(RoadInventory."Road Code", ProjectRoadLink."Road Code");
                                if RoadInventory.FindSet then begin
                                    repeat
                                        RoadInventory."Road Valuation" := RoadInventory."Road Valuation" + (ProjectRoadLink."Workplanned Length(KM)" / TotalWorkPlannedLength * "Payments to Date");
                                        RoadInventory.Modify(true);
                                        Message('Valuation per road %1', Format(ProjectRoadLink."Workplanned Length(KM)" / TotalWorkPlannedLength * "Payments to Date"));
                                    until RoadInventory.Next = 0;
                                end;
                            until ProjectRoadLink.Next = 0;
                        end;
                    end;
                    Dialog.Message('Posted successfully');
                end;
            }
            action("Acceptance Letter")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Document No", "Document No");
                    if FindSet then begin
                        Report.Run(72053, true, false, Rec);
                    end;
                end;
            }
            action("Project Road Links")
            {
                ApplicationArea = Basic;
                Image = Line;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Project Road Links";
                // RunPageLink = "Global Budget Book Code"=field("Project ID"),
                //"KeRRA Budget Code"=field(Field24);
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Status := Status::Open;
        "Document Date" := Today;
    end;

    var
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
        FinalAccountLine: Record "Final Account Line";
        ObjJob: Record Job;
        RoadInventory: Record "Road Inventory";
        ProjectRoadLink: Record "Project Road Link";
        ProcurementProcessing: Codeunit "Procurement Processing";
        TotalWorkPlannedLength: Decimal;
}

