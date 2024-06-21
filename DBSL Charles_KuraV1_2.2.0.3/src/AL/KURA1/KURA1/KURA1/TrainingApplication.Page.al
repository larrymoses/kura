#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69283 "Training Application"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Show';
    SourceTable = "Training Requests";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                //             field("Course Title";"Course Title")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Start DateTime";"Start DateTime")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("End DateTime";"End DateTime")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //         }
                //     }
                //     area(factboxes)
                //     {
                //         part(Control1102755004;"Trainings Factbox")
                //         {
                //             SubPageLink = Code=field(Code);
                //         }
                //     }
                // }

                // actions
                // {
                //     area(navigation)
                //     {
                //         group("&Show")
                //         {
                //             Caption = '&Show';
                //             action(Comments)
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Comments';
                //                 Image = Comment;
                //                 Promoted = true;
                //                 PromotedCategory = Category5;

                //                 trigger OnAction()
                //                 var
                //                     DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                //                 begin
                //                     DocumentType:=Documenttype::"Training Application";

                //                     /*ApprovalComments.Setfilters(DATABASE::"HR Training Applications",DocumentType,Code);
                //                     ApprovalComments.SetUpLine(DATABASE::"HR Training Applications",DocumentType,Code);
                //                     ApprovalComments.RUN;*/

                //                 end;
                //             }
                //         }
                //         group("F&unctions")
                //         {
                //             Caption = 'F&unctions';
                //             action("&Approvals")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = '&Approvals';
                //                 Image = Approvals;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;

                //                 trigger OnAction()
                //                 var
                //                     DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                //                     ApprovalEntries: Page "Approval Entries";
                //                 begin
                //                     /*DocumentType:=DocumentType::"Training Application";
                //                     ApprovalEntries.Setfilters(DATABASE::"HR Training Applications",DocumentType,Code);
                //                     ApprovalEntries.RUN;*/

                //                 end;
                //             }
                //             action("&Send Approval &Request")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = '&Send Approval &Request';
                //                 Image = SendApprovalRequest;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;

                //                 trigger OnAction()
                //                 begin
                //                     /*TESTFIELDS;

                //                     IF ApprovalsMgmt.CheckTrainingAppApprovalsWorkflowEnabled(Rec) THEN
                //                       ApprovalsMgmt.OnSendTrainingAppForApproval(Rec);
                //                     */

                //                 end;
                //             }
                //             action("&Cancel Approval request")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = '&Cancel Approval request';
                //                 Image = Cancel;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;

                //                 trigger OnAction()
                //                 begin
                //                     if Confirm('Are you sure you want to cancel the approval request',true)=false then exit;
                //                     //ApprovalMgt.CancelTrainingAppApprovalReq(Rec,TRUE,TRUE);
                //                 end;
                //             }
                //             action("&Print")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = '&Print';
                //                 Image = PrintForm;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;

                //                 trigger OnAction()
                //                 begin
                //                     //TESTFIELD(Status,Status::Approved);

                //                     HRTrainingApplications.SetRange(HRTrainingApplications.Code,Code);
                //                     if HRTrainingApplications.Find('-') then
                //                     Report.Run(69122,true,true,HRTrainingApplications);
                //                 end;
                //             }
                //             action("<A ction1102755042>")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Re-Open';
                //                 Image = ReOpen;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;
                //                 Visible = false;

                //                 trigger OnAction()
                //                 begin
                //                     OpenDoc.ReleaseTrainingApp(Rec)
                //                 end;
                //             }
                //             action("Suggest Costs & Participants")
                //             {
                //                 ApplicationArea = Basic;
                //                 Image = Add;
                //                 Promoted = true;
                //                 PromotedCategory = Process;
                //                 PromotedIsBig = true;

                //                 trigger OnAction()
                //                 begin
                //                     SuggestCosts(Rec);
                //                 end;
                //             }
                //             action("Training Participants")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Training Participants';
                //                 Image = PersonInCharge;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;
                //                 RunObject = Page "Training App Participants List";
                //                 RunPageLink = "Training Code"=field(Code);
                //             }
                //             action(ImportParticipants)
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Import Participants';

                //                 trigger OnAction()
                //                 begin
                //                     Reset;
                //                     SetFilter(Code,Code);
                //                     Report.Run(69120,true,true,Rec);
                //                     Reset;
                //                 end;
                //             }
                //         }
                //         group("Imprest Management")
                //         {
                //             Caption = 'Imprest Management';
                //             action("Initiate an Imprest Request")
                //             {
                //                 ApplicationArea = Basic;
                //                 Image = Invoice;
                //                 Promoted = true;
                //                 PromotedCategory = Process;
                //                 PromotedIsBig = true;
                //                 Visible = false;

                //                 trigger OnAction()
                //                 begin
                //                     Rec.TestField("Imprest Created",false);
                //                     CreateImprest(Rec);
                //                 end;
                //             }
                //         }
                //         group("Fee Management")
                //         {
                //             Caption = 'Fee Management';
                //             action("Training Costs")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Training Costs';
                //                 Image = TaskList;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;
                //                 RunObject = Page "Training Cost";
                //                 RunPageLink = "Training ID"=field(Code);
                //             }
                //             action("Create Invoice")
                //             {
                //                 ApplicationArea = Basic;
                //                 Image = Invoice;
                //                 Promoted = true;
                //                 PromotedCategory = Process;
                //                 PromotedIsBig = true;
                //                 Visible = false;

                //                 trigger OnAction()
                //                 begin
                //                     CreateInvoice(Rec);
                //                 end;
                //             }
                //         }
                //         group(ActionGroup9)
                //         {
                //             action("Notify Procurement")
                //             {
                //                 ApplicationArea = Basic;
                //                 Image = Email;
                //                 Promoted = true;
                //                 PromotedCategory = Process;
                //                 Visible = false;

                //                 trigger OnAction()
                //                 begin
                //                     CreateNotification(Rec);
                //                 end;
                //             }
                //         }
                //     }
                // }

                // trigger OnAfterGetRecord()
                // begin
                //     /*
                //     IF "Budget Name"="Budget Name"::"0" THEN BEGIN
                //     "Responsibility CenterEditable" :=TRUE;
                //     "Application NoEditable" :=TRUE;
                //     "Employee No.Editable" :=TRUE;
                //     "Employee NameEditable" :=TRUE;
                //     "Employee DepartmentEditable" :=TRUE;
                //     "Purpose of TrainingEditable" :=TRUE;
                //     "Course TitleEditable" :=TRUE;
                //     END ELSE BEGIN
                //     "Responsibility CenterEditable" :=FALSE;
                //     "Application NoEditable" :=FALSE;
                //     "Employee No.Editable" :=FALSE;
                //     "Employee NameEditable" :=FALSE;
                //     "Employee DepartmentEditable" :=FALSE;
                //     "Purpose of TrainingEditable" :=FALSE;
                //     "Course TitleEditable" :=FALSE;
                //     END;
                //     */

                // end;

                // trigger OnInit()
                // begin
                //     "Course TitleEditable" := true;
                //     "Purpose of TrainingEditable" := true;
                //     "Employee DepartmentEditable" := true;
                //     "Employee NameEditable" := true;
                //     "Employee No.Editable" := true;
                //     "Application NoEditable" := true;
                //     "Responsibility CenterEditable" := true;
                // end;

                // var
                //     HREmp: Record Employee;
                //     EmpNames: Text[40];
                //     sDate: Date;
                //     HRTrainingApplications: Record "Training Requests";
                //   //  ApprovalMgt: Codeunit "Approvals Mgmt.";
                //     ApprovalComments: Page "Approval Comments";
                //     [InDataSet]
                //     "Responsibility CenterEditable": Boolean;
                //     [InDataSet]
                //     "Application NoEditable": Boolean;
                //     [InDataSet]
                //     "Employee No.Editable": Boolean;
                //     [InDataSet]
                //     "Employee NameEditable": Boolean;
                //     [InDataSet]
                //     "Employee DepartmentEditable": Boolean;
                //     [InDataSet]
                //     "Purpose of TrainingEditable": Boolean;
                //     [InDataSet]
                //     "Course TitleEditable": Boolean;
                //     HRTrainingNeed: Record "Advertisement Channels";
                //     //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                //     OpenDoc: Codeunit "Release Approval Document";
                //     NoSeriesManagement: Codeunit NoSeriesManagement;
                //     PurchasesPayablesSetup: Record "Purchases & Payables Setup";
                //     UserSetup: Record "User Setup";
                //     CashMgt: Record "Cash Management Setup";
                //     ImpNo: Code[30];
                //     NotificationManagement: Codeunit "Notification Management";
                //     FileLocation: Text;
                //     Email1: Text;
                //     Text001: label 'The training participants and costs have been added for the need %1';


                // procedure TESTFIELDS()
                // begin
                //     TestField("Course Title");
                //     TestField("Start DateTime");
                //     TestField("End DateTime");
                //     //TESTFIELD("Duration Units");
                //     TestField(Duration);
                //     TestField("Approved Cost");
                //     TestField(Location);
                //     TestField(Commitment);
                //     TestField("GL Account");
                // end;

                // local procedure CreateInvoice(TrainingRequest: Record "Training Requests")
                // var
                //     PurchaseHeader: Record "Purchase Header";
                //     PurchaseLine: Record "Purchase Line";
                //     Text001: label 'The Invoice No. %1,has been succesfully created';
                //     Text002: label 'The Invoice for application No %1,has already been created';
                //     Text003: label 'You do not have sufficient rights of Accounts User,consult the system administrator';
                //     TrainingCost: Record "Training Cost";
                // begin
                //     TestField(Status,Status::Approved);
                //     UserSetup.Reset;
                //     UserSetup.SetRange("User ID",UserId);
                //     if UserSetup.FindSet then begin
                //     if UserSetup."Accounts User"=true then begin
                //       PurchaseHeader.Reset;
                //       PurchaseHeader.SetRange("Applies-to Doc. No.",TrainingRequest.Code);
                //       if PurchaseHeader.FindSet then begin
                //        Error(Text002,TrainingRequest.Code);
                //        end else begin
                //        PurchaseHeader.Init;
                //        PurchasesPayablesSetup.Get;
                //        PurchasesPayablesSetup.TestField("Invoice Nos.");
                //        NoSeriesManagement.InitSeries(PurchasesPayablesSetup."Invoice Nos.",PurchaseHeader."No. Series",0D,PurchaseHeader."No.",PurchaseHeader."No. Series");
                //        PurchaseHeader."Document Type":=PurchaseHeader."document type"::Invoice;
                //        PurchaseHeader."Buy-from Vendor No.":=TrainingRequest.Provider;
                //        PurchaseHeader.Validate("Buy-from Vendor No.");
                //        PurchaseHeader."Document Date":=Today;
                //        PurchaseHeader."Order Date":=Today;
                //       // PurchaseHeader."Responsibility Center":=TrainingRequest."Responsibility Center";
                //        PurchaseHeader.Validate("Responsibility Center");
                //        PurchaseHeader."Applies-to Doc. No.":=TrainingRequest.Code;
                //        PurchaseHeader."Posting Description":=TrainingRequest.Description;
                //        PurchaseHeader.Insert;
                //        //Insert lines
                //        TrainingCost.Reset;
                //        TrainingCost.SetRange("Training ID",TrainingRequest.Code);
                //        TrainingCost.SetRange(Procurable,true);
                //        if TrainingCost.FindSet then begin
                //          repeat
                //               PurchaseLine.Init;
                //               PurchaseLine."Line No.":=PurchaseLine."Line No."+100;
                //               PurchaseLine."Document No.":=PurchaseHeader."No.";
                //               PurchaseLine."Document Type":=PurchaseHeader."document type"::Invoice;
                //               PurchaseLine.Type:=PurchaseLine.Type::"G/L Account";
                //               PurchaseLine."No.":=TrainingCost."G/L Account";
                //               PurchaseLine.Description:=TrainingCost."Cost Item";
                //               PurchaseLine."Direct Unit Cost":=TrainingCost."Unit Cost (LCY)";
                //               PurchaseLine.Quantity:=TrainingCost.Quantity;
                //               PurchaseLine.Validate(Quantity);
                //               PurchaseLine.Insert;
                //           until TrainingCost.Next=0;
                //         end;

                //        Message(Text001,PurchaseHeader."No.");
                //        Page.Run(51,PurchaseHeader,PurchaseHeader."No.");
                //       end;
                //       end
                //       else
                //       Error(Text003);
                //     end
                // end;

                // local procedure CreateImprest(TrainingRequest: Record "Training Requests")
                // var
                //     ImprestReq: Record payments;
                //     ImprestLines: Record "Imprest Lines";
                //     TrainingPart: Record "Training Participants";
                //     Text001: label 'The Imprest Requisitions have been created succesfully';
                //     Text002: label 'There are no participants added';
                //     UserSetup: Record "User Setup";
                //     Email: Text;
                //     Body: Text;
                //   //  SMTP: Codeunit Mail;
                //     Email2: Text[250];
                //     CompInfo: Record "Company Information";
                //     EmailHOD: Text;
                //     ImprestOther: Decimal;
                //     CashMgt: Record "Cash Management Setup";
                //    // SMTPT: Record "Email Account";
                // begin
                //     ImprestReq.Reset;
                //     ImprestReq.SetRange("Imprest Memo No",TrainingRequest.Code);
                //     if ImprestReq.FindSet then begin
                //       Error('');
                //       end
                //     else begin
                //       TrainingPart.Reset;
                //       TrainingPart.SetRange("Training Code",TrainingRequest.Code);
                //        if TrainingPart.FindSet then begin
                //           repeat
                //          ImpNo:='';
                //         //create individual imprests
                //              ImprestReq.Init;
                //              CashMgt.Get;
                //              CashMgt.TestField("Imprest Nos");
                //             NoSeriesManagement.InitSeries(CashMgt."Imprest Nos",CashMgt."Imprest Nos",0D,ImpNo,CashMgt."Imprest Nos");
                //              ImprestReq."No.":=ImpNo;
                //               ImprestReq."Document Type":=ImprestReq."document type"::Imprest;
                //              ImprestReq."Payment Type":=ImprestReq."payment type"::Imprest;

                //             ImprestReq."Destination Name":=TrainingRequest.Location;
                //             ImprestReq.Date:=Today;
                //             ImprestReq."Travel Date":=TrainingRequest."Actual Start Date";
                //             ImprestReq."Account Type":=ImprestReq."account type"::Employee;
                //             ImprestReq."Account No.":=TrainingPart."Employee Code";
                //             ImprestReq.Validate("Account No.");
                //             ImprestReq."Reference No.":=TrainingPart."Training Code";
                //             ImprestReq."Shortcut Dimension 1 Code":=TrainingPart."Global Dimension 1 Code";
                //             ImprestReq."Shortcut Dimension 2 Code":=TrainingPart."Global Dimension 2 Code";
                //             ImprestReq."Payment Narration":=TrainingRequest.Description;
                //             UserSetup.Reset;
                //             UserSetup.SetRange("Employee No.",ImprestReq."Account No.");
                //             if UserSetup.FindSet then begin
                //               ImprestReq."Created By":=UserSetup."User ID";
                //             end;
                //             ImprestReq.Insert;
                //             ImprestLines.Init;
                //             ImprestLines.No:=ImprestReq."No.";
                //             ImprestLines."Account Type":=ImprestLines."account type"::"G/L Account";
                //             ImprestLines."Account No.":=TrainingPart."G/l Account";
                //             ImprestLines.Validate("Account No.");
                //             ImprestLines.Description:=TrainingRequest.Description;
                //             ImprestLines."Daily Rate":=TrainingPart."Unit Amount";
                //             ImprestLines."No. of Days":=TrainingPart."No. of Days";
                //             ImprestLines.Amount:=TrainingPart."Total Amount";
                //             ImprestLines.Insert;
                //             //insert lines

                //         until TrainingPart.Next=0;
                //         Message(Text001);
                //         UserSetup.Reset;
                //         UserSetup.SetRange("Employee No.",TrainingPart."Employee Code");
                //         if UserSetup.FindSet then
                //          Email:=UserSetup."E-Mail";

                //             //send notification email
                //              SMTPT.Get;
                //             // Email2:=SMTPT."Email Sender Address";
                //                 Body:='IMPREST REQUISITION FOR'+TrainingRequest.Description;
                //                 SMTP.CreateMessage('IMPREST REQUISITION',Email2,
                //                 Email,'Training  '+'No: '+TrainingRequest.Code,
                //                 'Dear '+UserSetup."Employee Name"+',<BR><BR>'+'This is to bring to your attention regarding the creation of an imprest relating to the training'+
                //                 ' '+TrainingRequest.Description+' '+'</b> kindly login to'
                //                 ,true);

                //             //    SMTP.AddBCC(Email2);
                //             //                SMTP.AddBodyline('<BR><BR>Kind Regards,'+'<BR><BR>'+UserId+'<BR>'+'<BR>');
                //             //     SMTP.Send();

                //         TrainingRequest."Imprest Created":=true;
                //         TrainingRequest.Modify(true);
                //         end else
                //         Message(Text002);



                //     end
                // end;

                // local procedure CreateNotification(TrainingRequest: Record "Training Requests")
                // var
                //     UserSetup: Record "User Setup";
                //     Email: Text;
                //     Body: Text;
                //     SMTP: Codeunit Mail;
                //     Email2: Text[250];
                //     CompInfo: Record "Company Information";
                //     EmailHOD: Text;
                //     ImprestOther: Decimal;
                //     CashMgt: Record "Cash Management Setup";
                //     SMTPT: Record "Email Account";
                // begin
                //         UserSetup.Reset;
                //         UserSetup.SetRange("Procurement Manager",true);
                //         if UserSetup.FindSet then
                //          Email:=UserSetup."E-Mail";

                //             // //send notification email
                //             // // SMTPT.Get;
                //             // // Email2:=SMTPT."Email Sender Address";
                //             //     Body:='PROCUREMENT OF ITEMS RELATING TO'+TrainingRequest.Description;
                //             //     SMTP.CreateMessage('PROCUREMENT REQUEST',Email2,
                //             //     Email,'Training  '+'No: '+TrainingRequest.Code,
                //             //     'Dear '+UserSetup."Employee Name"+',<BR><BR>'+'This is to bring to your attention regarding the procurement of items relating to the training'+
                //             //     ' '+TrainingRequest.Description+' '+'</b> dated from<b>'+ Format(TrainingRequest."Start DateTime")+' ' + '</b> to<b>'+' '
                //             //     ,true);

                //             //    SMTP.AddBCC(Email2);
                //             //    FileLocation :='E:\ERPDocuments\'+TrainingRequest.Code+'.pdf';
                //             //     Report.SaveAsPdf(69122,FileLocation,TrainingRequest);
                //             //    SMTP.AddAttachment(FileLocation,FileLocation);
                //             //     SMTP.AddBodyline('<BR><BR>Kind Regards,'+'<BR><BR>'+TrainingRequest."Employee Name"+'<BR>'+'<BR>');
                //             //     SMTP.Send();


                // end;

                // local procedure SuggestCosts(TrainingNeed: Record "Training Requests")
                // var
                //     TrainingCost: Record "Training Cost";
                //     TrainingCosts: Record "Training Cost";
                // begin
                //     TrainingCost.Reset;
                //     TrainingCost.SetRange("Training ID",TrainingNeed."Course Title");
                //     if TrainingCost.FindSet then begin
                //       repeat
                //       TrainingCosts.Init;
                //       TrainingCosts."Training ID":=TrainingNeed.Code;
                //       TrainingCosts."Cost Item":=TrainingCost."Cost Item";
                //       TrainingCosts.Procurable:=TrainingCost.Procurable;
                //       TrainingCosts."Service/Item Code":=TrainingCost."Service/Item Code";
                //       TrainingCosts.Quantity:=TrainingCost.Quantity;
                //       TrainingCosts."Unit Cost (LCY)":=TrainingCost."Unit Cost (LCY)";
                //       TrainingCosts."Line Amount":=TrainingCost."Line Amount";
                //       TrainingCosts.Insert;
                //       until TrainingCost.Next=0;
                //       SuggestParticipants(TrainingNeed);
                //     end;
                // end;

                // local procedure SuggestParticipants(TrainingNeed: Record "Training Requests")
                // var
                //     TrainingParticipants: Record "Training Participants";
                //     TrainingParticipant: Record "Training Participants";
                // begin
                //     TrainingParticipant.Reset;
                //     TrainingParticipant.SetRange("Training Code",TrainingNeed."Course Title");
                //     if TrainingParticipant.FindSet then begin
                //       repeat
                //         TrainingParticipants.Init;
                //         TrainingParticipants."Training Code":=TrainingNeed.Code;
                //         TrainingParticipants."Employee Code":=TrainingParticipant."Employee Code";
                //         TrainingParticipants.Validate("Employee Code");
                //         TrainingParticipants.Insert;

                //     until TrainingParticipant.Next=0;
                //     Message(Text001,TrainingNeed.Status);
                //     end
                // end;
            }

        }
    }
}