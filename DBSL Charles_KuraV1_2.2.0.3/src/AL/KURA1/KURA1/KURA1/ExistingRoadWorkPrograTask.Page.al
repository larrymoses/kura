#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72202 "Existing Road Work Progra Task"
{
    PageType = List;
    SourceTable = "Existing Road Work Progra Task";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Work Program ID";"Road Work Program ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Type";"Job Task Type")
                {
                    ApplicationArea = Basic;
                }
                field("Job Posting Group";"Job Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Category Code";"Bill Item Category Code")
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

