#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50122 "pageextension50122" extends "Account Manager Activities"
{
    layout
    {
        // modify("Document Approvals")
        // {
        //     Caption = 'Payment and Imprest Management';

        //     //Unsupported feature: Property Modification (Name) on ""Document Approvals"(Control 19)".

        // }

        //Unsupported feature: Property Insertion (Visible) on ""POs Pending Approval"(Control 23)".


        //Unsupported feature: Property Insertion (Visible) on ""SOs Pending Approval"(Control 20)".

        addafter("Purchase Documents Due Today")
        {
            field("Posted Surrenders"; "Posted Surrenders")
            {
                ApplicationArea = Basic;
                DrillDownPageID = "Posted Imprest Surrenders";
            }
            field("Pending Fin Copyright Works"; "Pending Fin Copyright Works")
            {
                ApplicationArea = Basic;
                // DrillDownPageID = "Copyright Reg Application List";
            }
        }
        // addfirst("Document Approvals")
        // {
        //     field("Approved Payment Vouchers";"Approved Payment Vouchers")
        //     {
        //         ApplicationArea = Basic;
        //         DrillDownPageID = "Approved Payment Vouchers";
        //     }
        //     field("Pending Payment Vouchers";"Pending Payment Vouchers")
        //     {
        //         ApplicationArea = Basic;
        //         DrillDownPageID = "Payments Vouchers";
        //     }
        //     field("Approved Surrenders";"Approved Surrenders")
        //     {
        //         ApplicationArea = Basic;
        //         DrillDownPageID = "Approved Imprest Surrenders";
        //     }
        // }
        // addafter("Document Approvals")
        // {
        //     cuegroup("Document Approvals")
        //     {
        //         Caption = 'Document Approvals';
        //         field("Requests to Approve";"Requests to Approve")
        //         {
        //             ApplicationArea = Basic;
        //             DrillDownPageID = "Requests to Approve";
        //         }
        //         field("Requests Sent for Approval";"Requests Sent for Approval")
        //         {
        //             ApplicationArea = Basic;
        //             DrillDownPageID = "Approval Entries";
        //         }
        //     }
        // }
        addafter("Non-Applied Payments")
        {
            field("Customer with balance"; "Customer with balance")
            {
                ApplicationArea = Basic;
                DrillDownPageID = "Customer List";
            }
            field("Vendors with Balance"; "Vendors with Balance")
            {
                ApplicationArea = Basic;
                DrillDownPageID = "Vendor List";
            }
        }
    }


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RESET;
    IF NOT GET THEN BEGIN
      INIT;
      INSERT;
    END;

    SETFILTER("Due Date Filter",'<=%1',WORKDATE);
    SETFILTER("Overdue Date Filter",'<%1',WORKDATE);
    SETFILTER("User ID Filter",USERID);
    ShowCheckForOCR := OCRServiceMgt.OcrServiceIsEnable;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6

    SETFILTER("User ID Filter",USERID);

    SETFILTER("User ID Filter",'=%1',USERID);
    ShowCheckForOCR := OCRServiceMgt.OcrServiceIsEnable;
    */
    //end;
}

