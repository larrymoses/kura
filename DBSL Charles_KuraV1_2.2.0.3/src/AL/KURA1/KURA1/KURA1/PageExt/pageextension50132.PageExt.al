
PageExtension 50132 "pageextension50132" extends "Purchase Invoices"
{


    layout
    {



    }
    var
        UserSetup: Record "User Setup";





    trigger OnOpenPage()
    var

    begin
        if rec.Status = rec.status::"Pending Approval" then
            CurrPage.Editable := false;


    end;



    trigger OnAfterGetCurrRecord()

    begin
        if rec.Status = rec.status::"Pending Approval" then
            CurrPage.Editable := false;


    end;


    
    /*
    #1..5


    //Fred RCs
    IF UserSetup.GET(USERID) THEN BEGIN
      SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
      END;
    */
    //end;
}

