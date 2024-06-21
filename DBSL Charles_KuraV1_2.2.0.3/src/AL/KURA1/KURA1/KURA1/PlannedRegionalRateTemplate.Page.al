#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72319 "Planned Regional Rate Template"
{
    PageType = List;
    SourceTable = "Planned Regional Rate Template";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition Template ID";"Requisition Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Rate(Unit Amount Exc)";"Planned Rate(Unit Amount Exc)")
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

