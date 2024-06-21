page 99682 "Casual Bracket Table"
{
    Caption = 'Bracket Table';
    PageType = Card;
    SourceTable = "Casuals Earning Bracket Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Table Code"; Rec."Table Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }

            }
            part("Casual Bracket Lines"; "Casual Bracket Lines")
            {
                Caption = 'Lines';
                SubPageLink = "Table Code" = field("Table Code");
                UpdatePropagation = Both;
            }
        }
    }
}
