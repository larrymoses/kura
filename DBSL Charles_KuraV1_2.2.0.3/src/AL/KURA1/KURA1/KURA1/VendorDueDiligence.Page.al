#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75298 "Vendor Due-Diligence"
{
    ApplicationArea = Basic;
    CardPageID = "Vendor Due Diligence Voucher";
    DeleteAllowed = true;
    Editable = false;
    PageType = List;
    SourceTable = "Bid Evaluation Register";
    SourceTableView = where("Evaluation Type"=filter("Vendor Due Diligence"));
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
                field("Evaluation Type";"Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluator Category";"Evaluator Category")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead";"Evaluation Lead")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead Name";"Evaluation Lead Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bid No.";"Bid No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name";"Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Date";"Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Venue";"Evaluation Venue")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code";"IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Scoring Document No.";"Bid Scoring Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Scoring Document Type";"Bid Scoring Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Register No.";"Bid Opening Register No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date";"Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Evaluation Deadline";"Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Evaluation Commi";"Appointed Bid Evaluation Commi")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region";"Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Envelop Type";"Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                }
                field("Final Opening Done";"Final Opening Done")
                {
                    ApplicationArea = Basic;
                }
                field("Purchaser Code";"Purchaser Code")
                {
                    ApplicationArea = Basic;
                }
                field("Preliminary Evaluation Score";"Preliminary Evaluation Score")
                {
                    ApplicationArea = Basic;
                }
                field("Weighted Technical Eval Score";"Weighted Technical Eval Score")
                {
                    ApplicationArea = Basic;
                }
                field("Technical Evaluation  Decision";"Technical Evaluation  Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Weighted Financial Eval Score";"Weighted Financial Eval Score")
                {
                    ApplicationArea = Basic;
                }
                field("Award Decision";"Award Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Evaluation Comm Remarks";"Tender Evaluation Comm Remarks")
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

