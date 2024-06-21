#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69721 "Interview Invitations"
{
    ApplicationArea = Basic;
    CardPageID = "Interview invitation Card";
    Editable = false;
    PageType = List;
    SourceTable = "Candidate Selection Header";
    SourceTableView = where("Document Type"=filter("Interview Invitation"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Status";"Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control37;Outlook)
            {
            }
            systempart(Control38;Notes)
            {
            }
            systempart(Control39;MyNotes)
            {
            }
            systempart(Control40;Links)
            {
            }
        }
    }

    actions
    {
    }
}

