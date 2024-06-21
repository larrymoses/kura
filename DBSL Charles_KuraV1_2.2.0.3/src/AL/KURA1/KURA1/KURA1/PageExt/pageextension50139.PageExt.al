#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50139 "pageextension50139" extends "Order Promising Lines" 
{

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        OrderPromisingCalculationDone := FALSE;
        Accepted := FALSE;
        IF GETFILTER("Source ID") <> '' THEN
        #4..10
              END;
            "Source Type"::Job:
              BEGIN
                Job.Status := Job.Status::Open;
                Job."No." := GETRANGEMIN("Source ID");
                Job.FIND;
                SetJob(Job);
        #18..22
              SetSalesHeader(SalesHeader);
              AcceptButtonEnable := SalesHeader.Status = SalesHeader.Status::Open;
          END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..13
                Job.Status := Job.Status::"Completed/Under DLP";
        #15..25
        */
    //end;
}

