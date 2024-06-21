#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57035 "Execution Plan"
{
    PageType = ListPart;
    SourceTable = "Execution Plan";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Period;Period)
                {
                    ApplicationArea = Basic;
                }
                field("Task No.";"Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(Activity;Activity)
                {
                    ApplicationArea = Basic;
                }
                field(Duration;Duration)
                {
                    ApplicationArea = Basic;
                }
                field(Output;Output)
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

