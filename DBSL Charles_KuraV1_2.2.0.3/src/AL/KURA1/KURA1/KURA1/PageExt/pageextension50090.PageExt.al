#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50090 "pageextension50090" extends "Rating Answers" 
{

    //Unsupported feature: Code Modification on "OnInsertRecord".

    //trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Type := Type::Answer;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        Type := Type::Question;
        */
    //end;
}

