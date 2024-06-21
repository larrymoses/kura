#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72388 "Road Reserve Width"
{
    PageType = Card;
    SourceTable = "Road Reserve Width";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("KeRRA Road Code";"KeRRA Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage";"Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage";"End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Authentic Road Reserve Width";"Authentic Road Reserve Width")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'This is the road reserve length that is defined under the survey maps.';
                }
                field("Actual Road Reserve Width";"Actual Road Reserve Width")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'This is the road reserve length that is on the ground.';
                }
                field("Gazetted Road Code";"Gazetted Road Code")
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

