#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69284 "Closed Training Application"
{
    // DeleteAllowed = false;
    // InsertAllowed = false;
    // PageType = Card;
    // PromotedActionCategories = 'New,Process,Reports,Functions,Show';
    // SourceTable = "Training Requests";

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             Caption = 'General';
    //             Editable = false;
    //             field("Code";Code)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Training Plan No.";"Training Plan No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Course Title";"Course Title")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Description;Description)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = true;
    //             }
    //             field("Start DateTime";"Start DateTime")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("End DateTime";"End DateTime")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Duration;Duration)
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field(Cost;Cost)
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field(Location;Location)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Training Venue';
    //             }
    //             field(Provider;Provider)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = true;
    //             }
    //             field("Provider Name";"Provider Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Training Type";"Training Type")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //                 Visible = false;
    //             }
    //             field("Training Duration Hrs";"Training Duration Hrs")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Planned Budget";"Planned Budget")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Planned No. to be Trained";"Planned No. to be Trained")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("No. of Participants";"No. of Participants")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Created By";"Created By")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Created On";"Created On")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field(Status;Status)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = true;
    //             }
    //         }
    //         part(Control11;"Attendance Register")
    //         {
    //             Caption = 'Attendance Register';
    //             SubPageLink = "Training Application No."=field(Code);
    //         }
    //         part(Control9;"Training Feedback Suggestions")
    //         {
    //             SubPageLink = "Training Application No"=field(Code);
    //         }
    //         group(Evaluation)
    //         {
    //             field("Evaluation Summary";ObjText)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Evaluation Summary';
    //                 MultiLine = true;
    //                 Width = 200;

    //                 trigger OnValidate()
    //                 begin
    //                     CalcFields("Evaluation Summary");
    //                     "Evaluation Summary".CreateInstream(ObjInstr);
    //                     Obj.Read(ObjInstr);

    //                     if ObjText<>Format(Obj) then
    //                     begin
    //                      Clear("Evaluation Summary");
    //                      Clear(Obj);
    //                      Obj.AddText(ObjText);
    //                      "Evaluation Summary".CreateOutstream(ObjOutStr);
    //                      Obj.Write(ObjOutStr);
    //                      //MODIFY;
    //                     end;
    //                 end;
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
    //             action("Import Attendance Register")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Add;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;

    //                 trigger OnAction()
    //                 begin
    //                     SetRange(Code,Code);
    //                     AttendanceRegister.GetVariables(Rec);
    //                     AttendanceRegister.Run;
    //                 end;
    //             }
    //             action("Trainers Involved")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = ApplyEntries;
    //                 Promoted = true;
    //                 PromotedIsBig = true;
    //                 RunObject = Page "Trainers Involved";
    //                 RunPageLink = "Training Application No"=field(Code);
    //             }
    //         }
    //         group("Report")
    //         {
    //             Caption = 'Report';
    //             action("Post Training Report")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = "Report";
    //                 Promoted = true;
    //                 PromotedIsBig = true;

    //                 trigger OnAction()
    //                 begin
    //                     SetRange(Code,Code);
    //                     Report.Run(69133,true,false,Rec);
    //                 end;
    //             }
    //         }
    //     }
    // }

    // trigger OnAfterGetRecord()
    // begin
    //      CalcFields("Evaluation Summary");
    //     "Evaluation Summary".CreateInstream(ObjInstr);
    //     Obj.Read(ObjInstr);
    //     ObjText:=Format(Obj);
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
    //     ApprovalMgt: Codeunit "Approvals Mgmt.";
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
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     OpenDoc: Codeunit "Release Approval Document";
    //     NoSeriesManagement: Codeunit NoSeriesManagement;
    //     PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    //     UserSetup: Record "User Setup";
    //     CashMgt: Record "Cash Management Setup";
    //     ImpNo: Code[30];
    //     NotificationManagement: Codeunit "Notification Management";
    //     FileLocation: Text;
    //     Email1: Text;
    //     EvaluationSummary: Text;
    //     Obj: BigText;
    //     ObjInstr: InStream;
    //     ObjOutStr: OutStream;
    //     ObjText: Text;
    //     AttendanceRegister: XmlPort "Attendance Register";


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

    // local procedure CreatePurchaseReq(TrainingRequest: Record "Training Requests")
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
    //        PurchasesPayablesSetup.TestField("Purchase Requisition Nos.");
    //        NoSeriesManagement.InitSeries(PurchasesPayablesSetup."Purchase Requisition Nos.",PurchaseHeader."No. Series",0D,PurchaseHeader."No.",PurchaseHeader."No. Series");
    //        PurchaseHeader."Document Type":=PurchaseHeader."document type"::"Purchase Requisition";
    //        PurchaseHeader."Requester ID":=UserId;
    //        PurchaseHeader."Request-By No.":=UserSetup."Employee No.";
    //        PurchaseHeader."Document Date":=Today;
    //        PurchaseHeader."Buy-from Vendor No.":=TrainingRequest.Provider;
    //        PurchaseHeader.Validate("Request-By No.");
    //           PurchaseHeader."Applies-to Doc. No.":=TrainingRequest.Code;
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
    //               PurchaseLine."Document Type":=PurchaseHeader."document type"::"Purchase Requisition";
    //               PurchaseLine.Type:=TrainingCost."Account Type";
    //               PurchaseLine."No.":=TrainingCost."G/L Account";
    //               PurchaseLine.Description:=TrainingCost."Cost Item";
    //               PurchaseLine."Direct Unit Cost":=TrainingCost."Unit Cost (LCY)";
    //               PurchaseLine.Quantity:=TrainingCost.Quantity;
    //               PurchaseLine.Validate(Quantity);
    //               PurchaseLine.Insert;
    //           until TrainingCost.Next=0;
    //         end;

    //        Message(Text001,PurchaseHeader."No.");
    //        Page.Run(70059,PurchaseHeader,PurchaseHeader."No.");
    //       end;
    //       end
    //       else
    //       Error(Text003);
    //     end
    // end;

    // local procedure CreateMemo(TrainingRequest: Record "Training Requests")
    // var
    //     ImprestReq: Record "Imprest Memo";
    //     ImprestLines: Record "Imprest Lines";
    //     TrainingPart: Record "Training Participants";
    //     Text001: label 'The Imprest Requisitions have been created succesfully';
    //     Text002: label 'There are no participants added';
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
    //     ProjectMembers: Record "Project Members";
    // begin
    //     ImprestReq.Reset;
    //     ImprestReq.SetRange("Imprest No.",TrainingRequest.Code);
    //     if ImprestReq.FindSet then begin
    //       Error('');
    //       end

    //     else begin
    //          ImpNo:='';
    //         //create individual imprests
    //               ImprestReq.Init;
    //               CashMgt.Get;
    //               CashMgt.TestField("Imprest Memo Nos");
    //               NoSeriesManagement.InitSeries(CashMgt."Imprest Memo Nos",CashMgt."Imprest Memo Nos",0D,ImpNo,CashMgt."Imprest Memo Nos");
    //               ImprestReq."No.":=ImpNo;
    //               ImprestReq."Document Type":=ImprestReq."document type"::"Imprest Memo";
    //               ImprestReq."Imprest No.":=ImprestReq."No.";
    //               ImprestReq."User ID":=UserId;
    //               UserSetup.Reset;
    //               UserSetup.SetRange("User ID",UserId);
    //               if UserSetup.FindSet then begin
    //                 ImprestReq.Requestor:=UserSetup."Employee No.";
    //               end;
    //               ImprestReq.Validate(Requestor);
    //               ImprestReq.Date:=Today;
    //               ImprestReq."Start Date":=TrainingRequest."Actual Start Date";
    //               ImprestReq."Global Dimension 1 Code":=TrainingPart."Global Dimension 1 Code";
    //               ImprestReq."Global Dimension 2 Code":=TrainingPart."Global Dimension 2 Code";
    //               ImprestReq.Subject:=TrainingRequest.Description;
    //               ImprestReq.Insert;

    //             //Team Members
    //                 TrainingPart.Reset;
    //                 TrainingPart.SetRange("Training Code",TrainingRequest.Code);
    //                 if TrainingPart.FindSet then begin
    //                 repeat
    //                       ProjectMembers.Init;
    //                       ProjectMembers."Imprest Memo No.":=ImprestReq."No.";
    //                       ProjectMembers."Work Type":=TrainingPart.Destination;
    //                       ProjectMembers."Vote Item":=TrainingPart.Type;
    //                       ProjectMembers."No.":=TrainingPart."Employee Code";
    //                       ProjectMembers.Validate("No.");
    //                       ProjectMembers."Time Period":=TrainingPart."No. of Days";
    //                       ProjectMembers.Validate("Work Type");
    //                       ProjectMembers.Validate("Time Period");
    //                       ProjectMembers.Insert;
    //                 //notify every employee
    //                         UserSetup.Reset;
    //                         UserSetup.SetRange("Employee No.",TrainingPart."Employee Code");
    //                         if UserSetup.FindSet then begin
    //                             Email:=UserSetup."E-Mail";
    //                             //send notification email
    //                             SMTPT.Get;
    //                             Email2:=SMTPT."Email Sender Address";
    //                             Body:='IMPREST MEMO FOR'+TrainingRequest.Description;
    //                             SMTP.CreateMessage('IMPREST MEMO',Email2,
    //                             Email,'Training  '+'No: '+TrainingRequest.Code,
    //                             'Dear '+UserSetup."Employee Name"+',<BR><BR>'+'This is to bring to your attention regarding the creation of an imprest memo relating to the training'+
    //                             ' '+TrainingRequest.Description+' '+'</b> kindly login to'
    //                             ,true);

    //                             SMTP.AddBCC(Email2);
    //                             SMTP.AddBodyline('<BR><BR>Kind Regards,'+'<BR><BR>'+UserId+'<BR>'+'<BR>');
    //                             SMTP.Send();
    //                           end;
    //                       until TrainingPart.Next=0;
    //                   Message(Text001);

    //         TrainingRequest."Imprest Created":=true;
    //         TrainingRequest."Memo No.":=ImprestReq."No.";
    //         TrainingRequest.Modify(true);
    //         Page.Run(57033,ImprestReq,ImprestReq."No.");
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

    //             //send notification email
    //              SMTPT.Get;
    //              Email2:=SMTPT."Email Sender Address";
    //                 Body:='PROCUREMENT OF ITEMS RELATING TO'+TrainingRequest.Description;
    //                 SMTP.CreateMessage('PROCUREMENT REQUEST',Email2,
    //                 Email,'Training  '+'No: '+TrainingRequest.Code,
    //                 'Dear '+UserSetup."Employee Name"+',<BR><BR>'+'This is to bring to your attention regarding the procurement of items relating to the training'+
    //                 ' '+TrainingRequest.Description+' '+'</b> dated from<b>'+ Format(TrainingRequest."Start DateTime")+' ' + '</b> to<b>'+' '
    //                 ,true);

    //                SMTP.AddBCC(Email2);
    //                FileLocation :='E:\ERPDocuments\'+TrainingRequest.Code+'.pdf';
    //                 Report.SaveAsPdf(69122,FileLocation,TrainingRequest);
    //                SMTP.AddAttachment(FileLocation,FileLocation);
    //                 SMTP.AddBodyline('<BR><BR>Kind Regards,'+'<BR><BR>'+TrainingRequest."Employee Name"+'<BR>'+'<BR>');
    //                 SMTP.Send();


    // end;
}

