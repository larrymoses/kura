#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69113 "Staff Recruitment Requisitions"
{
    CardPageID = "Staff Requisition Card";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Job,Functions,Employee';
    ShowFilter = true;
    SourceTable = "Vacancy  Requisitions Table";
    SourceTableView = where(Status = filter(Open | "Pending Approval" | Released));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Manpower Plan ID"; "Manpower Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Manpower Plan Name"; "Manpower Plan Name")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; "Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1"; "Global Dimension 1")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Name"; "Global Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2"; "Global Dimension 2")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Name"; "Global Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755008; Outlook)
            {
            }
        }
    }

    actions
    {
    }

    var
        HREmp: Record Employee;
        HREmailParameters: Record "Hr E-Mail Parameters";
        // SMTP: Codeunit Mail;
        // DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition";
        // ApprovalEntries: Page "Approval Entries";
        // HREmpReq: Record "Employee Requisitions";
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;


    procedure TESTFIELDS()
    begin
    end;
}

