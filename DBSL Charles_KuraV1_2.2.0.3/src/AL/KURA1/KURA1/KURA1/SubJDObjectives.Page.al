#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80377 "Sub JD Objectives"
{
    PageType = ListPart;
    SourceTable = "Sub JD Objective";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line Number";"Line Number")
                {
                    ApplicationArea = Basic;
                }
                field("Sub Initiative No.";"Sub Initiative No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Imported Annual Target Qty";"Imported Annual Target Qty")
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

