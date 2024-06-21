#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50004 "pageextension50004" extends "Chart of Accounts"
{
    actions
    {
        addafter(Action1900210206)
        {
            action("TB with Totals")
            {
                ApplicationArea = Basic;
                Caption = 'TB with Totals';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "Trial Balance Total";
            }
        }
    }


    var
        ObjUserSetUp: Record "User Setup";
        UserSetup: Record "User Setup";


    //Unsupported feature: Code Insertion on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //begin
    /*
    // IF ObjUserSetUp.GET(USERID) THEN BEGIN
    //   IF ObjUserSetUp."Principal Accountant"= FALSE THEN
    //     BEGIN
    //       ERROR('You do not have permissions to create or edit chart of accounts.\\Please contact Finance Department.');
    //       END;
    //  END;
    */
    //end;


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    NoEmphasize := "Account Type" <> "Account Type"::Posting;
    NameIndent := Indentation;
    NameEmphasize := "Account Type" <> "Account Type"::Posting;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3

    // IF ObjUserSetUp.GET(USERID) THEN BEGIN
    //   IF ObjUserSetUp."Principal Accountant"= FALSE THEN
    //     BEGIN
    //       ERROR('You do not have permissions to create or edit chart of accounts.\\Please contact Finance Department.');
    //       END;
    //  END;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnInsertRecord".

    //trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    //begin
    /*
    IF UserSetup.GET(USERID) THEN BEGIN
      IF  UserSetup."View Works Inspections" = FALSE THEN BEGIN
        ERROR('You do not have permission to edit these GL Account details.Please contact your system administrator');
        END;
      END;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnModifyRecord".

    //trigger OnModifyRecord(): Boolean
    //begin
    /*
    IF UserSetup.GET(USERID) THEN BEGIN
      IF  UserSetup."View Works Inspections" = FALSE THEN BEGIN
        ERROR('You do not have permission to edit these GL Account details.Please contact your system administrator');
        END;
      END;
    */
    //end;


    //Unsupported feature: Code Modification on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetupNewGLAcc(xRec,BelowxRec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SetupNewGLAcc(xRec,BelowxRec);
    IF UserSetup.GET(USERID) THEN BEGIN
      IF  UserSetup."View Works Inspections" = FALSE THEN BEGIN
        ERROR('You do not have permission to edit these GL Account details.Please contact your system administrator');
        END;
      END;
    */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    begin

        IF ObjUserSetUp.GET(USERID) THEN
            SETRANGE("Global Dimension 1 Filter", ObjUserSetUp."Region Code");

        IF ObjUserSetUp.GET(USERID) THEN BEGIN
            IF ObjUserSetUp."Principal Accountant" = FALSE THEN BEGIN
                //   cc//// ERROR('You do not have permissions to create or edit chart of accounts.\\Please contact Finance Department.');
            END;
        END;

    end;
    //>>>> MODIFIED CODE:
    // begin

    // SetControlVisibility;


    //MESSAGE(FORMAT("Global Dimension 1 Filter"));


}

