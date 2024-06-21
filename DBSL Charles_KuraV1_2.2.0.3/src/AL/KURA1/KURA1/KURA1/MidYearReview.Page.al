#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56212 "Mid-Year Review"
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
                    Editable = false;
                }
                field("Achieved Targets  of Annual";"Achieved Targets  of Annual")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Performance Indicator";"Performance Indicator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Percentage Cumulative Achievem";"Percentage Cumulative Achievem")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Appraisal Score";"Appraisal Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Targets changed or added";"Targets changed or added")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
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

