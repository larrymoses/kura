#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69451 "HSE Plan Section Details"
{
    CardPageID = "HSE Plan Section Detail";
    PageType = List;
    SourceTable = 69425;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID"; "Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Section Type"; "Section Type")
                {
                    ApplicationArea = Basic;
                }
                field("Section Line No."; "Section Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Responsibility; Responsibility)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Indicator"; "Performance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field(Target; Target)
                {
                    ApplicationArea = Basic;
                }
                field("Planned Date"; "Planned Date")
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
