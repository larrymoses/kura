#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95182 "Audit Project Objectives"
{
    CardPageID = "Audit Project Objective";
    PageType = List;
    SourceTable = "Audit Project Objective";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Engagement ID";"Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit Objective ID";"Audit Objective ID")
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

