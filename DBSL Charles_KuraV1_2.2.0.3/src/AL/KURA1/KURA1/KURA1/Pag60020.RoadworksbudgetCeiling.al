page 60020 "Road works budget Ceiling"
{
    Caption = 'Road works budget Ceiling';
    PageType = Card;
    SourceTable = "Road Works Budget Ceilings";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Print,Release,Navigate,E-Mail';
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Doc Reference No"; Rec."Doc Reference No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Doc Reference No field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Funding Source Type field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Allocated Amount"; Rec."Allocated Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allocated Amount field.';
                }
                field("Assign To"; Rec."Assign To")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Assign To field.';
                }
                field("Assignment Remarks"; Rec."Assignment Remarks")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Assignment Remarks field.';
                }
                field("Budget Ceiling Amount"; Rec."Budget Ceiling Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Ceiling Amount field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Financier Code"; Rec."Financier Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Financier Code field.';
                }
                field("Financier Name"; Rec."Financier Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Financier Name field.';
                }

                field("Includes HQ"; Rec."Includes HQ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Includes HQ field.';
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
            }
            part("Roadworks Ceilings Line"; "Roadworks Ceilings Line")
            {
                Caption = 'Roadworks Ceilings Line';
                SubPageLink = "Document No" = field("Document No");
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(99501),
                              "No." = field("Document No");

            }
            systempart(Notes; Notes)
            {
            }

            systempart(Links; Links)
            {
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(NotifyRegions)
            {
                Caption = 'Notify Regions';
                Promoted = true;
                PromotedCategory = Category8;
                trigger OnAction()
                var
                    ResponsibilityCenters: Record "Responsibility Center";
                    Email: Codeunit Email;
                    Mail: Codeunit "Email Message";
                    TempBlob: Codeunit "Temp Blob";
                    DocStream: Instream;
                    Outs: Outstream;
                    RecRef: RecordRef;
                    fref: FieldRef;
                    Body: Text;
                    Subject: Label 'BUDGET CEILINGS UPLOADED';
                    Recepient: List of [Text];
                    RoadWorkCeilingsLine: Record "RoadWorks Ceilings Line";
                    Emp: Record Employee;
                    CCRecepient: List of [Text];
                    BCCRecepient: List of [Text];
                begin
                    RoadWorkCeilingsLine.Reset();
                    RoadWorkCeilingsLine.SetRange("Document No", Rec."Document No");
                    if RoadWorkCeilingsLine.FindSet() then begin
                        repeat
                            ResponsibilityCenters.Reset();
                            ResponsibilityCenters.SetRange("Operating Unit Type", ResponsibilityCenters."Operating Unit Type"::Region);
                            ResponsibilityCenters.SetRange(Code, RoadWorkCeilingsLine."Region Code");
                            if ResponsibilityCenters.FindFirst() then begin
                                Clear(Recepient);
                                Clear(BCCRecepient);
                                Recepient.Add(ResponsibilityCenters."E-Mail");
                                Body := 'Dear Sir/Madam, <br>' + 'This is to notify you that the Road Works Budget Ceilings for the financial year ' + Rec."Financial Year Code" + ' have been uploaded. <br> Please login to the system to prepare the regional workplans.<br> ' + 'Thanks and Regards <br>';
                                if Emp.Get(ResponsibilityCenters."Current Head") then
                                    BCCRecepient.Add(Emp."E-Mail");
                                Mail.Create(Recepient, Subject, Body, true, CCRecepient, BCCRecepient);
                                Email.Send(Mail);
                            end
                        until RoadWorkCeilingsLine.Next() = 0;
                    end;

                end;

            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant)
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
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
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
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
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        //   SetControlAppearance();
        SetControlAppearance;

    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();

    end;

    trigger OnOpenPage()
    begin

        SetControlAppearance;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;


    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DocumentErrorsMgt: Codeunit "Document Errors Mgt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        Rec.CalcFields("Financier Posting Group Filter");
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}
