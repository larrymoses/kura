#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72735 "Resource Supervisors"
{
    PageType = List;
    SourceTable = "Resource Supervisor";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resouce No";"Resouce No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Email";"Employee Email")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

