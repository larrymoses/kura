/// <summary>
/// Page Matanga Contributions (ID 50099).
/// </summary>
page 50099 "Matanga Contributions"
{
    Caption = 'Matanga Contributions';
    PageType = List;
    SourceTable = "Hr Welfare Header";
    CardPageID = "Matanga Contribution Header";
    SourceTableView = WHERE("Welfare Category"=FILTER(1));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Welfare No.";Rec."Welfare No.")
                {
                }
                field("Welfare Type";Rec."Welfare Type")
                {
                }
                field(Description;Rec.Description)
                {
                }
                field("Welfare Category";Rec."Welfare Category")
                {
                }
                field("Created By";Rec."Created By")
                {
                }
                field("Created On";Rec."Created On")
                {
                }
                field("Total Amount";Rec."Total Amount")
                {
                }
            }
        }
    }

    actions
    {
    }
}

