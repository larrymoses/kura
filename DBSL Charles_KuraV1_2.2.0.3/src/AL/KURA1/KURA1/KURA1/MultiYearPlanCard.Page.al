#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72375 "Multi Year Plan Card"
{
    Caption = 'Multi Year Financing Projection';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Road Work Program";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Authority; Rec.Authority)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Total MultiYear Plan Cost"; Rec."Total MultiYear Plan Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Budget Ceiling"; Rec."Total Budget Ceiling")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Budget Book Amount';
                    Editable = false;
                    Visible = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part("Multi Year Work"; "Multi_Year Work")
            {
                Caption = 'Multi Year Work';
                SubPageLink = "Road Work Program ID" = field(Code);
                ToolTip = 'Multi Year Work';
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Import Budget Entries")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Config. Packages";
                RunPageView = where(Code = const('MULTIYEAR'));

                trigger OnAction()
                begin
                    //MESSAGE('Success');
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
                    // RMS.CheckBudgetCeiling(Rec);
                    //MS.FnCheckWorkPlanLinesExist(NewRoadWorkProgramPackage,Code);
                    // CALCFIELDS("Total Budget Ceiling");
                    // TESTFIELD("Total Budget Ceiling;
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    Rec."Approval Status" := Rec."Approval Status"::Released;
                    // if ApprovalsMgmt.CheckRWPReqApprovalPossible(Rec) then
                    // ApprovalsMgmt.OnSendRWPReqForApproval(Rec);
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
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    //IF ApprovalsMgmt.CheckRWPReqApprovalPossible(Rec) THEN
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
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
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
                    Rec.Reset;
                    Rec.SetRange(Code, Rec.Code);
                    if Rec.FindSet then
                        Report.Run(72036, true, false, Rec);
                end;
            }
            group(ActionGroup5)
            {
                action("G/l Budget Entries")
                {
                    ApplicationArea = Basic;
                    Image = LedgerEntries;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Road Program G/L budget";
                    RunPageLink = "Road Work Program" = field(Code),
                                  "Road Project Category" = filter("Construction Works");
                    Visible = false;
                }
                action("Check Budget ")
                {
                    ApplicationArea = Basic;
                    Image = CheckLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction()
                    begin
                        RMS.CheckBudgetCeiling(Rec)
                    end;
                }
                action("Suggest Projects")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = false;

                    trigger OnAction()
                    begin
                        //RMS.FnSuggestProjectsFromBudgetEntries(Rec,"Document Type");
                        //RMS.FnSuggestFundingSourcesFromBudgetEntries(Rec,"Document Type");
                        RMS.FnSuggestProjectsFromProcPlanEntry(Rec, Rec."Document Type");
                        RMS.FnSuggestFundingSourcesFromProcPlanEntry(Rec, Rec."Document Type");
                        Message('Lines suggested successfully');
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Multi-Year Programs";
        Rec."Road Project Category" := Rec."road project category"::"Road Construction";

        if UserSetup.Get(UserId) then begin
            if UserSetup."Create Development Budget Book" = false then
                Error('You are not allowed to create Budgets');
        end;
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
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        RoadWorkProgram: Record "Road Work Program";
        RMS: Codeunit "RMS Management";
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

