#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50064 "pageextension50064" extends "Job Task Lines Subform"
{
    layout
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Schedule (Total Cost)")
        {
            Caption = 'Contract Sum';
        }
        modify("Global Dimension 1 Code") { visible = true; }

        //Unsupported feature: Property Deletion (Visible) on ""Global Dimension 1 Code"(Control 67)".


        //Unsupported feature: Property Deletion (Visible) on ""Global Dimension 2 Code"(Control 69)".

        addafter(Description)
        {
            field("Road Section  Name"; "Road Section  Name")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
        addafter("Global Dimension 2 Code")
        {
            field("Start Point(Km)"; "Start Point(Km)")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("End Point(Km)"; "End Point(Km)")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
        addafter(Totaling)
        {
            field("Surface Types"; "Surface Types")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Road Condition"; "Road Condition")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Funding Source"; "Funding Source")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("End Date")
        {
            field("Road Section ID"; "Road Section ID")
            {
                ApplicationArea = Basic;
            }
            field("Procurement Method"; "Procurement Method")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Amt. Rcd. Not Invoiced")
        {
            field("Department Code"; "Department Code")
            {
                ApplicationArea = Basic;
            }
            field("Directorate Code"; "Directorate Code")
            {
                ApplicationArea = Basic;
            }
            field(Division; Division)
            {
                ApplicationArea = Basic;
            }
            field("Roads Category"; "Roads Category")
            {
                ApplicationArea = Basic;
            }
            field("Fund Type"; "Fund Type")
            {
                ApplicationArea = Basic;
            }
            field("Execution Method"; "Execution Method")
            {
                ApplicationArea = Basic;
            }
            field(Commitments; Commitments)
            {
                ApplicationArea = Basic;
            }
            field("Completed Length(Km)"; "Completed Length(Km)")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter(Description; "Global Dimension 1 Code")
    }
    actions
    {
        addafter("F&unctions")
        {
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
                        MilestoneLine.SetRange("Project No", "Job No.");
                        MilestoneLine.SetRange("Task No", "Job Task No.");
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

