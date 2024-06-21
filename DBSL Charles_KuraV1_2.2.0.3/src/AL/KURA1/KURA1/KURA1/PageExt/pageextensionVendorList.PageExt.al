#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50010 "pageextension50010" extends "Vendor List"
{



    layout
    {
        addafter("Fax No.")
        {
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Name)
        {
            field("VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = Basic;
            }

        }
    }
    actions
    {

        //Unsupported feature: Property Modification (RunPageLink) on "PayVendor(Action 60)".

        modify("Vendor Register")
        {
            Visible = false;
        }
        addafter("Vendor - List")
        {
            action("<Report Vendor - List2>")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Ind Vendor - List';
                Image = "Report";
                //   // RunObject = Report "Vendor - List1";
                ToolTip = 'View various kinds of basic information for vendors, such as vendor posting group, discount and payment information, priority level and the vendor''s default currency, and the vendor''s current balance (in LCY). The report can be used, for example, to maintain the information in the Vendor table.';
            }
        }
    }
}

#pragma implicitwith restore

