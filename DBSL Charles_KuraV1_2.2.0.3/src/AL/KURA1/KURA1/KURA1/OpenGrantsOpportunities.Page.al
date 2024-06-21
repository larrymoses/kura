#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65056 "Open Grants Opportunities"
{
    Caption = 'Open Grants Opportunities';
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Grant Funding Application";
    SourceTableView = where("Application Status"=filter("Not Started"|InProgress));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No";"Application No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("FOA ID";"FOA ID")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No";"External Document No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Opportunity  Title";"Opportunity  Title")
                {
                    ApplicationArea = Basic;
                }
                field("Call Type";"Call Type")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Type";"Grant Type")
                {
                    ApplicationArea = Basic;
                }
                field("Justification for Application";"Justification for Application")
                {
                    ApplicationArea = Basic;
                }
                field("Research Center";"Research Center")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Research Program ID";"Primary Research Program ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Research Area";"Primary Research Area")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Principal Investigator";"Principal Investigator")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Grant Amount";"Requested Grant Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Grant Amount(LCY)";"Requested Grant Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Grant Amount";"Awarded Grant Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Grant Amount (LCY)";"Awarded Grant Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Application Status";"Application Status")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Admin Team Code";"Grant Admin Team Code")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Closed Date";"Closed Date")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor No.";"Grantor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Name";"Grantor Name")
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field(Address2;Address2)
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
                field("Phone No";"Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("Mobile Phone No";"Mobile Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Research Contact ID";"Grantor Research Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Research Reviewer";"Grantor Research Reviewer")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Admin Contact ID";"Grantor Admin Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Admin Name";"Grantor Admin Name")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Finance Contact ID";"Grantor Finance Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Finance Contact";"Grantor Finance Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Application Due Date";"Application Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Submitted Date";"Application Submitted Date")
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Award Date";"Estimated Award Date")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Factor";"Currency Factor")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date";"Posting Date")
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

