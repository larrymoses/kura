#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52003 "Ongoing Environmental Studies"
{
    ApplicationArea = Basic;
    CardPageID = "Environmental Study Card";
    PageType = List;
    SourceTable = "Road Planning Header";
    SourceTableView = order(ascending)
                      where("Document Type"=const("Environmental Study"));
    UsageCategory = Lists;

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
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Region;Region)
                {
                    ApplicationArea = Basic;
                }
                field(Constistuency;Constistuency)
                {
                    ApplicationArea = Basic;
                }
                field(Objective;Objective)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created";"Date Created")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control15;Outlook)
            {
            }
            systempart(Control16;Notes)
            {
            }
            systempart(Control17;MyNotes)
            {
            }
            systempart(Control18;Links)
            {
            }
        }
    }

    actions
    {
    }
}

