// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// PageExtension 50054 pageextension50054 extends "Vendor Bank Account List2"
// {
//     // Editable = true;
//     // layout
//     // {
//     //     addafter("Country/Region Code")
//     //     {
//     //         field("Vendor No.";"Vendor No.")
//     //         {
//     //             ApplicationArea = Basic;
//     //         }
//     //     }
//     //     addafter("Fax No.")
//     //     {
//     //         field("Bank Code";"Bank Code")
//     //         {
//     //             ApplicationArea = Basic;
//     //         }
//     //         field("Bank Branch Name";"Bank Branch Name")
//     //         {
//     //             ApplicationArea = Basic;
//     //         }
//     //         field("Bank Branch No.";"Bank Branch No.")
//     //         {
//     //             ApplicationArea = Basic;
//     //         }
//     //     }
//     //     addafter("Language Code")
//     //     {
//     //         field(Blocked;Blocked)
//     //         {
//     //             ApplicationArea = Basic;
//     //         }
//     //     }
//     //     moveafter("Fax No.";"Bank Account No.")
//     // }

//     // var
//     //     UserSetup: Record "User Setup";


//     // //Unsupported feature: Code Insertion on "OnAfterGetCurrRecord".

//     // //trigger OnAfterGetCurrRecord()
//     // //begin
//     //     /*
//     //     {IF UserSetup.GET(USERID) THEN BEGIN
//     //       IF  UserSetup."Amend Bank Account Details" = FALSE THEN BEGIN
//     //         ERROR('You do not have permission to view or edit these bank details.Please contact your system administrator');
//     //         END;
//     //       END;}
//     //     */
//     // //end;


//     // //Unsupported feature: Code Insertion on "OnDeleteRecord".

//     // //trigger OnDeleteRecord(): Boolean
//     // //begin
//     //     /*
//     //      IF UserSetup.GET(USERID) THEN BEGIN
//     //       IF  UserSetup."Discount Bill" = FALSE THEN BEGIN
//     //         ERROR('You do not have permission to view or edit these bank details.Please contact your system administrator');
//     //         END;
//     //       END;
//     //     */
//     // //end;


//     // //Unsupported feature: Code Insertion on "OnInsertRecord".

//     // //trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     // //begin
//     //     /*
//     //      IF UserSetup.GET(USERID) THEN BEGIN
//     //       IF  UserSetup."Discount Bill" = FALSE THEN BEGIN
//     //         ERROR('You do not have permission to view or edit these bank details.Please contact your system administrator');
//     //         END;
//     //       END;
//     //     */
//     // //end;


//     // //Unsupported feature: Code Insertion on "OnModifyRecord".

//     // //trigger OnModifyRecord(): Boolean
//     // //begin
//     //     /*
//     //      IF UserSetup.GET(USERID) THEN BEGIN
//     //       IF UserSetup."Discount Bill" = FALSE THEN BEGIN
//     //         ERROR('You do not have permission to view or edit these bank details.Please contact your system administrator');
//     //         END;
//     //       END;
//     //     */
//     // //end;


//     // //Unsupported feature: Code Insertion on "OnNewRecord".

//     // //trigger OnNewRecord(BelowxRec: Boolean)
//     // //begin
//     //     /*
//     //      IF UserSetup.GET(USERID) THEN BEGIN
//     //       IF  UserSetup."Discount Bill" = FALSE THEN BEGIN
//     //         ERROR('You do not have permission to view or edit these bank details.Please contact your system administrator');
//     //         END;
//     //       END;
//     //     */
//     // //end;
// }

