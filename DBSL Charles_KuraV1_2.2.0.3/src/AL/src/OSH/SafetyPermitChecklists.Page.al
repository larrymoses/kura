#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69415 "Safety Permit Checklists"
{
    CardPageID = "Safety Permit Checklist";
    PageType = List;
    SourceTable = 69408;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Condition Type"; "Condition Type")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; "Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Severity Level for Violation"; "Severity Level for Violation")
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