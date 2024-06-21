#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65150 "Project Templates"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Project Templates";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project  Task No.";"Project  Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Description";"Project Description")
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

