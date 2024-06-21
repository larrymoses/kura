#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 99119 "Purchasing Agent Role Center11"
{
    Caption = 'Supply Chain Management Role';
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
            action("Vendor - T&op 10 List")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor - T&op 10 List';
                Image = "Report";
                RunObject = Report "Vendor - Top 10 List";
            }
            action("Vendor/&Item Purchases")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor/&Item Purchases';
                Image = "Report";
                RunObject = Report "Vendor/Item Purchases";
            }
            separator(Action28)
            {
            }
            action("Inventory - &Availability Plan")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory - &Availability Plan';
                Image = ItemAvailability;
                RunObject = Report "Inventory - Availability Plan";
            }
            // action("Purchase Order Report")
            // {
            //     ApplicationArea = Basic;
            //     RunObject = Report UnknownReport51511169;
            // }
            action("Inventory &Purchase Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory &Purchase Orders';
                Image = "Report";
                RunObject = Report "Inventory Purchase Orders";
            }
            action("Inventory - &Vendor Purchases")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory - &Vendor Purchases';
                Image = "Report";
                RunObject = Report "Inventory - Vendor Purchases";
            }
            action("Inventory &Cost and Price List")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory &Cost and Price List';
                Image = "Report";
                RunObject = Report "Inventory Cost and Price List";
            }
            separator(Action53)
            {
            }
            // action("Requisition by Item")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Requisition by Item';
            //     Image = Aging;
            //     RunObject = Report UnknownReport51511437;
            // }
            // action("Requisition by Date")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Requisition by Date';
            //     Image = Alerts;
            //     RunObject = Report UnknownReport51511441;
            // }
            // action("Purchase Order Analysis ")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Purchase Order Analysis ';
            //     RunObject = Report UnknownReport51511473;
            // }
        }
        area(embedding)
        {
            // action("Purchase Orders")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Purchase Orders';
            //     RunObject = Page "Purchase Order List";
            // }
            action("Procurement Plan")
            {
                ApplicationArea = Basic;
                RunObject = Page "Procurement Plans List";
            }
            action("Departmental Procurement Plan")
            {
                ApplicationArea = Basic;
                RunObject = Page "Departmental Procurement Plan";
            }
            action("Approved Departmental Procurement Plan")
            {
                ApplicationArea = Basic;
                RunObject = Page "Approved Dept Procurement Plan";
            }
            action("Consolidated Procurement Plan")
            {
                ApplicationArea = Basic;
                RunObject = Page 75009;
            }
            // action("Open Orders ")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Open Orders ';
            //     RunObject = Page "Purchase Order List";
            //     RunPageView = where(Status=filter(Open));
            // }
            // action("Pending Approval ")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Pending Approval ';
            //     RunObject = Page "Purchase Order List";
            //     RunPageView = where(Status=filter("Pending Approval"));
            // }
            // action("Approved Purchase Orders ")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Approved Purchase Orders ';
            //     RunObject = Page "Purchase Order List";
            //     RunPageView = where(Status=filter(Released));
            // }
            // action("Purchase Quotes")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Purchase Quotes';
            //     RunObject = Page "Purchase Quotes";
            // }
            // action("Blanket Purchase Orders")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Blanket Purchase Orders';
            //     RunObject = Page "Blanket Purchase Orders";
            // }
            action("Purchase Invoices")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Invoices';
                RunObject = Page "Purchase Invoices";
            }
            // action("Purchase Return Orders")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Purchase Return Orders';
            //     RunObject = Page "Purchase Return Order List";
            // }
            action("Purchase Credit Memos")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Credit Memos';
                RunObject = Page "Purchase Credit Memos";
            }
            action("Assembly Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Assembly Orders';
                RunObject = Page "Assembly Orders";
            }
            action("Sales Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page "Sales Order List";
            }
            action(Vendors)
            {
                ApplicationArea = Basic;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                RunPageMode = View;
                RunPageView = where("Vendor Type" = const(Trade));
            }
            action(Items)
            {
                ApplicationArea = Basic;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
            }
            action("Nonstock Items")
            {
                ApplicationArea = Basic;
                Caption = 'Nonstock Items';
                Image = NonStockItem;
                RunObject = Page "Catalog Item List";
            }
            action("Stockkeeping Units")
            {
                ApplicationArea = Basic;
                Caption = 'Stockkeeping Units';
                Image = SKU;
                RunObject = Page "Stockkeeping Unit List";
            }
            action("Purchase Analysis Reports")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Analysis Reports';
                RunObject = Page "Analysis Report Purchase";
                RunPageView = where("Analysis Area" = filter(Purchase));
            }
            action("Inventory Analysis Reports")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory Analysis Reports';
                RunObject = Page "Analysis Report Inventory";
                RunPageView = where("Analysis Area" = filter(Inventory));
            }
            action("Item Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Item Journals';
                RunObject = Page "Item Journal Batches";
                RunPageView = where("Template Type" = const(Item),
                                    Recurring = const(false));
            }
            action("Purchase Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Journals';
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(Purchases),
                                    Recurring = const(false));
            }
            action("Requisition Worksheets")
            {
                ApplicationArea = Basic;
                Caption = 'Requisition Worksheets';
                RunObject = Page "Req. Wksh. Names";
                RunPageView = where("Template Type" = const("Req."),
                                    Recurring = const(false));
            }
            action("Subcontracting Worksheets")
            {
                ApplicationArea = Basic;
                Caption = 'Subcontracting Worksheets';
                RunObject = Page "Req. Wksh. Names";
                RunPageView = where("Template Type" = const("For. Labor"),
                                    Recurring = const(false));
            }
            action("Standard Cost Worksheets")
            {
                ApplicationArea = Basic;
                Caption = 'Standard Cost Worksheets';
                RunObject = Page "Standard Cost Worksheet Names";
            }
            action("Config. Packages")
            {
                ApplicationArea = Basic;
                Caption = 'Config. Packages';
                RunObject = Page "Config. Packages";
            }
        }
        area(sections)
        {
            group("Store Requisitions")
            {
                Caption = 'Store Requisitions';
                Image = LotInfo;
                action("Store Requisitions List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisitions List';
                    RunObject = Page "Store Requisitions";
                }
                action("Approved Store Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Store Requisitions';
                    RunObject = Page 50053;
                }
                action("Store Requisitions Posted")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisitions Posted';
                    RunObject = Page "Posted Store Requisitions";
                }
            }
            group("Purchase Requisitions ")
            {
                Caption = 'Purchase Requisitions ';
                Image = LotInfo;
                action("Purchase Requisitions List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisitions List';
                    RunObject = Page "Open Purchase Requisitions";
                }
                action("Approved Purchase Requsitions ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Purchase Requsitions ';
                    RunObject = Page "Approved PRN";
                }
                action("Unassigned Purchase Requisitions")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Unasssigned PRNs";
                }
                action("Assigned Purchase Requisitions")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Assigned PRNs";
                }
            }
            group("Sourcing Process")
            {
                Caption = 'Sourcing Process';
                Image = LotInfo;
                action("Works Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Works Purchase Requisitions";
                }
                action("Approved Purchase Requisition ")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved PRN";
                }
                action("Draft Invitation for Supply")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Draft Invitation For Supply";
                }
                action("Approved Invitation for Supply")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Invitation For Supply";
                }
                action("Published Invitation for Supply")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Publishe Invitation For Supply";
                }
                action("Request for Quoatation(RFQ)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Quotation List';
                    RunObject = Page "Request For Quotations (RFQ)";
                }
                action("Approved Quotation(RFQ)")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Quotations(RFQ)";
                }
                action("Tender Addendum Notice")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Tender Addendum Notice";
                }
                action("Prebid Meeting Register")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "IFS Prebid Register";
                }
                action("IFS Committee2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Standing Committees';
                    RunObject = Page "Clustered IFS Tender Committee";
                }
                action("IFS Committee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tender Committees';
                    RunObject = Page "IFS Tender Committee";
                }
            }
            group("Supplier Prequalification")
            {
                Caption = 'Supplier Registration.';
                Image = LotInfo;
                action("Registered Suppliers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Vendor Registration";
                }
                action("Invitation for Registration")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Invitation For Prequalificatio";
                }
                action("Published Registrations")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Published Prequalification Not";
                }
                action("Registration Responses")
                {
                    ApplicationArea = Basic;
                    RunObject = Page 75171;
                }

                action("Closed Prequalifications")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Closed Prequalification Notice";
                }
                action("Registration Evaluation Vouchers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page 75186;
                }

                action("Evaluated Registrations")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Evaluated Prequalification Not";
                }
                action("Registration  Entries")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Vendor Prequalification Entry";
                }
            }
            group("Bid Response Evaluation")
            {
                Caption = 'Bid Response Evaluation and Award';
                action("Bid Response List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Bid Response List";
                }
                action("Evaluation Templates")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Bid Evaluation Template";
                }
                action("Standing Committees")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Clustered IFS Tender Committee";
                }
                action("Technical Bid Opening Register")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Bid Opening Register";
                }
                action("Individual Preliminary Eval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Individual Preliminary Evaluation';
                    RunObject = Page "Individual Preliminary Evaluat";
                }
                action("Final preliminary Eval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Final preliminary Evaluation';
                    RunObject = Page "Bid Evaluation Register";
                }
                action("Individual Technical Eval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Individual Technical Evaluation';
                    RunObject = Page "Individual Technical Bid Eval";
                }
                action("Final Technical Eval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Final Technical Evaluation';
                    RunObject = Page "Technical Bid Evaluation list";
                }
                action("Financial Opening Register")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Finance Opening Register";
                }
                action("Individual financial Eval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Individual financial Evaluation';
                    RunObject = Page "Individual Financial Bid Eval";
                }
                action("Final Financial Eval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Final Financial Evaluation';
                    RunObject = Page "Financial Bid Evaluation list";
                }
                action("Approved Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Evaluation Reports';
                    RunObject = Page "Approved Invitation For Supply";
                }
                action("Vendor Due-Diligence")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Vendor Due-Diligence";
                }
                action("Final Evaluation Report")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Final Evaluation  Report";
                }
                action("Professional Opinion")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Proffession Opinion list";
                }
                action("Notification of Award")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Notice of Award list";
                }
            }
            ///////cc
            //cs
            group("Asset Management")
            {
                Caption = 'Asset Management';
                Image = LotInfo;
                group("Asset Register")
                {
                    Caption = 'Asset Register';

                    action("Fixed Assets")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fixed ASSETS';
                        RunObject = Page "Fixed Asset List";
                    }
                    action("Insurance")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Insurance';
                        RunObject = Page "Fixed Asset List";
                    }
                    action("Asset Transfer List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Asset Transfer List';
                        RunObject = Page "Fixed Asset List";
                    }

                }
                group("History")
                {
                    Caption = 'History';
                    action("FA REGISTERS")
                    {
                        ApplicationArea = Basic;
                        Caption = 'FA Registers';
                        RunObject = Page "FA Registers";
                    }
                    action("Navigate3")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Navigate';
                        RunObject = Page "Navigate";
                    }

                }
                group("Reports&Analysis")
                {
                    Caption = 'Reports&Analysis';
                    action("FA Analysis")
                    {
                        ApplicationArea = Basic;
                        Caption = 'FA Aalysis';
                        RunObject = Page "FA Allocations";
                    }
                    action("Navigate")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Navigate';
                        RunObject = Page "Navigate";
                    }

                }
                group("Planning")
                {
                    Caption = 'Planning';

                    action("Fixed Assets2")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fixed ASSETS';
                        RunObject = Page "Fixed Asset List";
                    }
                    action("Functional Disposal plans")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Functional Disposal plans';
                        RunObject = Page "Fixed Asset List";
                    }
                    action("Submitted Functional Disposal plans")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Submitted Functional Disposal plans';
                        RunObject = Page "Fixed Asset List";
                    }
                    action("Consolidated Disposal plan")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Consolidated Disposal plan';
                        RunObject = Page "Fixed Asset List";
                    }
                    action("Disposal Committee Appointment")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Disposal Committee Appointment';
                        RunObject = Page "Fixed Asset List";
                    }
                }

                group("Requisition")
                {
                    Caption = 'Requisition';

                    action("Asset Disposal Requisition")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Asset Disposal Requisition';
                        RunObject = Page "Fixed Asset List";
                    }
                    action("Approved Disposal Requisition List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Disposal Requisition List';
                        RunObject = Page "Fixed Asset List";
                    }

                }
                group("Disposal Methods")
                {
                    caption = 'Disposal Methods';
                    group("Transfer to Public Entity")
                    {
                        Caption = 'Transfer to Public Entity';

                        action("Asset Transfer Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Asset Transfer Vouchers';
                            RunObject = Page "Fixed Asset List";
                        }
                        action("Approved Asset Transfer Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Approved Asset Transfer Vouchers';
                            RunObject = Page "Fixed Asset List";
                        }
                    }

                    group("Sale by Public Tender")
                    {
                        Caption = 'Sale by Public Tender';

                        action("Disposal Quotes")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Disposal Quotes';
                            RunObject = Page "Fixed Asset List";
                        }
                        action("Invitation to Tender Notices")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Invitation to Tender Notices';
                            RunObject = Page "Fixed Asset List";
                        }
                        action("Approved Disposal Invitations")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Invitation to Tender Notices';
                            RunObject = Page "Fixed Asset List";
                        }
                    }
                    group("Sale by Public Auction")
                    {
                        Caption = 'Sale by Public Auction';

                        action("Asset Auction Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Asset Auction Vouchers';
                            RunObject = Page "Fixed Asset List";
                        }
                        action("Approved Asset Auction Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Approved Asset Auction Vouchers';
                            RunObject = Page "Fixed Asset List";
                        }
                    }
                    group("Trade-in")
                    {
                        Caption = 'Trade-in';

                        action("Asset Trade-in Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Asset Trade-in Vouchers';
                            RunObject = Page "Fixed Asset List";
                        }
                        action("Approved Asset Trade-in Voucher")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Approved Asset Trade-in Voucher';
                            RunObject = Page "Fixed Asset List";
                        }
                    }
                    group("Waste Disposal Management")
                    {
                        Caption = 'Waste Disposal Management';

                        action("Asset Disposal Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Asset Disposal Vouchers';
                            RunObject = Page "Fixed Asset List";
                        }
                        action("Approved Asset Disposal Vouchers")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Approved Asset Disposal Vouchers';
                            RunObject = Page "Fixed Asset List";
                        }
                    }
                    group("Setup")
                    {
                        Caption = 'Setup';

                        action("Procurement Committee Types")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Procurement Committee Types';
                            RunObject = Page "Fixed Asset List";
                        }
                        action("Disposal Types")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Disposal Types';
                            RunObject = Page "Fixed Asset List";
                        }
                    }
                    group("Disposal Contract Management")
                    {
                        Caption = 'Disposal Contract Management';

                        action("Sales Orders12")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Sales Orders';
                            RunObject = Page "Sales Order List";
                        }
                        action("Posted Sales Invoices")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Posted Sales Invoices';
                            RunObject = Page "Posted Sales Invoices";
                        }
                    }


                }



            }

            group("Contract Administration")
            {
                Caption = 'Contract Administration';
                Image = LotInfo;
                action("Standard Contract List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Standard Contract List';
                    RunObject = Page "Contract List";
                }
                action("Framework Agreements")
                {
                    ApplicationArea = Basic;
                    Caption = 'Framework Agreements';
                    RunObject = Page "Framework Agreement Invitation";
                }
                // action("Purchase Orders")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Purchase Orders';
                //     RunObject = Page "Purchase Order List";
                // }
                action("Inspection and Acceptance Comm")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inspection and Acceptance Committee';
                    RunObject = Page "Inspection Committee Appointme";
                }
                action("Clustered IAC")
                {
                    ApplicationArea = Basic;
                    Caption = 'Standing Inspection and Acceptance Committee';
                    RunObject = Page "Clustered IFS Tender Committee";
                }
                action("Inspection List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Inspections List";
                }
            }
            group("Self Service")
            {
                Caption = 'Self Service';
                Image = Travel;
                action("Imprest Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Request';
                    RunObject = Page "Imprest Memos";
                }
                action(Action105)
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Request';
                    RunObject = Page "Imprest Requisitions";
                }
                action("Imprest Surrender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Surrender';
                    RunObject = Page "Imprest Surrenders";
                }
                action("Claims Refund")
                {
                    ApplicationArea = Basic;
                    Caption = 'Claims Refund';
                    RunObject = Page "Staff Claims";
                }
                action("Purchase Requisition ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisition ';
                    RunObject = Page "Purchase Requisitions List";
                }
                action("Store Requisition ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisition ';
                    Image = Vendor;
                    RunObject = Page "Store Requisitions";
                }
                action("Leave Application ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Application ';
                    Image = Balance;
                    RunObject = Page "Leave Applications List";
                }
                action("Fleet Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet Requisition';
                    Image = Documents;
                    RunObject = Page "Fleet Requisition List";
                }
                action("ICT Help Desk")
                {
                    ApplicationArea = Basic;
                    Caption = 'ICT Help Desk';
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
            group("Posted Documents & History ")
            {
                Caption = 'Posted Documents & History ';
                Image = FiledPosted;
                action("Posted Purchase Receipts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                }
                action("Posted Return Shipments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                }
                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                }
                action("Posted Assembly Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Assembly Orders';
                    RunObject = Page "Posted Assembly Orders";
                }
                action("Purchase Order Archives")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Order Archives';
                    RunObject = Page "Purchase Order Archives";
                }
            }
        }
        area(creation)
        {
            action("Purchase &Order")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase &Order';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Order";
                RunPageMode = Create;
            }
            action("Purchase &Return Order")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase &Return Order';
                Image = ReturnOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Return Order";
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
        }
    }
}

