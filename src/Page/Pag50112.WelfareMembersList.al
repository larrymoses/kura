/// <summary>
/// Page Welfare Members List (ID 50112).
/// </summary>
page 50112 "Welfare Members List"
{
    Caption = 'Welfare Members List';
    PageType = List;
    SourceTable = Employee;
    SourceTableView = ORDER(Ascending)
                      WHERE("Welfare Member"=CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";Rec."No.")
                {
                }
                field("First Name";Rec."First Name")
                {
                }
                field("Middle Name";Rec."Middle Name")
                {
                }
                field("Last Name";Rec."Last Name")
                {
                }
                field(Address;Rec.Address)
                {
                }
                field("Address 2";Rec."Address 2")
                {
                }
                field("Phone No.";Rec."Phone No.")
                {
                }
                field("Global Dimension 1 Code";Rec."Global Dimension 1 Code")
                {
                }
                field("Welfare Member";Rec."Welfare Member")
                {
                }
                field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
                {
                }
                field("Company E-Mail";Rec."Company E-Mail")
                {
                }
            }
        }
    }

    actions
    {
    }
}

