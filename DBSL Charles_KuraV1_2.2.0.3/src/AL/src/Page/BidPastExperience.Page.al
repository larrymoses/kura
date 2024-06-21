#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75143 "Bid Past Experience"
{
    PageType = List;
    SourceTable = "Bid Past Experience";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Client Name";"Client Name")
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field("Type of Engagement";"Type of Engagement")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contractor";"Primary Contractor")
                {
                    ApplicationArea = Basic;
                    Caption = 'Main Contractor';
                }
                field("Assignment/Project Name";"Assignment/Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Scope Summary";"Project Scope Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Start Date";"Assignment Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assignment/ Project Start Date';
                }
                field("Assignment End Date";"Assignment End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assignment/Project End Date';
                }
                field("Assignment Value LCY";"Assignment Value LCY")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assignment/Project Value LCY';
                }
                field("Assignment Status";"Assignment Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assignment/Project Status';
                }
                field("Project Completion % (Value)";"Project Completion % (Value)")
                {
                    ApplicationArea = Basic;
                }
                field("Delivery Location";"Delivery Location")
                {
                    ApplicationArea = Basic;
                }
                field("Project Completion % (Work)";"Project Completion % (Work)")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Person";"Primary Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Designation";"Primary Contact Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Tel";"Primary Contact Tel")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Email";"Primary Contact Email")
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

