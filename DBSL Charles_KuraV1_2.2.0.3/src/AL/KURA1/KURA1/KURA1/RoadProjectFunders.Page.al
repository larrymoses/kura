#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52041 "Road Project Funders"
{
    PageType = List;
    SourceTable = "Road Project Funders";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Project";"Road Project")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Funding Source";"Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source Name";"Funding Source Name")
                {
                    ApplicationArea = Basic;
                }
                field("Funded Amount(LCY)";"Funded Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Funded Percentage";"Funded Percentage")
                {
                    ApplicationArea = Basic;
                }
                field(Section;Section)
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

