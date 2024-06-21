#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65123 "Fixed Price Billing Card"
{
    PageType = Card;
    SourceTable = "Project Billable Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Project Billable ID"; "Project Billable ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Type"; "Project Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; "External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
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
                field("Total billable Amount"; "Total billable Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total billable Amount(LCY)"; "Total billable Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control15; "Fixed Price Billing Lines")
            {
                SubPageLink = "Project Billable ID" = field("Project Billable ID"),
                              "Project Type" = field("Project Type"),
                              "Job No." = field("Project ID");
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
                        ///ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        TestField("Approval Status", "approval status"::Open);//status must be open.
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
                        TestField("Approval Status", "approval status"::"Pending Approval");//status must be open.
                        /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        ApprovalsMgmt.OnCancelGFAApprovalRequest(Rec);*/

                    end;
                }
                separator(Action7)
                {
                }
                action("Post Billable")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Billable';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin



                        LineN := 0;
                        BillableLines.Reset;
                        BillableLines.SetRange("Project Billable ID", "Project Billable ID");
                        BillableLines.SetRange("Job No.", "Project ID");
                        //BillableLines.SETRANGE(Transferred,FALSE);
                        if BillableLines.Find('-') then begin
                            repeat
                                BillableLines.TestField(Qty);
                                BillableLines.TestField("No.");
                                BillableLines.TestField("Billing Price");
                                BillableLines.TestField("Billing Price(LCY)");

                                JobPlanningLines.Init;
                                JobPlanningLines."Line No." := FnGetLastjbLineNo() + 1;
                                JobPlanningLines."Job No." := BillableLines."Job No.";
                                JobPlanningLines."Job Task No." := BillableLines."Job Task No.";
                                JobPlanningLines.Type := BillableLines."Billing Type";
                                JobPlanningLines.Validate(JobPlanningLines.Type);
                                JobPlanningLines."No." := BillableLines."No.";
                                JobPlanningLines.Validate(JobPlanningLines."No.");
                                JobPlanningLines."Document No." := "Project Billable ID";
                                JobPlanningLines."Line Type" := JobPlanningLines."line type"::Billable;
                                JobPlanningLines.Validate(JobPlanningLines."Line Type");
                                JobPlanningLines.Quantity := BillableLines.Qty;
                                JobPlanningLines.Validate(JobPlanningLines.Quantity);
                                JobPlanningLines."Unit Price" := BillableLines."Billing Price";
                                JobPlanningLines."Unit Price (LCY)" := BillableLines."Billing Price(LCY)";
                                JobPlanningLines."Job Budget Templates" := BillableLines."Job Budget Templates";
                                JobPlanningLines.Description := BillableLines."Billing Description";
                                JobPlanningLines.Insert(true);
                            //BillableLines.Transferred:=TRUE;
                            until BillableLines.Next = 0;
                        end;

                        Message('Billing Posted Successfully');
                    end;
                }
            }
            group(ActionGroup25)
            {
                Caption = '&Job';
                Image = Job;
            }
            group("Research Project")
            {
                action(MilestonesLines)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Milestone Lines';
                    Image = JobLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (Budget) or you can specify what you actually agreed with your customer that he should pay for the job (Billable).';

                    trigger OnAction()
                    var
                        MilestoneLine: Record "Milestones Lines";
                        MilestoneLines: Page "Milestones Lines";
                    begin
                        TestField("Project ID");
                        MilestoneLine.FilterGroup(2);
                        MilestoneLine.SetRange("Project No", "Project ID");
                        MilestoneLine.FilterGroup(0);
                        //MilestoneLines.SetJobTaskNoVisible(TRUE);
                        MilestoneLines.SetTableview(MilestoneLine);
                        MilestoneLines.Editable := true;
                        MilestoneLines.Run;
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Project Type" := "project type"::"Fixed Price Billing";
    end;

    var
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        LineN: Integer;
        BillableLines: Record "Billable Project Lines";
        JobPlanningLines: Record "Job Planning Line";

    local procedure FnGetLastLineNo() LineNumber: Integer
    var
        Billable: Record "Billable Project Lines";
    begin
        Billable.Reset;
        if Billable.Find('+') then
            LineNumber := Billable."Line Number"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    local procedure FnGetLastjbLineNo() LineN: Integer
    var
        JBBillable: Record "Job Planning Line";
    begin
        JBBillable.Reset;
        if JBBillable.Find('+') then
            LineN := JBBillable."Line No."
        else
            LineN := 1;
        exit(LineN);
    end;
}

