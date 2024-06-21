#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69484 "Safety Permit Application Line"
{
    PageType = ListPart;
    SourceTable = 69442;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Permit Type";"Permit Type")
                {
                    ApplicationArea = Basic;
                }
                field("Compliance Requirement";"Compliance Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";"Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Severity Level for Violation";"Severity Level for Violation")
                {
                    ApplicationArea = Basic;
                }
                field("Compliance Status";"Compliance Status")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Compliance Notes";"Additional Compliance Notes")
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
