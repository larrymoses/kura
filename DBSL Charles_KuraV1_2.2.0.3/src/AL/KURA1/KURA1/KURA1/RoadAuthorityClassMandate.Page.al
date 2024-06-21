#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72143 "Road Authority Class Mandate"
{
    PageType = List;
    SourceTable = "Road Authority Class Mandate";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Authority Code";"Road Authority Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class ID";"Road Class ID")
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

