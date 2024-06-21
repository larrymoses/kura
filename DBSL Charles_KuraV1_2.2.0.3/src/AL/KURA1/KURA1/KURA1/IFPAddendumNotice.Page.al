#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75382 "IFP Addendum Notice"
{
    ApplicationArea = Basic;
    CardPageID = "IFP Addendum Notice Card";
    Editable = false;
    PageType = List;
    SourceTable = "Tender Addendum Notice";
    SourceTableView = where("Process Type"=const(IFP));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Addendum Notice No.";"Addendum Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice No.";"Invitation Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Addendum Instructions";"Addendum Instructions")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Addendum Type ID";"Primary Addendum Type ID")
                {
                    ApplicationArea = Basic;
                }
                field("Addendum Type Description";"Addendum Type Description")
                {
                    ApplicationArea = Basic;
                }
                field("Tender No";"Tender No")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Description";"Tender Description")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("New Submission Start Date";"New Submission Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Original Submission Start Date";"Original Submission Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("New Submission Start Time";"New Submission Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Original Submission Start Time";"Original Submission Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("New Submission End Date";"New Submission End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Original Submission End Date";"Original Submission End Date")
                {
                    ApplicationArea = Basic;
                }
                field("New Submission End Time";"New Submission End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Original Submission End Time";"Original Submission End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Original Bid Opening Date";"Original Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("New Bid Opening Date";"New Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Original Bid Opening Time";"Original Bid Opening Time")
                {
                    ApplicationArea = Basic;
                }
                field("New Bid Opening Time";"New Bid Opening Time")
                {
                    ApplicationArea = Basic;
                }
                field("Original Prebid Meeting Date";"Original Prebid Meeting Date")
                {
                    ApplicationArea = Basic;
                }
                field("New Prebid Meeting Date";"New Prebid Meeting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status";"Document Status")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created by";"Created by")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time";"Created Date/Time")
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

