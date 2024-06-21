#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50038 "pageextension50038" extends "Posted Sales Invoices"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Posted Sales Invoices"(Page 143)".

    var
        UserSetup: Record "User Setup";


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    HasPostedSalesInvoices := TRUE;
    CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    CRMIsCoupledToRecord := CRMIntegrationEnabled;
    IF CRMIsCoupledToRecord THEN
      CRMIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(RECORDID);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5

    //Fred RCs
    IF UserSetup.GET(USERID) THEN BEGIN
      SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF DocExchStatusVisible THEN
      DocExchStatusStyle := GetDocExchStatusStyle;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF DocExchStatusVisible THEN
      DocExchStatusStyle := GetDocExchStatusStyle;

    //Fred RCs
    IF UserSetup.GET(USERID) THEN BEGIN
      SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    HasFilters := GETFILTERS <> '';
    SetSecurityFilterOnRespCenter;
    CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
    IF HasFilters THEN
      IF FINDFIRST THEN;
    IsOfficeAddin := OfficeMgt.IsAvailable;
    IsFoundationEnabled := ApplicationAreaMgmtFacade.IsFoundationEnabled;
    SalesInvoiceHeader.COPYFILTERS(Rec);
    SalesInvoiceHeader.SETFILTER("Document Exchange Status",'<>%1',"Document Exchange Status"::"Not Sent");
    DocExchStatusVisible := NOT SalesInvoiceHeader.ISEMPTY;
    */
    //end;
    //>>>> MODIFIED CODE:
    begin

        // HasFilters := GETFILTERS <> '';
        //SetSecurityFilterOnRespCenter;



        //Fred RCs
        IF UserSetup.GET(USERID) THEN BEGIN
        if not UserSetup."Accounts Administrator" then
            Rec.SETRANGE("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        END;

    end;
}

#pragma implicitwith restore

