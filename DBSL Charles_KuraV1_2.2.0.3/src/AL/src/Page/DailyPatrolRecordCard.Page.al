#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72085 "Daily Patrol Record Card"
{
    PageType = Card;
    SourceTable = "Daily Patrol Record";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Daily Patrol No";"Daily Patrol No")
                {
                    ApplicationArea = Basic;
                }
                field("Road Authority";"Road Authority")
                {
                    ApplicationArea = Basic;
                }
                field(Contractor;Contractor)
                {
                    ApplicationArea = Basic;
                }
                field(Project;Project)
                {
                    ApplicationArea = Basic;
                }
                field("Road Name/Chainage";"Road Name/Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class";"Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Inspected By";"Inspected By")
                {
                    ApplicationArea = Basic;
                }
                field("Standard Service Level";"Standard Service Level")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control11;"Daily Patrol Line")
            {
                SubPageLink = Project=field(Project),
                              "Header No"=field("Daily Patrol No");
            }
            part(Control12;"Daily Patrol Other Activities")
            {
                SubPageLink = Project=field(Project),
                              "Header No"=field("Daily Patrol No");
            }
        }
    }

    actions
    {
    }
}

