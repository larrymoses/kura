#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72712 "Layer Test Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Layer Test Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Layer Code";"Layer Code")
                {
                    ApplicationArea = Basic;
                }
                field("Test Code";"Test Code")
                {
                    ApplicationArea = Basic;
                }
                field("Test Description";"Test Description")
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

