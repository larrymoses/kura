/// <summary>
/// Page Beneficiary Categories (ID 50104).
/// </summary>
page 50104 "Beneficiary Categories"
{
    Caption = 'Beneficiary Categories';
    PageType = List;
    SourceTable = "Benefits Types";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code;Rec.Code)
                {
                }
                field(Description;Rec.Description)
                {
                }
                field(Blocked;Rec.Blocked)
                {
                }
            }
        }
    }
}
