#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50101 "pageextension50101" extends "Order Planning" 
{

    //Unsupported feature: Code Modification on "ShowDemandOrder(PROCEDURE 15)".

    //procedure ShowDemandOrder();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE "Demand Type" OF
          DATABASE::"Sales Line":
            BEGIN
        #4..40
            BEGIN
              Job.GET("Demand Order No.");
              CASE Job.Status OF
                Job.Status::Open:
                  PAGE.RUN(PAGE::"Job Card",Job);
              END;
            END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..43
                Job.Status::"Completed/Under DLP":
        #45..48
        */
    //end;
}

