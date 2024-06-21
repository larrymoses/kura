#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50103 "pageextension50103" extends "Fixed Asset List"
{

    layout
    {
        addafter("No.")
        {
            field("Serial No."; "Serial No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("FA Subclass Code")
        {
            field("Location Code"; "Location Code")
            {
                ApplicationArea = Basic;
            }
        }
    }
    trigger OnOpenPage()
    begin
        IF UserSetup.GET(USERID) THEN
            SETRANGE("Global Dimension 1 Code", UserSetup."Region Code");
        ;
    end;

    var
        UserSetup: Record "User Setup";


    //Unsupported feature: Code Insertion on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //begin
    /*
    IF UserSetup.GET(USERID) THEN BEGIN
      SETRANGE("Location Code",UserSetup."Purchase Resp. Ctr. Filter");
      END;
    IF UserSetup.GET(USERID) THEN BEGIN
      IF (UserSetup."Amend Bank Account Details"=TRUE) THEN
        RESET;
      END;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    IF UserSetup.GET(USERID) THEN BEGIN
      SETRANGE("Location Code",UserSetup."Purchase Resp. Ctr. Filter");
      END;
    IF UserSetup.GET(USERID) THEN BEGIN
      IF (UserSetup."Amend Bank Account Details"=TRUE) THEN
        RESET;
      END;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnOpenPage".

    //trigger OnOpenPage()
    //begin
    /*
    IF UserSetup.GET(USERID) THEN BEGIN
      SETRANGE("Location Code",UserSetup."Purchase Resp. Ctr. Filter");
      END;
      IF UserSetup.GET(USERID) THEN BEGIN
      IF (UserSetup."Amend Bank Account Details"=TRUE) THEN
        RESET;
      END;
    */
    //end;
}

