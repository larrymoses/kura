/// <summary>
/// Page Ongoing Security Incidences (ID 60086).
/// </summary>
#pragma implicitwith disable
page 60086 "Ongoing Security Incidences"
{
    CardPageID = "Security Incidence Card";
    PageType = List;
    SourceTable = "Security Incidences";
    SourceTableView = WHERE("Approval Status"=FILTER("Pending Approval"|Released));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                     ApplicationArea=Basic;
                }
                field("Severity Level"; Rec."Severity Level")
                {
                     ApplicationArea=Basic;
                }
                field("Incident Type"; Rec."Incident Type")
                {
                     ApplicationArea=Basic;
                }
                field("Incident Type Details"; Rec."Incident Type Details")
                {
                     ApplicationArea=Basic;
                }
                field("Time Reported"; Rec."Time Reported")
                {
                     ApplicationArea=Basic;
                }
                field("Reported By Type"; Rec."Reported By Type")
                {
                     ApplicationArea=Basic;
                }
                field(Stakeholder; Rec.Stakeholder)
                {
                     ApplicationArea=Basic;
                }
                field("Reporter Number"; Rec."Reporter Number")
                {
                     ApplicationArea=Basic;
                }
                field("Reporter Name"; Rec."Reporter Name")
                {
                     ApplicationArea=Basic;
                }
                field("Reporter Phone Number"; Rec."Reporter Phone Number")
                {
                     ApplicationArea=Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                     ApplicationArea=Basic;
                }
                field("Incidence Stage"; Rec."Incidence Stage")
                {
                     ApplicationArea=Basic;
                }
                field("Reporter Email Address"; Rec."Reporter Email Address")
                {
                     ApplicationArea=Basic;
                }
                field("Incident Details"; Rec."Incident Details")
                {
                     ApplicationArea=Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes;Notes)
            {
            }
           
            systempart(Links;Links)
            {
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

