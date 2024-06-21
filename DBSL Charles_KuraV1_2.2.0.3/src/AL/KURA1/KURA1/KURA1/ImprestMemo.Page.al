#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57033 "Imprest Memo"
{
    DeleteAllowed = false;
    PageType = Document;
    SourceTable = "Imprest Memo";
    ///Permissions =
    //  tabledata "Imprest Memo" = RIM,
    // tabledata "Project Members" = R;
    PromotedActionCategories = 'New,Process,Report,New Document,Approve,Request Approval,Prices and Discounts,Navigate,Customer';

    layout
    {
        area(content)
        {
            group("Imprest Request Memo")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ShowMandatory = true;
                    Visible = false;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Objective; ObjText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Objective);
                        Rec.Objective.CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec.Objective);
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec.Objective.CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("Terms of Reference"; TORText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;

                    trigger OnValidate()
                    begin

                        Rec.CalcFields("Terms of Reference");
                        Rec."Terms of Reference".CreateInstream(Instr);
                        TOR.Read(Instr);

                        if TORText <> Format(TOR) then begin
                            Clear(Rec."Terms of Reference");
                            Clear(TOR);
                            TOR.AddText(TORText);
                            Rec."Terms of Reference".CreateOutstream(OutStr);
                            TOR.Write(OutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("Imprest Naration"; Rec."Imprest Naration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Narations';
                    Editable = not OpenApprovalEntriesExist;
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Destination Name"; Rec."Destination Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Travel Date';
                    Visible = true;
                }
                field("No. of days"; Rec."No. of days")
                {
                    ApplicationArea = Basic;
                    //  Numeric = true;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Mode of Transport"; Rec."Mode of Transport")
                {
                    ApplicationArea = Basic;
                }
                field("Number of Drivers"; Rec."Number of Drivers")
                {
                    ApplicationArea = Basic;
                }
                field("International Travel"; Rec."International Travel")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Code:';
                    Visible = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Subsistence Allowance"; Rec."Total Subsistence Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Total Fuel Costs"; Rec."Total Fuel Costs")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Total Maintenance Costs"; Rec."Total Maintenance Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Total Casuals Cost"; Rec."Total Casuals Cost")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Total Other Costs"; Rec."Total Other Costs")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Raised By';
                    Editable = false;
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Constituency';
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Section Name';
                    Visible = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Budget"; Rec."Project Budget")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Actual Project Costs"; Rec."Actual Project Costs")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("PO Commitments"; Rec."PO Commitments")

                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Store Requisition Commitments"; Rec."Store Requisition Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Imprest Application Commitment"; Rec."Imprest Application Commitment")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Job  Task"; Rec."Job  Task")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Total Imprest Cost"; Rec."Total Imprest Cost")
                {
                    ApplicationArea = all;
                    Visible = true;
                    Editable = false;
                    trigger OnValidate()
                    var

                    begin
                        rec.CalcFields(rec."Total Subsistence Allowance", rec."Total Casuals Cost", rec."Total Other Costs");
                        rec."Total Imprest Cost" := rec."Total Subsistence Allowance" + rec."Total Casuals Cost" + rec."Total Other Costs";
                    end;

                }
                part("Attached Documents1"; "Document Attachment Factbox1")
                {
                    ApplicationArea = All;
                    Caption = 'Attachment';
                    SubPageLink = "Table ID" = CONST(57008), "No." = FIELD("No.");//, "Document Type" = CONST(0);
                                                                                  // SystemCreatedBy = field(SystemCreatedBy);

                }
            }
            group("Travel Details")
            {
                Visible = false;
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = Basic;
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control43; "Safari Team")
            {
                UpdatePropagation =Both;
                Caption = 'Team';
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Person);
            }
            part("Fuel/Maintenance"; Fuel)
            {
                UpdatePropagation =Both;
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Machine);
                Visible = false;
            }
            part(Control1000000021; "Execution Plan")
            {
                UpdatePropagation =Both;
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                Visible = false;
            }
            part(Control1000000022; Casuals)
            {
                UpdatePropagation =Both;
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                Visible = true;
            }
            part(Control1000000023; "Other Costs")
            {
                UpdatePropagation =Both;
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
            }
        }
        area(factboxes)
        {
            // part("Attached Documents1"; "Document Attachment Factbox1")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachments';
            //     SubPageLink = "Table ID" = CONST(57033), "No." =
            //     FIELD("No.");


            // }
            systempart(Control1000000017; Notes)
            {
            }
            systempart(Control1000000018; MyNotes)
            {
            }
            systempart(Control1000000019; Links)
            {
            }

        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                var
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin

                    //Check if the header has lines
                    ProjectTeam.Reset;
                    ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", Rec."No.");
                    if not ProjectTeam.FindLast then
                        Error('Please make sure you have atleast one line');
                    editTransport := false;
                    Rec.TestField(Status, Rec.Status::Open);//status must be open.
                    //TESTFIELD("User ID",USERID); //control so that only the initiator of the document can send for approval
                    Rec.TestField(Objective);
                    Rec.TestField(Subject);
                    Rec.TestField(Date);
                    Rec.TestField("Imprest Naration");
                    //TESTFIELD(Job);
                    //TESTFIELD("Job  Task");
                    rec.TestField(rec."Shortcut Dimension 1 Code");
                    rec.TestField("Responsibility Center");
                    //cc//  Rec.Status := Rec.Status::Released;
                    //   cc/// Rec.Modify(TRUE);
                    //IF "Vote Amount"<"Total Subsistence Allowance" THEN
                    //ERROR('Budgeted Amount is less than the Amount requested');

                    //check if the requester is part of the team


                    //****Commented by Morris*****//
                    /*ProjectTeam.RESET;
                    ProjectTeam.SETRANGE(ProjectTeam."No.",Requestor);
                    IF ProjectTeam.FINDFIRST= FALSE THEN
                      ERROR(Text001);*/
                    //****Commented by Morris*****//
                    /*IF Status=Status::"Pending Approval" THEN BEGIN
                          IF "User ID"='DYNASOFT' THEN
                            editTransport:=TRUE;
                    
                            END ELSE BEGIN
                            editTransport:=FALSE;
                            END;*/

                    /*
                    CALCFIELDS("Total Subsistence Allowance","Total Fuel Costs","Total Maintenance Costs","Total Casuals Cost","Total Other Costs");
                    TotalImprestAmount:="Total Subsistence Allowance"+"Total Fuel Costs"+"Total Maintenance Costs"+"Total Casuals Cost"+"Total Other Costs";
                    */
                    /*IF (TotalImprestAmount>"Job Task Remaining Amount") THEN
                       ERROR('Applied imprest Memo of Amount (%1) is more than Available Amount (%2)',TotalImprestAmount,"Job Task Remaining Amount");
                    
                    "Total Cost":=TotalImprestAmount;
                    MODIFY;
                    *//*
                    CALCFIELDS("Total Subsistence Allowance","Total Fuel Costs","Total Maintenance Costs","Total Casuals Cost","Total Other Costs");
                    TotalImprestAmount:="Total Subsistence Allowance"+"Total Fuel Costs"+"Total Maintenance Costs"+"Total Casuals Cost"+"Total Other Costs";
                     // CashMgmtSetup.GET;
                     // IF (CashMgmtSetup."Check Budget Vailability"=TRUE) THEN BEGIN
                      IF (TotalImprestAmount>"Job Task Remaining Amount") THEN
                         ERROR('Applied imprest Memo of Amount (%1) is more than Available Amount (%2)',TotalImprestAmount,"Job Task Remaining Amount");
                     // END;
                     */
                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Enabled = Show;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin

                    PaymentPost.PostImprestMemo(Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                Visible = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Imprest Memo", true, true, Rec);
                end;
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
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalMgt.OpenApprovalEntriesPage(rec.RecordId);
                end;
            }
            action("Re&lease")
            {
                ApplicationArea = Basic;
                Caption = 'Re&lease';
                Image = ReleaseDoc;
                ShortCutKey = 'Ctrl+F9';

                trigger OnAction()
                var
                // ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    Rec.TestField("Reason to Reopen");
                    Releasememo.PerformManualRelease(Rec);
                end;
            }
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Enabled = Rec."No." <> '';
                Image = Dimensions;
                Promoted = true;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    Rec.ShowDocDim;
                    CurrPage.SaveRecord;
                end;
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
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //    ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(SendNotification)
                {
                    ApplicationArea = suite;
                    Caption = 'Send E-Mail Notification To Members';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    Visible = true;
                    trigger OnAction()
                    var
                        SMTPMailSetup: Record "Email Account";
                        SMTPMail: Codeunit "Email Message";
                        HumanResourcesSetup: Record "Human Resources Setup";
                        SenderName: Text[250];
                        SenderEmailAddress: Text[250];
                        Receipients: text[30];///// List of [Text];
                        Subject: Text[300];
                        Body: Text[300];
                        Employee: Record Employee;
                        ImprestNotificationsSetup: Record "Imprest Notifications Setup";
                        InsuranceNotifications: Codeunit "Insurance Notifications";
                        Smail: Codeunit EMail;
                        Safari: record "Project Members";


                    begin
                        rec.testfield(Rec.status,Rec.status::Released);
                        Safari.reset;
                        safari.setrange(Safari."Imprest Memo No.", rec."No.");
                        if Safari.FindSet then begin
                            REPEAT
                                HumanResourcesSetup.Get;
                                //ImprestNotificationsSetup.GET;
                                SenderName := CompanyProperty.DisplayName;
                                HumanResourcesSetup.TestField("HR E-mail Address");
                                SenderEmailAddress := HumanResourcesSetup."HR E-mail Address";
                                if Rec.Status = rec.status::Released then begin
                                    Employee.Reset;
                                    Employee.SetRange(Employee."No.", Safari."No.");
                                    if Employee.FindSet then
                                        Receipients := Employee."Company E-Mail";
                                    Message(Receipients);
                                    Subject := 'IMPREST MEMO(S) APPROVED';
                                    Body := 'Dear' + ' ' + SAFARI."Name" + '<br>'
                                   + 'Please note that you have listed on imprest memo(s)' + rec."No." + '<br>'
                                   + 'An Imprest Requisition has been created. Please Login to your ESS portal and navigate to open imprest requisitions and send it for approval' + '<BR>'
                                   + 'Kind Regards,' + '<br>'
                                   + CompanyProperty.DisplayName;
                                    //////   ///// SMTPMail.Create(SenderName,SenderEmailAddress,Receipients,Subject,Body,true);
                                    SMTPMail.Create(Receipients, Subject, Body, true);
                                    //SMTPMail.Send();
                                    Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);

                                END;
                            UNTIL SAFARI.NEXT = 0;

                            message('Sucessful!');
                        end;
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //        DMSManagement.UploadImprestDocuments(DMSDocuments."document type"::"Imprest Memo", "No.", 'Imprest Memo', RecordId, "Shortcut Dimension 1 Code");
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category7;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = false;

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
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Upload Documents';
                Image = Attach;
                Promoted = true;
                Visible = false;
                PromotedCategory = Category9;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                    Doc: Record "Document Attachment";

                begin

                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;

            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
        Rec.CalcFields("Terms of Reference", Objective);
        Rec."Terms of Reference".CreateInstream(Instr);
        TOR.Read(Instr);
        TORText := Format(TOR);


        Rec.Objective.CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Imprest Memo";
    end;

    trigger OnOpenPage()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        rec."Total Imprest Cost" := rec."Total Subsistence Allowance" + rec."Total Casuals Cost" + rec."Total Other Costs";
        SetControlAppearance;
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        Show: Boolean;
        TOR: BigText;
        Instr: InStream;
        PendindApproval: Boolean;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        ProjectTeam: Record "Project Members";
        Text001: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        Text002: label 'The Imprest Memo must be fully approved before printing';
        Text003: label 'You do no have rights to post Imprest memo surrender. Please Seek Assistance from Accounts';
        usersetup: Record "User Setup";
        Releasememo: Codeunit "Imprest Memo";
        pteam: Record "Project Members";
        impmemo: Record "Imprest Memo";
        exeplan: Record "Execution Plan";
        editTransport: Boolean;
        //safariteam: Page "Safari Team";
        TotalImprestAmount: Decimal;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //   OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(v: Record  temporary;);
        //   OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(rec:RecordId);
    end;
}



