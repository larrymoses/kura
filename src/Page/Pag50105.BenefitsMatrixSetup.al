/// <summary>
/// Page Benefits Matrix Setup (ID 50105).
/// </summary>
page 50105 "Benefits Matrix Setup"
{
    Caption = 'Benefits Matrix Setup';
    PageType = List;
    SourceTable = "Benefits Matrix Setup";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Benefit Type";Rec."Benefit Type")
                {
                }
                field("Benefit Description";Rec."Benefit Description")
                {
                }
                field("Beneficiary Category";Rec."Beneficiary Category")
                {
                }
                field(Amount;Rec.Amount)
                {
                }
            }
        }
    }
}
