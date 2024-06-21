#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69480 "Emergency Drill Action Plans"
{
    CardPageID = "Emergency Drill Action Plan";
    PageType = List;
    SourceTable = 69440;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Evacuation Event ID";"Evacuation Event ID")
                {
                    ApplicationArea = Basic;
                }
                field("Criteria Code";"Criteria Code")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Action";Action)
                {
                    ApplicationArea = Basic;
                }
                field("Action Type";"Action Type")
                {
                    ApplicationArea = Basic;
                }
                field(Responsibility;Responsibility)
                {
                    ApplicationArea = Basic;
                }
                field("Owner ID";"Owner ID")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Date";"Planned Date")
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
