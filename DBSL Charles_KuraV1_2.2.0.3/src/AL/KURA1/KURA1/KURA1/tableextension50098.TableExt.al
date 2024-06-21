#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50098 "tableextension50098" extends "Notification Entry" 
{

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Created Date-Time" := ROUNDDATETIME(CURRENTDATETIME,60000);
        "Created By" := USERID;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        "Created Date-Time" := ROUNDDATETIME(CURRENTDATETIME,60000);
        "Created By" := USERID;

        //Call the codeunit on insert
        CODEUNIT.RUN(1509);
        */
    //end;


    //Unsupported feature: Code Modification on "CreateNew(PROCEDURE 1)".

    //procedure CreateNew();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF NOT DataTypeManagement.GetRecordRef(NewRecord,NewRecRef) THEN
          EXIT;

        InsertRec(NewType,NewUserID,NewRecRef.RECORDID,NewLinkTargetPage,NewCustomLink,'');
        NotificationSchedule.ScheduleNotification(Rec);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        //Fred Commented Advised by Reychelle====Finance
        {IF NOT DataTypeManagement.GetRecordRef(NewRecord,NewRecRef) THEN
        #2..4
        NotificationSchedule.ScheduleNotification(Rec);}
        */
    //end;


    //Unsupported feature: Code Modification on "CreateNewEntry(PROCEDURE 4)".

    //procedure CreateNewEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF NOT DataTypeManagement.GetRecordRef(NewRecord,NewRecRef) THEN
          EXIT;

        InsertRec(NewType,NewUserID,NewRecRef.RECORDID,NewLinkTargetPage,NewCustomLink,NewSenderUserID);
        NotificationSchedule.ScheduleNotification(Rec);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        //Fred Commented Advised by Reychelle====Finance
        {IF NOT DataTypeManagement.GetRecordRef(NewRecord,NewRecRef) THEN
        #2..4
        NotificationSchedule.ScheduleNotification(Rec);}
        */
    //end;


    //Unsupported feature: Code Modification on "InsertRec(PROCEDURE 6)".

    //procedure InsertRec();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(Rec);
        Type := NewType;
        "Recipient User ID" := NewUserID;
        "Triggered By Record" := NewRecordID;
        "Link Target Page" := NewLinkTargetPage;
        "Custom Link" := NewCustomLink;
        "Sender User ID" := NewSenderUserID;
        INSERT(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ////Fred Commented Advised by Reychelle====Finance
        {CLEAR(Rec);
        #2..7
        INSERT(TRUE);}
        */
    //end;
}

