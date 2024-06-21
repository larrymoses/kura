#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80096 "Objective Comments"
{
    PageType = List;
    SourceTable = "PC Objective Comment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan No";"Workplan No")
                {
                    ApplicationArea = Basic;
                }
                field("Objective ID";"Objective ID")
                {
                    ApplicationArea = Basic;
                }
                field("Comment/Additional Notes";"Comment/Additional Notes")
                {
                    ApplicationArea = Basic;
                }
                field("Last Update Date";"Last Update Date")
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

