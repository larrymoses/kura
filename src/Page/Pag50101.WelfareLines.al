/// <summary>
/// Page Welfare Lines (ID 50101).
/// </summary>
page 50101 "Welfare Lines"
{
    Caption = 'Welfare Lines';
    PageType = ListPart;
    SourceTable = "Welfare Lines";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Employee No.";Rec."Employee No.")
                {
                }
                field("Employee Name";Rec."Employee Name")
                {
                }
                field(Month;Rec.Month)
                {
                }
                field(Date;Rec.Date)
                {
                }
                field(Amount;Rec.Amount)
                {
                }
            }
        }
    }

    actions
    {
    }
}

