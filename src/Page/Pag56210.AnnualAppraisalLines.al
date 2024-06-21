#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56210 "Annual Appraisal Lines"
{
    PageType = ListPart;
    SourceTable = "Annual  Appraisal Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Agreed Performance Targets";"Agreed Performance Targets")
                {
                    ApplicationArea = Basic;
                }
                field("Achieved Targets  of Annual";"Achieved Targets  of Annual")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Indicator";"Performance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("Percentage Cumulative Achievem";"Percentage Cumulative Achievem")
                {
                    ApplicationArea = Basic;
                }
                field("Appraisal Score";"Appraisal Score")
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

