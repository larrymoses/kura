#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95273 "Audit Management Comments"
{
    PageType = List;
    SourceTable = "Audit Management Comment";

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
                    Visible = false;
                }
                field("Engagement ID";"Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Checklist ID";"Checklist ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Finding ID";"Finding ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Management Comment ID";"Management Comment ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Action Owner ID";"Action Owner ID")
                {
                    ApplicationArea = Basic;
                }
                field("Action Status";"Action Status")
                {
                    ApplicationArea = Basic;
                }
                field("% Complete";"% Complete")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Date Done";"Actual Date Done")
                {
                    ApplicationArea = Basic;
                }
                field("Task Priority";"Task Priority")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date";"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date";"Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Action Type";"Action Type")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Objective ID";"Audit Objective ID")
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

