#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56038 "Case File Card"
{
    PageType = Card;
    SourceTable = "Case File";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Case ID";"Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Court Case no";"Court Case no")
                {
                    ApplicationArea = Basic;
                }
                field("Case Title";"Case Title")
                {
                    ApplicationArea = Basic;
                }
                field("Case Brief";"Case Brief")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Year of the Case";"Year of the Case")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Name";"Accused Name")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Address";"Accused Address")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Phone No";"Accused Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("Complainant Name";"Complainant Name")
                {
                    ApplicationArea = Basic;
                }
                field("Complainant Address";"Complainant Address")
                {
                    ApplicationArea = Basic;
                }
                field("Complainant Phone No";"Complainant Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("Court Station";"Court Station")
                {
                    ApplicationArea = Basic;
                }
                field("Court Rank";"Court Rank")
                {
                    ApplicationArea = Basic;
                }
                field("Main Investigator No";"Main Investigator No")
                {
                    ApplicationArea = Basic;
                }
                field("Main Investigator Name";"Main Investigator Name")
                {
                    ApplicationArea = Basic;
                }
                field("Arresting Officer No";"Arresting Officer No")
                {
                    ApplicationArea = Basic;
                }
                field("Arresting Officer Name";"Arresting Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Case Types";"Case Types")
                {
                    ApplicationArea = Basic;
                }
                field("Exhibit No";"Exhibit No")
                {
                    ApplicationArea = Basic;
                }
                field("Serial No";"Serial No")
                {
                    ApplicationArea = Basic;
                }
                field("Exhibit Details";"Exhibit Details")
                {
                    ApplicationArea = Basic;
                }
                field("Current Case File Location";"Current Case File Location")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Offence";"Nature of Offence")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of cause of action";"Nature of cause of action")
                {
                    ApplicationArea = Basic;
                }
                field("Case Outcome";"Case Outcome")
                {
                    ApplicationArea = Basic;
                }
                field("Exhibit Disposed";"Exhibit Disposed")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created";"Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created";"Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                field("Decretal Amount";"Decretal Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Amount";"Awarded Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Status";"Payment Status")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Amount";"Payment Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Amount";"Outstanding Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control31;Outlook)
            {
            }
            systempart(Control32;Notes)
            {
            }
            systempart(Control33;Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Investigators)
            {
                ApplicationArea = Basic;
                Caption = 'Investigators';
                Image = Agreement;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Investigators Listing";
                RunPageLink = "Case No"=field("Case ID");
            }
            action(Witnesses)
            {
                ApplicationArea = Basic;
                Caption = 'Witnesses';
                Image = PostingEntries;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page Witnesses;
                RunPageLink = "Case No"=field("Case ID");
            }
            action("Registered Documents")
            {
                ApplicationArea = Basic;
                Caption = 'Registered Documents';
                Image = Database;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Document Registration List";
                RunPageLink = "Case ID"=field("Case ID");
            }
        }
    }
}

