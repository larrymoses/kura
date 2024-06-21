/// <summary>
/// Page Subscriptions Conference Lines (ID 50046).
/// </summary>
page 50049 "Subscriptions Conference Lines"
{
    Caption = 'Subscriptions Conference Lines';
    PageType = ListPart;
    SourceTable = "Subscription Conference Lines";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Member No. field.', Comment = '%';
                }
                field(Member; Rec.Member)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Member field.', Comment = '%';
                    visible = false;
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Member Name field.', Comment = '%';
                }
                field("Professional Body Name";Rec."Professional Body Name")
                {
                    ApplicationArea = All;
                    Caption = 'Professional Body';
                }
                field("Course Fee";Rec."Course Fee")
                {
                    ApplicationArea = All;
                }
                field("Points Earned"; Rec."Points Earned")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Points Earned field.', Comment = '%';
                }
                field(Feedback; Rec.Feedback)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
