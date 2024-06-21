#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69468 "HSE Plan Line Hazard Controls"
{
    CardPageID = "HSE Plan Line Hazard Control";
    PageType = List;
    SourceTable = 69434;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID";"Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Hazard ID";"Hazard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Hazard Type";"Hazard Type")
                {
                    ApplicationArea = Basic;
                }
                field("Control ID";"Control ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Responsibility;Responsibility)
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer No.";"Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Action Status";"Action Status")
                {
                    ApplicationArea = Basic;
                }
                field("% Complete";"% Complete")
                {
                    ApplicationArea = Basic;
                }
                field("Task Priority";"Task Priority")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date";"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Due Date";"Planned Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Date Done";"Actual Date Done")
                {
                    ApplicationArea = Basic;
                }
                field("Action Type";"Action Type")
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
