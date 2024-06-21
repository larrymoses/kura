#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50012 "pageextension50012" extends "Item Card"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Item Card"(Page 30)".

    layout
    {

        //Unsupported feature: Property Deletion (Visible) on ""No."(Control 2)".

        addafter(Description)
        {
            field("Description 3"; Rec."Description 3") { ApplicationArea = all; }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Cost is Posted to G/L")
        {
            field("Vote Item"; Rec."Vote Item")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Item Category Code")
        {
            field("Procurement Category"; Rec."Procurement Category") { ApplicationArea = basic; }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        IsInventoriable := true;
    end;
}

#pragma implicitwith restore

