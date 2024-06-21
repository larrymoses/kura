page 99681 "Casual Bracket Tables"
{
    ApplicationArea = All;
    Caption = 'Casual Bracket Tables';
    PageType = List;
    CardPageId="Casual Bracket Table";
    SourceTable = "Casuals Earning Bracket Table";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Table Code";Rec."Table Code")
                {
                    ApplicationArea =Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea =Basic;
                }
                field("Start Date";Rec."Start Date")
                {
                    ApplicationArea =Basic;
                }
                field("End Date";Rec."End Date")
                {
                    ApplicationArea =Basic;
                }
            }
        }
    }
}
