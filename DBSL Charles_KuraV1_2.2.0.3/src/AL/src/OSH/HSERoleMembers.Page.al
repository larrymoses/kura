#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69421 "HSE Role Members"
{
    CardPageID = "HSE Role Member";
    PageType = List;
    SourceTable = 69411;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Role ID"; "Role ID")
                {
                    ApplicationArea = Basic;
                }
                field("Resource No."; "Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Email)
                {
                    ApplicationArea = Basic;
                }
                field("Membership Role Type"; "Membership Role Type")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Service Start Date"; "Service Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Service End Date"; "Service End Date")
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
