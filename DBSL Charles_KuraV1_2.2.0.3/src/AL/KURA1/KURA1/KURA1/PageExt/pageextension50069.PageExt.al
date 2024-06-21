#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50069 "pageextension50069" extends "Purchase Documents" 
{

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SETFILTER("Due Date",'<%1',WORKDATE);
        SETRANGE("Document Type","Document Type"::Invoice);
        SETFILTER("Remaining Amt. (LCY)" ,'<>0');
        ASCENDING := TRUE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SETFILTER("Due Date",'<%1',WORKDATE);
        SETRANGE("Document Type","Document Type"::Payment);
        SETFILTER("Remaining Amt. (LCY)" ,'<>0');
        ASCENDING := TRUE;
        */
    //end;


    //Unsupported feature: Code Modification on "SetFilterForOverduePurInvoiceAmount(PROCEDURE 3)".

    //procedure SetFilterForOverduePurInvoiceAmount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        RESET;
        SETFILTER("Due Date",'<%1',WORKDATE);
        SETRANGE("Document Type","Document Type"::Invoice);
        SETFILTER("Remaining Amt. (LCY)" ,'<>0');
        ASCENDING := TRUE;
        CurrPage.UPDATE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        RESET;
        SETFILTER("Due Date",'<%1',WORKDATE);
        SETRANGE("Document Type","Document Type"::Payment);
        #4..6
        */
    //end;
}

