#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80416 "Sub Objectives and Outcomes"
{
    PageType = ListPart;
    SourceTable = "Sub Objective Evaluation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Objective/Initiative";"Objective/Initiative")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty";"Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Final/Actual Qty";"Final/Actual Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Weight %";"Weight %")
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

