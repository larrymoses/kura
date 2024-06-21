#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80032 "Corporate Perfomance Grades"
{
    PageType = List;
    SourceTable = "Corporate Perfomance Grades";

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
                field("Min Score (%) Per. Contract";"Min Score (%) Per. Contract")
                {
                    ApplicationArea = Basic;
                }
                field("Max Score (%) Per. Contract";"Max Score (%) Per. Contract")
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

