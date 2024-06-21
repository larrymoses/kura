#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75126 "IFS Securities"
{
    PageType = List;
    SourceTable = "IFS Securities";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IFS Code";"IFS Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Form of Security";"Form of Security")
                {
                    ApplicationArea = Basic;
                }
                field("Security Type";"Security Type")
                {
                    ApplicationArea = Basic;
                }
                field("Required at Bid Submission";"Required at Bid Submission")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Security Amount (LCY)";"Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("No of Days";"No of Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Period';
                }
                field("Bid Security Validity Expiry";"Bid Security Validity Expiry")
                {
                    ApplicationArea = Basic;
                    Caption = 'Security Validity Expiry Date';
                }
            }
        }
    }

    actions
    {
    }
}

