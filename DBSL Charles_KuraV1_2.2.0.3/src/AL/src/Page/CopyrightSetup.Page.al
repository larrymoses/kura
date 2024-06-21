#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56019 "Copyright Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Copyright Setup";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Primary Key";"Primary Key")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Applicant Nos";"Applicant Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Complains Nos";"Complains Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Case Nos";"Case Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Court Attendance Nos";"Court Attendance Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Case File Movement Nos";"Case File Movement Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Document Registration Nos";"Document Registration Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Registration Nos.";"Copyright Registration Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("CMO Registration Nos";"CMO Registration Nos")
                {
                    ApplicationArea = Basic;
                }
                field("CMO Renewal Nos";"CMO Renewal Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Internal Memo Nos";"Internal Memo Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Customer FeedBack Nos";"Customer FeedBack Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Visitor Pass Nos";"Visitor Pass Nos")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Authentication Devices")
            {
                Caption = 'Authentication Devices';
                field("Authentication Nos";"Authentication Nos")
                {
                    ApplicationArea = Basic;
                }
                field("APSD Minimum Quantity";"APSD Minimum Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("APSD Default Unit Price";"APSD Default Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field("Default APSD Item";"Default APSD Item")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';
                field("Copyright Amount";"Copyright Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Bus Posting Group";"Gen. Bus Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Posting Group";"Customer Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(Resource;Resource)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Authorization)
            {
                Caption = 'Authorization';
                field("user id";"user id")
                {
                    ApplicationArea = Basic;
                    Caption = 'Authorizing User Id';
                }
            }
        }
    }

    actions
    {
    }
}

