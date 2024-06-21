

Page 69169 "Pay Period Temp"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    //Editable = false;
    PageType = List;
    SourceTable = "Payroll PeriodXT";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("New Fiscal Year"; Rec."New Fiscal Year")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Date Locked"; Rec."Date Locked")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Date"; Rec."Pay Date")
                {
                    ApplicationArea = Basic;
                }
                field("Close Pay"; Rec."Close Pay")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("P.A.Y.E"; Rec."P.A.Y.E")
                {
                    ApplicationArea = Basic;
                }
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
                RunObject = Report "Create Payroll PeriodT";
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



                    ClosingFunction.GetCurrentPeriod(Rec);
                    ClosingFunction.Run;
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
                        /*IF ApprovalsMgmt.CheckPayPeriodApprovalsWorkflowEnabled(Rec) THEN
                          ApprovalsMgmt.OnSendPayPeriodForApproval(Rec);
                        */

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
                separator(Action14)
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

                        // ApprovalEntries.Setfilters(Database::"Payroll PeriodXT",8,Format(Rec."Starting Date"));
                        ApprovalEntries.Run;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        Rec.SetRange("Responsibility Center", UserSetup."Responsibility Center");
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Responsibility Center" := UserSetup."Responsibility Center";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserSetup."Responsibility Center";
    end;

    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);
        Rec.SetRange("Responsibility Center", UserSetup."Responsibility Center");
    end;

    var
        ClosingFunction: Report "Close Pay period T";
        //      ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        UserSetup: Record "User Setup";
}



