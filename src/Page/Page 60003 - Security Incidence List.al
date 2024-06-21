
page 60003 "Security Incidence List"
{
    CardPageID = "Security Incidence Card";
    PageType = List;
    SourceTable = "Security Incidences";
    SourceTableView = WHERE("Incidence Stage" = CONST(New),
                            "Approval Status" = CONST(Open));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea=BasicHR;
                }
                field("Severity Level"; Rec."Severity Level")
                {
                    ApplicationArea=BasicHR;
                }
                field("Incident Type"; Rec."Incident Type")
                {
                    ApplicationArea=BasicHR;
                }
                field("Incident Type Details"; Rec."Incident Type Details")
                {
                    ApplicationArea=BasicHR;
                }
                field("Time Reported"; Rec."Time Reported")
                {
                    ApplicationArea=BasicHR;
                }
                field("Reported By Type"; Rec."Reported By Type")
                {
                    ApplicationArea=BasicHR;
                }
                field(Stakeholder; Rec.Stakeholder)
                {
                    ApplicationArea=BasicHR;
                }
                field("Reporter Number"; Rec."Reporter Number")
                {
                    ApplicationArea=BasicHR;
                }
                field("Reporter Name"; Rec."Reporter Name")
                {
                }
                field("Reporter Phone Number"; Rec."Reporter Phone Number")
                {
                    ApplicationArea=BasicHR;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea=BasicHR;
                }
                field("Incidence Stage"; Rec."Incidence Stage")
                {
                    ApplicationArea=BasicHR;
                }
                field("Reporter Email Address"; Rec."Reporter Email Address")
                {
                    ApplicationArea=BasicHR;
                }
                field("Incident Details"; Rec."Incident Details")
                {
                    ApplicationArea=BasicHR;
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
            }

            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
    }
}



