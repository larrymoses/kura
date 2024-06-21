#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95114 "Assurance Level Criteria"
{
    CardPageID = "Assurance Level Criterion";
    PageType = List;
    SourceTable = "Assurance Level Criteria";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Assurance Level ID";"Assurance Level ID")
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

