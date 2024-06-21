#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72512 "New Project Creation Voucher"
{
    // Caption = 'New Project Initiation Card';
    // DeleteAllowed = false;
    // PageType = Card;
    // SourceTable = "Road Work Program";

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             field("Code";Code)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Voucher No';
    //                 Editable = false;
    //             }
    //             field("Document Date";"Document Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Region ID";"Region ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Financial Year Code";"Financial Year Code")
    //             {
    //                 ApplicationArea = Basic;

    //                 trigger OnValidate()
    //                 begin
    //                     if "Document Type"<>"document type"::"New Job Voucher" then
    //                     Description:='Annual Maintenance Budget Ceilings Year: '+"Financial Year Code";
    //                 end;
    //             }
    //             field("Financial Budget ID";"Financial Budget ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Procurement Plan ID";"Procurement Plan ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field(Description;Description)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Funding Source ID";"Funding Source ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Funding Agency ID";"Funding Agency ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Global Dimension 1 Code";"Global Dimension 1 Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Contract ID";"Contract ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Contractor No";"Contractor No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Contractor Name";"Contractor Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Start Date";"Start Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Project Start Date';
    //             }
    //             field("End Date";"End Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Project End Date';
    //             }
    //             field("Type of Project";"Type of Project")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Approval Status";"Approval Status")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field(Posted;Posted)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Created By";"Created By")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Created Date";"Created Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Created Time";"Created Time")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //         }
    //         part("New Project Creation Lines";"New Project Creation Lines")
    //         {
    //             Caption = 'Packages';
    //             SubPageLink = "Road Work Program ID"=field(Code);
    //             ToolTip = 'Packages';
    //         }
    //         group("Project Details")
    //         {
    //             Caption = 'Project Details';
    //             field("Contractor Advance Account ID";"Contractor Advance Account ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Directorate Code";"Directorate Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Department Code";"Department Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Road Project Category";"Road Project Category")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Road Works Category";"Road Works Category")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Road Planner No";"Road Planner No")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Project Engineer ID';
    //             }
    //             field("Road Planner Name";"Road Planner Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Project Engineer Name';
    //             }
    //             field("Job Posting Group";"Job Posting Group")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //     }
    // }

    // actions
    // {
    //     area(navigation)
    //     {
    //         action("Suggest Lines")
    //         {
    //             ApplicationArea = Basic;
    //             Image = Suggest;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;
    //             Visible = false;

    //             trigger OnAction()
    //             begin
    //                 RoadPackage.Reset;
    //                 RoadPackage.SetRange(RoadPackage."Road Work Program ID",Code);
    //                 if RoadPackage.FindSet then
    //                 RoadPackage.DeleteAll;

    //                 NewRoadWorkProgramPackage.Reset;
    //                 NewRoadWorkProgramPackage.SetRange(NewRoadWorkProgramPackage."Road Work Program ID",Rec."Gloabal Budget Book ID");
    //                 //NewRoadWorkProgramPackage.SETRANGE(NewRoadWorkProgramPackage."Region ID","Region ID");
    //                 if  NewRoadWorkProgramPackage.FindSet then begin
    //                   repeat
    //                    RoadPackage.Init;
    //                    RoadPackage."Road Work Program ID":=Code;
    //                    RoadPackage."Budget Entry No":=NewRoadWorkProgramPackage."Package No.";
    //                    RoadPackage."Package Name":=NewRoadWorkProgramPackage."Package Name";
    //                    RoadPackage."Road Code":=NewRoadWorkProgramPackage."Road Code";
    //                    RoadPackage.Validate("Road Code");
    //                    RoadPackage."Road Section No.":=NewRoadWorkProgramPackage."Road Section No.";
    //                    RoadPackage.Validate("Road Section No.");
    //                    RoadPackage."Road Works Category":=NewRoadWorkProgramPackage."Road Works Category";
    //                    RoadPackage."Pavement Surface Type":=NewRoadWorkProgramPackage."Pavement Surface Type";
    //                    RoadPackage."Funding Source ID":=NewRoadWorkProgramPackage."Funding Source ID";
    //                    RoadPackage.Validate("Funding Source ID");
    //                    RoadPackage."Total Budget Cost":=NewRoadWorkProgramPackage."Total Budget Cost";
    //                    RoadPackage."Region ID":=NewRoadWorkProgramPackage."Region ID";
    //                    RoadPackage."Entry No":=RoadPackage.Count+1;
    //                    RoadPackage.Validate("Region ID");
    //                    RoadPackage."BoQ Template Code":=NewRoadWorkProgramPackage."BoQ Template Code";
    //                    RoadPackage."VAT Bus. Posting Group":="VAT Bus. Posting Group";
    //                    RoadPackage.Validate("VAT Bus. Posting Group");
    //                    RoadPackage."VAT Prod. Posting Group":="VAT Prod. Posting Group";
    //                    RoadPackage.Validate("VAT Prod. Posting Group");
    //                    if not RoadPackage.Get(RoadPackage."Road Work Program ID",RoadPackage."Budget Entry No",RoadPackage."Entry No") then
    //                    RoadPackage.Insert(true);
    //                   until NewRoadWorkProgramPackage.Next=0;
    //                   Message('Lines Suggested Successfully');
    //                   end;
    //             end;
    //         }
    //         action("Suggest Bil Items From Template")
    //         {
    //             ApplicationArea = Basic;
    //             Image = SuggestBatch;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;

    //             trigger OnAction()
    //             begin
    //                 RMS.FnCreateRWProgramTasksFromBOQTemplate(RoadWorkPlanPackage,Job,NewRoadWorkProgramTask,Rec);
    //                 RMS.FnCreateRWPPlanningLinesFromBOQTemplates(RoadWorkPlanPackage,Job,NewRoadWorkProgramActivity,Rec);
    //                 Message('Bill Items inserted successfully');
    //             end;
    //         }
    //         action("Import Bill Categories")
    //         {
    //             ApplicationArea = Basic;
    //             Ellipsis = true;
    //             Image = Import;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;
    //             RunObject = XMLport "Import Bill Categories";
    //         }
    //         action("Import Bill Items")
    //         {
    //             ApplicationArea = Basic;
    //             Ellipsis = true;
    //             Image = Import;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;
    //             RunObject = XMLport "Import Bill Items";
    //         }
    //         action(Approvals)
    //         {
    //             ApplicationArea = Basic;
    //             Ellipsis = true;
    //             Image = Approvals;
    //             Promoted = true;
    //             PromotedCategory = Category4;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;

    //             trigger OnAction()
    //             begin
    //                 ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
    //             end;
    //         }
    //         action(Print)
    //         {
    //             ApplicationArea = Basic;
    //             Ellipsis = true;
    //             Image = Print;
    //             Promoted = true;
    //             PromotedCategory = Category5;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;

    //             trigger OnAction()
    //             begin
    //                 Reset;
    //                 SetRange(Code,Code);
    //                 if FindSet then
    //                 Report.Run(72042,true,false,Rec);
    //             end;
    //         }
    //         action(Post)
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Create Project';
    //             Image = Post;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;

    //             trigger OnAction()
    //             begin
    //                 TestField("Approval Status","approval status"::Released);
    //                 TestField(Posted,false);
    //                 TestField("Contractor Advance Account ID");
    //                 TestField("Job Posting Group");
    //                 RMS.FnCreateJobsFromWorkPlanLines(RoadWorkPlanPackage,Job,Rec);
    //                 Posted:=true;
    //                 Modify;
    //                 Message('The document %1 has been posted successfully',Code);
    //             end;
    //         }
    //         action("Send Approval Request")
    //         {
    //             ApplicationArea = Basic;
    //             Ellipsis = true;
    //             Image = SendApprovalRequest;
    //             Promoted = true;
    //             PromotedCategory = Category4;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;

    //             trigger OnAction()
    //             begin
    //                 /*TESTFIELD("Approval Status","Approval Status"::Open);
    //                 RecVariant:=Rec;
    //                 RMSManagement.FnPopulateApprovalEntryCustomeWorkflow(RecVariant,Job,DocumentType::"Work Execution Plan","Project ID",ApprovalEntry."Document Type"::PCO,0,RECORDID,FnGetTableNo());
    //                 "Approval Status":="Approval Status"::"Pending Approval";
    //                 MODIFY(TRUE);
    //                 EmailNotifications.FnSendApprovalsMailCustom(CustomApprovalEntry,"Project ID");
    //                 MESSAGE(TXT0001);*/

    //             end;
    //         }
    //         action("Cancel Approval Request")
    //         {
    //             ApplicationArea = Basic;
    //             Ellipsis = true;
    //             Image = CancelApprovalRequest;
    //             Promoted = true;
    //             PromotedCategory = Category4;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;

    //             trigger OnAction()
    //             var
    //                 RecRef: RecordRef;
    //                 CustomApprovalEntry: Record "Custom Approval Entry";
    //                 OldStatus: Option;
    //             begin
    //                 /*TESTFIELD(Status,Status::"Pending Approval");
    //                 TESTFIELD("Created By",USERID);

    //                 CustomApprovalEntry.RESET;
    //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Document No.","Project ID");
    //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Record ID to Approve",RECORDID);
    //                 CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
    //                 IF CustomApprovalEntry.FINDSET THEN
    //                   REPEAT
    //                     OldStatus := ApprovalEntry.Status;
    //                     CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Canceled;
    //                     CustomApprovalEntry.MODIFY(TRUE);
    //                    UNTIL CustomApprovalEntry.NEXT=0;

    //                 //Notify The User
    //                 EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
    //                 Status:=Status::Open;
    //                 MODIFY(TRUE);

    //                 MESSAGE(TXT0002);*/

    //             end;
    //         }
    //         action("Project Approvals")
    //         {
    //             ApplicationArea = Basic;
    //             Ellipsis = true;
    //             Image = Approvals;
    //             Promoted = true;
    //             PromotedCategory = Category4;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;

    //             trigger OnAction()
    //             begin
    //                 ApprovalsMgmt.FnOpenApprovalEntriesPage(RecordId);
    //             end;
    //         }
    //         action(Approve)
    //         {
    //             ApplicationArea = Suite;
    //             Caption = 'Approve';
    //             Image = Approve;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             Scope = Repeater;
    //             ToolTip = 'Approve the requested changes.';

    //             trigger OnAction()
    //             var
    //                 CustomApprovalEntry: Record "Custom Approval Entry";
    //                 ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //             begin
    //                 //CurrPage.SETSELECTIONFILTER(CustomApprovalEntry);
    //                 /*ApprovalsMgmt.FnApproveRecordApprovalRequest(RECORDID);

    //                 CustomApprovalEntry.RESET;
    //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Document No.","Project ID");
    //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry.Status,CustomApprovalEntry.Status::Approved);
    //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Sequence No.",FnGetLargestSequenceNoFromApprovalEntry("Project ID"));
    //                 MESSAGE(FORMAT(FnGetLargestSequenceNoFromApprovalEntry("Project ID")));
    //                 IF CustomApprovalEntry.FINDFIRST THEN
    //                   BEGIN
    //                 //      ReleaseApprovalDocument.ReleaseSAVReq(Rec);
    //                    END;*/

    //             end;
    //         }
    //         action(Reject)
    //         {
    //             ApplicationArea = Suite;
    //             Caption = 'Reject';
    //             Image = Reject;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             Scope = Repeater;
    //             ToolTip = 'Reject the approval request.';

    //             trigger OnAction()
    //             var
    //                 ApprovalEntry: Record "Custom Approval Entry";
    //                 ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 currentRecEntryNo: Integer;
    //                 CustomApprovalEntryChange: Record "Custom Approval Entry History";
    //             begin
    //                 //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
    //                 //Added
    //                 //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
    //                 //Added
    //                 /*CustomApprovalEntry.RESET;
    //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Document No.","Project ID");
    //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Record ID to Approve",RECORDID);
    //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry.Status,CustomApprovalEntry.Status::Open);
    //                 IF CustomApprovalEntry.FINDSET THEN BEGIN
    //                    currentRecEntryNo:=CustomApprovalEntry."Sequence No.";
    //                 END;//Added

    //                 ApprovalsMgmt.FnRejectRecordApprovalRequest(RECORDID);

    //                 CustomApprovalEntry.RESET;
    //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Document No.","Project ID");
    //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Record ID to Approve",RECORDID);
    //                 //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
    //                 IF CustomApprovalEntry.FINDSET THEN
    //                   REPEAT
    //                     CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Rejected;
    //                     CustomApprovalEntry.MODIFY(TRUE);
    //                   UNTIL CustomApprovalEntry.NEXT=0;

    //                 Status:=Status::Open;
    //                 MODIFY(TRUE);

    //                 //Added part 2
    //                 IF currentRecEntryNo>1 THEN BEGIN
    //                 CustomApprovalEntry.RESET;
    //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Document No.","Project ID");
    //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Record ID to Approve",RECORDID);
    //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Sequence No.",currentRecEntryNo);
    //                 IF CustomApprovalEntry.FINDSET THEN BEGIN
    //                   REPEAT
    //                    UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
    //                    CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Created;
    //                    CustomApprovalEntry.MODIFY();
    //                   UNTIL CustomApprovalEntry.NEXT=0;
    //                 END;

    //                 END;

    //                 IF currentRecEntryNo>1 THEN BEGIN
    //                     CustomApprovalEntry.RESET;
    //                     CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Document No.","Project ID");
    //                     CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Record ID to Approve",RECORDID);
    //                     CustomApprovalEntry.SETFILTER(CustomApprovalEntry."Sequence No.",'<%1',currentRecEntryNo);
    //                     IF CustomApprovalEntry.FINDSET THEN BEGIN
    //                       REPEAT

    //                         IF (CustomApprovalEntry."Sequence No."=(currentRecEntryNo-1)) THEN BEGIN
    //                            CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Open;
    //                         END
    //                         ELSE IF (CustomApprovalEntry."Sequence No.">currentRecEntryNo) THEN BEGIN
    //                            CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Created;
    //                         END ELSE BEGIN
    //                            CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Approved;
    //                         END;
    //                         UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
    //                        CustomApprovalEntry.MODIFY();

    //                       UNTIL CustomApprovalEntry.NEXT=0;
    //                     END;
    //                 END;
    //                 IF currentRecEntryNo=1 THEN BEGIN
    //                   CustomApprovalEntry.RESET;
    //                   CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Document No.","Project ID");
    //                   CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Record ID to Approve",RECORDID);
    //                   //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
    //                   IF CustomApprovalEntry.FINDSET THEN
    //                     REPEAT
    //                       CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Rejected;
    //                       CustomApprovalEntry.MODIFY(TRUE);
    //                     UNTIL CustomApprovalEntry.NEXT=0;

    //                   Status:=Status::Open;
    //                   MODIFY(TRUE);
    //                 END;
    //                 //Added part 2

    //                 EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);


    //                 FIND
    //                 */

    //             end;
    //         }
    //         action(Delegate)
    //         {
    //             ApplicationArea = Suite;
    //             Caption = 'Delegate';
    //             Image = Delegate;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             Scope = Repeater;
    //             ToolTip = 'Delegate the approval to a substitute approver.';

    //             trigger OnAction()
    //             var
    //                 ApprovalEntry: Record "Custom Approval Entry";
    //                 ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 Selected: Integer;
    //                 USetup: Record "User Setup";
    //                 Options: Text;
    //                 "Count": Integer;
    //                 SelectedUser: Code[50];
    //                 Region: Text;
    //             begin
    //                 //Added
    //                     Options:='Default Substitute,';
    //                     //Get Region
    //                     USetup.Reset;
    //                     USetup.SetRange("User ID",UserId);
    //                     if USetup.Find('-') then begin
    //                         Region:=SelectedUser;
    //                     end;

    //                     USetup.Reset;
    //                     USetup.SetRange("Region Code",Region);
    //                     if USetup.Find('-') then begin
    //                       repeat

    //                       Options:=Options+USetup."User ID"+',';

    //                     until USetup.Next=0;
    //                     end;


    //                 Selected := Dialog.StrMenu(Options, 1, 'Select User');

    //                     USetup.Reset;
    //                     USetup.SetRange("Region Code",Region);
    //                     if USetup.Find('-') then begin repeat
    //                        Count:=Count+1;
    //                       if Selected = Count+1 then begin
    //                         SelectedUser:=USetup."User ID";
    //                       end;
    //                     until USetup.Next=0;
    //                     end;

    //                     USetup.Reset;
    //                     USetup.SetRange("User ID",UserId);
    //                     if USetup.Find('-') then begin
    //                         USetup."Substitute Selected":=true;
    //                         USetup."Selected Substitute":=SelectedUser;
    //                         USetup.Modify();
    //                     end;
    //                 //Added

    //                 //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
    //                 //ApprovalsMgmt.FnDelegateRecordApprovalRequest(RECORDID);
    //                 //EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);
    //             end;
    //         }
    //         action("Reject Document")
    //         {
    //             ApplicationArea = Basic;
    //             Image = Reject;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin
    //                 /*TESTFIELD("Rejection Remarks");
    //                 Rejected:=TRUE;
    //                 "Rejected By":=USERID;
    //                 MODIFY();
    //                 MESSAGE('Document Rejected.');*/

    //             end;
    //         }
    //     }
    // }

    // trigger OnAfterGetCurrRecord()
    // begin
    //     if "Approval Status"="approval status"::Released then begin
    //       CurrPage.Editable:=false;
    //       end;
    // end;

    // trigger OnAfterGetRecord()
    // begin
    //     if "Approval Status"="approval status"::Released then begin
    //       CurrPage.Editable:=false;
    //       end;
    // end;

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     "Document Type":="document type"::"New Job Voucher";

    //     //IF "Planning Level"="Planning Level"::Regional THEN BEGIN
    //     if UserSetup.Get(UserId) then begin
    //       "Road Planner No":=UserSetup."Road Planner No";
    //       Validate("Road Planner No");
    //       end;
    //       //END;
    // end;

    // trigger OnOpenPage()
    // begin
    //     if "Approval Status"="approval status"::Released then begin
    //       CurrPage.Editable:=false;
    //       end;
    // end;

    // var
    //     Job: Record Job;
    //     JobTask: Record "Job Task";
    //     JobPlanningLine: Record "Job Planning Line";
    //     Procurement: Codeunit "Procurement Processing";
    //     ConsRoadWorkProgram: Record "Road Work Program";
    //     ExistingRoadWPPackage: Record "Existing Road WP Package";
    //     ExistingRoadWorkPrograTask: Record "Existing Road Work Progra Task";
    //     ExistingRoadWPActivity: Record "Existing Road WP Activity";
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     RoadWorkProgram: Record "Road Work Program";
    //     RMS: Codeunit "RMS Management";
    //     UserSetup: Record "User Setup";
    //     RoadPackage: Record "Road WorkPlan Package";
    //     RoadWorkPlanPackage: Record "Road WorkPlan Package";
    //     NewRoadWorkProgramTask: Record "New Road Work Program Task";
    //     NewRoadWorkProgramPackage: Record "New Road Work Program Package";
    //     PurchaseRequisitionTemplate: Record "Purchase Requisition Template";
    //     RequisitionTemplateLine: Record "BoQ Template Line1";
    //     BoQTemplateBillCode: Record "BoQ Template Bill Code";
    //     NewRoadWorkProgramActivity: Record "New Road Work Program Activity";
    //     TariffCodes1: Record "Tariff Codes1";
    //     NoSeriesManagement: Codeunit NoSeriesManagement;
    //     JobsSetup: Record "Jobs Setup";
    //     TAskNo: Integer;
    //     Item: Record Item;
    //     JobList: Page "Job List";
    //     ProcurementPlanLines: Record "Procurement Plan Lines";
    //     ProcurementPlanEntry: Record "Procurement Plan Entry";
    //     ProcurementPlan: Record "Procurement Plan";
    //     ConsRoadWorkProgramPackage: Record "Cons Road Work Program Package";
    //     LineNo: Integer;
    //     LinNo2: Integer;
    //     TXT0001: label 'An approval request has been sent and approvers notified successfully.';
    //     TXT0002: label 'An approval request has been cancelled and approvers notified successfully.';
    //     RecVariant: Variant;
    //     RMSManagement: Codeunit "RMS Management";

    // local procedure FnPostNewRoadWorkPlan()
    // begin
    //     //Insert Jobs
    //     JobsSetup.Get;
    //     NewRoadWorkProgramPackage.Reset;
    //     NewRoadWorkProgramPackage.SetRange(NewRoadWorkProgramPackage."Road Work Program ID",Code);
    //     if NewRoadWorkProgramPackage.FindSet then begin
    //       repeat
    //       Job.Init;
    //       Job."No.":='';//NoSeriesManagement.GetNextNo(JobsSetup."Job Nos.",TODAY,TRUE);
    //       Job.Description:=Description;
    //       Job."Road Code":=NewRoadWorkProgramPackage."Road Code";
    //       Job."Record Type":=Job."record type"::"Road Project";
    //       Job.Validate("Road Code");
    //       Job."Road Section No":=NewRoadWorkProgramPackage."Road Section No.";
    //       Job.Validate("Road Section No");
    //       Job."Road Class ID":=NewRoadWorkProgramPackage."Road Class";
    //       Job."Bill-to Customer No.":='CUST2006';
    //       Job.Insert(true);
    //       until NewRoadWorkProgramPackage.Next =0;
    //       end;

    //     //Insert Tasks
    //        NewRoadWorkProgramTask.Reset;
    //        NewRoadWorkProgramTask.SetRange(NewRoadWorkProgramTask."Road Work Program ID",NewRoadWorkProgramPackage."Road Work Program ID");
    //        if NewRoadWorkProgramTask.FindSet(true) then
    //        repeat
    //          JobTask.Init;
    //          JobTask."Job No.":=Job."No.";
    //          JobTask."Job Task No.":=NewRoadWorkProgramTask."Begin-Total Job Task No.";
    //          JobTask.Description:=NewRoadWorkProgramTask.Description;
    //          JobTask."Job Task Type":=JobTask."job task type"::"Begin-Total";
    //          if not JobTask.Get(JobTask."Job No.",JobTask."Job Task No.") then
    //          JobTask.Insert(true);

    //          JobTask.Init;
    //          JobTask."Job No.":=Job."No.";
    //          JobTask."Job Task No.":=NewRoadWorkProgramTask."Package No.";
    //          JobTask.Description:=NewRoadWorkProgramTask.Description;
    //          JobTask."Job Task Type":=JobTask."job task type"::Posting;
    //          if not JobTask.Get(JobTask."Job No.",JobTask."Job Task No.") then
    //          JobTask.Insert(true);

    //          JobTask.Init;
    //          JobTask."Job No.":=Job."No.";
    //          JobTask."Job Task No.":=NewRoadWorkProgramTask."End-Total Job Task No.";
    //          JobTask.Description:=NewRoadWorkProgramTask.Description;
    //          JobTask."Job Task Type":=JobTask."job task type"::"End-Total";
    //          if not JobTask.Get(JobTask."Job No.",JobTask."Job Task No.") then
    //          JobTask.Insert(true);
    //         until NewRoadWorkProgramTask.Next =0;

    //          //Create Job Planning Lines
    //         NewRoadWorkProgramActivity.Reset;
    //         NewRoadWorkProgramActivity.SetRange(NewRoadWorkProgramActivity."Road Work Program ID",Code);
    //         if NewRoadWorkProgramActivity.FindSet then begin
    //         repeat
    //         JobPlanningLine.Init;
    //         JobPlanningLine."Job No.":=Job."No.";
    //         JobPlanningLine."Job Task No.":=NewRoadWorkProgramTask."Package No.";
    //         JobPlanningLine."Line No.":=JobPlanningLine.Count+1;
    //         JobPlanningLine.Type:=JobPlanningLine.Type::Item;
    //         JobPlanningLine."No.":=NewRoadWorkProgramActivity."Activity Code";
    //         JobPlanningLine.Status:=JobPlanningLine.Status::Planning;
    //         JobPlanningLine."Budget Type":=JobPlanningLine."budget type"::Original;
    //         JobPlanningLine."Ledger Entry Type":=JobPlanningLine."ledger entry type"::Item;
    //         JobPlanningLine.Description:=NewRoadWorkProgramActivity.Description;
    //         JobPlanningLine.Quantity:=NewRoadWorkProgramActivity."Packaged Quantity";
    //         JobPlanningLine.Validate(Quantity);
    //         JobPlanningLine."Road Technology":=NewRoadWorkProgramActivity."Technology Type";
    //         JobPlanningLine.Validate("Road Technology");
    //         JobPlanningLine."Road Activity Categories":=NewRoadWorkProgramActivity."Bill Item Category Code";
    //         JobPlanningLine."Direct Unit Cost (LCY)":=NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
    //         JobPlanningLine."Unit Cost":=NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
    //         JobPlanningLine.Validate("Unit Cost");
    //         JobPlanningLine.Insert(true);
    //         until NewRoadWorkProgramActivity.Next =0;
    //         end;

    //     Message('Success');
    //     Job.Reset;
    //     Job.SetRange(Job."No.",Job."No.");
    //     if Job.FindSet then
    //       JobList.SetTableview(Job);
    //     JobList.Run();
    // end;

    // local procedure FnInsertPlanningCategory()
    // begin
    //      RoadPackage.Reset;
    //      RoadPackage.SetRange(RoadPackage."Road Work Program ID",Code);
    //       if RoadPackage.FindSet then begin
    //       repeat
    //      ProcurementPlan.Reset;
    //      ProcurementPlan.SetRange(ProcurementPlan."Plan Type",ProcurementPlan."plan type"::Consolidated);
    //      ProcurementPlan.SetRange(ProcurementPlan.Code,"Procurement Plan ID");
    //      if ProcurementPlan.FindSet then begin
    //          ProcurementPlanLines.Reset;
    //          ProcurementPlanLines.SetCurrentkey("Procurement Plan ID","Planning Category");
    //          ProcurementPlanLines.SetRange(ProcurementPlanLines."Procurement Plan ID",RoadPackage."Procurement Plan ID");
    //          ProcurementPlanLines.SetRange(ProcurementPlanLines."Planning Category",RoadPackage."Procurement Category");
    //          if not ProcurementPlanLines.FindSet then begin
    //           ProcurementPlanLines.Init;
    //           ProcurementPlanLines."PP Line No":=ProcurementPlanLines.Count+1;
    //           ProcurementPlanLines."Procurement Plan ID":=ProcurementPlan.Code;
    //           ProcurementPlanLines."Planning Category":=RoadPackage."Procurement Category";
    //           ProcurementPlanLines.Validate("Planning Category");
    //           ProcurementPlanLines."Procurement Type":='WORKS';
    //           ProcurementPlanLines."Solicitation Type":='OPENTENDER';
    //           ProcurementPlanLines."Procurement Method":=ProcurementPlanLines."procurement method"::"Open Tender";
    //           ProcurementPlanLines."Primary Source of Funds":=RoadPackage."Funding Source ID";
    //           if not ProcurementPlanLines.Get(ProcurementPlanLines."Procurement Plan ID",ProcurementPlanLines."PP Line No") then
    //           ProcurementPlanLines.Insert(true);
    //          end;
    //         end;
    //         until RoadPackage.Next=0;
    //         end;
    // end;

    // local procedure FnInsertIntoPPlanEntry()
    // begin
    //     // //Insert In the Procurement Plan Entry Tables
    //     /*RoadPackage.RESET;
    //     RoadPackage.SETRANGE(RoadPackage."Road Work Program ID",Code);
    //       IF RoadPackage.FINDSET THEN
    //         REPEAT
    //            ProcurementPlanEntry.INIT;
    //            ProcurementPlanEntry."Entry No.":=LineNo;
    //            ProcurementPlanEntry."Procurement Plan ID":="Procurement Plan ID";
    //            ProcurementPlanEntry."Planning Category":=RoadPackage."Procurement Category";
    //            ProcurementPlanEntry."Work Plan Project ID":=RoadPackage."Road Work Program ID";
    //            ProcurementPlanEntry.Description:=RoadPackage."Package Name";
    //            ProcurementPlanEntry."Procurement Type":='WORKS';
    //            ProcurementPlanEntry."Solicitation Type":='OPENTENDER';
    //            ProcurementPlanEntry."Requisition Product Group":=ProcurementPlanEntry."Requisition Product Group"::Works;
    //            ProcurementPlanEntry."Procurement Use":=ProcurementPlanEntry."Procurement Use"::"Project-Specific Use";
    //            ProcurementPlanEntry."Procurement Method":=ProcurementPlanEntry."Procurement Method"::"Open Tender";
    //            ProcurementPlanEntry."Preference/Reservation Code":='LOC';
    //            ProcurementPlanEntry."Funding Source ID":=RoadPackage."Funding Source ID";
    //            ProcurementPlanEntry."Start Chainage(Km)":=RoadPackage."Start Chainage";
    //            ProcurementPlanEntry."End Chainage(Km)":=RoadPackage."End Chainage";
    //            ProcurementPlanEntry."Planning Date":=TODAY;
    //            ProcurementPlanEntry.Quantity:=1;
    //            //RoadPackage.CALCFIELDS(RoadPackage."Budget (Cost) Excl. VAT",RoadPackage."Budget (Cost) Incl. VAT",RoadPackage."Budget (VAT Amount)");
    //            ProcurementPlanEntry."Unit Cost":=RoadPackage."Total Budget Cost";
    //            ProcurementPlanEntry."Line Budget Cost":=RoadPackage."Total Budget Cost";
    //            ProcurementPlanEntry."Section Length(Km)":=RoadPackage."Total Road Section Length";
    //            ProcurementPlanEntry.Region:=RoadPackage."Region ID";
    //            ProcurementPlanEntry.Constituency:=RoadPackage."Constituency ID";
    //            ProcurementPlanEntry.Department:=RoadPackage."Department ID";
    //            ProcurementPlanEntry.Directorate:=RoadPackage."Directorate ID";
    //            ProcurementPlanEntry."Road No.":=RoadPackage."Road Code";
    //            ProcurementPlanEntry.VALIDATE("Road No.");
    //            //ProcurementPlanEntry."Workplan Task No.":=RoadPackage."Budget Entry No";
    //            JobTask.RESET;
    //            JobTask.SETRANGE(JobTask."Job No.",RoadPackage."Global Budget Book Id");
    //            IF JobTask.FINDSET THEN
    //             BEGIN
    //               ProcurementPlanEntry."Budget Control Job No":=JobTask."Job No.";
    //               ProcurementPlanEntry."Budget Control Job Task No.":=JobTask."Job Task No.";
    //               END;
    //            ProcurementPlanEntry.Status:=ProcurementPlanEntry.Status::Approved;
    //            IF NOT ProcurementPlanEntry.GET(ProcurementPlanEntry."Procurement Plan ID",ProcurementPlanEntry."Entry No.") THEN
    //            ProcurementPlanEntry.INSERT(TRUE);
    //            UNTIL RoadPackage.NEXT=0;
    //            MESSAGE('Posted Successfully');*/

    // end;
}

