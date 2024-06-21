#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50091 "pageextension50091" extends "Create Rating Subform" 
{

    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        StyleIsStrong := Type = Type::Question;
        IF Type <> Type::Question THEN
          DescriptionIndent := 1
        ELSE
          DescriptionIndent := 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        StyleIsStrong := Type = Type::" ";
        IF Type <> Type::" " THEN
        #3..5
        */
    //end;
}

