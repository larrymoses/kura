#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69662 "Commitee Appointment Voucher"
{
    PageType = Card;
    SourceTable = "Commitee Appointment Voucher";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Type ID";"Committee Type ID")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy Name";"Vacancy Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Appointment Effective Date";"Appointment Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tenure End Date";"Tenure End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointing Authority";"Appointing Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Raised By";"Raised By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Staff ID";"Staff ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Region;Region)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control6;"Committe Appointment Lines")
            {
                SubPageLink = "Document No."=field("Document No."),
                              "Document Type"=field("Document Type");
            }
        }
        area(factboxes)
        {
            systempart(Control26;Outlook)
            {
            }
            systempart(Control27;Notes)
            {
            }
            systempart(Control28;MyNotes)
            {
            }
            systempart(Control29;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Selection Committee Vacancy")
            {
                ApplicationArea = Basic;
                Image = SelectLineToApply;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Selection Committee Vacancy";
                RunPageLink = "Document No."=field("Document No.");
            }
            action(Appoint)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Appoint the selected members';
                begin
                    if Confirm(TXT001)=true then begin
                     TestField("Approval Status","approval status"::Released);
                     Recruitment.AppointCommiteeeMembers(Rec);
                    //"Approval Status":="Approval Status"::Released;
                    Modify(true);
                    end
                end;
            }
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    //Message
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                begin
                    TestField("Approval Status","approval status"::Open);
                    "Approval Status":="approval status"::Released;
                    Message('Approved Successfully');
                    // IF ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(Rec) THEN
                    //  ApprovalsMgmt.OnSendLeaveAppForApproval(Rec);
                    // END
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                begin
                    //
                    TestField("Approval Status","approval status"::"Pending Approval");
                    "Approval Status":="approval status"::Open;
                    Message('Cancelled Successfully');
                    //ApprovalsMgmt.OnCancelLeaveAppApprovalRequest(Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::Appointment;
    end;

    var
        Recruitment: Codeunit Recruitment;
}

