#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50082 "pageextension50082" extends "Contact Profile Answers" 
{

    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Set := ContProfileAnswer.GET(Cont."No.","Profile Questionnaire Code","Line No.");

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
        Set := ContProfileAnswer.GET(Cont."No.","Profile Questionnaire Code","Line No.");

        StyleIsStrong := Type = Type::" ";
        IF Type <> Type::" " THEN
        #5..7
        */
    //end;


    //Unsupported feature: Code Modification on "OnFindRecord".

    //trigger OnFindRecord()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ProfileQuestionnaireLine2.COPY(Rec);

        IF NOT ProfileQuestionnaireLine2.FIND(Which) THEN
          EXIT(FALSE);

        ProfileQuestLineQuestion := ProfileQuestionnaireLine2;
        IF ProfileQuestionnaireLine2.Type = Type::Answer THEN
          ProfileQuestLineQuestion.GET(ProfileQuestionnaireLine2."Profile Questionnaire Code",ProfileQuestLineQuestion.FindQuestionLine);

        OK := TRUE;
        #11..16
              GoNext := ProfileQuestionnaireLine2.NEXT(1) <> 0;
            IF GoNext THEN BEGIN
              ProfileQuestLineQuestion := ProfileQuestionnaireLine2;
              IF ProfileQuestionnaireLine2.Type = Type::Answer THEN
                ProfileQuestLineQuestion.GET(
                  ProfileQuestionnaireLine2."Profile Questionnaire Code",ProfileQuestLineQuestion.FindQuestionLine);
              OK := NOT ProfileQuestLineQuestion."Auto Contact Classification";
        #24..29

        Rec := ProfileQuestionnaireLine2;
        EXIT(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
        IF ProfileQuestionnaireLine2.Type = Type::Question THEN
        #8..19
              IF ProfileQuestionnaireLine2.Type = Type::Question THEN
        #21..32
        */
    //end;


    //Unsupported feature: Code Modification on "OnNextRecord".

    //trigger OnNextRecord()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ProfileQuestionnaireLine2.COPY(Rec);

        IF Steps > 0 THEN
        #4..6

        REPEAT
          IF ProfileQuestionnaireLine2.NEXT(Step) <> 0 THEN BEGIN
            IF ProfileQuestionnaireLine2.Type = Type::Answer THEN
              ProfileQuestLineQuestion.GET(
                ProfileQuestionnaireLine2."Profile Questionnaire Code",ProfileQuestionnaireLine2.FindQuestionLine);
            IF ((NOT ProfileQuestLineQuestion."Auto Contact Classification") AND
                (ProfileQuestionnaireLine2.Type = Type::Answer)) OR
               ((ProfileQuestionnaireLine2.Type = Type::Question) AND (NOT ProfileQuestionnaireLine2."Auto Contact Classification"))
            THEN BEGIN
              ActualSteps := ActualSteps + Step;
              IF Steps <> 0 THEN
        #19..22
        UNTIL (ActualSteps = Steps) OR NoOneFound;

        EXIT(ActualSteps);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..9
            IF ProfileQuestionnaireLine2.Type = Type::Question THEN
        #11..13
                (ProfileQuestionnaireLine2.Type = Type::Question)) OR
               ((ProfileQuestionnaireLine2.Type = Type::" ") AND (NOT ProfileQuestionnaireLine2."Auto Contact Classification"))
        #16..25
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateProfileAnswer(PROCEDURE 2)".

    //procedure UpdateProfileAnswer();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF NOT RunFormCode AND Set THEN
          TESTFIELD(Type,Type::Answer);

        IF Set THEN BEGIN
          ContProfileAnswer.INIT;
        #6..13
            ContProfileAnswer.DELETE(TRUE);

        OnAfterUpdateProfileAnswer(Rec,xRec,Cont);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF NOT RunFormCode AND Set THEN
          TESTFIELD(Type,Type::Question);
        #3..16
        */
    //end;
}

