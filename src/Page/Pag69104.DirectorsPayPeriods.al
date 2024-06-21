#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69104 "Directors Pay Periods"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Director Payroll Period";
    SourceTableView = order(descending);
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Starting Date"; "Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field("New Fiscal Year"; "New Fiscal Year")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Date"; "Pay Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field(Closed; Closed)
                {
                    ApplicationArea = Basic;
                }
                field("Close Pay"; "Close Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Advocacy Message"; "Advocacy Message")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000014; Notes)
            {
            }
            systempart(Control1000000015; MyNotes)
            {
            }
            systempart(Control1000000016; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Create Period")
            {
                ApplicationArea = Basic;
                Caption = '&Create Period';
                Ellipsis = true;
                Image = CreateYear;
                Promoted = true;
                PromotedCategory = Process;
                // RunObject = Report "Create Payroll Period";
            }
            action("C&lose Period")
            {
                ApplicationArea = Basic;
                Caption = 'C&lose Period';
                Image = CloseYear;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //IF Rec.Status<>Status::Released THEN
                    // ERROR('Payroll period must be APPROVED before closing. Please check!!');
                    if Rec.Closed = true then
                        Error('Payroll period has already been closed.Please Check!!');

                    if not Confirm('You are about to close the current Pay period are you sure you want to do this?' + //
                    ' Make sure all reports are correct before closing the current pay period, Go ahead?', false) then
                        exit;



                    //ClosingFunction.GetCurrentPeriod(Rec);
                    //ClosingFunction.RUN;
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = true;

                    trigger OnAction()
                    begin
                        //IF ApprovalsMgmt.CheckPayPeriodApprovalsWorkflowEnabled(Rec) THEN
                        //  ApprovalsMgmt.OnSendPayPeriodForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //ApprovalsMgmt.OnCancelPayPeriodApprovalRequest(Rec);
                    end;
                }
                separator(Action1000000019)
                {
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        //ApprovalEntries.Setfilters(DATABASE::"Payroll PeriodX",8,FORMAT(Rec."Starting Date"));
                        //ApprovalEntries.RUN;
                    end;
                }
            }
        }
    }

    var
        ClosingFunction: Report "Close Pay period";

    ///   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

