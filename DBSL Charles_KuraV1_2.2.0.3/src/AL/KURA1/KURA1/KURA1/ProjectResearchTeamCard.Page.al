#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65039 "Project Research Team Card"
{
    CardPageID = "Project Research Team List";
    PageType = Card;
    SourceTable = "Project Research Team";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Job No";"Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Researcher ID";"Researcher ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Primary Role";"Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field("Role Description";"Role Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Default Payment Mentod";"Default Payment Mentod")
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

