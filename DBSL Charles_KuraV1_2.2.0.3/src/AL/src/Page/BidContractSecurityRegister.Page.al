#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75151 "Bid_Contract Security Register"
{
    PageType = List;
    SourceTable = "Bid_Contract Security Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Form of Security";"Form of Security")
                {
                    ApplicationArea = Basic;
                }
                field("Security Type";"Security Type")
                {
                    ApplicationArea = Basic;
                }
                field("Reference No";"Reference No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Guarantee Number';
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Issuer Institution Type";"Issuer Institution Type")
                {
                    ApplicationArea = Basic;
                }
                field("Issuer/Guarantor Name";"Issuer/Guarantor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Issuer Registered Offices";"Issuer Registered Offices")
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
                    Description = 'Bid Security Effective Date';
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
                field("Second Expiry Notification Dat";"Second Expiry Notification Dat")
                {
                    ApplicationArea = Basic;
                    Caption = 'Second Expiry Notification Date';
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

