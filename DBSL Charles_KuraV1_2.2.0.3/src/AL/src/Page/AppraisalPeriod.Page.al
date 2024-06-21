#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56204 "Appraisal Period"
{
    ApplicationArea = Basic;
    Caption = 'Period';
    PageType = List;
    SourceTable = "Appraisal  Period";
    UsageCategory = Administration;

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
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6;Notes)
            {
            }
        }
    }

    actions
    {
    }
}

