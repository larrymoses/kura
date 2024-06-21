#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69457 "HSE Plan Roles"
{
    CardPageID = "HSE Plan Role";
    PageType = List;
    SourceTable = 69428;

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
                field("Role ID"; "Role ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary"; "Executive Summary")
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
