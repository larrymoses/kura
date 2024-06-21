#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72386 "Bid Securities"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Bid_Contract Security Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Form of Security";"Form of Security")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Reference No";"Reference No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Guarantee Number';
                }
                field("Security Type";"Security Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Guarantee Type';
                }
                field("Issuer Institution Type";"Issuer Institution Type")
                {
                    ApplicationArea = Basic;
                }
                field("Issuer/Guarantor Name";"Issuer/Guarantor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Security Amount (LCY)";"Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Guarantee Amount (KES)';
                }
                field("Bid Security Effective Date";"Bid Security Effective Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Guarantee Effective Date';
                }
                field("Bid Security Validity Expiry";"Bid Security Validity Expiry")
                {
                    ApplicationArea = Basic;
                    Caption = 'Guarantee Expiry Date';
                }
                field("Guarantee Expiry Notification";"Guarantee Expiry Notification")
                {
                    ApplicationArea = Basic;
                }
                field("Security Closure Date";"Security Closure Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

