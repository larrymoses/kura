pageextension 50150 "Salesperson/Purchaser Ext" extends "Salesperson/Purchaser Card"
{
    layout
    {
        addafter(Invoicing)
        {
            group(Communication)
            {
                field("Receive Reorder Notification"; Rec."Receive Reorder Notification")
                {
                    ApplicationArea = Suite;
                }
            }
        }
    }
}