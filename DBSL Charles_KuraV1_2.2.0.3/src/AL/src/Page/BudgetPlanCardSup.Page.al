#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65118 "Budget Plan Card-Sup"
{
    // Caption = 'Project Budget Plan Card';
    // PageType = Document;
    // PromotedActionCategories = 'New,Process,Report,Prices';
    // RefreshOnActivate = true;
    // SourceTable = "Project Budget Header";

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             Caption = 'General';
    //             field("Project Budget ID";"Project Budget ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Budget Type";"Budget Type")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Project ID";"Project ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Description;Description)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("External Document No.";"External Document No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Financial Year Code";"Financial Year Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Approval Status";"Approval Status")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Currency Code";"Currency Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Original Budget Cost";"Original Budget Cost")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Original Budget Cost (LCY)";"Original Budget Cost (LCY)")
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
    //         }
    //         part(Control11;"Budget Planning Lines")
    //         {
    //             SubPageLink = "Project Budget ID"=field("Project Budget ID"),
    //                           "Job No."=field("Project ID");
    //         }
    //     }
    // }

    // actions
    // {
    //     area(navigation)
    //     {
    //         group("&Job")
    //         {
    //             Caption = '&Job';
    //             Image = Job;
    //             action(Approvals)
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Approval;
    //                 Promoted = true;
    //                 PromotedCategory = Category5;

    //                 trigger OnAction()
    //                 begin
    //                      ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
    //                 end;
    //             }
    //             action("Send Approval Request")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = SendApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = Category5;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalMgt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     TestField("Approval Status","approval status"::Open);//status must be open.
    //                     /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
    //                      IF ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
    //                       ApprovalsMgmt.OnSendGFAForApproval(Rec);*/

    //                 end;
    //             }
    //             action("Cancel Approval Request")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = CancelApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = Category5;

    //                 trigger OnAction()
    //                 begin
    //                     TestField("Approval Status","approval status"::"Pending Approval");//status must be open.
    //                     /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
    //                     ApprovalsMgmt.OnCancelGFAApprovalRequest(Rec);*/

    //                 end;
    //             }
    //             separator(Action15)
    //             {
    //             }
    //             action("Post Budget")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Post;
    //                 Promoted = true;
    //                 PromotedCategory = Process;

    //                 trigger OnAction()
    //                 begin
    //                     LineN:=0;
    //                     BudgetLines.Reset;
    //                     BudgetLines.SetRange("Project Budget ID","Project Budget ID");
    //                     BudgetLines.SetRange("Job No.","Project ID");
    //                     BudgetLines.SetRange(Transferred,false);
    //                     if BudgetLines.Find('-') then begin
    //                       repeat
    //                          if (BudgetLines.Quantity<=0) then
    //                           Error('Quantity should be greator than zero');

    //                         JobPlanningLines.Init;
    //                         JobPlanningLines."Job No.":=BudgetLines."Job No.";
    //                         JobPlanningLines."Job Task No.":=BudgetLines."Job Task No.";
    //                         JobPlanningLines.Type:=BudgetLines.Type;
    //                         JobPlanningLines."No.":=BudgetLines."No.";
    //                         JobPlanningLines.Validate( JobPlanningLines."No.");
    //                         JobPlanningLines."Document No.":="Project Budget ID";
    //                         JobPlanningLines."Planning Date":=BudgetLines."Planning Date";
    //                         JobPlanningLines.Quantity:=BudgetLines.Quantity;
    //                         JobPlanningLines.Validate( JobPlanningLines.Quantity);
    //                         JobPlanningLines."Job Budget Templates":=BudgetLines."Job Budget Templates";
    //                         JobPlanningLines."Budget Type":=BudgetLines."Budget Type";
    //                         JobPlanningLines.Insert(true);
    //                         //BudgetLines.Transferred:=TRUE;
    //                       until BudgetLines.Next=0;
    //                       end;

    //                      /* ProcurementHeader.RESET;
    //                       ProcurementHeader.SETRANGE("Financial Year Code","Financial Year Code");
    //                       IF ProcurementHeader.FIND('-') THEN BEGIN
    //                         BudgetLines.RESET;
    //                         BudgetLines.SETRANGE("Project Budget ID","Project Budget ID");
    //                         BudgetLines.SETRANGE("Job No.","Project ID");
    //                         BudgetLines.SETRANGE(Transferred,FALSE);
    //                         IF BudgetLines.FIND('-') THEN BEGIN
    //                            REPEAT
    //                                 LineN:=FnGetLastLineNo();
    //                                 ProcurementLine.INIT;
    //                                 ProcurementLine."Plan Year":=ProcurementHeader.No;
    //                                 ProcurementLine."Plan Item No":=FORMAT(LineN);
    //                                 ProcurementLine.Type:=BudgetLines.Type;
    //                                 ProcurementLine."No.":=BudgetLines."No.";
    //                                 ProcurementLine."Item Description":=BudgetLines.Description;
    //                                 ProcurementLine.Quantity:=BudgetLines.Quantity;
    //                                 ProcurementLine."Unit Cost":=BudgetLines."Unit Cost";
    //                                 ProcurementLine."Estimated Cost":=BudgetLines."Total Cost (LCY)";
    //                                 ProcurementLine.INSERT(TRUE);

    //                                 ProcurementEntry.INIT;
    //                                 ProcurementEntry."Budget Name":=ProcurementHeader.No;
    //                                 ProcurementEntry."Procurement Item":=FORMAT(LineN);
    //                                 ProcurementEntry.Date:=TODAY;
    //                                 ProcurementEntry."Budget Type":= ProcurementEntry."Budget Type"::Approved;
    //                                 ProcurementEntry.Description:=BudgetLines.Description;
    //                                 ProcurementEntry.Quantity:=BudgetLines.Quantity;
    //                                 ProcurementEntry."Unit Price":=BudgetLines."Unit Cost";
    //                                 ProcurementEntry.Amount:=BudgetLines."Total Cost (LCY)";
    //                                 ProcurementEntry.INSERT(TRUE);



    //                            UNTIL BudgetLines.NEXT=0;
    //                         END;
    //                      END;*/

    //                       Message('Bugdet Posted Successfully');

    //                 end;
    //             }
    //         }
    //     }
    // }

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     "Budget Type":="budget type"::Suplementary;
    // end;

    // var
    //     FormatAddress: Codeunit "Format Address";
    //     JobSimplificationAvailable: Boolean;
    //     TotalBudgetCommitments: Decimal;
    //     AvailableFunds: Decimal;
    //     NoFieldVisible: Boolean;
    //     IsCountyVisible: Boolean;
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     JobPlanningLines: Record "Job Planning Line";
    //     BudgetHeader: Record "Project Budget Header";
    //     BudgetLines: Record "Project Budget Planning Line";
    //     ProcurementHeader: Record "Procurement Header";
    //     ProcurementLine: Record "Procurement Plan1";
    //     ProcurementEntry: Record "Procurement Plan Entry1";
    //     LineNumber: Integer;
    //     LineN: Integer;

    // local procedure BilltoCustomerNoOnAfterValidat()
    // begin
    // end;

    // local procedure SetNoFieldVisible()
    // var
    //     DocumentNoVisibility: Codeunit DocumentNoVisibility;
    // begin
    // end;


    // procedure FnGetLastLineNo() LineNumber: Integer
    // begin
    //     JobPlanningLines.Reset;
    //     if JobPlanningLines.FindLast then begin
    //        LineNumber:=JobPlanningLines."Line No.";
    //       end;
    //     exit(LineNumber);
    // end;
}

