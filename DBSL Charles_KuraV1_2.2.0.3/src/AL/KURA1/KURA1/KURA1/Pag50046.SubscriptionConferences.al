/// <summary>
/// Page Subscription Conferences (ID 50044).
/// </summary>
page 50046 "Subscription Conferences"
{
    // ApplicationArea = All;
    Caption = 'Subscription Conferences';
    PageType = List;
    SourceTable = "Subscriptions Conferences H";
    SourceTableView = where("Archive Document" = const(false));
    Editable = false;
    CardPageId = "Subscription Conferences H";
    // UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("FY Code"; Rec."FY Code")
                {
                    ApplicationArea = All;
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name 2 field.', Comment = '%';
                }
                field("Conference Date"; Rec."Conference Date")
                {
                    ApplicationArea = Basic;
                }
                field("Members Attended"; Rec."Members Attended")
                {
                    ApplicationArea = All;
                }
                field("Total Points Earned"; Rec."Total Points Earned")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Points Earned field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Archive)
            {
                ApplicationArea = Suite;
                Caption = 'Archive';
                Image = Archive;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    SelectedConf: Record "Subscriptions Conferences H";
                    SelectedCount: Integer;
                begin
                    CurrPage.SetSelectionFilter(SelectedConf);
                    SelectedConf.FindSet;
                    SelectedCount := SelectedConf.Count;

                    SelectedConf.ModifyAll("Archive Document", true, true);

                    CurrPage.Update();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.CalcFields("Total Points Earned", "Members Attended");
    end;

    trigger OnAfterGetCurrRecord()
    begin
        Rec.CalcFields("Total Points Earned", "Members Attended");
    end;
}
