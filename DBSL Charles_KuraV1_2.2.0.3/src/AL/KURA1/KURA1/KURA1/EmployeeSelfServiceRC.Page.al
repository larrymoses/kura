#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56213 "Employee Self-Service RC"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1904652008; "Employee service Activities")
                {
                }
            }
            group(Control1900724708)
            {
                part(Control21; "My Job Queue")
                {
                    Visible = false;
                }
                systempart(Control1901377608; MyNotes)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            // action("Imprest Memo")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Imprest Memo';
            //     Image = "Report";
            //     RunObject = Report "Imprest Memo";
            // }
            // action("Imprest Requisition")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Imprest Requisition';
            //     Image = "Report";
            //     RunObject = Report "Imprest Requisition";
            // }
            // action("Imprest Surrender")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Imprest Surrender';
            //     Image = "Report";
            //     RunObject = Report "Imprest Surrender";
            // }
            // separator(Action9)
            // {
            // }
            // action(" Leave Application Print Out")
            // {
            //     ApplicationArea = Basic;
            //     Caption = ' Leave Application Print Out';
            //     Image = "Report";
            //     RunObject = Report "Leave Application";
            // }
            separator(Action14)
            {
            }
        }
        area(embedding)
        {
            action("Imprest Memos")
            {
                ApplicationArea = Basic;
                Caption = 'Imprest Memos';
                RunObject = Page "Imprest Memos";
            }
            action("<Page Project Imprest Requisition>")
            {
                ApplicationArea = Basic;
                Caption = 'My Imprest Requisitions';
                Image = Quote;
                RunObject = Page "Imprest Requisitions";
            }
            action("My Store Requisitions")
            {
                ApplicationArea = Basic;
                Caption = 'My Store Requisitions';
                Image = Document;
                RunObject = Page "Store Requisitions";
            }
            action("My Imprest Surrenders")
            {
                ApplicationArea = Basic;
                Caption = 'My Imprest Surrenders';
                Image = Document;
                RunObject = Page "Imprest Surrenders";
            }
            action("My Leave Applications")
            {
                ApplicationArea = Basic;
                Caption = 'My Leave Applications';
                Image = ServiceCode;
                RunObject = Page "Leave Applications List";
            }
            action("ICT Helpdesk Request")
            {
                ApplicationArea = Basic;
                Caption = 'ICT Helpdesk Request';
                Enabled = false;
                Image = SendTo;
                RunObject = Page "ICT Helpdesk Request List";
                Visible = false;
            }
            action("My Purchase Requisitions")
            {
                ApplicationArea = Basic;
                Caption = 'My Purchase Requisitions';
                Image = Loaners;
                RunObject = Page "Open Purchase Requisitions";
            }
            action("Fleet Requisition List")
            {
                ApplicationArea = Basic;
                RunObject = Page "Fleet Requisition List";
            }
            action("Request to Approve")
            {
                ApplicationArea = Basic;
                RunObject = Page "Requests to Approve";
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action("Posted Imprest Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Imprest Memos';
                    Image = PostedVoucherGroup;
                    RunObject = Page "Posted Imprest Memos";
                }
                action("Posted Imprest Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Imprest Requisitions';
                    Image = PostedServiceOrder;
                    RunObject = Page "Posted Imprest Requisitions";
                }
                action("Posted Imprest Surrender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Imprest Surrender';
                    RunObject = Page "Imprest Surrenders";
                }
            }
        }
        area(creation)
        {
            group("&SelfService")
            {
                Caption = '&SelfService';
                Image = Tools;
                action(Action17)
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memo';
                    Image = New;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Imprest Memo";
                    RunPageMode = Create;
                }
                // action("Imprest Requisition")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Imprest Requisition';
                //     Image = NewDocument;
                //     Promoted = false;
                //     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedCategory = Process;
                //     RunObject = Page "Imprest Requisition";
                //     RunPageMode = Create;
                // }
                action(Action16)
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Surrender';
                    Image = NewDocument;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Imprest Surrender";
                    RunPageMode = Create;
                }
            }
            action("Leave Application")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Application';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Leave Applications Card";
                RunPageMode = Create;
            }
            action("Purchase Requisition")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Requisition';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Open Purchase Requisitions";
                RunPageMode = Create;
            }
        }
    }
}

