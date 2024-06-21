#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69487 "Safety Permit Workgroups"
{
    CardPageID = "Safety Permit Workgroup";
    PageType = List;
    SourceTable = 69444;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workgroup Type"; "Workgroup Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Contact Person"; "Contact Person")
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
                field("Date Informed"; "Date Informed")
                {
                    ApplicationArea = Basic;
                }
                field("Comments/Additional Notes"; "Comments/Additional Notes")
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
