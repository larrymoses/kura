#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72387 "Road Reserve Widths"
{
    CardPageID = "Road Reserve Width";
    PageType = List;
    SourceTable = "Road Reserve Width";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("KeRRA Road Code"; Rec."KeRRA Road Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'KURA Road Code';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Authentic Road Reserve Width"; Rec."Authentic Road Reserve Width")
                {
                    ApplicationArea = Basic;
                    Caption = 'Authentic Road Reserve Width(M)';
                    ToolTip = 'This is the road reserve length that is defined under the survey maps.';
                }
                field("Actual Road Reserve Width"; Rec."Actual Road Reserve Width")
                {
                    ApplicationArea = Basic;
                    Caption = 'Actual Road Reserve Width(M)';
                    ToolTip = 'This is the road reserve length that is on the ground.';
                }
                field("Gazetted Road Code"; Rec."Gazetted Road Code")
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

#pragma implicitwith restore

