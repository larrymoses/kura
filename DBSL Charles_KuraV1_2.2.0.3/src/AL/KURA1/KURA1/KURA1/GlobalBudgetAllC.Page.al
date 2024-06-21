#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72379 "Global Budget All C"
{
    Caption = 'Global Budget Book/Road Work Plan';
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
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                    Visible = true;

                    trigger OnValidate()
                    begin
                        Description := 'Annual Maintenance Budget Ceilings Year: ' + "Financial Year Code";
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(Authority; Authority)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Gloabal Budget Book ID"; "Gloabal Budget Book ID")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID"; "Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Road Planner No"; "Road Planner No")
                {
                    ApplicationArea = Basic;
                }
                field("Road Planner Name"; "Road Planner Name")
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
                field("Budget Line/ Vote Item"; "Budget Line/ Vote Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Funding Source ID"; "Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency ID"; "Funding Agency ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Road Project Category"; "Road Project Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                field("Total MultiYear Plan Cost"; "Total MultiYear Plan Cost")
                {
                    ApplicationArea = Basic;
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
                }
            }
            part(Control42; "Maintenance Budget Ceilings Al")
            {
                Caption = 'Budget Ceilings';
                // SubPageLink = "Road Work Program ID"=field(Code);
                Visible = RegionalVisible;
            }
            part(Control25; "Construction Budget  Ceilin Al")
            {
                Caption = 'Budget Ceilings';
                SubPageLink = "Road Work Program ID" = field(Code);
                Visible = GlobalVisible;
            }
            part(Control32; "Multi_Year Work")
            {
                SubPageLink = "Road Work Program ID" = field(Code);
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        if (("Approval Status" = "approval status"::"Pending Approval") or ("Approval Status" = "approval status"::Released)) then begin
            CurrPage.Editable := false;
        end;

        GlobalVisible := false;
        RegionalVisible := false;

        if "Document Type" = "document type"::"Global Budget Book" then begin
            GlobalVisible := true;
            RegionalVisible := false;
        end else
            if "Document Type" = "document type"::"Schedule Of Projects" then begin
                GlobalVisible := false;
                RegionalVisible := true;
            end;

        if "Document Type" = "document type"::"Multi-Year Programs" then begin
            MultiYearVisible := true
        end else
            MultiYearVisible := false;
    end;

    trigger OnAfterGetRecord()
    begin
        if (("Approval Status" = "approval status"::"Pending Approval") or ("Approval Status" = "approval status"::Released)) then begin
            CurrPage.Editable := false;
        end;

        GlobalVisible := false;
        RegionalVisible := false;

        if "Document Type" = "document type"::"Global Budget Book" then begin
            GlobalVisible := true;
            RegionalVisible := false;
        end else
            if "Document Type" = "document type"::"Schedule Of Projects" then begin
                GlobalVisible := false;
                RegionalVisible := true;
            end;

        if "Document Type" = "document type"::"Multi-Year Programs" then begin
            MultiYearVisible := true
        end else
            MultiYearVisible := false;
    end;

    trigger OnOpenPage()
    begin
        if (("Approval Status" = "approval status"::"Pending Approval") or ("Approval Status" = "approval status"::Released)) then begin
            CurrPage.Editable := false;
        end;
        GlobalVisible := false;
        RegionalVisible := false;

        if "Document Type" = "document type"::"Global Budget Book" then begin
            GlobalVisible := true;
            RegionalVisible := false;
        end else
            if "Document Type" = "document type"::"Schedule Of Projects" then begin
                GlobalVisible := false;
                RegionalVisible := true;
            end;


        if "Document Type" = "document type"::"Multi-Year Programs" then begin
            MultiYearVisible := true
        end else
            MultiYearVisible := false;
    end;

    var
        GlobalVisible: Boolean;
        RegionalVisible: Boolean;
        MultiYearVisible: Boolean;
}

