#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69613 "Staff Establishment Plan"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Staff Establishment Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Staff Establishment"; Rec."Total Staff Establishment")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Recruitment Plans"; Rec."No. of Recruitment Plans")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control12; "Establishment Position")
            {
                Caption = 'Establishment Positions';
                SubPageLink = "Staff Establishment Code" = field(Code);
            }
        }
        area(factboxes)
        {
            part(Control9; "Establishment Factbox")
            {
                Editable = false;
            }
            systempart(Control5; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control4; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Suggest Job Positions")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to Suggest Positions', true) then
                        Error('Positions not Suggested');

                    StaffEstablishmentTaskLines.Reset;
                    StaffEstablishmentTaskLines.SetRange("Staff Establishment Code", Rec.Code);
                    if StaffEstablishmentTaskLines.FindSet then begin
                        StaffEstablishmentTaskLines.DeleteAll;
                    end;

                    Positions.Reset;
                    if Positions.FindSet then begin
                        repeat
                            StaffEstablishmentTaskLines.Init;
                            StaffEstablishmentTaskLines."Job ID" := Positions."Position ID";
                            StaffEstablishmentTaskLines."Department Code" := Positions.Department;
                            StaffEstablishmentTaskLines."Directorate Code" := Positions.Directorate;
                            StaffEstablishmentTaskLines."Job Title" := Positions."Job Title";
                            StaffEstablishmentTaskLines."Designation Group" := Positions."Designation Group";
                            StaffEstablishmentTaskLines."Staff Establishment Code" := Rec.Code;
                            StaffEstablishmentTaskLines.Insert;

                        until
                      Positions.Next = 0;
                        Message('Job Positions suggested successfully');
                    end;
                end;
            }
            separator(Action23)
            {
            }
            action("Export To Excel")
            {
                ApplicationArea = Basic;
                Image = ExportToExcel;
                Promoted = true;
                PromotedCategory = Category7;
                RunObject = XMLport "Staff Planning Lines";
            }
            separator(Action21)
            {
            }
            action("Import from Excel")
            {
                ApplicationArea = Basic;
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Category7;
                RunObject = XMLport "Staff Planning Lines";
            }
            separator(Action18)
            {
            }
            action("Establishment Voucher")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the approval request.';

                    trigger OnAction()
                    var
                    //      ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the approval to a substitute approver.';

                    trigger OnAction()
                    var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';

                    trigger OnAction()
                    var
                    //      ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval to change the record.';

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //IF ApprovalsMgmt.CheckCustomerApprovalsWorkflowEnabled(Rec) THEN
                        // ApprovalsMgmt.OnSendCustomerForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    // WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
                    begin
                        //ApprovalsMgmt.OnCancelCustomerApprovalRequest(Rec);
                        //WorkflowWebhookManagement.FindAndCancel(RECORDID);
                    end;
                }
            }
        }
        area(navigation)
        {
            action("Manpower Plans")
            {
                ApplicationArea = Basic;
                Image = Planning;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category8;
                RunObject = Page "Establishment Planning Lines";
                RunPageMode = View;
            }
            action("Job Grades")
            {
                ApplicationArea = Basic;
                Image = JobLedger;
                Promoted = true;
                PromotedCategory = Category8;
                RunObject = Page "Job Grades";
            }
            action("Duty Stations")
            {
                ApplicationArea = Basic;
                Image = DeleteAllBreakpoints;
                Promoted = true;
                PromotedCategory = Category8;
                RunObject = Page "Duty Stations";
            }
        }
        area(reporting)
        {
            action("Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                //RunObject = Report "Staff Establishment";
            }
            action("Detailed Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                // RunObject = Report "Detailed Staff Establishment";
            }
        }
    }

    trigger OnOpenPage()
    begin
        EntryNo := 0;
        StaffEstablishmentTaskLines.Reset;
        StaffEstablishmentTaskLines.SetRange("Staff Establishment Code", Rec.Code);
        if StaffEstablishmentTaskLines.FindSet then begin
            repeat
                StaffEstablishmentTaskLines.CalcFields("Approved No.");
                EntryNo := StaffEstablishmentTaskLines."Approved No." + EntryNo;
            until StaffEstablishmentTaskLines.Next = 0;
        end;
        Rec."Total Staff Establishment" := EntryNo;
        Rec.Modify(true);
    end;

    var
        StaffEstablishmentTaskLines: Record "Establishment Plan Position";
        Positions: Record "Company Positions";
        EntryNo: Integer;
}

#pragma implicitwith restore

