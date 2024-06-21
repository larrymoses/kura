#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52013 "Planning Team List"
{
    CardPageID = "Planning Team Card";
    PageType = List;
    SourceTable = "Planning Team Members";

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
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Team ID";"Team ID")
                {
                    ApplicationArea = Basic;
                }
                field("Team Name";"Team Name")
                {
                    ApplicationArea = Basic;
                }
                field(Role;Role)
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

