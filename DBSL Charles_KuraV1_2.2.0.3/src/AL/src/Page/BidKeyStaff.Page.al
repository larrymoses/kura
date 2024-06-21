#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75140 "Bid Key Staff"
{
    PageType = List;
    SourceTable = "Bid Key Staff";

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
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff No.";"Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Name";"Staff Name")
                {
                    ApplicationArea = Basic;
                }
                field(Nationality;Nationality)
                {
                    ApplicationArea = Basic;
                }
                field("Proposed Project Role ID";"Proposed Project Role ID")
                {
                    ApplicationArea = Basic;
                }
                field("Required Project Role";"Required Project Role")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Category";"Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field(Profession;Profession)
                {
                    ApplicationArea = Basic;
                }
                field("Date of Birth";"Date of Birth")
                {
                    ApplicationArea = Basic;
                }
                field("Years with Firm";"Years with Firm")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail";"E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type";"Employment Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup18)
            {
                action("Bid Key Staff Qualification")
                {
                    ApplicationArea = Basic;
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bid Key Staff Qualification";
                    RunPageLink = "Staff No."=field("Staff No.");
                }
                action("Bid Key Staff Experience")
                {
                    ApplicationArea = Basic;
                    Image = FileContract;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bid Key Staff Experience";
                    RunPageLink = "Staff No."=field("Staff No.");
                }
            }
        }
    }
}

