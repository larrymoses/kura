#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57092 "Imprest Memos Surrender-P"
{
    CardPageID = "Imprest Memo Surrender-P";
    Editable = false;
    PageType = List;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = const(Released),
                            Posted = const(true),
                            "Document Type" = const("Imprest Surr Memo"),
                            Surrendered = const(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Memo Doc. No."; "Imprest Memo Doc. No.")
                {
                    ApplicationArea = Basic;
                }
                field(Project; Project)
                {
                    ApplicationArea = Basic;
                }
                field("Project Description"; "Project Description")
                {
                    ApplicationArea = Basic;
                }
                field(Objective; Objective)
                {
                    ApplicationArea = Basic;
                }
                field("Terms of Reference"; TermsText)
                {
                    ApplicationArea = Basic;
                }
                field(Requestor; Requestor)
                {
                    ApplicationArea = Basic;
                }
                field("Requestor Name"; "Requestor Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
             part("Attached Documents"; "Document Attachment Factbox")
                {
                    ApplicationArea = ALL;
                    Visible = true;
                    Caption = 'Attachment';
                    SubPageLink = "Table ID" = CONST(57008), "No." = FIELD("No.");

                }
            systempart(Control1000000012; Notes)
            {
            }
            systempart(Control1000000013; MyNotes)
            {
            }
            systempart(Control1000000014; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                begin
                    //  if ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(Rec) then
                    //  ApprovalsMgmt.OnSendImpMemoForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                begin
                 //   ApprovalsMgmt.OnCancelSalesApprovalRequest(SalesRec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    //Ushindi changes

                    SetRange("No.", "No.");
                    Report.Run(57001, true, true, Rec);
                    Reset;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Accounts User" = false then
                SetRange("User ID", UserId);
        end
        /*
        CALCFIELDS("Terms of Reference");
        "Terms of Reference".CREATEINSTREAM(Instr);
        TOR.READ(Instr);
        TOR.GETSUBTEXT(TermsText,1) ;
        */

    end;

    trigger OnInit()
    begin
        //
    end;

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Accounts User" = false then
                SetRange("User ID", UserId);
        end

        /*
        CALCFIELDS("Terms of Reference");
        "Terms of Reference".CREATEINSTREAM(Instr);
        TOR.READ(Instr);
        TOR.GETSUBTEXT(TermsText,1) ;
        */

    end;

    var
        Instr: InStream;
        TOR: BigText;
        Outstr: OutStream;
        TermsText: Text;
       // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        SalesRec: Record "Sales Header";
        OpenApprovalEntriesExist: Boolean;
        UserSetup: Record "User Setup";

    local procedure SetControlAppearance()
    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
       // OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

