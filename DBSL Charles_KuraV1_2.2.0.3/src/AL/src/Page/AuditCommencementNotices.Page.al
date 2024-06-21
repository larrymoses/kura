#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95220 "Audit Commencement Notices"
{
    CardPageID = "Audit Commencement Notice";
    PageType = List;
    SourceTable = "Audit Mobilization Header";
    SourceTableView = where("Document Type"=filter("Audit Commencement Notice"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Audit Commencement Notice No.";"Audit Commencement Notice No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Auditee Notice Response No.";"Auditee Notice Response No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Entrace Meeting No.";"Entrace Meeting No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Engagement ID";"Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Audit Plan ID";"Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit  Work Type";"Audit  Work Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Engagement Name";"Engagement Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Engagement Category";"Engagement Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Auditor Type";"Auditor Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit Lead ID";"Audit Lead ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Auditee Type";"Auditee Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary Auditee ID";"Primary Auditee ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Auditee Name";"Auditee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Auditee Lead ID";"Auditee Lead ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Created DateTime";"Created DateTime")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Entrance Meeting Venue";"Entrance Meeting Venue")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Entrance Meeting Start Date";"Entrance Meeting Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Entrance Meeting Start Time";"Entrance Meeting Start Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Entrance Meeting End Date";"Entrance Meeting End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Entrance Meeting End Time";"Entrance Meeting End Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Duration;Duration)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Meeting Medium";"Meeting Medium")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

