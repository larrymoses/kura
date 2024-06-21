#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69474 "Emergency Drill Teams"
{
    CardPageID = "Emergency Drill Team";
    PageType = List;
    SourceTable = 69437;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resource No."; "Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(Role; Role)
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No."; "Telephone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Email)
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