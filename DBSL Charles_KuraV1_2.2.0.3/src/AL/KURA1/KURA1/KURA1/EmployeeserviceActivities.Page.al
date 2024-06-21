#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56214 "Employee service Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Service Cue";

    layout
    {
        area(content)
        {
            cuegroup("Imprest Applications & Processing")
            {
                Caption = 'Imprest Applications & Processing';
                field("Imprest Request-Inprocess"; "Imprest Request-Inprocess")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Imprest Requisitions";
                }
                field("Imprest Requisition-Aproved"; "Imprest Requisition-Aproved")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approved Imprest Requisitions";
                }
                field("Imprest Request-P"; "Imprest Request-P")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Imprest Requisitions';
                }

                actions
                {
                    action("New Imprest Memo")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Imprest Memo';
                        Image = TileNew;
                        RunObject = Page "Imprest Memo";
                        RunPageMode = Create;
                    }
                    action("New Imprest Surrender Memo")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Imprest Surrender Memo';
                        RunObject = Page "Imprest Surr Memo card";
                        RunPageMode = Create;
                        Visible = false;
                    }
                }
            }
            cuegroup("Leave Applications ")
            {
                Caption = 'Leave Applications ';
                field("Leave Application-Inprocess"; "Leave Application-Inprocess")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Leave Applications List";
                }
                field("Leave Application-Approved"; "Leave Application-Approved")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "My Approved Leave Applications";
                }

                actions
                {
                    action("New Imprest Surrender")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Imprest Surrender';
                        Image = TileNew;
                        RunObject = Page "Imprest Surrender";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("Document Approvals")
            {
                Caption = 'Document Approvals';
                field("Requests to Approve"; "Requests to Approve")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Requests to Approve";
                }
                field("Requests Sent for Approval"; "Requests Sent for Approval")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approval Entries";
                }

                actions
                {
                    action("New Purchase Requisition")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Purchase Requisition';
                        // RunObject = Page "Purchase Requisition";
                        RunPageMode = Create;
                    }
                    action("New Leave Application")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Leave Application';
                        RunObject = Page "Leave Applications Card";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup(Control2)
            {
                field("Fleet Requisition List>"; Page::"Fleet Requisition List")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Fleet Requisition List";
                    LookupPageID = "Fleet Requisition List";
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Reset;
        if not Get then begin
            Init;
            Insert;
        end;

        SetRespCenterFilter;
        SetRange("Date Filter", 0D, WorkDate);
        SetFilter("User ID Filter", '=%1', UserId);
    end;
}

