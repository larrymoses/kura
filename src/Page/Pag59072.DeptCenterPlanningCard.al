#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59072 "Dept/Center Planning Card"
{
    Caption = 'User Planning Card';
    PageType = Card;
    SourceTable = Planning;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Head";"Directorate Head")
                {
                    ApplicationArea = Basic;
                }
                field("Accounting Period";"Accounting Period")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Employee";"Responsible Employee")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Division;Division)
                {
                    ApplicationArea = Basic;
                }
                field(Section;Section)
                {
                    ApplicationArea = Basic;
                }
                field(Unit;Unit)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control23;"Planning Matrix List")
            {
                SubPageLink = No=field(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup22)
            {
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send For Approval';
                    Enabled = true;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        /*TESTFIELD(Status,Status::Open);//status must be open.
                        TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        //TESTFIELD("Imprest Memo No");
                        TESTFIELD("Payment Narration");
                        IF "Imprest Amount"=0 THEN
                          ERROR(Text001,"No.");
                        IF ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) THEN
                          ApprovalsMgmt.OnSendPaymentsForApproval(Rec);*/
                          Message('Approved successfully');

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        /*TESTFIELD(Status,Status::"Pending Approval");//status must be open.
                        TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);*/
                        Message('Canceled successfully');

                    end;
                }
            }
        }
    }
}

