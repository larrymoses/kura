#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69224 "Training Evaluation List"
{
    ApplicationArea = Basic;
    CardPageID = "Training Evaluation Page";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Training Evaluation Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Application Code";"Application Code")
                {
                    ApplicationArea = Basic;
                }
                field("Course Title";"Course Title")
                {
                    ApplicationArea = Basic;
                }
                field("Start DateTime";"Start DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime";"End DateTime")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008;Links)
            {
            }
            systempart(Control1000000009;Notes)
            {
            }
        }
    }

    actions
    {
    }
}

