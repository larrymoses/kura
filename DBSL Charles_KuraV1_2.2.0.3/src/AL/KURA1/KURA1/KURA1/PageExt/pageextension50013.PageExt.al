#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50013 "pageextension50013" extends "Item List"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Item List"(Page 31)".


    //Unsupported feature: Property Insertion (SourceTableView) on ""Item List"(Page 31)".

    layout
    {

        //Unsupported feature: Property Insertion (Visible) on ""No."(Control 2)".

        addafter("No.")
        {
            field("Vote Item"; Rec."Vote Item")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
        addafter(Type)
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

