#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72716 "Detailed Pavemet Tests"
{
    PageType = List;
    SourceTable = "Detailed Pavemet Test Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Layer Code";"Layer Code")
                {
                    ApplicationArea = Basic;
                }
                field("Layer Description";"Layer Description")
                {
                    ApplicationArea = Basic;
                }
                field("Layer Test Code";"Layer Test Code")
                {
                    ApplicationArea = Basic;
                }
                field("Layer Test Description";"Layer Test Description")
                {
                    ApplicationArea = Basic;
                }
                field("Chainage(KM)";"Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Layer Tolerance";"Layer Tolerance")
                {
                    ApplicationArea = Basic;
                }
                field("Test Result";"Test Result")
                {
                    ApplicationArea = Basic;
                }
                field("Level Deviation";"Level Deviation")
                {
                    ApplicationArea = Basic;
                }
                field("Test Date";"Test Date")
                {
                    ApplicationArea = Basic;
                }
                field("Survey Date";"Survey Date")
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

