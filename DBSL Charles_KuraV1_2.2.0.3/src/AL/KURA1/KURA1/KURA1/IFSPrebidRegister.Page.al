#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75134 "IFS Prebid Register"
{
    ApplicationArea = Basic;
    CardPageID = "IFS Prebid Register Card";
    Editable = false;
    PageType = List;
    SourceTable = "IFS Prebid Register";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code";"IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Description";"Tender Description")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Visit Date";"Pre-bid Visit Date")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Visit Start Time";"Pre-bid Visit Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Visit End Date";"Pre-bid Visit End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Visit End Time";"Pre-bid Visit End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Purchaser Code";"Pre-bid Purchaser Code")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Bidders";"No. of Bidders")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Prebid Attendees";"No. of Prebid Attendees")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date";"Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time";"Created Time")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region";"Primary Region")
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

