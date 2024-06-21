#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50007 "pageextension50007" extends "Customer Card"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Customer Card"(Page 21)".

    layout
    {
        modify("No.")
        {
            Editable = false;
        }

        addafter(Name)
        {
            field("Customer Type"; "Customer Type")
            {
                ApplicationArea = Basic;
                Caption = 'Customer Type';
                Visible = false;
            }
        }
        addafter("Privacy Blocked")
        {
            field("Funding Class"; "Funding Class")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Disable Search by Name")
        {
            field("Advance Payment Contractor No"; "Advance Payment Contractor No")
            {
                ApplicationArea = Basic;
                Editable = true;
            }
        }
        addafter("Preferred Bank Account Code")
        {
            field("Customer's Bank"; "Employee's Bank")
            {
                ApplicationArea = Basic;
            }
            field("Bank Name"; "Bank Name")
            {
                ApplicationArea = Basic;
            }
            field("Bank Branch"; "Bank Branch")
            {
                ApplicationArea = Basic;
            }
            field("Bank Branch Name"; "Bank Branch Name")
            {
                ApplicationArea = Basic;
            }
            field("Bank Account Number"; "Bank Account Number")
            {
                ApplicationArea = Basic;
            }

        }
    }
    actions
    {
        //  modify(NewSalesInvoiceAddin)
        //          {
        //              Visible = false;
        //          }

        // modify(NewSalesInvoiceAddin)
        // {
        //     Visible = false;
        // }
        // modify(Flow)
        // {
        //     Visible = false;
        // }
        // addafter(NewSalesQuoteAddin)
        // {
        //     action(NewSalesInvoiceAddin)
        //     {
        //         AccessByPermission = TableData "Sales Header"=RIM;
        //         ApplicationArea = Basic,Suite;
        //         Caption = 'Sales Invoice';
        //         Image = NewSalesInvoice;
        //         Promoted = true;
        //         PromotedCategory = Category4;
        //         PromotedOnly = true;
        //         ToolTip = 'Create a sales invoice for the customer.';
        //         Visible = IsOfficeAddin;

        //         trigger OnAction()
        //         begin
        //             CreateAndShowNewInvoice;
        //         end;
        //     }
        // }
        // addafter(CancelApprovalRequest)
        // {
        //     group(Flow)
        //     {
        //         Caption = 'Flow';
        //     }
        // }
    }

    //Unsupported feature: Property Deletion (RefreshOnActivate).

}

