#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72305 "Regional Maintenance W_Plans"
{
    ApplicationArea = Basic;
    Caption = 'Regional Maintenance Work Plans';
    CardPageID = "Regional Mainte Road Work Plan";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Road Work Program";
    SourceTableView = sorting(Code, "Document Type")
                      order(descending)
                      where("Document Type" = filter("Schedule Of Projects"),
                            "Road Project Category" = filter(Maintenance));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Gloabal Budget Book ID"; Rec."Gloabal Budget Book ID")
                {
                    ApplicationArea = Basic;
                }
                field(Authority; Rec.Authority)
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Budget ID"; Rec."Financial Budget ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Workplanned Length (Km)"; Rec."Total Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budget Ceiling"; Rec."Total Budget Ceiling")
                {
                    ApplicationArea = Basic;
                }
                field("Total Actual Costs"; Rec."Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
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
        if Rec."Approval Status" <> Rec."approval status"::Open then begin
            CurrPage.Editable := false;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec."Approval Status" <> Rec."approval status"::Open then begin
            CurrPage.Editable := false;
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Document Type" := Rec."document type"::"Schedule Of Projects";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Work Program Type":="Work Program Type"::Functional;
    end;

    trigger OnOpenPage()
    begin
        if Rec."Approval Status" <> Rec."approval status"::Open then begin
            CurrPage.Editable := false;
        end;
    end;
}

#pragma implicitwith restore

