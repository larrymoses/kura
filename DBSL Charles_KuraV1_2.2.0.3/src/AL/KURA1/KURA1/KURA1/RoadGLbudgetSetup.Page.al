
Page 72315 "Road G/L budget Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Road G/L budget Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Road Project Category"; Rec."Road Project Category")
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



