#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50001 "pageextension50001" extends "Company Information"
{
    layout
    {
        modify("VAT Registration No.")
        {
            Caption = 'KRA PIN.';
        }
        addafter(Name)
        {
            field("Company Abbreviation";Rec."Company Abbreviation")
            {
                ApplicationArea = Basic;
            }
        }

        //Unsupported feature: Property Insertion (Visible) on "GLN(Control 7)".


        //Unsupported feature: Property Insertion (Visible) on ""Industrial Classification"(Control 76)".


        //Unsupported feature: Property Insertion (Visible) on ""Fax No."(Control 54)".


        //Unsupported feature: Property Insertion (Visible) on ""IC Partner Code"(Control 78)".


        //Unsupported feature: Property Insertion (Visible) on ""IC Inbox Type"(Control 80)".


        //Unsupported feature: Property Insertion (Visible) on ""IC Inbox Details"(Control 82)".


        //Unsupported feature: Property Insertion (Visible) on ""Auto. Send Transactions"(Control 91)".


        //Unsupported feature: Property Insertion (Visible) on ""Allow Blank Payment Info."(Control 3)".


        //Unsupported feature: Property Insertion (Visible) on ""Payment Routing No."(Control 22)".


        //Unsupported feature: Property Insertion (Visible) on ""Giro No."(Control 24)".


        //Unsupported feature: Property Insertion (Visible) on ""SWIFT Code"(Control 72)".


        //Unsupported feature: Property Insertion (Visible) on "IBAN(Control 74)".


        //Unsupported feature: Property Insertion (Visible) on "BankAccountPostingGroup(Control 30)".


        //Unsupported feature: Property Insertion (Visible) on "Shipping(Control 1906801201)".

        addafter("Phone No.")
        {
            field("Phone No. 2"; "Phone No. 2")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Picture)
        {
            field("N.S.SF. No."; "N.S.SF. No.")
            {
                ApplicationArea = Basic;
            }
            field("N.H.I.F No."; "N.H.I.F No.")
            {
                ApplicationArea = Basic;
            }
            field(RubberStamp; RubberStamp)
            {
                ApplicationArea = Basic;
            }
            field(Motto; Motto)
            {
                ApplicationArea = Basic;
            }
            field("Headed By"; "Headed By")
            {
                ApplicationArea = Basic;
            }
            field("Current Head"; "Current Head")
            {
                ApplicationArea = Basic;
            }
            field("Current Head Name"; "Current Head Name")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Payments)
        {
            group("Outgoing Emails")
            {
                Caption = 'Outgoing Emails';
                field("Procurement Support E-mail"; "Procurement Support E-mail")
                {
                    ApplicationArea = Basic;
                }
                field("Administrator Email"; "Administrator Email")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor  Email"; "Vendor  Email")
                {
                    ApplicationArea = Basic;
                }
                field("ICT Email"; "ICT Email")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Files)
            {
                Caption = 'Files';
                field("HR Document Link"; "HR Document Link")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Insertion (Visible) on ""Report Layouts"(Action 25)".


        //Unsupported feature: Property Insertion (Visible) on ""General Ledger Setup"(Action 52)".


        //Unsupported feature: Property Insertion (Visible) on ""Sales & Receivables Setup"(Action 46)".


        //Unsupported feature: Property Insertion (Visible) on ""Purchases & Payables Setup"(Action 48)".


        //Unsupported feature: Property Insertion (Visible) on ""Inventory Setup"(Action 45)".


        //Unsupported feature: Property Insertion (Visible) on ""Fixed Assets Setup"(Action 44)".


        //Unsupported feature: Property Insertion (Visible) on ""Jobs Setup"(Action 40)".


        //Unsupported feature: Property Insertion (Visible) on ""No. Series"(Action 26)".


        //Unsupported feature: Property Insertion (Visible) on ""Permission Sets"(Action 28)".


        //Unsupported feature: Property Insertion (Visible) on ""Email Account"(Action 23)".


        //Unsupported feature: Property Insertion (Visible) on "Action27(Action 27)".


        //Unsupported feature: Property Insertion (Visible) on ""Countries/Regions"(Action 19)".


        //Unsupported feature: Property Insertion (Visible) on ""Online Map Setup"(Action 15)".


        //Unsupported feature: Property Insertion (Visible) on "Languages(Action 12)".


        //Unsupported feature: Property Insertion (Visible) on ""Source Codes"(Action 9)".


        //Unsupported feature: Property Insertion (Visible) on ""Reason Codes"(Action 5)".

    }
}

