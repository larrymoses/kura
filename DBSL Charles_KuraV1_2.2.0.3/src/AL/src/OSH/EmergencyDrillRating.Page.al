#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 99503 "Emergency Drill Rating"
{
    PageType = Card;
    SourceTable = 69446;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Evacuation Event ID"; "Evacuation Event ID")
                {
                    ApplicationArea = Basic;
                }
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Criterion"; "Evaluation Criterion")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments/Notes"; "Additional Comments/Notes")
                {
                    ApplicationArea = Basic;
                }
                field("General Rating"; "General Rating")
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
