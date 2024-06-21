#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52022 "Project Funding Contract Form"
{
    PageType = Card;
    SourceTable = "Project Contract Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Project Contract No"; "Project Contract No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                // field("Total Planned Fundings";"Total Planned Fundings")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Start Date"; "Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date"; "Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Funding Sponsor ID"; "Primary Funding Sponsor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Sponsor Name"; "Primary Sponsor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Status"; "Contract Status")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control21; "Project Funding Lines")
            {
            }
        }
        area(factboxes)
        {
            systempart(Control17; Outlook)
            {
            }
            systempart(Control18; Notes)
            {
            }
            systempart(Control19; MyNotes)
            {
            }
            systempart(Control20; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Feasibility Study")
            {
                Caption = 'Feasibility Study';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No. Series");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        /*
                        ShowDocDim;
                        CurrPage.SAVERECORD;
                        */

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
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        /*
                        ApprovalEntries.Setfilters(DATABASE::Payments,8,"No.");
                        ApprovalEntries.RUN;
                        */

                    end;
                }
            }
        }
        area(processing)
        {
            group(PFC)
            {
                Caption = 'PFC';
                Image = "Order";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        /*
                        //TESTFIELD("Funding Source");
                        TESTFIELD(Status,Status::Open);//status must be open.
                        TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        TESTFIELD(Job);
                        TESTFIELD("Job Task No");
                        IF ("Advance Recovery"<>0) AND ("Account No."='')THEN
                        BEGIN
                          ERROR(text0001);
                        END;
                        TESTFIELD("Payment Narration");
                        TESTFIELD(Payee);
                        TESTFIELD(Date);
                        pvheader.RESET;
                        pvheader.SETRANGE(pvheader."No.","No.");
                        IF pvheader.FIND('-') THEN
                          BEGIN
                            pvLines.RESET;
                            pvLines.SETRANGE(pvLines.No,pvheader."No.");
                            IF pvLines.FIND('-') THEN
                        
                              BEGIN
                                REPEAT
                                  pvLines.TESTFIELD(pvLines."Applies to Doc. No");
                                  UNTIL pvLines.NEXT=0;
                                END;
                        
                            END;
                        
                        
                        IF ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) THEN
                          ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
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

                    trigger OnAction()
                    begin
                        /*
                        TESTFIELD(Status,Status::"Pending Approval");//status must be open.
                        TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                        */

                    end;
                }
                separator(Action36)
                {
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);

                        /*
                        SETRANGE("No.","No.");
                        REPORT.RUN(57000,TRUE,TRUE,Rec)
                        */

                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        /*
                        usersetup.GET(USERID);
                        usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
                        ReopenPV.PerformManualReopen(Rec);
                        */

                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        /*
                        usersetup.GET(USERID);
                        usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
                        TESTFIELD("Reasons to Reopen");
                        ReopenPV.PerformManualReopen(Rec);
                        */

                    end;
                }
                separator(Action30)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        //PaymentsPost."Post Payment Voucher"(Rec);
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
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
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

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
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

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
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

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    // trigger OnAction()
                    // var
                    //     DocumentAttachmentDetails: Page "Document Attachment Details";
                    //     RecRef: RecordRef;
                    // begin
                    //     RecRef.GetTable(Rec);
                    //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    //     DocumentAttachmentDetails.RunModal;
                    // end;
                }
            }
        }
    }
}

