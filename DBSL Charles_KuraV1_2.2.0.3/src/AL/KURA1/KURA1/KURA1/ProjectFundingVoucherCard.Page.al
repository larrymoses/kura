#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72060 "Project Funding Voucher Card"
{
    PageType = Card;
    SourceTable = "Project Funding Request Vouche";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Year Code"; "Year Code")
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
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Region; Region)
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Code"; "Constituency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Default Works Category"; "Default Works Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Category';
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Creation Date"; "Creation Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Creation Time"; "Creation Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Default Funding Source"; "Default Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Total Value(LCY)"; "Funding Total Value(LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Estimated Cost(LCY)';
                    Editable = false;
                }
            }
            part(Control25; "Project Funding Voucher Line")
            {
                Caption = 'Road Work Sections';
                SubPageLink = "Document No" = field("Document No");
            }
        }
        area(factboxes)
        {
            systempart(Control21; Outlook)
            {
            }
            systempart(Control22; Notes)
            {
            }
            systempart(Control23; MyNotes)
            {
            }
            systempart(Control24; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    ObjApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    // if ObjApprovalsMgmt.CheckProjectReqApprovalPossible(Rec) then
                    //   ObjApprovalsMgmt.OnSendProjectReqForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    //ApprovalsMgmt.OnCancelProjectReqApprovalRequest(Rec);
                end;
            }
            action("Approval Entries")
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Consolidate)
            {
                ApplicationArea = Basic;
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    FnDeleteOldEntriesForSameDocNo();
                    FnConsolidateEntries();
                    if not Confirm('Are you sure you wanna transfer to procurement plan?') then
                        exit;
                    FnPopulateProcPlanEntryAndLines(ProcurementPlan, ProcurementPlanEntry);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Status <> Status::Open then
            CurrPage.Editable := false;
    end;

    trigger OnAfterGetRecord()
    begin
        if Status <> Status::Open then
            CurrPage.Editable := false;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::PFV;
    end;

    trigger OnOpenPage()
    begin
        if Status <> Status::Open then
            CurrPage.Editable := false;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ObjConsolidatedFunding: Record "Consolidated Project Funding R";
        ObjProjFundVLine: Record "Project Funding Voucher Line";
        ProcurementPlanLines: Record "Procurement Plan Lines";
        ProcurementPlanEntry: Record "Procurement Plan Entry";
        ProcurementPlan: Record "Procurement Plan";
        PFVoucherL: Record "Project Funding Voucher Line";
        PFVoucherH: Record "Project Funding Request Vouche";

    local procedure FnDeleteOldEntriesForSameDocNo()
    begin
        ObjConsolidatedFunding.Reset;
        ObjConsolidatedFunding.SetRange(ObjConsolidatedFunding."Document No", "Document No");
        if ObjConsolidatedFunding.FindSet then
            ObjConsolidatedFunding.DeleteAll;
    end;

    local procedure FnConsolidateEntries()
    begin
        ObjProjFundVLine.Reset;
        ObjProjFundVLine.SetRange(ObjProjFundVLine."Document No", "Document No");
        if ObjProjFundVLine.FindSet then
            repeat
                ObjConsolidatedFunding.Init;
                //ObjConsolidatedFunding."Responsibilty Center":="Responsibility Center";
                ObjConsolidatedFunding.TransferFields(ObjProjFundVLine);
                ObjConsolidatedFunding.Insert(true);
                Commit;
            until ObjProjFundVLine.Next = 0;
        Message('Consolidated Successfully');
    end;


    procedure FnPopulateProcPlanEntryAndLines(var ProcPlan: Record "Procurement Plan"; var ProcPlanENtry: Record "Procurement Plan Entry")
    begin
        PFVoucherL.Reset;
        PFVoucherL.SetRange(PFVoucherL."Document No", "Document No");
        if PFVoucherL.FindSet then begin
            ProcurementPlanEntry.Reset;
            ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Work Plan Project ID", PFVoucherL."Project No");
            if ProcurementPlanEntry.FindSet then
                ProcurementPlanEntry.DeleteAll;
            repeat
                PFVoucherL.CalcFields("Total Estimated Cost");
                ProcurementPlanEntry.Init;
                ProcurementPlanEntry.Reset;
                ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Procurement Plan ID", FnGetCurrentProcPlan);
                if ProcurementPlanEntry.FindLast then
                    ProcurementPlanEntry."Entry No." := ProcurementPlanEntry."Entry No." + 1000;
                //MESSAGE(FORMAT(ProcurementPlanEntry."Entry No."));
                ProcurementPlanEntry."Procurement Plan ID" := FnGetCurrentProcPlan();
                //MESSAGE(FnGetCurrentProcPlan());
                ProcurementPlanEntry.Department := PFVoucherL.Department;
                ProcurementPlanEntry."Funding Source ID" := PFVoucherL."Funding Source";
                ProcurementPlanEntry."Work Plan Project ID" := PFVoucherL."Project No";
                ProcurementPlanEntry."Workplan Task No." := PFVoucherL."Section Code";
                ProcurementPlanEntry."Procurement Type" := 'WORKS';
                ProcurementPlanEntry."Planning Category" := PFVoucherL."Works Category";
                ProcurementPlanEntry.Constituency := "Constituency Code";
                ProcurementPlanEntry.Description := Description;
                ProcurementPlanEntry.Quantity := 1;
                ProcurementPlanEntry."Start Chainage(Km)" := PFVoucherL."Start Chainage(Km)";
                ProcurementPlanEntry."End Chainage(Km)" := PFVoucherL."End Chainage(Km)";
                if PFVoucherL."End Chainage(Km)" - PFVoucherL."Start Chainage(Km)" <= 0 then
                    ProcurementPlanEntry."Section Length(Km)" := PFVoucherL."End Chainage(Km)" - PFVoucherL."Start Chainage(Km)";
                ProcurementPlanEntry.Validate(Quantity);
                ProcurementPlanEntry."Unit Cost" := PFVoucherL."Total Estimated Cost";
                ProcurementPlanEntry.Validate("Unit Cost");
                ProcurementPlanEntry."Road No." := PFVoucherL."Road Code";
                ProcurementPlanEntry.Validate("Road No.");
                ProcurementPlanEntry."Procurement Method" := ProcurementPlanEntry."procurement method"::"Open Tender";
                ProcurementPlanEntry."Solicitation Type" := ProcurementPlanEntry."Solicitation Type";
                ProcurementPlanEntry."Requisition Product Group" := ProcurementPlanEntry."requisition product group"::Works;
                ProcurementPlanEntry."Procurement Use" := ProcurementPlanEntry."procurement use"::"Project-Specific Use";
                ProcurementPlanEntry.Insert(true);
                Message(Format(ProcurementPlanEntry));
            until PFVoucherL.Next = 0;
            Message('Successful');
        end;
    end;


    procedure FnGetCurrentProcPlan(): Code[20]
    begin
        ProcurementPlan.Reset;
        ProcurementPlan.SetRange(ProcurementPlan."Financial Year Code", "Year Code");
        ProcurementPlan.SetRange(ProcurementPlan.Blocked, false);
        if ProcurementPlan.FindFirst then
            exit(ProcurementPlan.Code);
    end;
}

