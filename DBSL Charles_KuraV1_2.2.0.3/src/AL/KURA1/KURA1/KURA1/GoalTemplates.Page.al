#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80086 "Goal Templates"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Goal Template";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Global;Global)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Responsibility Center";"Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID";"Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Year Code";"Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Goal Template Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Goal Template Lines';
                Image = AddAction;
                Promoted = true;
                RunObject = Page "Goal Template Lines";
                RunPageLink = "Goal Template ID"=field(Code);
            }
        }
    }
}

