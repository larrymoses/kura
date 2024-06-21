/// <summary>
/// Unknown Inventory Valuation Ext (ID 50000) extends Record Inventory Valuation.
/// </summary>
reportextension 50000 "Inventory Valuation Ext" extends "Inventory Valuation"
{
    dataset
    {
        add(Item)
        {
            Column(Purch_Account; PurchAccount)
            {

            }
        }
        modify(Item)
        {
            trigger OnAfterAfterGetRecord()
            begin
                if GenProdPostingGroup.Get(Item."Gen. Prod. Posting Group") then begin
                    GenPostingSetup.Reset();
                    GenPostingSetup.SetRange("Gen. Prod. Posting Group", GenProdPostingGroup.Code);
                    //GenPostingSetup.SetRange("Gen. Bus. Posting Group",Item.gen);
                    if GenPostingSetup.FindFirst() then
                        PurchAccount := GenPostingSetup."Purch. Account";
                end;
            end;
        }
    }
    var
        PurchAccount: Code[20];
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        GenPostingSetup: Record "General Posting Setup";
}
