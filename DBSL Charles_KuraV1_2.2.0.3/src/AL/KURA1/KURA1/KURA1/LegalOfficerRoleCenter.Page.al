#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56125 "Legal Officer Role Center"
{
    Caption = 'Advocate Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1907662708; "Purchase Agent Activities")
                {
                }
            }
            group(Control1900724708)
            {
                systempart(Control43; MyNotes)
                {
                }
                part(Control25; "Purchase Performance")
                {
                }
                part(Control37; "Purchase Performance")
                {
                    Visible = false;
                }
                part(Control21; "Inventory Performance")
                {
                }
                part(Control44; "Inventory Performance")
                {
                    Visible = false;
                }
                part(Control35; "My Job Queue")
                {
                    Visible = false;
                }
                part(Control1902476008; "My Vendors")
                {
                }
                part(Control1905989608; "My Items")
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            // action("Bring Up Report")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Bring Up Report';
            //     Image = "Report";
            //     RunObject = Report "Scheduled Cases";
            // }
            // action("Litigation Status Report")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Litigation Status Report';
            //     Image = "Report";
            //     RunObject = Report "Litigation Status Report New";
            // }
            // separator(Action28)
            // {
            // }
            // action("Case Register Report")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Case Register Report';
            //     Image = ItemAvailability;
            //     RunObject = Report "Case Register Report New 2";
            // }
            // action("Archived Cases Report")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Archived Cases Report';
            //     RunObject = Report "Archived Cases New 2";
            // }
            // action("Calendar Based Report")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Calendar Based Report';
            //     Image = "Report";
            //     RunObject = Report "Calendar Base Report";
            // }
            separator(Action53)
            {
            }
        }
        area(embedding)
        {
            action(Plaintiff)
            {
                ApplicationArea = Basic;
                RunObject = Page "Plaintiffs All";
            }
            action(Defendant)
            {
                ApplicationArea = Basic;
                RunObject = Page "Case Defandants";
            }
            action("Nature Of Cases")
            {
                ApplicationArea = Basic;
                RunObject = Page "Nature of Cases";
            }
            action("Case Types")
            {
                ApplicationArea = Basic;
                RunObject = Page "Case Types";
            }
            action("Case Advocates")
            {
                ApplicationArea = Basic;
                RunObject = Page "Case Advocates";
            }
        }
        area(sections)
        {
            group("Case Setups")
            {
                Caption = 'Case Setups';
                Image = LotInfo;
                action(Plaintiffs)
                {
                    ApplicationArea = Basic;
                    Caption = 'Plaintiffs';
                    RunObject = Page "Plaintiffs All";
                }
                action(Defendants)
                {
                    ApplicationArea = Basic;
                    Caption = 'Defendants';
                    RunObject = Page "Case Defandants";
                }
                action(Nature_Of_Cases)
                {
                    ApplicationArea = Basic;
                    Caption = 'Nature Of Cases';
                    RunObject = Page "Nature of Cases";
                }
                action(Case_Types)
                {
                    ApplicationArea = Basic;
                    Caption = 'Case Types';
                    RunObject = Page "Case Types";
                }
                action(Case_Advocates)
                {
                    ApplicationArea = Basic;
                    Caption = 'Case Advocates';
                    RunObject = Page "Case Advocates";
                }
            }
            group("Case Register")
            {
                Caption = 'Case Register';
                Image = LotInfo;
                action("<Page New Case Register List")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Case Register List';
                    RunObject = Page "New Case Register List";
                }
                action("<Page Ongoing Cases List>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ongoing Cases List';
                    RunObject = Page "Case Register List";
                }
            }
            group("Closed Cases")
            {
                Caption = 'Closed Cases';
                Image = LotInfo;
                action("<Page Closed Cases List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Cases List';
                    RunObject = Page "Close Case Registers";
                }
            }
            group("Self Service")
            {
                Caption = 'Self Service';
                Image = Travel;
                action("Imprest Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memos';
                    RunObject = Page "Imprest Memos";
                }
                action("Imprest Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Requisitions';
                    RunObject = Page "Imprest Requisitions";
                }
                action("Imprest Surrenders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Surrenders';
                    RunObject = Page "Imprest Surrenders";
                }
                action("Staff Claims")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Claims';
                    RunObject = Page "Staff Claims";
                }
                action("Purchase Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisitions';
                    RunObject = Page "Purchase Requisitions List";
                }
                action("Store Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisitions';
                    Image = Vendor;
                    RunObject = Page "Store Requisitions";
                }
                action("Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Applications';
                    Image = Balance;
                    RunObject = Page "Leave Applications List";
                }
                action("Fleet Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet Requisitions';
                    Image = Documents;
                    RunObject = Page "Fleet Requisition List";
                }
                action("ICT Help Desk Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'ICT Help Desk Requests';
                    RunObject = Page "ICT Helpdesk Request List";
                }
            }
            group("Approvals ")
            {
                Caption = 'Approvals ';
                Image = Purchasing;
                action("Approval Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Entries';
                    Image = Currency;
                    RunObject = Page "Approval Entries";
                }
                action("Approval Request Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Request Entries';
                    Image = AccountingPeriods;
                    RunObject = Page "Approval Request Entries";
                }
            }
        }
        area(creation)
        {
            action("<Page Case Register Card>")
            {
                ApplicationArea = Basic;
                Caption = 'New Case Register';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Case Register Card";
                RunPageMode = Create;
            }
            action("<Page Defendant Card>")
            {
                ApplicationArea = Basic;
                Caption = 'New Defendant';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Case Defandants";
                RunPageMode = Create;
            }
            action("<Page Plaintiff Card>")
            {
                ApplicationArea = Basic;
                Caption = 'New Plaintiff';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Case Plaintiff All Card";
                RunPageMode = Create;
            }
            action("<Page Nature Of Cases>")
            {
                ApplicationArea = Basic;
                Caption = 'New Nature of Case';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Nature of Cases";
                RunPageMode = Create;
            }
            action("<Page Case Types>")
            {
                ApplicationArea = Basic;
                Caption = 'New Case Type';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Case Types";
                RunPageMode = Create;
            }
            action("<Page Advocate>")
            {
                ApplicationArea = Basic;
                Caption = 'New Advocate';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Case Advocates";
                RunPageMode = Create;
            }
        }
        area(processing)
        {
            separator(Action24)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("Location List ")
            {
                ApplicationArea = Basic;
                Image = Job;
                RunObject = Page "Location List";
            }
            action("&Purchase Journal")
            {
                ApplicationArea = Basic;
                Caption = '&Purchase Journal';
                Image = Journals;
                RunObject = Page "Purchase Journal";
            }
            action("Item &Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Item &Journal';
                Image = Journals;
                RunObject = Page "Item Journal";
            }
            action("Physical Inventory Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Physical Inventory Journal';
                Image = Addresses;
                RunObject = Page "Phys. Inventory Journal";
            }
            action("Order Plan&ning")
            {
                ApplicationArea = Basic;
                Caption = 'Order Plan&ning';
                Image = Planning;
                RunObject = Page "Order Planning";
            }
            separator(Action38)
            {
            }
            action("Requisition &Worksheet")
            {
                ApplicationArea = Basic;
                Caption = 'Requisition &Worksheet';
                Image = Worksheet;
                RunObject = Page "Req. Wksh. Names";
                RunPageView = where("Template Type" = const("Req."),
                                    Recurring = const(false));
            }
            // action("Pur&chase Prices")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Pur&chase Prices';
            //     Image = Price;
            //     RunObject = Page "Purchase Prices";
            // }
            // action("Purchase &Line Discounts")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Purchase &Line Discounts';
            //     Image = LineDiscount;
            //     RunObject = Page "Purchase Line Discounts";
            // }
            separator(Action36)
            {
                Caption = 'History';
                IsHeader = true;
            }
            action("Navi&gate")
            {
                ApplicationArea = Basic;
                Caption = 'Navi&gate';
                Image = Navigate;
                RunObject = Page Navigate;
            }
            action(GRN)
            {
                ApplicationArea = Basic;
                // RunObject = Report UnknownReport51511265;
            }
        }
    }
}

