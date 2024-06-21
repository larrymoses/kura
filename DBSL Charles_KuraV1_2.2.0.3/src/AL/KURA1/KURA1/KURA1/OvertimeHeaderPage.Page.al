#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69173 "Overtime Header Page"
{
    PageType = Card;
    SourceTable = "Overtime Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application Code"; "Application Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("EMp No."; "EMp No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field("Convert to pay";"Convert to pay")
                // {
                //     ApplicationArea = Basic;
                //     Editable = EditableCheck;
                // }
                // field("Convert to Leave";"Convert to Leave")
                // {
                //     ApplicationArea = Basic;
                //     Editable = EditableCheck;
                // }
                field("Overtime Amount"; "Overtime Amount")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Total Hours"; "Total Hours")
                {
                    ApplicationArea = Basic;
                }
                field("Application Date"; "Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("Dim Code 1"; "Dim Code 1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region';
                    Editable = false;
                }
                field("Dim Code 2"; "Dim Code 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Constituency';
                    Editable = false;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Converted; Converted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group("Overtime Details")
            {
                Caption = 'Overtime Details';
                part(Control1000000004; "Overtime Lines")
                {
                    SubPageLink = "EmpNo." = field("EMp No."),
                                  "Application Code" = field("Application Code");
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Convert To leave")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    //IF "Convert to Leave" = TRUE THEN
                end;
            }
            action("Convert to Pay")
            {
                ApplicationArea = Basic;
            }
            action(Approval)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    /*DocumentType:=DocumentType::Overtime;
                    ApprovalEntries.Setfilters(DATABASE::Overtime,DocumentType,"Application Code");
                    ApprovalEntries.RUN;*/

                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    Text001: label 'This transaction is already pending approval';
                begin
                    TestField(Status, Status::Open);


                    /*
                    IF "Paying Type"="Paying Type"::" " THEN
                    ERROR('Kindly spceify the paying type')
                    
                    ELSE IF ("Paying Vendor Account"<>'') AND ("Paying Bank Account"<>'') THEN
                    ERROR('You cannot have both paying bank and paying vendor, choose one')
                    
                    ELSE IF ("Paying Type"="Paying Type"::Vendor) AND ("Paying Vendor Account"='') THEN
                    ERROR('Kindly spceify the paying vendor account')
                    
                    ELSE IF ("Paying Type"="Paying Type"::Bank) AND ("Paying Bank Account"='') THEN
                    ERROR('Kindly spceify the paying bank account');
                    
                    
                    IF NOT LinesExists THEN
                       ERROR('There are no Lines created for this Document');
                    //Ensure No Items That should be committed that are not
                    IF LinesCommitmentStatus THEN
                      ERROR('There are some lines that have not been committed');
                    
                    PayLine.RESET;
                    PayLine.SETRANGE(PayLine.No,"No.");
                    PayLine.SETRANGE(PayLine.Type,'MEMBER');
                    IF PayLine.FIND('-') THEN BEGIN
                    IF PayLine."Transaction Type"=PayLine."Transaction Type"::" " THEN
                    ERROR('Transaction Type cannot be blank in payment lines');
                    END;
                    
                    TESTFIELD(Payee);
                    //Release the PV for Approval
                    
                    
                    BankAcc.RESET;
                    BankAcc.SETRANGE(BankAcc."No.","Paying Bank Account");
                    BankAcc.SETRANGE(BankAcc."Bank Type",BankAcc."Bank Type"::Cash);
                    IF BankAcc.FIND('-') THEN BEGIN
                    BankAcc.CALCFIELDS(BankAcc.Balance);
                    
                    IF  BankAcc.Balance<0 THEN
                    ERROR('Kindly ensure that the petty cash float is enough') ;
                    END;
                    */

                    // if ApprovalsMgmt.CheckOvertimeApprovalsWorkflowEnabled(Rec) then
                    //   ApprovalsMgmt.OnSendOvertimeForApproval(Rec);

                end;
            }
            action("Cancel Approval REquest")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //  ApprovalsMgmt.OnCancelOvertimeApprovalRequest(Rec);
                end;
            }
            action("Fill Overtime Details")
            {
                ApplicationArea = Basic;
                //  RunObject = Page UnknownPage52018537;
                Visible = false;
            }
        }
    }

    trigger OnInit()
    begin
        EditableCheck := false;
        // if Status=Status::Approved then
        EditableCheck := true;
    end;

    trigger OnOpenPage()
    begin
        EditableCheck := false;
        //if Status=Status::Approved then
        EditableCheck := true;
    end;

    var
        HRSETUP: Record "Human Resources Setup";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation","Overdraft ",BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp;
        EditableCheck: Boolean;
}

