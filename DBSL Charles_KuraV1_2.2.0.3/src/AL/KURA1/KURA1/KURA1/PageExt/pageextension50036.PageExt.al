#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50036 "pageextension50036" extends "Posted Purchase Invoice"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Posted Purchase Invoice"(Page 138)".

    layout
    {
        addafter(Cancelled)
        {
            field("Advance Recovery %"; "Advance Recovery %")
            {
                ApplicationArea = Basic;
            }
            field("Retention %"; "Retention %")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        // modify(Print)
        // {

        //     //Unsupported feature: Property Modification (Name) on "Print(Action 27)".

        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (Image) on "Print(Action 27)".


        //     //Unsupported feature: Property Modification (PromotedCategory) on "Print(Action 27)".


        //     //Unsupported feature: Property Insertion (PromotedIsBig) on "Print(Action 27)".


        //     //Unsupported feature: Property Insertion (PromotedOnly) on "Print(Action 27)".

        // }


        //Unsupported feature: Code Modification on "Print(Action 27).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(PurchInvHeader);
        PurchInvHeader.PrintRecords(TRUE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        RESET;
        SETRANGE("No.","No.");
        IF FINDSET THEN
          REPORT.RUN(406,TRUE,TRUE,Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (Ellipsis) on "Print(Action 27)".


        //Unsupported feature: Property Deletion (CaptionML) on "Print(Action 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Print(Action 27)".


        //Unsupported feature: Property Deletion (Visible) on "Print(Action 27)".

        // addafter(Print)
        // {
        //     action(Print)
        //     {
        //         ApplicationArea = Basic,Suite;
        //         Caption = '&Print';
        //         Ellipsis = true;
        //         Image = Print;
        //         Promoted = true;
        //         PromotedCategory = Category6;
        //         ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';
        //         Visible = not IsOfficeAddin;

        //         trigger OnAction()
        //         begin
        //             CurrPage.SetSelectionFilter(PurchInvHeader);
        //             PurchInvHeader.PrintRecords(true);
        //         end;
        //     }
        // }
    }
}

