#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69298 "HR Committee Appointment"
{
    Caption = 'Committee Appointment Voucher';
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
                    Caption = 'Committee Type';
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
                }
                field("Staff ID";"Staff ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Region;Region)
                {
                    ApplicationArea = Basic;
                }
                field("Branch/Centre";"Branch/Centre")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
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
            action(Appoint)
            {
                ApplicationArea = Basic;
                Caption = 'Appoint & Notify';
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
                      Recruitment.FnAppointHRCommiteeeMembers(Rec);
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
                PromotedCategory = Category4;

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
                PromotedCategory = Category4;

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

