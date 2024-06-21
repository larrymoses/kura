#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69767 "Candidate Selection Panel Card"
{
    PageType = Card;
    SourceTable = "Candidate Selection Panel";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Panel ID";"Panel ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Venue;Venue)
                {
                    ApplicationArea = Basic;
                }
                field("Room No.";"Room No.")
                {
                    ApplicationArea = Basic;
                }
                field("No of Committee Members";"No of Committee Members")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control15;"Selection Panelist")
            {
                SubPageLink = "Document No"=field("Document No"),
                              "Panel ID"=field("Panel ID");
            }
        }
        area(factboxes)
        {
            systempart(Control11;Outlook)
            {
            }
            systempart(Control12;Notes)
            {
            }
            systempart(Control13;MyNotes)
            {
            }
            systempart(Control14;Links)
            {
            }
        }
    }

    actions
    {
    }
}

