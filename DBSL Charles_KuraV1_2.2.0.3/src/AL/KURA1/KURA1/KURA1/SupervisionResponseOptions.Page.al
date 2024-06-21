#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72562 "Supervision Response Options"
{
    CardPageID = "Supervision Response Option";
    PageType = List;
    SourceTable = "Supervision Response Option";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Response Type ID";"Response Type ID")
                {
                    ApplicationArea = Basic;
                }
                field("Option Code";"Option Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Minimum % Score";"Minimum % Score")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum % Score";"Maximum % Score")
                {
                    ApplicationArea = Basic;
                }
                field("Corrective Order is Applicable";"Corrective Order is Applicable")
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

