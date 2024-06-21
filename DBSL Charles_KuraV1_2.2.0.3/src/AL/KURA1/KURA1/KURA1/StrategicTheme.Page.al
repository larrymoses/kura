#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80027 "Strategic Theme"
{
    PageType = List;
    SourceTable = "Strategic Theme";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Strategic Plan ID"; Rec."Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Theme ID"; Rec."Theme ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Key Result Area';

                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Strategic Issue"; Rec."Primary Strategic Issue")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Strategic Goals"; Rec."No. of Strategic Goals")
                {
                    ApplicationArea = basic;
                }
                field("No. of Strategic Objectives"; Rec."No. of Strategic Objectives")
                {
                    ApplicationArea = Basic;
                }

                field("No. of Strategies"; Rec."No. of Strategies")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Strategic Initiatives"; Rec."No. of Strategic Initiatives")
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

