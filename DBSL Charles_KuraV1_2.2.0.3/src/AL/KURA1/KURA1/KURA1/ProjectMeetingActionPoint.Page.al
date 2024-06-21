#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72259 "Project Meeting Action Point"
{
    PageType = List;
    SourceTable = "Project Meeting Action Point";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Meeting ID";"Meeting ID")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Task Description";"Task Description")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Category";"Responsibility Category")
                {
                    ApplicationArea = Basic;
                }
                field("Task Owner ID";"Task Owner ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Due Date";"Due Date")
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

