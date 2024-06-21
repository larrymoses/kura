#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69109 "Manpower Plan Header"
{
    PageType = Card;
    SourceTable = "Manpower Plan Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Year Code"; "Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Staff Establishment Voucher"; "Staff Establishment Voucher")
                {
                    ApplicationArea = Basic;
                }
                field("Establishment Description"; "Establishment Description")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; "Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department  Name"; "Department  Name")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Status"; "Approved Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Global; Global)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control15; "Manpower Task Lines")
            {
                SubPageLink = "Manpower Plan Code" = field(No);
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
            }
            systempart(Control20; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control19; Notes)
            {
                ApplicationArea = Notes;
                Visible = true;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Import Planning Lines")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = XMLport "Manpower Planning Lines";

                trigger OnAction()
                begin
                    ManPowerPlanningLine.SetRange("Manpower Plan Code", No);
                    ManpowerPlanningLines.Run;
                    //code to import the manpower plan
                end;
            }
            separator(Action32)
            {
            }
            action("Suggest Task Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Text001: label 'Manpower Task Lines updated succesfully';
                begin
                    StaffEstablishmentHeader.Reset;
                    StaffEstablishmentHeader.SetRange(Active, true);
                    if StaffEstablishmentHeader.FindSet then begin
                        StaffEstablishmentTaskLines.SetRange("Staff Establishment Code", StaffEstablishmentHeader.Code);
                        if StaffEstablishmentTaskLines.FindSet then begin
                            repeat
                                ManPowerPlanTaskLines.Init;
                                ManPowerPlanTaskLines."Task No" := Format(StaffEstablishmentTaskLines."Entry No.");
                                ManPowerPlanTaskLines."Job Id" := StaffEstablishmentTaskLines."Job ID";
                                ManPowerPlanTaskLines."Manpower Plan Code" := No;
                                ManPowerPlanTaskLines.Validate("Job Id");
                                StaffEstablishmentTaskLines.CalcFields("Actual Active");
                                ManPowerPlanTaskLines."Actual Active" := StaffEstablishmentTaskLines."Actual Active";
                                ManPowerPlanTaskLines."Approved Establishment" := StaffEstablishmentTaskLines."No. of Posts";
                                ManPowerPlanTaskLines.Validate("Approved Establishment");
                                ManPowerPlanTaskLines.Insert;
                            until StaffEstablishmentTaskLines.Next = 0;
                            Message(Text001);
                        end
                    end
                end;
            }
            action("Manpower Planning Lines")
            {
                ApplicationArea = Basic;
                Image = JobLines;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page "Manpower Planning Lines";
                RunPageLink = "Manpower Plan Code" = field(No);
            }
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Image = Dimensions;
                Promoted = false;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = false;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    /*ShowDocDim;
                    CurrPage.SAVERECORD;
                    */

                end;
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
                     //   ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                       // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                       // ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                      //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                     //   ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
                     //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                      //  ApprovalsMgmt.GetApprovalComment(Rec);
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
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval to change the record.';

                    trigger OnAction()
                    begin
                        /*IF ApprovalsMgmt.CheckManpowerApprovalWorkflowEnabled(Rec) THEN
                          ApprovalsMgmt.OnSendManpowerForApproval(Rec);
                          */

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                       // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                       // WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
                    begin
                        if "Approved Status" <> "approved status"::"Pending Approval" then
                            Error(Text001, No);
                        /*
                        ApprovalsMgmt.OnCancelManpowerForApprovalRequest(Rec);
                        WorkflowWebhookManagement.FindAndCancel(RECORDID);
                        */

                    end;
                }
            }
        }
        area(navigation)
        {
            action("New Hires")
            {
                ApplicationArea = Basic;
                Image = Add;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
            }
            action("Manpower Statistics")
            {
                ApplicationArea = Basic;
                Image = Statistics;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page "Manpower Plan Statistics";
            }
            action("Staff Vacancy Requisitions")
            {
                ApplicationArea = Basic;
                Image = List;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page "Staff Recruitment Requisitions";
                RunPageLink = "Manpower Plan ID" = field(No);
            }
        }
        area(reporting)
        {
            action("Manpower Plan Summary")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    ManPowerPlanningLine.SetRange("Manpower Plan Code", No);
                    ManpowerPlanningLines.Run;
                end;
            }
        }
    }

    var
        ManPowerPlanningLine: Record "ManPower Planning Lines";
        ManpowerPlanningLines: Page "Manpower Planning Lines";
        Employee: Record "HR Job Applications";
        VacancyRequisitionsTable: Record "ManPower Planning Lines";
        ManPowerPlanTaskLines: Record "ManPower Plan Task Lines";
        StaffEstablishmentTaskLines: Record "Staff Establishment Task Lines";
        StaffEstablishmentHeader: Record "Staff Establishment Header";
       // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Text001: label 'The document %1 has not been sent for approval';
}

