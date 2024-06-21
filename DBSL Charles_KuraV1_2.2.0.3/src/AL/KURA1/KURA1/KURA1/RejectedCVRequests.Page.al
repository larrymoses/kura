#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72492 "Rejected CV Requests"
{
    ApplicationArea = Basic;
    Caption = 'Rejected Contractor Variation Requests';
    CardPageID = "Contractor Variation Request";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Project Variation Header";
    SourceTableView = where("Document Type"=filter("Contractor Variation Request"),
                            Status=filter(Released),
                            "Review Status"=const(Declined));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Extension Reason Code";"Extension Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary";"Executive Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Original Project Starting Date";"Original Project Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Original Project Ending Date";"Original Project Ending Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Extension Period";"Requested Extension Period")
                {
                    ApplicationArea = Basic;
                }
                field("Extended Project End Date";"Extended Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Review Status";"Review Status")
                {
                    ApplicationArea = Basic;
                }
                field("Review Rejection Notes";"Review Rejection Notes")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time";"Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"Contractor Variation Request";
    end;
}

