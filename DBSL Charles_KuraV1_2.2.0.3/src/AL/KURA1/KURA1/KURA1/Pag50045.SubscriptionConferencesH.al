/// <summary>
/// Page Subscription Conferences H (ID 50045).
/// </summary>
page 50045 "Subscription Conferences H"
{
    Caption = 'Subscription Conferences H';
    PageType = Document;
    SourceTable = "Subscriptions Conferences H";
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name 2 field.', Comment = '%';
                    Importance = Additional;
                }
                field("Conference Date"; Rec."Conference Date")
                {
                    ApplicationArea = Basic;
                }
                field("Conference End Date"; Rec."Conference End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Conference Host"; Rec."Conference Host")
                {
                    ApplicationArea = All;
                    // Importance = Additional;
                }
                field("Conference Venue"; Rec."Conference Venue")
                {
                    ApplicationArea = All;
                    // Importance = Additional;
                }
                field("Points Per Member"; Rec."Points Per Member")
                {
                    ApplicationArea = All;
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
                field("Total Course Fees"; Rec."Total Course Fees")
                {
                    ApplicationArea = All;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                    Importance = Additional;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                    Importance = Additional;
                }
            }
            part("Subscriptions Conference Lines"; "Subscriptions Conference Lines")
            {
                SubPageLink = "Document No." = field("No.");
                Caption = 'Conference Members';
                UpdatePropagation = Both;
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
                ToolTip = 'Approve the requested changes.';

                trigger OnAction()
                var
                //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec."Archive Document" := true;
                    Rec.Modify;
                    CurrPage.Close;
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

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Total Points Earned", "Members Attended");
    end;
}
