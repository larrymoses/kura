#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50053 "pageextension50053" extends "Vendor Bank Account Card" 
{
    layout
    {
        modify(Contact)
        {
            Caption = 'Payee';
        }
        addafter("Currency Code")
        {
            field("Bank Code";"Bank Code")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Transit No.")
        {
            field(Blocked;Blocked)
            {
                ApplicationArea = Basic;
            }
        }
    }

    var
        UserSetup: Record "User Setup";


    //Unsupported feature: Code Insertion on "OnDeleteRecord".

    //trigger OnDeleteRecord(): Boolean
    //begin
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
          IF  UserSetup."Discount Bill" = FALSE THEN BEGIN
            ERROR('You do not have permission to view or edit these bank details.Please contact your system administrator');
            END;
          END;
        */
    //end;


    //Unsupported feature: Code Insertion on "OnInsertRecord".

    //trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    //begin
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
          IF  UserSetup."Discount Bill" = FALSE THEN BEGIN
            ERROR('You do not have permission to view or edit these bank details.Please contact your system administrator');
            END;
          END;
        */
    //end;


    //Unsupported feature: Code Insertion on "OnModifyRecord".

    //trigger OnModifyRecord(): Boolean
    //begin
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
          IF  UserSetup."Discount Bill" = FALSE THEN BEGIN
            ERROR('You do not have permission to view or edit these bank details.Please contact your system administrator');
            END;
          END;
        */
    //end;
}

