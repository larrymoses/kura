#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69049 "Pay Periods List"
{
    Editable = false;
    PageType = List;
    SourceTable = "Payroll PeriodX";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Starting Date"; "Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field("New Fiscal Year"; "New Fiscal Year")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Date"; "Pay Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Closed; Closed)
                {
                    ApplicationArea = Basic;
                }
                field("Job Book Lock Date"; "Job Book Lock Date")
                {
                    ApplicationArea = Basic;
                }
                field("Job Book Locked?"; "Job Book Locked?")
                {
                    ApplicationArea = Basic;
                }
                field("Job Book Start Date"; "Job Book Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Job Book End Date"; "Job Book End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Close Pay"; "Close Pay")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000014; Notes)
            {
            }
            systempart(Control1000000015; MyNotes)
            {
            }
            systempart(Control1000000016; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Payroll Costs Analysis")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Costs Analysis';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        // PayrollCost.GetDateFilters(Rec."Starting Date",CalcDate('-1M',Rec."Starting Date"));
                        // PayrollCost.Run;
                    end;
                }
            }
        }
    }

    var
        ClosingFunction: Report "Close Pay period";
    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    // PayrollCost: Report "Payroll Cost Analysis";
}

