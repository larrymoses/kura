#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56200 "Customer Feedback List"
{
    ApplicationArea = Basic;
    CardPageID = "Customer Feedback Card";
    Editable = false;
    PageType = List;
    SourceTable = "Customer FeedbackS";
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
                field("Feedback Date";"Feedback Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Date created";"Date created")
                {
                    ApplicationArea = Basic;
                }
                field("Time created";"Time created")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12;Notes)
            {
            }
        }
    }

    actions
    {
    }
}

