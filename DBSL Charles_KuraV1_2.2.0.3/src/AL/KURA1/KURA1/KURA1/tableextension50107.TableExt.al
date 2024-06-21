#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50107 "tableextension50107" extends "Contact Profile Answer" 
{
    fields
    {
        modify("Line No.")
        {
            TableRelation = "Profile Questionnaire Line"."Line No." where ("Profile Questionnaire Code"=field("Profile Questionnaire Code"),
                                                                           Type=const(Question));
        }
    }

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ProfileQuestnLine.GET("Profile Questionnaire Code","Line No.");
        ProfileQuestnLine.TESTFIELD(Type,ProfileQuestnLine.Type::Answer);

        ProfileQuestnLine2.GET("Profile Questionnaire Code",QuestionLineNo);
        ProfileQuestnLine2.TESTFIELD("Auto Contact Classification",FALSE);

        IF NOT ProfileQuestnLine2."Multiple Answers" THEN BEGIN
          ContProfileAnswer.RESET;
          ProfileQuestnLine3.RESET;
          ProfileQuestnLine3.SETRANGE("Profile Questionnaire Code","Profile Questionnaire Code");
          ProfileQuestnLine3.SETRANGE(Type,ProfileQuestnLine3.Type::Question);
          ProfileQuestnLine3.SETFILTER("Line No.",'>%1',ProfileQuestnLine2."Line No.");
          IF ProfileQuestnLine3.FINDFIRST THEN
            ContProfileAnswer.SETRANGE(
        #15..27
        END;

        Contact.TouchContact("Contact No.");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ProfileQuestnLine.GET("Profile Questionnaire Code","Line No.");
        ProfileQuestnLine.TESTFIELD(Type,ProfileQuestnLine.Type::Question);
        #3..10
          ProfileQuestnLine3.SETRANGE(Type,ProfileQuestnLine3.Type::" ");
        #12..30
        */
    //end;


    //Unsupported feature: Code Modification on "QuestionLineNo(PROCEDURE 3)".

    //procedure QuestionLineNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH ProfileQuestnLine DO BEGIN
          RESET;
          SETRANGE("Profile Questionnaire Code",Rec."Profile Questionnaire Code");
          SETFILTER("Line No.",'<%1',Rec."Line No.");
          SETRANGE(Type,Type::Question);
          IF FINDLAST THEN
            EXIT("Line No.")
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
          SETRANGE(Type,Type::" ");
        #6..8
        */
    //end;


    //Unsupported feature: Code Modification on "PartOfRating(PROCEDURE 4)".

    //procedure PartOfRating();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Rating.SETCURRENTKEY("Rating Profile Quest. Code","Rating Profile Quest. Line No.");
        Rating.SETRANGE("Rating Profile Quest. Code","Profile Questionnaire Code");

        ProfileQuestnLine.GET("Profile Questionnaire Code","Line No.");
        ProfileQuestnLine.GET("Profile Questionnaire Code",ProfileQuestnLine.FindQuestionLine);

        ProfileQuestnLine2 := ProfileQuestnLine;
        ProfileQuestnLine2.SETRANGE(Type,ProfileQuestnLine2.Type::Question);
        ProfileQuestnLine2.SETRANGE("Profile Questionnaire Code",ProfileQuestnLine2."Profile Questionnaire Code");
        IF ProfileQuestnLine2.NEXT <> 0 THEN
          Rating.SETRANGE("Rating Profile Quest. Line No.",ProfileQuestnLine."Line No.",ProfileQuestnLine2."Line No.")
        ELSE
          Rating.SETFILTER("Rating Profile Quest. Line No.",'%1..',ProfileQuestnLine."Line No.");

        EXIT(Rating.FINDFIRST);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
        ProfileQuestnLine2.SETRANGE(Type,ProfileQuestnLine2.Type::" ");
        #9..15
        */
    //end;
}

