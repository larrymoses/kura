#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80052 "Workplan Risk"
{
    PageType = List;
    SourceTable = "PC Risk";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk Source Class"; Rec."Risk Source Class")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Category"; Rec."Risk Category")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Description"; Rec."Risk Description")
                {
                    ApplicationArea = Basic;
                }
                field("Inherent Likelihood Level"; Rec."Inherent Likelihood Level")
                {
                    ApplicationArea = Basic;
                }
                field("Inherent Impact Level"; Rec."Inherent Impact Level")
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

