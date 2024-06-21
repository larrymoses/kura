#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72744 "Project Workflow User G Member"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "Workflow User Group Member";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Role";"Project Role")
                {
                    ApplicationArea = Basic;
                }
                field("Sequence No.";"Sequence No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Based";"Project Based")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

