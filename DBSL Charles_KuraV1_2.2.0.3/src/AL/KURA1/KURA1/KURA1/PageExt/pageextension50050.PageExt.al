#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50050 "pageextension50050" extends "Bank Acc. Reconciliation List"
{
    var
        UserSetup: Record "User Setup";


    //Unsupported feature: Code Insertion on "OnAfterGetCurrRecord".

    trigger OnAfterGetCurrRecord()
    begin

        IF UserSetup.GET(USERID) THEN BEGIN
            Rec.SETRANGE("Responsibility Center", UserSetup."Responsibility Center");
        END;

    end;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    IF UserSetup.GET(USERID) THEN
      BEGIN
        SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        END;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnOpenPage".

    trigger OnOpenPage()
    begin

        IF UserSetup.GET(USERID) THEN BEGIN
            Rec.SETRANGE("Responsibility Center", UserSetup."Responsibility Center");
        END;

    end;
}

