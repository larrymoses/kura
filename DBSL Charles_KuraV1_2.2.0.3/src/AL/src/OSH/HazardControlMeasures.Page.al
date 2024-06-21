#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69403 "Hazard Control Measures"
{
    CardPageID = "Hazard Control Measure";
    PageType = List;
    SourceTable = 69402;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Hazard Type"; "Hazard Type")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Recommended Preventive Action"; "Recommended Preventive Action")
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
