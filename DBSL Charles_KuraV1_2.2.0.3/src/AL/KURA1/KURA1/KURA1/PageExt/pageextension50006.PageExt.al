#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50006 "pageextension50006" extends "General Ledger Entries" 
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Debit Amount"(Control 17)".


        //Unsupported feature: Property Modification (Visible) on ""Credit Amount"(Control 19)".


        //Unsupported feature: Property Deletion (Editable) on ""Debit Amount"(Control 17)".

        addafter("User ID")
        {
            // field("Source Type";"Source Type")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Source No.";"Source No.")
            // {
            //     ApplicationArea = Basic;
            // }
        }
        addafter("External Document No.")
        {
            field("Transaction No.";"Transaction No.")
            {
                ApplicationArea = Basic;
            }
        }
    }

    var
        ObjUserSetup: Record "User Setup";


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetControlVisibility;

        IF GETFILTERS <> '' THEN
          IF FINDFIRST THEN;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4


        // IF ObjUserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Global Dimension 1 Code",ObjUserSetup."Region Code");
        //  END;
        */
    //end;

    //Unsupported feature: Property Deletion (DeleteAllowed).

}

