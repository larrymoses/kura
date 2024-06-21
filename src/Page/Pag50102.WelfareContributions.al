/// <summary>
/// Page Welfare Contributions (ID 50102).
/// </summary>
page 50102 "Welfare Contributions"
{
    Caption = 'Welfare Contributions';
    PageType = List;
    SourceTable = "Hr Welfare Header";
    CardPageID = "Welfare Contribution Header";
    SourceTableView = WHERE("Welfare Type"=FILTER(Contribution));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Contribution No";Rec."Welfare No.")
                {
                }
                field(Description;Rec.Description)
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
        area(creation)
        {
            action("Import Contributions")
            {
            }
        }
    }
}

