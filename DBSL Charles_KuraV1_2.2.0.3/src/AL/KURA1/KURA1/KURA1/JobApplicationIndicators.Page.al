#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69274 "Job Application Indicators"
{
    PageType = List;
    SourceTable = "Applications Accomplishmentss";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job Indicator Code";"Job Indicator Code")
                {
                    ApplicationArea = Basic;
                }
                field("Indicator Description";"Indicator Description")
                {
                    ApplicationArea = Basic;
                }
                field(Number;Number)
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments";"Additional Comments")
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

