#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72309 "Global Maintenance Budget"
{
    ApplicationArea = Basic;
    Caption = 'Global Maintenance Budget Book';
    CardPageID = "Global Maintenance Budget Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Road Work Program";
    SourceTableView = where("Document Type" = filter("Global Budget Book"),
                            "Road Project Category" = const(Maintenance));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Authority; Authority)
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; "Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID"; "Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Budget ID"; "Financial Budget ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; "Financial Year Code")
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
                }
                field("Total Budget Ceiling"; "Total Budget Ceiling")
                {
                    ApplicationArea = Basic;
                }
                field("Total Actual Costs"; "Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        if "Approval Status" <> "approval status"::Open then begin
            CurrPage.Editable := false;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        if "Approval Status" <> "approval status"::Open then begin
            CurrPage.Editable := false;
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Document Type" := "document type"::"Global Budget Book";

        if UserSetup.Get(UserId) then begin
            if UserSetup."Create Maintenance Budget Book" = false then begin
                Error('You are not allowed to create maintenance budgets');
            end;
        end;
    end;

    trigger OnOpenPage()
    begin
        if "Approval Status" <> "approval status"::Open then begin
            CurrPage.Editable := false;
        end;
    end;

    var
        UserSetup: Record "User Setup";
}

