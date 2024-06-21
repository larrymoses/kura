#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75272 "Finance Opening Register"
{
    ApplicationArea = Basic;
    CardPageID = "Finance Opening Register Card";
    PageType = List;
    SourceTable = "Bid Opening Register";
    SourceTableView = where(Type=const(Finance));
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
                field("Tender Name";"Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date";"Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Start Time";"Bid Opening Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening End Date";"Bid Opening End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening End Time";"Bid Opening End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Purchaser Code";"Pre-bid Purchaser Code")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Intention To Bid Vendor";"No. of Intention To Bid Vendor")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Submitted Bids";"No. of Submitted Bids")
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
                field("Appointed Bid Opening Com";"Appointed Bid Opening Com")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Envelop Type";"Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Unsealing Type";"Bid Unsealing Type")
                {
                    ApplicationArea = Basic;
                }
                field("Final Opening Done";"Final Opening Done")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Evaluation Deadline";"Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Register No.";"Bid Register No.")
                {
                    ApplicationArea = Basic;
                }
                field("Required Bid Security Amount";"Required Bid Security Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Venue";"Bid Opening Venue")
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

