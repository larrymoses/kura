#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65130 "Cost Reimbursement Lines"
{
    PageType = ListPart;
    SourceTable = "Billable Project Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Original Line Type";"Original Line Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Billing Line Type";"Billing Line Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Original Type";"Original Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Billing Type";"Billing Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Original Description";"Original Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Billing Description";"Billing Description")
                {
                    ApplicationArea = Basic;
                }
                field(Qty;Qty)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price";"Unit Price")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit Price (LCY)";"Unit Price (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Billing Price";"Billing Price")
                {
                    ApplicationArea = Basic;
                }
                field("Billing Price(LCY)";"Billing Price(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Job Budget Templates";"Job Budget Templates")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                group(Milestones)
                {
                    Image = Setup;
                    action(MilestoneLines)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Milestone & Lines';
                        Image = JobLines;
                        Scope = Repeater;
                        ShortCutKey = 'Shift+Ctrl+P';
                        ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that he should pay for the job (billable).';

                        trigger OnAction()
                        var
                            MilestoneLine: Record "Milestones Lines";
                            MilestoneLines: Page "Milestones Lines";
                        begin
                            TestField("Job No.");
                              MilestoneLine.FilterGroup(2);
                              MilestoneLine.SetRange("Project No","Job No.");
                              MilestoneLine.SetRange("Task No","Job Task No.");
                              MilestoneLine.FilterGroup(0);
                              MilestoneLines.SetTableview(MilestoneLine);
                              MilestoneLines.Editable := true;
                             MilestoneLines.Run;
                        end;
                    }
                }
            }
        }
    }
}

