#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75394 "Rejected Proffession Opinion"
{
    ApplicationArea = Basic;
    Caption = 'Rejected Opinions/Evaluation Reports';
    CardPageID = "Proffesion Opinion Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Bid Tabulation Header";
    SourceTableView = where("Document Type"=const("Professional Opinion"),
                            "Process Type"=filter(IFS),
                            "Document Status"=const(Rejected));
    UsageCategory = History;

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
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Report ID";"Final Evaluation Report ID")
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
                field("Raised By";"Raised By")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Committee Role";"Tender Committee Role")
                {
                    ApplicationArea = Basic;
                }
                field("Designation/Title";"Designation/Title")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Procurement Plan ID";"Annual Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Date";"Procurement Plan Date")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code";"Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Line No.";"Procurement Plan Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Entry No";"Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Available Procurement Budget";"Available Procurement Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Narration";"Budget Narration")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date";"Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Completion Date";"Evaluation Completion Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Opening Comm";"Appointed Bid Opening Comm")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Evaluation Com";"Appointed Bid Evaluation Com")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region";"Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Professional Opinion ID";"Professional Opinion ID")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bid No";"Awarded Bid No")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bidder No.";"Awarded Bidder No.")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bidder Name";"Awarded Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Award Tender Sum Inc Taxes";"Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                }
                field("Award Acceptance Deadline";"Award Acceptance Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Award Acceptance Response";"Award Acceptance Response")
                {
                    ApplicationArea = Basic;
                }
                field("Min. Contract Holding";"Min. Contract Holding")
                {
                    ApplicationArea = Basic;
                }
                field("Earliest Contract Issuance Dt";"Earliest Contract Issuance Dt")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder NoA Response Type";"Bidder NoA Response Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder NoA Response Date";"Bidder NoA Response Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Post-Award Disputes";"No. of Post-Award Disputes")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status";"Document Status")
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

