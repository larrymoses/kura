
Page 72537 "Site Agent Nominations"
{
    ApplicationArea = Basic;
    CardPageID = "Site Agent Nomination";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "WEP Contractor Submission";
    SourceTableView = where("Document Type"=filter("Site Agent Nomination"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan"; Rec."Work Execution Plan")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent Staff No"; Rec."Site Agent Staff No")
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent Name"; Rec."Site Agent Name")
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No"; Rec."Telephone No")
                {
                    ApplicationArea = Basic;
                }
                field("E-mail"; Rec."E-mail")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
            }
        }
            area(FactBoxes)
        {
            part(Control1906354007; "Document Attachment Factbox")
            {

                SubPageLink = "Table ID" = const(72280),
                              "No." = field("Document No");

            }
              systempart(Control55; Links)
            {
            }
            systempart(Control57; Notes)
            {
            }
        }
    }

    actions
    {
    }
}



