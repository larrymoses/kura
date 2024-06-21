page 99683 "Casual Bracket Lines"
{
    Caption = 'Casual Bracket Lines';
    PageType = ListPart;
    SourceTable =  "Casual Bracket table lines";
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Category;Rec.Category)
                {
                    ApplicationArea =Basic;
                }
                 field(Grade;Rec.Grade)
                {
                    ApplicationArea =Basic;
                }
                 field("Hourly Rate";Rec."Hourly Rate")
                {
                    ApplicationArea =Basic;
                }
                 field("Daily Rate";Rec."Daily Rate")
                {
                    ApplicationArea =Basic;
                }
                 field("Monthly Contract Rate";Rec."Monthly Contract Rate")
                {
                    ApplicationArea =Basic;
                }
            }
        }
    }
}
