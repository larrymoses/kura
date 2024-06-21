#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69500 "Emergency Drill Finding Lines"
{
    PageType = ListPart;
    SourceTable = 69439;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Evacuation Event ID"; "Evacuation Event ID")
                {
                    ApplicationArea = Basic;
                }
                field("Criteria Code"; "Criteria Code")
                {
                    ApplicationArea = Basic;
                }
                field("Drill Assessment Criteria"; "Drill Assessment Criteria")
                {
                    ApplicationArea = Basic;
                }
                field("General Rating"; "General Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments/Findings"; "Additional Comments/Findings")
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
