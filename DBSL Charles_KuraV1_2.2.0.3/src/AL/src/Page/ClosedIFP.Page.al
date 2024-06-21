#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75064 "Closed IFP"
{
    CardPageID = "IFP Card";
    PageType = List;
    SourceTable = "Request For Information";
    SourceTableView = where("Document Type"=const("Invitation For Prequalification"));

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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Summary";"Tender Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Target Vendor Cluster";"Primary Target Vendor Cluster")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No";"External Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Period Start Date";"Period Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Period End Date";"Period End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Name 2";"Name 2")
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2";"Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code";"Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code";"Country/Region Code")
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
                field("Tender Box Location Code";"Tender Box Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Charge Code";"Prequalification Charge Code")
                {
                    ApplicationArea = Basic;
                }
                field(Published;Published)
                {
                    ApplicationArea = Basic;
                }
                field("Created by";"Created by")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Start Date";"Submission Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Start Time";"Submission Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Date";"Submission End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Time";"Submission End Time")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Submission";"No. of Submission")
                {
                    ApplicationArea = Basic;
                }
                field("Enforce Mandatory E-Receipt";"Enforce Mandatory E-Receipt")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Document Template";"Procurement Document Template")
                {
                    ApplicationArea = Basic;
                }
                field("Display Scoring Criteria Vendo";"Display Scoring Criteria Vendo")
                {
                    ApplicationArea = Basic;
                }
                field("RFI Scoring Template";"RFI Scoring Template")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time";"Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
                field("Summarized Terms & Conditions";"Summarized Terms & Conditions")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 3 Code";"Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field(County;County)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control42;Outlook)
            {
            }
            systempart(Control43;Notes)
            {
            }
            systempart(Control44;MyNotes)
            {
            }
            systempart(Control45;Links)
            {
            }
        }
    }

    actions
    {
    }
}

