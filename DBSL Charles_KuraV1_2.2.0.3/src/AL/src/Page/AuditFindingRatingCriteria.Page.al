#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95118 "Audit Finding Rating Criteria"
{
    CardPageID = "Audit Finding Rating Criterion";
    PageType = List;
    SourceTable = "Audit Finding Rating Criteria";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Rating Code";"Rating Code")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

