#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65092 "Admin Team Members"
{
    Caption = 'Admin Team Members';
    PageType = List;
    SourceTable = "AdminTeam Members";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Admin Code";"Admin Code")
                {
                    ApplicationArea = Basic;
                }
                field("Admin Name";"Admin Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
    }
}

