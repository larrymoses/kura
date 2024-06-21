#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50011 "pageextension50011" extends "Vendor Ledger Entries"
{

    //Unsupported feature: Property Modification (Permissions) on ""Vendor Ledger Entries"(Page 29)".


    //Unsupported feature: Property Modification (InsertAllowed) on ""Vendor Ledger Entries"(Page 29)".


    //Unsupported feature: Property Modification (DeleteAllowed) on ""Vendor Ledger Entries"(Page 29)".

    Editable = true;
    layout
    {
        addafter("Dimension Set ID")
        {
            field("Project No"; Rec."Project No")
            {
                ApplicationArea = Basic;
            }
            field("Contractor No"; Rec."Contractor No")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on ""Show Document"(Action 13).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowDoc
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        ShowDoc
        */
        //end;
    }
}

#pragma implicitwith restore

