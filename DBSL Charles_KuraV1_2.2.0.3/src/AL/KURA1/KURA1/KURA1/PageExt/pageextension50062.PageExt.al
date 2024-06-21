#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50062 "pageextension50062" extends "Approval Request Entries" 
{

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Usersetup.GET(USERID) THEN
          IF NOT Usersetup."Approval Administrator" THEN BEGIN
            FILTERGROUP(2);
            SETCURRENTKEY("Sender ID");
            SETFILTER("Sender ID",'=%1',Usersetup."User ID");
            FILTERGROUP(0);
          END;

        SETRANGE(Status);
        SETRANGE("Due Date");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        // IF Usersetup.GET(USERID) THEN
        //  IF NOT Usersetup."Approval Administrator" THEN BEGIN
        //    FILTERGROUP(2);
        //    SETCURRENTKEY("Sender ID");
        //    SETFILTER("Sender ID",'=%1',Usersetup."User ID");
        //    FILTERGROUP(0);
        //  END;
        #8..10
        */
    //end;
}

