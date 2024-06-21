#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75286 "Purchase Contract Insurance"
{
    PageType = List;
    SourceTable = "Purchase Contract Insurance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Type";"Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Cover Type";"Policy Cover Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Policy Coverage (LCY)";"Policy Coverage (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Policy ID";"Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Company";"Insurance Company")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Date";"Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Norification Date";"Expiry Norification Date")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Second Expiry Notification Dat";"Second Expiry Notification Dat")
                {
                    ApplicationArea = Basic;
                    Caption = 'Second Expiry Notification Date';
                }
            }
        }
    }

    actions
    {
    }
}

