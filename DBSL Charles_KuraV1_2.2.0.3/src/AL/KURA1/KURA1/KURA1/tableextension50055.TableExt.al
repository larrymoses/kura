#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50055 "tableextension50055" extends "Payment Method" 
{

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF IdentityManagement.IsInvAppId THEN
          IF NOT "Use for Invoicing" THEN
            VALIDATE("Use for Invoicing",TRUE);

        "Last Modified Date Time" := CURRENTDATETIME;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        //ERROR('You are not allowed to create payment methods');
        #1..5
        */
    //end;
}

