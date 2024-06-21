#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72377 "Multi Works Line"
{
    PageType = List;
    SourceTable = "Detailed Multi_Year Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("KeRRA Budget Code"; "KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                }
                field("Year Code"; "Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Revision Type"; "Revision Type")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Package No."; "Package No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Line No';
                }
                field("Package Name"; "Package Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Name';
                    Visible = false;
                }
                field("Annual Projection"; "Annual Projection")
                {
                    ApplicationArea = Basic;
                }
                field("Current Budget Amount"; "Current Budget Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Revised Budget"; "Revised Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Supplementary Budget"; "Supplementary Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Date"; "Funding Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Funding Source ID"; "Funding Source ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Actual Amount Allocated"; "Actual Amount Allocated")
                {
                    ApplicationArea = Basic;
                    Caption = 'Actual Amount Disbursed';
                    Editable = false;
                }
                field("Amount Certified"; "Amount Certified")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Actual Amount Spent"; "Actual Amount Spent")
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount Paid';
                    // TableRelation = Job."Total Actual Costs" where ("No."=field("Package No."));
                }
                field(Closed; Closed)
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

