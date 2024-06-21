#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72306 "Regional Mainte Road Work Plan"
{
    Caption = 'Regional Maintenance Work Plan';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Road Work Program";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Road Planner No"; "Road Planner No")
                {
                    ApplicationArea = Basic;
                }
                field("Road Planner Name"; "Road Planner Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Gloabal Budget Book ID"; "Gloabal Budget Book ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; "Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Budget ID"; "Financial Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        Description := 'Annual Maintenance Budget Ceilings Year: ' + "Financial Year Code";
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Authority; Authority)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Procurement Plan ID"; "Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Workplanned Length (Km)"; "Total Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Financial Budget"; "Total Financial Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Budget Ceiling"; "Total Budget Ceiling")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Budget Book Amount';
                    Editable = false;
                }
                field("Total Actual Costs"; "Total Actual Costs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    //                 
                }
            }
        }
    }
}