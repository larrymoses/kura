/// <summary>
/// Page Archived Subscription Conf. H (ID 50068).
/// </summary>
page 50068 "Archived Subscription Conf. H"
{
    ApplicationArea = All;
    Caption = 'Archived Subscription Conferences';
    PageType = List;
    SourceTable = "Subscriptions Conferences H";
    SourceTableView = where("Archive Document" = const(true));
    Editable = false;
    UsageCategory = History;
    
    layout
    {
        area(Content)
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
}
