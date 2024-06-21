#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65071 "Research Investigators"
{
    ApplicationArea = Basic;
    CardPageID = "Project Research Team Card";
    Editable = false;
    PageType = List;
    SourceTable = "Project Research Team";
    SourceTableView = where("Primary Role"=const('PI'));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No";"Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Researcher ID";"Researcher ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Role";"Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field("Role Description";"Role Description")
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

