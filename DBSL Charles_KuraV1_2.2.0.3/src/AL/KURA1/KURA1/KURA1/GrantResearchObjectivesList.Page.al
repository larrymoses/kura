#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65055 "Grant Research Objectives List"
{
    PageType = List;
    SourceTable = "Grant Research Objectives";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Research Objective";"Research Objective")
                {
                    ApplicationArea = Basic;
                }
                field("Research Program";"Research Program")
                {
                    ApplicationArea = Basic;
                }
                field("Project Area";"Project Area")
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

