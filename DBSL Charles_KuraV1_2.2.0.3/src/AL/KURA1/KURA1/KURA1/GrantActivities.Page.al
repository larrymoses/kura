#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65134 "Grant Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Grants Cue";

    layout
    {
        area(content)
        {
            cuegroup("Actual Amounts(LCY)")
            {
                Caption = 'Actual Amounts(LCY)';
                field("Anouncement Amount(LCY)"; "Anouncement Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Announcements';
                }
                field("Successfull Proposals(LCY)"; "Successfull Proposals(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("UnSuccessful Proposals(LCY)"; "UnSuccessful Proposals(LCY)")
                {
                    ApplicationArea = Basic;
                }
            }
            cuegroup("Funding Announcements")
            {
                Caption = 'Funding Announcements';
                field("Funding Accouncement-Open"; "Funding Accouncement-Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Open Funding Announcements';
                }
                field("Funding Accouncement-Closed"; "Funding Accouncement-Closed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Funding Announcements';
                }
            }
            cuegroup("Grant Proposals")
            {
                Caption = 'Grant Proposals';
                field("Grant Proposal-Approved"; "Grant Proposal-Approved")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Grant Proposals';
                }
                field("Grant Proposal-InProgress"; "Grant Proposal-InProgress")
                {
                    ApplicationArea = Basic;
                    Caption = 'InProgress Grant Proposals';
                }
                field("Grant Proposal-Succesful"; "Grant Proposal-Succesful")
                {
                    ApplicationArea = Basic;
                    Caption = 'successful Grant Proposals';
                }
                field("Grant Proposal-NotSuccesful"; "Grant Proposal-NotSuccesful")
                {
                    ApplicationArea = Basic;
                    Caption = 'UnSuccessful Grant Proposals';
                }

                actions
                {
                    action("New Research Proposals")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Research Proposals';
                        Image = TileNew;
                        RunObject = Page "My Research Proposals";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup(Projects)
            {
                Caption = 'Projects';
                field("Project-Ongoing"; "Project-Ongoing")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ongoing Projects';
                }
                field("Project Closed"; "Project Closed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Projects';
                }
            }
            cuegroup(Payments)
            {
                field("Banked Imprest requisition"; "Banked Imprest requisition")
                {
                    ApplicationArea = Basic;
                }
            }
            cuegroup(Approvals)
            {
                Caption = 'Approvals';
                field("Requests to Approve"; "Requests to Approve")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Requests to Approve";
                    ToolTip = 'Specifies the number of approval requests that require your approval.';
                }
            }
            cuegroup("My User Tasks")
            {
                Caption = 'My User Tasks';
                field("UserTaskManagement.GetMyPendingUserTasksCount"; UserTaskManagement.GetMyPendingUserTasksCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Pending User Tasks';
                    Image = Checklist;
                    ToolTip = 'Specifies the number of pending tasks that are assigned to you or to a group that you are a member of.';

                    trigger OnDrillDown()
                    var
                        UserTaskList: Page "User Task List";
                    begin
                        UserTaskList.SetPageToShowMyPendingUserTasks;
                        UserTaskList.Run;
                    end;
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

        //SetRespCenterFilter;
        SetRange("Date Filter", 0D, WorkDate);
        SetFilter("User ID Filter", '=%1', UserId);
    end;

    var
        UserTaskManagement: Codeunit "User Task Management";
}

