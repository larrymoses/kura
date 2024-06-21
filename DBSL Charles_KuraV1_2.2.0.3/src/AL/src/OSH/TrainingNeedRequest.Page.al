#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 99295 "Training Need Request"
{
    PageType = Card;
    SourceTable = 69194;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("FY Code";Rec."FY Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                }
                field("Date of First Appointment"; Rec."Date of First Appointment")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Training Plan No"; Rec."Training Plan No")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Status = Rec.Status::Closed;
                }
                field("Years Worked"; Rec."Years Worked")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Age Bracket"; Rec."Age Bracket")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Career Aspirations"; Rec."Career Aspirations")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Training Programme Required"; Rec."Training Programme Required")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Training Attended"; Rec."Training Attended")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part("Education/Professional Qualifications"; CoursesPursuingPage)
            {
                SubPageLink = "Document No." = field(Code);
                Caption = 'Education/Professional Qualifications';
            }
            part("Job Requirements"; DuttyPerformanceChallengesSF)
            {
                SubPageLink = "Document No." = field(Code);
                Caption = 'Job Requirements';
            }
            part(Control9; "Need Requests")
            {
                SubPageLink = "Training Header No." = field(Code);
            }
            part("Training Attended Subform"; EmpTrainingAttendedCard)
            {
                SubPageLink = "Document No." = field(Code);
                Caption = 'Training Attended';
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
            }
            systempart(Control26; Notes)
            {
            }
            systempart(Control25; MyNotes)
            {
            }
            systempart(Control21; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Need Application")
            {
                Caption = 'Need Application';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                action(Archive)
                {
                    ApplicationArea = Suite;
                    Caption = 'Archive';
                    Image = Archive;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';

                    trigger OnAction()
                    var
                    //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec."Archive Document" := true;
                        Rec.Modify;
                        CurrPage.Close;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);

                        // CurrPage.Close();
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = PostApplication;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = Rec.Status = Rec.Status::Closed;

                    trigger OnAction()
                    begin
                        Rec.TestField(Posted, false);
                        Rec.TestField("Training Plan No");
                        TrainingNeedsRequests.Reset;
                        TrainingNeedsRequests.SetRange("Training Header No.", Rec.Code);
                        if TrainingNeedsRequests.FindSet then begin
                            repeat
                                TrainingPlanLines.Reset;
                                TrainingPlanLines.SetRange("Training Plan Code", Rec."Training Plan No");
                                TrainingPlanLines.SetRange("Course Title", TrainingNeedsRequests."Course ID");
                                if not TrainingPlanLines.FindSet then begin
                                    TrainingPlanLines2.Init;
                                    TrainingPlanLines3.Reset;
                                    if TrainingPlanLines3.FindLast then
                                        TrainingPlanLines2."Task No" := TrainingPlanLines3."Task No" + 1;
                                    TrainingPlanLines2."Training Plan Code" := Rec."Training Plan No";
                                    TrainingPlanLines2."Course Title" := TrainingNeedsRequests."Course ID";
                                    TrainingPlanLines2."Course Description" := TrainingNeedsRequests.Description;
                                    TrainingPlanLines2.Insert(true);
                                end;
                                TrainingNeedsRegister.Init;
                                TrainingNeedsReg.Reset;
                                if TrainingNeedsReg.FindLast then
                                    TrainingNeedsRegister."Entry No." := TrainingNeedsReg."Entry No." + 1;
                                TrainingNeedsRegister."Training Plan No" := Rec."Training Plan No";
                                TrainingNeedsRegister."Course ID" := TrainingNeedsRequests."Course ID";
                                TrainingNeedsRegister.Description := TrainingNeedsRequests.Description;
                                TrainingNeedsRegister.Source := TrainingNeedsRequests.Source;
                                TrainingNeedsRegister.Comments := TrainingNeedsRequests.Comments;
                                TrainingNeedsRegister."Training Header No." := Rec.Code;
                                TrainingNeedsRegister."Employee No" := Rec."Employee No";
                                TrainingNeedsRegister."Employee Name" := Rec."Employee Name";
                                TrainingNeedsRegister.Insert(true);
                            until TrainingNeedsRequests.Next = 0;
                        end;
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CurrentDatetime;
                        Message('Posted Successfully');
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = not OpenApprovalEntriesExist;

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
        SetControlAppearance;
    end;
    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;
    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        TrainingNeedsRegister: Record 69187;
        TrainingNeedsRequests: Record "Training Needs Requests";
        TrainingNeedsReg: Record 69187;
        TrainingPlanLines: Record "Training Plan Lines";
        TrainingNeedsReq: Record "Training Needs Requests";
        TrainingPlanLines2: Record "Training Plan Lines";
        TrainingPlanLines3: Record "Training Plan Lines";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;
}

#pragma implicitwith restore
