#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69306 "Training Domains"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Training Domains";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Courses";"No. of Courses")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Actual Staff Trained";"No. of Actual Staff Trained")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Budget Spent";"Actual Budget Spent")
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

