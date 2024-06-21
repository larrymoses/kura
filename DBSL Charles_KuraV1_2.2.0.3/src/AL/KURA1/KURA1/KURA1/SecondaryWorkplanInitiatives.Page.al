#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80210 "Secondary Workplan Initiatives"
{
    Caption = 'Secondary Workplan Initiatives';
    PageType = ListPart;
    SourceTable = "Secondary PC Objective";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Primary Directorate";"Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Initiative No.";"Initiative No.")
                {
                    ApplicationArea = Basic;
                }
                field("Objective/Initiative";"Objective/Initiative")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID";"Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Outcome Perfomance Indicator";"Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Imported Annual Target Qty";"Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agreed Targets';
                }
                field("Assigned Weight (%)";"Assigned Weight (%)")
                {
                    ApplicationArea = Basic;
                }
                field(Control7;Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Plog Achieved Targets";"Plog Achieved Targets")
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
            group("Line Functions")
            {
                action("Sub Intiatives")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Sub Objectives/Intiatives";
                    RunPageLink = "Workplan No."=field("Workplan No."),
                                  "Initiative No."=field("Initiative No."),
                                  "Goal ID"=field("Goal ID"),
                                  "Strategy Plan ID"=field("Strategy Plan ID");
                }
                action("Implementation Intiatives")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                action("Performance Targets")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        Message('Test');
                    end;
                }
                action("Performance Appraisal Entries")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        Message('Test');
                    end;
                }
                action(Comments)
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        Message('Test');
                    end;
                }
                action("Import Objectives")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        Message('Test');
                    end;
                }
            }
        }
    }
}

