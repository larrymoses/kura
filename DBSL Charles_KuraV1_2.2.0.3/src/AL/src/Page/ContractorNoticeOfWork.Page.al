#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72290 "Contractor Notice Of Work"
{
    PageType = Card;
    SourceTable = "Measurement &  Payment Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Certificate Type";"Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                    Visible = "Document Type"="Document Type"::"Payment Certificate";
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field("Works Start Chainage";"Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage";"Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
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
                field("Posted By";"Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(Reversed;Reversed)
                {
                    ApplicationArea = Basic;
                }
                field("Reason For Reversal";"Reason For Reversal")
                {
                    ApplicationArea = Basic;
                }
                field("Reversed By";"Reversed By")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime";"Created DateTime")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control44;"Measurement & Payment Line")
            {
                SubPageLink = "Document Type"=field("Document Type"),
                              "Document No"=field("Document No.");
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                field("Project Start Date";"Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date";"Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer No.";"Project Engineer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager";"Project Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer Name";"Project Engineer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Representative No.";"Engineer Representative No.")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Representative Name";"Engineer Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID";"Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID";"Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID";"Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("County ID";"County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funder Name";"Funder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No.";"Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name";"Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Section Start Chainage";"Section Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Section End Chainage";"Section End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Total  Section Length (KMs)";"Total  Section Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
                field("No Series";"No Series")
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
            action("Measurement Sheet Bill Codes")
            {
                ApplicationArea = Basic;
                RunObject = Page "Measurement Sheet Bill Codes";
                RunPageLink = "Document Type"=field("Document Type"),
                              "Document No"=field("Document No.");
            }
        }
    }
}

