#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75467 "Fin Evaluation Entries"
{
    Caption = 'Finance Evaluation';
    PageType = List;
    SourceTable = "Fin Evaluation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bid No";"Bid No")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name";"Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item No";"Bill Item No")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Bill Item Rate";"Bidder Bill Item Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Market  Rate";"Bill Item Market  Rate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bill Item Average Modal Rate';
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10;Outlook)
            {
            }
            systempart(Control11;Notes)
            {
            }
            systempart(Control12;MyNotes)
            {
            }
            systempart(Control13;Links)
            {
            }
        }
    }

    actions
    {
    }
}

