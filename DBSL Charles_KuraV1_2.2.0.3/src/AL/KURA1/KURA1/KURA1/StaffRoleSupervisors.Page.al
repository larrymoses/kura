#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72710 "Staff Role Supervisors"
{
    PageType = List;
    SourceTable = "Staff Role Code Supervisor";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Role Code";"Staff Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Job ID";"Supervisor Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Job Title";"Supervisor Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Email";"Supervisor Email")
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

