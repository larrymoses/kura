#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75141 "Bid Key Staff Qualification"
{
    PageType = List;
    SourceTable = "Bid Key Staff Qualification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Proposed Project Role ID";"Proposed Project Role ID")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Category";"Qualification Category")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Name";"Qualification Name")
                {
                    ApplicationArea = Basic;
                }
                field(Institution;Institution)
                {
                    ApplicationArea = Basic;
                }
                field("Start Year";"Start Year")
                {
                    ApplicationArea = Basic;
                }
                field("End Year";"End Year")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Achievements";"Outstanding Achievements")
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

