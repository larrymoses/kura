#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72425 "Mobilized Project Objectives"
{
    CardPageID = "Mobilized Project Objective";
    PageType = List;
    SourceTable = "Mobilized Project Objective";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Objective Verifiable Indicator";"Objective Verifiable Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Source of Evidence";"Source of Evidence")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Project Assumptions";"No. of Project Assumptions")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Project Constraints";"No. of Project Constraints")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Critical Success Factor";"No. of Critical Success Factor")
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

