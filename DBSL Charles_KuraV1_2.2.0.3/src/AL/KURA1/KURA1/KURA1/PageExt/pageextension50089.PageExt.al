#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50089 "pageextension50089" extends "Answer Points" 
{
    layout
    {

        //Unsupported feature: Code Modification on "Points(Control 1).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD(Type,Type::Answer);

            IF Rating.GET(TargetQuestnCode,TargetQuestLineNo,"Profile Questionnaire Code","Line No.") THEN
              IF Points = 0 THEN
            #5..14
              Rating.Points := Points;
              Rating.INSERT(TRUE);
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            TESTFIELD(Type,Type::Question);
            #2..17
            */
        //end;
    }


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Rating.GET(TargetQuestnCode,TargetQuestLineNo,"Profile Questionnaire Code","Line No.") THEN
          Points := Rating.Points
        ELSE
          Points := 0;

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
        #1..5
        StyleIsStrong := Type = Type::" ";
        IF Type <> Type::" " THEN
        #8..10
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TargetQuestnCode := "Profile Questionnaire Code";
        TargetQuestLineNo := "Line No.";
        TargetQuestnLineNoEnd := "Line No.";
        CurrQuestnCode := "Profile Questionnaire Code";

        IF TempProfileQuestnLine.GET(TargetQuestnCode,"Line No.") THEN
          WHILE (TempProfileQuestnLine.NEXT <> 0) AND
                (TempProfileQuestnLine.Type = TempProfileQuestnLine.Type::Answer)
          DO
            TargetQuestnLineNoEnd := TempProfileQuestnLine."Line No.";

        SetRatingFilter;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
                (TempProfileQuestnLine.Type = TempProfileQuestnLine.Type::Question)
        #9..12
        */
    //end;
}

