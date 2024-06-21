#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50088 "pageextension50088" extends "Profile Questn. Line Subform" 
{
    layout
    {

        //Unsupported feature: Code Modification on "Set(Control 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD(Type,Type::Answer);

            IF Set THEN BEGIN
              TempProfileQuestionnaireLine.INIT;
            #5..8
              TempProfileQuestionnaireLine.GET("Profile Questionnaire Code","Line No.");
              TempProfileQuestionnaireLine.DELETE;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            TESTFIELD(Type,Type::Question);
            #2..11
            */
        //end;
    }


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Set := TempProfileQuestionnaireLine.GET("Profile Questionnaire Code","Line No.");
        StyleIsStrong := Type = Type::Question;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        Set := TempProfileQuestionnaireLine.GET("Profile Questionnaire Code","Line No.");
        StyleIsStrong := Type = Type::" ";
        */
    //end;
}

