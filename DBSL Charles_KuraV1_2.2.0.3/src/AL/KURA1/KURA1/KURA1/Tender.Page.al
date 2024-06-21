#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70036 "Tender"
{
    PageType = Card;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type" = const(Tender));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Title)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition No"; "Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan No"; "Procurement Plan No")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Type"; "Tender Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; "Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; "Procurement Method")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Supplier Category"; "Supplier Category")
                {
                    ApplicationArea = Basic;
                }
                field("Issued Date"; "Issued Date")
                {
                    ApplicationArea = Basic;
                }
                field("Validity Period"; "Validity Period")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Validate End Date"; "Tender Validate End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Tender Closing Date"; "Tender Closing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Opening Date"; "Tender Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Extended Date"; "Extended Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Status"; "Tender Status")
                {
                    ApplicationArea = Basic;
                }
                field("No of Tender Documents"; "No of Tender Documents")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Amount"; "Tender Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000019; "Procurement Request Lines")
            {
                SubPageLink = "Requisition No" = field(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Tender)
            {
                Caption = 'Tender';
                action("Mandatory Requirements")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mandatory Requirements';
                    Image = Setup;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Tender Mandatory Requirements";
                    RunPageLink = "Tender No" = field(No);
                }
                action("Technical Specifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Technical Specifications';
                    Image = setup;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Tender Specifications";
                    RunPageLink = "Requisition No" = field(No);
                }
                action("Close Tender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Close Tender';

                    trigger OnAction()
                    begin
                        Closed := true;
                        Modify;
                    end;
                }
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bidders';
                    Promoted = true;
                    PromotedCategory = Process;
                    // RunObject = Page Bidders;
                    // RunPageLink = "Ref No."=field(No);
                    Visible = false;
                }
                action("Tender Opening Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tender Opening Summary';
                    RunObject = Page "Tender Bidders Summary";
                    RunPageLink = "Ref No." = field(No);
                }
                action("<Page Supplier Selection>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier Selection';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Tender Supplier";
                    RunPageLink = "Reference No." = field(No);
                    RunPageView = sorting("Reference No.", "Supplier No");
                    Visible = false;
                }
                action("Cost Comparison Sheet")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Comparison Sheet';

                    trigger OnAction()
                    begin
                        TenderBids.Reset;
                        TenderBids.SetFilter(TenderBids."Requisition No", No);
                        Report.Run(70003, true, true, TenderBids);
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Document Attachment Details";
                    RunPageLink = "No." = field(No);
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        // RecRef.GETTABLE(Rec);
                        // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        // DocumentAttachmentDetails.RUNMODAL;
                    end;
                }
                action("<Send Approval Request>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        rfpevalrec: Record "RFQ Evaluation Lists";
                        filesrec2: Record "Document Attachment";
                        docrec: Record "Document Attachment";
                    begin
                        //TESTFIELD("Technical Score");
                        //TESTFIELD(Title);
                        //============================================================verify existance of preriquisites
                        /*rfpevalrec.RESET;
                        rfpevalrec.SETFILTER(rfpevalrec."RFP No.",No);
                        rfpevalrec.SETFILTER(rfpevalrec."Evaluation Type",'%1',rfpevalrec."Evaluation Type"::Mandatory);
                        IF NOT  rfpevalrec.FINDSET THEN BEGIN
                           ERROR('Please Fill the Mandatory Requirements!!!');
                        END;*/
                        /* rfpevalrec.RESET;
                         rfpevalrec.SETFILTER(rfpevalrec."RFP No.",No);
                         rfpevalrec.SETFILTER(rfpevalrec."Evaluation Type",'%1',rfpevalrec."Evaluation Type"::Technical);
                         IF NOT  rfpevalrec.FINDSET THEN BEGIN
                            ERROR('Please Fill the Technical Requirements!!!');
                         END;*/

                        filesrec2.Reset;
                        filesrec2.SetRange(filesrec2."No.", No);
                        if not filesrec2.FindFirst then begin
                            Message('This is Doc No %1 and this is tender %2', filesrec2."No.", No);
                            Error('Please Attach Documents for RFP %1', No);
                        end;
                        //=============================================================================================
                        //====================================================================================
                        reqlist.Reset;
                        reqlist.SetFilter(reqlist."No.", "Requisition No");
                        if reqlist.FindSet then begin
                            requser := reqlist."Requester ID";

                            Usersetuprec.Reset;
                            Usersetuprec.Get(requser);
                            useremail1 := Usersetuprec."E-Mail";

                            approvatemprec.Reset;
                            approvatemprec.SetFilter(approvatemprec."Document No.", '%1', "Requisition No");
                            approvatemprec.SetFilter(approvatemprec."Sequence No.", '%1', 2);
                            if approvatemprec.FindSet then begin
                                Approveruser := approvatemprec."Approver ID";

                                Usersetuprec.Reset;
                                Usersetuprec.Get(Approveruser);
                                useremail2 := Usersetuprec."E-Mail";

                                //====================================================================
                                smtprec.Reset;
                                smtprec.Get;

                                mailheader := 'RE: RFQ NO:  ' + No;
                                mailbody := 'Dear Sir/Madam<br><br>';
                                mailbody := mailbody + 'Please Find Attached RFQ Document(s) for your review.<br><br>Kindly submit any comments on the same within 24 hours.<br><br>';
                                mailbody := mailbody + 'If you do not submit any Comments within 24 hours the Procurement Process will Continue.<br<br>';
                                mailbody := mailbody + '<br><br><i>This E-mail is sent to you because you Approved or Raised the Requisition No: <b>' + reqlist."No." + '</b> Which formed the basis of creating this RFQ Document</i><br><br>';
                                mailbody := mailbody + 'Kind Regards<br><br>';

                                //  smtpcu.CreateMessage('RFQ Team',smtprec."User ID",useremail1,mailheader,mailbody,true);

                                //  docrec.Reset;
                                //  docrec.SetFilter(docrec."No.",No);
                                //  if docrec.FindSet then repeat
                                //    // smtpcu.AddAttachment(docrec.Export(true),'');
                                //  until docrec.Next=0;

                                //  smtpcu.AddCC(useremail2+';mwanaambai.jc@gmail.com');
                                //  smtpcu.Send();


                                //=====================================put on queue=================
                                /*schedulerec.RESET;
                                schedulerec.SETFILTER(schedulerec."Document No",No);
                                IF schedulerec.FINDSET THEN BEGIN
                                   schedulerec.DELETEALL;
                                END;
                                schedulerec.RESET;
                                schedulerec.INIT;
                                schedulerec."Document No":=No;
                                schedulerec.Date:=CALCDATE('1D',TODAY);
                                schedulerec.time:= TIME;
                                schedulerec.INSERT;*/

                                Message('Email sent & Job Queue Entries setup successfully...');
                                //====================================================================
                            end;
                        end;
                        //====================================================================================
                        // if ApprovalMgt.CheckProcApprovalPossible(Rec) then
                        //   ApprovalMgt.OnSendProcDocForApproval(Rec);

                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.CancelProcApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Process Type" := "process type"::Tender;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Process Type" := "process type"::Tender;
    end;

    var
        TenderBids: Record "Tender Bids";
        FileDirectory: Text[100];
        FileName: Text[500];
        ReportID: Integer;
        // "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer: Record Customer;
        Customer2: Record Customer;
        SupplierSelect: Record "Supplier Selection1";
        SupplierSelect2: Record "Supplier Selection1";
        Mail: Codeunit Mail;
        MailSent: Boolean;
        PrequalifiedSupRec: Record "Prequalified Suppliers1";
        Subject: Text[250];
        Body: Text[250];
        CCName: Text[30];
        //  ApprovalMgt: Codeunit "Approvals Mgmt.";
        CompInfo: Record "Company Information";
        Usersetuprec: Record "User Setup";
        approvatemprec: Record "Approval Entry";
        payablesetuprec: Record "Purchases & Payables Setup";
        reqlist: Record "Purchase Header";
        requser: Code[50];
        Approveruser: Code[50];
        smtpcu: Codeunit Mail;
        mailheader: Text;
        mailbody: Text;
        smtprec: Record "Email Account";
        useremail1: Text;
        useremail2: Text;
        schedulerec: Record "Job Queue Category";
        currentdatetime: DateTime;
}

