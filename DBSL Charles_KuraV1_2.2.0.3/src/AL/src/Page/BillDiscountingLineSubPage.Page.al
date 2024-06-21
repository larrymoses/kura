#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57222 "Bill Discounting Line SubPage"
{
    PageType = ListPart;
    SourceTable = "Bill Discounting Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No";"Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Code";"Project Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Pending Certificate No.";"Pending Certificate No.")
                {
                    ApplicationArea = Basic;
                }
                field("Pending Certificates";"Pending Certificates")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Certificate value deductions";"Certificate value deductions")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Certificate Amount";"Certificate Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Gross Certificate Amount';
                }
                field("Net Amount";"Net Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Discountable Amount.';
                    Editable = false;
                }
                field("Discountable Amount";"Discountable Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Discounted Amount";"Discounted Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Gross Amount to Discount';
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("VAT Code";"VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Rate";"VAT Rate")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Amount";"VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("W/Tax Code";"W/Tax Code")
                {
                    ApplicationArea = Basic;
                }
                field("W/Tax Rate";"W/Tax Rate")
                {
                    ApplicationArea = Basic;
                }
                field("W/Tax Amount";"W/Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("W/T VAT Code";"W/T VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Six % Rate";"VAT Six % Rate")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Withheld Amount";"VAT Withheld Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Retention Code";"Retention Code")
                {
                    ApplicationArea = Basic;
                }
                field("Retention  Amount";"Retention  Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Retention Rate";"Retention Rate")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Withheld Code";"VAT Withheld Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Advance Recovery";"Advance Recovery")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

