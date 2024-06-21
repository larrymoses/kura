#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50081 "pageextension50081" extends "Profile Question Details" 
{

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SETRANGE(Type,Type::Question);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SETRANGE(Type,Type::" ");
        */
    //end;
}

