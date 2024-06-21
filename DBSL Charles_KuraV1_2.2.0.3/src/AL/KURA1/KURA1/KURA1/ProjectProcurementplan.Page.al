#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65141 "Project Procurement plan"
{
    Caption = 'Project Budget Plan Card';
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Prices';
    RefreshOnActivate = true;
    SourceTable = "Project Budget Header";
    SourceTableView = where("Procurement Plan"=const(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Project Budget ID";"Project Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Budget Type";"Budget Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("External Document No.";"External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code";"Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Original Budget Cost";"Original Budget Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Original Budget Cost (LCY)";"Original Budget Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Funding Source";"Funding Source")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control11;"Project Procurement Lines")
            {
                SubPageLink = "Project Budget ID"=field("Project Budget ID"),
                              "Job No."=field("Project ID");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Job")
            {
                Caption = '&Job';
                Image = Job;
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                         ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        TestField("Approval Status","approval status"::Open);//status must be open.
                        /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                         IF ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                          ApprovalsMgmt.OnSendGFAForApproval(Rec);*/

                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        TestField("Approval Status","approval status"::"Pending Approval");//status must be open.
                        /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        ApprovalsMgmt.OnCancelGFAApprovalRequest(Rec);*/

                    end;
                }
                separator(Action15)
                {
                }
                action("Post Project Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        LineN:=0;
                        /*BudgetLines.RESET;
                        BudgetLines.SETRANGE("Project Budget ID","Project Budget ID");
                        BudgetLines.SETRANGE("Job No.","Project ID");
                        BudgetLines.SETRANGE(Transferred,FALSE);
                        IF BudgetLines.FIND('-') THEN BEGIN
                          REPEAT
                            BudgetLines.TESTFIELD("No.");
                            LineN:=FnGetLastLineNo();
                            JobPlanningLines.INIT;
                            JobPlanningLines."Line No.":=LineN+1000;
                            JobPlanningLines."Job No.":=BudgetLines."Job No.";
                            JobPlanningLines."Job Task No.":=BudgetLines."Job Task No.";
                            JobPlanningLines.Type:=BudgetLines.Type;
                            JobPlanningLines."No.":=BudgetLines."No.";
                            JobPlanningLines.VALIDATE( JobPlanningLines."No.");
                            JobPlanningLines."Document No.":="Project Budget ID";
                            JobPlanningLines."Planning Date":=BudgetLines."Planning Date";
                            JobPlanningLines.Quantity:=BudgetLines.Quantity;
                            JobPlanningLines.VALIDATE( JobPlanningLines.Quantity);
                            JobPlanningLines."Unit Cost":=BudgetLines."Unit Cost (LCY)";
                            JobPlanningLines.VALIDATE("Unit Cost");
                            JobPlanningLines."Job Budget Templates":=BudgetLines."Job Budget Templates";
                            JobPlanningLines."Budget Type":=BudgetLines."Budget Type";
                            JobPlanningLines."Directorate Code":=BudgetLines."Directorate Code";
                            JobPlanningLines."Department Code":=BudgetLines."Department Code";
                            JobPlanningLines.Division:=BudgetLines.Division;
                            JobPlanningLines.INSERT(TRUE);
                            //BudgetLines.Transferred:=TRUE;
                          UNTIL BudgetLines.NEXT=0;
                          END;*/
                        
                          ProcurementHeader.Reset;
                          ProcurementHeader.SetRange("Financial Year Code","Financial Year Code");
                          if ProcurementHeader.Find('-') then begin
                            BudgetLines.Reset;
                            BudgetLines.SetRange("Project Budget ID","Project Budget ID");
                            BudgetLines.SetRange("Job No.","Project ID");
                            BudgetLines.SetRange(Transferred,false);
                            if BudgetLines.Find('-') then begin
                               repeat
                                   // LineN:='Project_'+FORMAT(FnGetLastLineNo());
                                    ProcurementLine.Init;
                                    ProcurementLine."Plan Year":=ProcurementHeader.No;
                                    ProcurementLine."Plan Item No":="Project ID"+IncStr(BudgetLines."Job Task No.");
                                    ProcurementLine.Type:=BudgetLines.Type;
                                    ProcurementLine."Procurement Type":=ProcurementLine."procurement type"::Works;
                                    ProcurementLine."Unit of Measure":='UNIT';
                                    ProcurementLine."No.":=BudgetLines."No.";
                                    ProcurementLine."Item Description":=BudgetLines.Description;
                                    ProcurementLine.Quantity:=BudgetLines.Quantity;
                                    ProcurementLine."Unit Cost":=BudgetLines."Unit Cost";
                                    ProcurementLine."Estimated Cost":=BudgetLines."Total Cost (LCY)";
                                    ProcurementLine."Directorate Code":=BudgetLines."Directorate Code";
                                    ProcurementLine."Department Code":=BudgetLines."Department Code";
                                    ProcurementLine."Job ID":=BudgetLines."Job No.";
                                    ProcurementLine."Job Task No.":=BudgetLines."Job Task No.";
                                    ProcurementLine."Source of Funds":="Funding Source";
                                    ProcurementLine.Insert(true);
                        
                                    LineN:=FnGetLastPLineNo();
                                    ProcurementEntry.Init;
                                    ProcurementEntry."Budget Name":=ProcurementHeader.No;
                                    ProcurementEntry."Procurement Item":="Project ID"+IncStr(BudgetLines."Job Task No.");
                                    ProcurementEntry."Entry No.":=LineN+1;
                                    ProcurementEntry.Date:=Today;
                                    ProcurementEntry."Budget Type":= ProcurementEntry."budget type"::Approved;
                                    ProcurementEntry.Description:=BudgetLines.Description;
                                    //ProcurementEntry."Directorate Code":=BudgetLines."Directorate Code";
                                    //ProcurementEntry."Department Code":=BudgetLines."Department Code";
                                    ProcurementEntry.Quantity:=BudgetLines.Quantity;
                                    ProcurementEntry."Unit Price":=BudgetLines."Unit Cost";
                                    ProcurementEntry.Amount:=BudgetLines."Total Cost (LCY)";
                                    ProcurementEntry."Job ID":=BudgetLines."Job No.";
                                    ProcurementEntry."Job Task No.":=BudgetLines."Job Task No.";
                                    ProcurementEntry.Insert(true);
                        
                        
                        
                               until BudgetLines.Next=0;
                            end;
                         end;
                        
                          Message('Bugdet Posted Successfully');

                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Budget Type":="budget type"::Original;
        "Procurement Plan":=true;
    end;

    var
        FormatAddress: Codeunit "Format Address";
        JobSimplificationAvailable: Boolean;
        TotalBudgetCommitments: Decimal;
        AvailableFunds: Decimal;
        NoFieldVisible: Boolean;
        IsCountyVisible: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        JobPlanningLines: Record "Job Planning Line";
        BudgetHeader: Record "Project Budget Header";
        BudgetLines: Record "Project Budget Planning Line";
        ProcurementHeader: Record "Procurement Header";
        ProcurementLine: Record "Procurement Plan1";
        ProcurementEntry: Record "Procurement Plan Entry1";
        LineNumber: Integer;
        LineN: Integer;

    local procedure BilltoCustomerNoOnAfterValidat()
    begin
    end;

    local procedure SetNoFieldVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
    end;


    procedure FnGetLastLineNo() LineNumber: Integer
    begin
        JobPlanningLines.Reset;
        if JobPlanningLines.FindLast then begin
           LineNumber:=JobPlanningLines."Line No.";
          end;
        exit(LineNumber);
    end;


    procedure FnGetLastPLineNo() EntryNumber: Integer
    begin
        ProcurementEntry.Reset;
        if ProcurementEntry.FindLast then begin
           EntryNumber:=ProcurementEntry."Entry No.";
          end;
        exit(EntryNumber);
    end;
}

