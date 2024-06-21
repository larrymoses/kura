#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69221 "Training Requisition"
{
    PageType = Card;
    SourceTable = "Training Requests";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = DStatus;
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Training Plan No."; "Training Plan No.")
                {
                    ApplicationArea = Basic;
                }
                field("Course Title"; "Course Title")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Start DateTime"; "Start DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime"; "End DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Duration)
                {
                    ApplicationArea = Basic;
                    Caption = 'Duration (Days)';
                }
                field(Cost; Cost)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Training Venue Region Code"; "Training Venue Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Training Venue Region"; "Training Venue Region")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Training Responsibility Code"; "Training Responsibility Code")
                {
                    ApplicationArea = Basic;
                }
                field("Training Responsibility"; "Training Responsibility")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Location; Location)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Provider; Provider)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Provider Name"; "Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field("Training Type"; "Training Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Training Duration Hrs"; "Training Duration Hrs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Planned Budget"; "Planned Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Planned No. to be Trained"; "Planned No. to be Trained")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Participants"; "No. of Participants")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Procurement Cost"; "Total Procurement Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Other Costs"; "Other Costs")
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
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
            }
            part(Control37; "Training Participants List")
            {
                Enabled = DStatus;
                SubPageLink = "Training Code" = field(Code);
            }
        }
        area(factboxes)
        {
            systempart(Control20; Notes)
            {
            }
            systempart(Control21; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            group("&Show")
            {
                Caption = '&Show';
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                    begin
                        DocumentType := Documenttype::"Training Application";

                        /*ApprovalComments.Setfilters(DATABASE::"HR Training Applications",DocumentType,Code);
                        ApprovalComments.SetUpLine(DATABASE::"HR Training Applications",DocumentType,Code);
                        ApprovalComments.RUN;*/

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        /*DocumentType:=DocumentType::"Training Application";
                        ApprovalEntries.Setfilters(DATABASE::"HR Training Applications",DocumentType,Code);
                        ApprovalEntries.RUN;*/

                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        TestField(Duration);
                        if Confirm('Are you sure you want to send an approval request', true) = false then exit;
                        //   if ApprovalsMgmt.CheckTApplicationApprovalsWorkflowEnabled(Rec) then
                        //    ApprovalsMgmt.OnSendTApplicationForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        TestField(Status, Status::Pending);
                        if Confirm('Are you sure you want to cancel the approval request', true) = false then exit;
                        // ApprovalsMgmt.OnCancelTApplicationApprovalRequest(Rec);
                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        //TESTFIELD(Status,Status::Approved);

                        HRTrainingApplications.SetRange(HRTrainingApplications.Code, Code);
                        if HRTrainingApplications.Find('-') then
                            Report.Run(69122, true, true, HRTrainingApplications);
                    end;
                }
                action("<A ction1102755042>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //    OpenDoc.ReleaseTrainingApp(Rec)
                    end;
                }
                action(ImportParticipants)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Participants';

                    trigger OnAction()
                    begin
                        Reset;
                        SetFilter(Code, Code);
                        Report.Run(69120, true, true, Rec);
                        Reset;
                    end;
                }
                action("Training Costs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Costs';
                    Image = Calculate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Training Cost";
                    RunPageLink = "Training ID" = field(Code);
                }
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Upload Documents';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
    }

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        DStatus := true;
        if Status = Status::Pending then
            DStatus := false;
    end;

    trigger OnOpenPage()
    begin
        DStatus := true;
        if Status = Status::Pending then
            DStatus := false;
    end;

    var
        HREmp: Record Employee;
        EmpNames: Text[40];
        sDate: Date;
        HRTrainingApplications: Record "Training Requests";
        // ApprovalMgt: Codeunit "Approvals Mgmt.";
        ApprovalComments: Page "Approval Comments";
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Application NoEditable": Boolean;
        [InDataSet]
        "Employee No.Editable": Boolean;
        [InDataSet]
        "Employee NameEditable": Boolean;
        [InDataSet]
        "Employee DepartmentEditable": Boolean;
        [InDataSet]
        "Purpose of TrainingEditable": Boolean;
        [InDataSet]
        "Course TitleEditable": Boolean;
        HRTrainingNeed: Record "Advertisement Channels";
        //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenDoc: Codeunit "Release Approval Document";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        UserSetup: Record "User Setup";
        CashMgt: Record "Cash Management Setup";
        ImpNo: Code[30];
        NotificationManagement: Codeunit "Notification Management";
        FileLocation: Text;
        Email1: Text;
        DStatus: Boolean;
}

