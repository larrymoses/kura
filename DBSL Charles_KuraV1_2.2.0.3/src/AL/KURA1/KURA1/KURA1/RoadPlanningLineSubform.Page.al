#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52001 "Road Planning Line Subform"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Road Planning Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Planning ID";"Planning ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Activity;Activity)
                {
                    ApplicationArea = Basic;
                }
                field("Planned Date";"Planned Date")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Date";"Actual Date")
                {
                    ApplicationArea = Basic;
                }
                field(Priority;Priority)
                {
                    ApplicationArea = Basic;
                }
                field("% of Completion";"% of Completion")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

