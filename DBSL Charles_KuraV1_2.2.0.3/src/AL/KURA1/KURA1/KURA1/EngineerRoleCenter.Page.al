page 60001 "EngineerRoleCenter"
{
    Caption = 'Engineer Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {

            part(Control55; "Road Activities")
            {
                //  AccessByPermission = TableData "Assisted Setup" = I;
                ApplicationArea = Basic, Suite;
                Caption = 'Roads Operations Activities';
            }
            part(Control102; "Headline RC Project Manager")
            {
                ApplicationArea = Jobs;
            }
            part(Control33; "Project Manager Activities")
            {
                ApplicationArea = Jobs;
            }
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Jobs;
            }
            part(Control77; "Team Member Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control34; "My Jobs")
            {
                ApplicationArea = Jobs;
            }
            part("Job Actual Price to Budget Price"; "Job Act to Bud Price Chart")
            {
                ApplicationArea = Jobs;
                Caption = 'Job Actual Price to Budget Price';
            }
            part("Job Profitability"; "Job Profitability Chart")
            {
                ApplicationArea = Jobs;
                Caption = 'Job Profitability';
            }
            part("Job Actual Cost to Budget Cost"; "Job Act to Bud Cost Chart")
            {
                ApplicationArea = Jobs;
                Caption = 'Job Actual Cost to Budget Cost';
            }
            part(Control1907692008; "My Customers")
            {
                ApplicationArea = Jobs;
                Editable = false;
                Enabled = false;
                Visible = false;
            }
            part("Power BI Report Spinner Part"; "Power BI Report Spinner Part")
            {
                AccessByPermission = TableData "Power BI User Configuration" = I;
                ApplicationArea = Basic, Suite;
            }
            part(Control21; "My Job Queue")
            {
                ApplicationArea = Jobs;
                Visible = True;
            }
            part(Control31; "Report Inbox Part")
            {
                ApplicationArea = Jobs;
                Visible = false;
            }
            systempart(Control1901377608; MyNotes)
            {
                ApplicationArea = Jobs;
                Visible = false;
            }
        }
    }

    actions
    {

        //////////////////////////////////////////////////////////////////////////////////////////////



        /// /////////////////////////////////////////////////////////////////////////////////////////
        area(embedding)
        {
            action(Jobs)
            {
                ApplicationArea = Jobs;
                Caption = 'Jobs';
                Image = Job;
                RunObject = Page "Job List";
                ToolTip = 'Define a project activity by creating a job card with integrated job tasks and job planning lines, structured in two layers. The job task enables you to set up job planning lines and to post consumption to the job. The job planning lines specify the detailed use of resources, items, and various general ledger expenses.';
            }
            ////////////////////////////////////////
            /// 
            action("GlobalRoadInventory")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Global Road Inventory';
                Image = NewSalesQuote;
                RunObject = Page "Global Road Inventory";
                RunPageMode = Create;
                //ToolTip = 'Offer items or services to a customer.';
            }
            action("RoadStructuresInventory")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Road Structures Inventory';
                Image = NewOrder;
                RunObject = Page "Road Structure Inventory";
                RunPageMode = Create;
                //   ToolTip = 'Create a new sales order for items or services.';
            }
            action("RoadFacilitiesInventory12")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Road Facilities Inventory';
                Image = NewSalesInvoice;
                RunObject = Page "Road Facility Item";
                RunPageMode = Create;
                ToolTip = 'Create a new invoice for the sales of items or services. Invoice quantities cannot be posted partially.';
            }
            action("Registered Road Environs")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Suite;
                Caption = 'Registered Road Environs';
                Image = NewSalesQuote;
                RunObject = Page "Road Environ Entries";
                RunPageMode = Create;
                //             ToolTip = 'Create a new purchase quote.';
            }



            /// 





            ////
            action(JobsOnOrder)
            {
                ApplicationArea = Jobs;
                Caption = 'Open';
                RunObject = Page "Job List";
                RunPageView = WHERE(Status = FILTER(Open));
                ToolTip = 'Open the card for the selected record.';
            }
            action(JobsPlannedAndQuoted)
            {
                ApplicationArea = Jobs;
                Caption = 'Planned and Quoted';
                RunObject = Page "Job List";
                RunPageView = WHERE(Status = FILTER(Quote | Planning));
                ToolTip = 'View all planned and quoted jobs.';
            }
            action("Jobs Completed")
            {
                ApplicationArea = Jobs;
                Caption = 'Completed';
                RunObject = Page "Job List";
                RunPageView = WHERE(Status = FILTER(Completed));
                ToolTip = 'View all completed jobs.';
            }
            action(JobsUnassigned)
            {
                ApplicationArea = Jobs;
                Caption = 'Unassigned';
                RunObject = Page "Job List";
                RunPageView = WHERE("Person Responsible" = FILTER(''));
                ToolTip = 'View all unassigned jobs.';
            }
            action("Job Tasks")
            {
                ApplicationArea = Suite;
                Caption = 'Job Tasks';
                RunObject = Page "Job Task List";
                ToolTip = 'Define the various tasks involved in a job. You must create at least one job task per job because all posting refers to a job task. Having at least one job task in your job enables you to set up job planning lines and to post consumption to the job.';
            }
            action(Customers)
            {
                ApplicationArea = Jobs;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(Items)
            {
                ApplicationArea = Jobs;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action(Resources)
            {
                ApplicationArea = Jobs;
                Caption = 'Resources';
                RunObject = Page "Resource List";
                ToolTip = 'Manage your resources'' job activities by setting up their costs and prices. The job-related prices, discounts, and cost factor rules are set up on the respective job card. You can specify the costs and prices for individual resources, resource groups, or all available resources of the company. When resources are used or sold in a job, the specified prices and costs are recorded for the project.';
            }
            ////////////////////////////////////////////////////////////////////


            /// 
            ///////////////////////////////////////////////////////////////////// 
        }
        area(sections)
        {
            group("Sales & Purchases")
            {
                Caption = 'Sales & Purchases';
                action("Sales Invoices")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Sales Invoices';
                    Image = Invoice;
                    RunObject = Page "Sales Invoice List";
                    ToolTip = 'Register your sales to customers and invite them to pay according to the delivery and payment terms by sending them a sales invoice document. Posting a sales invoice registers shipment and records an open receivable entry on the customer''s account, which will be closed when payment is received. To manage the shipment process, use sales orders, in which sales invoicing is integrated.';
                }
                action("Sales Credit Memos")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Sales Credit Memos';
                    RunObject = Page "Sales Credit Memos";
                    ToolTip = 'Revert the financial transactions involved when your customers want to cancel a purchase or return incorrect or damaged items that you sent to them and received payment for. To include the correct information, you can create the sales credit memo from the related posted sales invoice or you can create a new sales credit memo with copied invoice information. If you need more control of the sales return process, such as warehouse documents for the physical handling, use sales return orders, in which sales credit memos are integrated. Note: If an erroneous sale has not been paid yet, you can simply cancel the posted sales invoice to automatically revert the financial transaction.';
                }
                action("Purchase Orders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Orders';
                    RunObject = Page "Purchase Order List";
                    ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
                }
                action("Purchase Invoices")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Invoices';
                    RunObject = Page "Purchase Invoices";
                    ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
                }
                action("Purchase Credit Memos")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Credit Memos';
                    RunObject = Page "Purchase Credit Memos";
                    ToolTip = 'Create purchase credit memos to mirror sales credit memos that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. If you need more control of the purchase return process, such as warehouse documents for the physical handling, use purchase return orders, in which purchase credit memos are integrated. Purchase credit memos can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
                }
            }
            /////////////////////////cc
            group(RICS)
            {
                Caption = 'RICS';
                Image = Transactions;
                action("RICS (Existing Road Links)")
                {
                    AccessByPermission = TableData Customer = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'RICS (Existing Road Links)';
                    Image = Customer;
                    RunObject = Page "Road Condition Surveys(Exist N";
                    //RunPageMode = Create;
                    ToolTip = 'Create a new road links survey.';
                }
                action("RICS (New Road Links)")
                {
                    AccessByPermission = TableData Vendor = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'RICS (New Road Links)';
                    Image = Vendor;
                    RunObject = Page "Road Condition Surveys(New Ro)";
                    Visible =false;
                 //RunPageMode = Create;
                    ToolTip = 'Register a new vendor.';
                }
            }
            group(Projects)
            {
                Caption = 'Projects';
                action("Planned Projects")
                {
                    ApplicationArea = Basic;
                    Caption = 'Planned Projects';
                    RunObject = Page "Job List";
                    RunPageView = where(Status = filter(Planned));
                }
                action("Ongoing Projects")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ongoing Projects';
                    Image = ApplyEntries;
                    RunObject = Page "job List";
                    RunPageView = where(status = filter(Ongoing));
                }
                action("Completed/Under DLP Projects")
                {
                    AccessByPermission = TableData "Bank Export/Import Setup" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Completed/Under DLP Projects';
                    Image = Import;
                    RunObject = Page "Job List";
                    RunPageView = where(Status = filter("Completed/Under DLP"));
                    // ToolTip = 'To start the process of reconciling new payments, import a bank feed or electronic file containing the related bank transactions.';
                }
                action("Projects Under PBRM")
                {
                    AccessByPermission = TableData "Payment Registration Setup" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Projects Under PBRM';
                    Image = Payment;
                    RunObject = Page "Job List";
                    RunPageView = where(Status = filter("Under PBRM"));
                    ToolTip = 'Process your customer payments by matching amounts received on your bank account with the related unpaid sales invoices, and then post the payments.';
                }
                action("Completed Projects")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Completed Projects';
                    Image = SuggestVendorPayments;
                    RunObject = Page "Job List";
                    RunPageView = where(Status = filter(Completed));
                    ToolTip = 'Opens vendor ledger entries for all vendors with invoices that have not been paid yet.';
                }
            }
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            group(Setup)
            {
                Caption = 'Setup';
                Image = Setup;
                action("Roads Management Setup Card")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Roads Management Setup Card';
                    Image = CompanyInformation;
                    RunObject = Page "Roads Management Setup";
                }

                action(Counties)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Counties';
                    Image = Map;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page Counties;
                }
                action(Towns)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Towns';
                    Image = MapSetup;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page 92000;
                }
                action(Regions)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Regions';
                    Image = MapSetup;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Regions List";
                }
                action(Constituencies)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Constituencies';
                    Image = MapAccounts;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page Constituencies;
                }
                action("Configuration Packages")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Configuration Packages';
                    Image = CompanyInformation;
                    RunObject = Page "Config. Packages";
                }
                group("i-RMS Global Setups")
                {
                    Caption = 'i-RMS Global Setups';
                    //Image = Administration;
                    action("Roads Management Setup")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Roads Management Setup';
                        Image = CompanyInformation;
                        RunObject = Page "Roads Management Setup";
                    }
                    action("Funding Year Codes")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Funding Year Codes';
                        Image = NonStockItemSetup;
                        RunObject = Page "Funding Year Codes";
                        // ToolTip = 'Install Extensions for greater functionality of the system.';
                    }
                    action("Road Works Types")
                    {
                        ApplicationArea = Service;
                        Caption = 'Road Works Types';
                        Image = ServiceTasks;
                        RunObject = Page "Works Categories";
                    }
                    action("Road Materials")
                    {
                        ApplicationArea = Service;
                        Caption = 'Road Materials';
                        Image = ServiceTasks;
                        RunObject = Page "Road Materialsx";
                        // ToolTip = 'Enable and configure external services, such as exchange rate updates, Microsoft Social Engagement, and electronic bank integration.';
                    }
                    action("Road Technologies")
                    {
                        ApplicationArea = Service;
                        Caption = 'Road Technologies';
                        Image = ServiceTasks;
                        RunObject = Page "Road Technologies";
                    }
                    action("Road Authorities")
                    {
                        ApplicationArea = Service;
                        Caption = 'Road Authorities';
                        Image = ServiceTasks;
                        RunObject = Page "Road Authorities";
                    }
                    action("Road Classes")
                    {
                        ApplicationArea = Service;
                        Caption = 'Road Classes';
                        Image = ServiceTasks;
                        RunObject = Page "Road Classes";
                    }
                    action("Pavement Surface Types")
                    {
                        ApplicationArea = Service;
                        Caption = 'Pavement Surface Types';
                        Image = ServiceTasks;
                        RunObject = Page "Pavement Surface Types";
                    }
                    action("Road Facility Types")
                    {
                        ApplicationArea = Service;
                        Caption = 'Road Facility Types';
                        Image = ServiceTasks;
                        RunObject = Page "Road Facility Type";
                    }
                    action("Road Environs Categories")
                    {
                        ApplicationArea = Service;
                        Caption = 'Road Environs Categories';
                        Image = ServiceTasks;
                        RunObject = Page "Road Environ Categories";
                    }
                    action("Pavement Layers")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pavement Layers Setup';
                        Image = ServiceTasks;
                        RunObject = Page Layers;
                    }
                    action("Pavement Layer Test Setups")
                    {
                        ApplicationArea = Service;
                        Caption = 'Pavement Layer Test Setups';
                        Image = ServiceTasks;
                        RunObject = Page "Layer Test Setup";
                    }
                    action("Materials On Site Setup")
                    {
                        ApplicationArea = Service;
                        Caption = 'Materials On Site Setup';
                        Image = ServiceTasks;
                        RunObject = Page "Material On Site Setup";
                    }
                    action("Required Document Types")
                    {
                        ApplicationArea = Basic;
                        Image = Check;
                        RunObject = Page "Project Document Types";
                    }
                    action("Consultacy Report Types")
                    {
                        ApplicationArea = Service;
                        Caption = 'Consultacy Report Types';
                        Image = ServiceTasks;
                        RunObject = Page "Study/Survey/Design Reports";
                    }
                }
                group("i-RMS Default Template Setups")
                {
                    Caption = 'i-RMS Default Template Setups';
                    //Image = Setup;
                    action("Standard BoQ Templates")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Standard BoQ Templates';
                        Image = CompanyInformation;
                        RunObject = Page "BoQ Requisition Template";
                    }
                    action("Project BoQs")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Project BoQs';
                        Image = NonStockItemSetup;
                        RunObject = Page "BoQ Requisition Template";
                        //ToolTip = 'Install Extensions for greater functionality of the system.';
                    }
                    action("Engineer's Estimates")
                    {
                        ApplicationArea = Service;
                        Caption = 'Engineer''s Estimates';
                        Image = ServiceTasks;
                        RunObject = Page "BoQ Requisition Template";
                        // ToolTip = 'Enable and configure external services, such as exchange rate updates, Microsoft Social Engagement, and electronic bank integration.';
                    }
                    action("Project Staff Templates")
                    {
                        ApplicationArea = Service;
                        Caption = 'Project Staff Templates';
                        Image = ServiceTasks;
                        RunObject = Page "Project Works Staff Template";
                    }
                    action("Equipment Specs Templates")
                    {
                        ApplicationArea = Service;
                        Caption = 'Project Staff Templates';
                        Image = ServiceTasks;
                        RunObject = Page "Works Equipment Template";
                    }
                    action("Required Document Templates")
                    {
                        ApplicationArea = Service;
                        Caption = 'Required Document Templates';
                        Image = ServiceTasks;
                        RunObject = Page "Project Document Templates";
                    }
                    action("Default Meeting Templates")
                    {
                        ApplicationArea = Service;
                        Caption = 'Default Meeting Templates';
                        Image = ServiceTasks;
                        RunObject = Page "Project Meeting Types";
                    }
                    action("Checklist Templates")
                    {
                        ApplicationArea = Service;
                        Caption = 'Checklist Templates';
                        Image = ServiceTasks;
                        RunObject = Page "Project Kickoff Templates";
                    }
                    action("Project Materials Templates")
                    {
                        ApplicationArea = Service;
                        Caption = 'Project Materials Templates';
                        Image = ServiceTasks;
                        RunObject = Page "Project Material Templates";
                    }
                }
            }
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            group("RMS Home")
            {
                Caption = 'RMS Home';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action("Kenya Road Inventory")
                {
                    ApplicationArea = RMSJobs;
                    Caption = 'Kenya Road Inventory';
                    RunObject = Page 72148;
                    //  ToolTip = 'Define a project activity by creating a job card with integrated job tasks and job planning lines, structured in two layers. The job task enables you to set up job planning lines and to post consumption to the job. The job planning lines specify the detailed use of resources, items, and various general ledger expenses.';
                }
                action("HNational Secondary Roads")
                {
                    ApplicationArea = RMSJobs;
                    Caption = 'National Secondary Roads';
                    RunObject = Page "72347";
                    // RunPageView = WHERE(Status = FILTER(Open));
                    // ToolTip = 'Open the card for the selected record.';
                }
                action(HNationalTrunkRoads)
                {
                    ApplicationArea = RMSJobs;
                    Caption = 'National Trunk Roads';
                    RunObject = Page "72345";
                    // ToolTip = 'Open the list of all planned and quoted jobs.';
                }
                action(HCountyRoads)
                {
                    ApplicationArea = RMSJobs;
                    Caption = 'County Roads';
                    RunObject = Page "72520";
                    //RunPageView = WHERE(Status = FILTER(Completed));
                    //ToolTip = 'Open the list of all completed jobs.';
                }
                action(HKWSRoads)
                {
                    ApplicationArea = Jobs;
                    Caption = 'KWS Roads';
                    RunObject = Page "72522";
                    // RunPageView = WHERE("Person Responsible" = FILTER(''));
                    //ToolTip = 'Open the list of all unassigned jobs.';
                }
                action(HSpecialPurposeRoads)
                {
                    ApplicationArea = Suite;
                    Caption = 'Special Purpose Roads';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "72524";
                    // ToolTip = 'Open the list of ongoing job tasks. Job tasks represent the actual work that is performed in a job, and they enable you to set up job planning lines and to post consumption to the job.';
                }
                action("HUnclassified Roads")
                {
                    ApplicationArea = RMSJobs;
                    Caption = 'Unclassified Roads';
                    Image = JobRegisters;
                    RunObject = Page "72526";
                    // ToolTip = 'View auditing details for all job ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
                action("RoadStructures Inventory")
                {
                    ApplicationArea = RMSJobs;
                    Caption = 'Road Structures Inventory';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "72351";
                    //  ToolTip = 'Open the list of ongoing job planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that he should pay for the job (billable).';
                }
                action("Road Facilities Inventory")
                {
                    ApplicationArea = RMSJobs;
                    Caption = 'Road Facilities Inventory';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "72353";
                    //  RunPageView = WHERE(Recurring = CONST(false));
                    //ToolTip = 'Record job expenses or usage in the job ledger, either by reusing job planning lines or by manual entry.';
                }
                action("RegistereRoadEnvirons")
                {
                    ApplicationArea = RMSJobs;
                    Caption = 'Registered Road Environs';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "72355";
                    //  RunPageView = WHERE("Template Type" = CONST(Jobs),
                    //                     Recurring = CONST(false));
                    // ToolTip = 'Record job expenses or usage in job accounts in the general ledger. For expenses or usage of type G/L Account, use the job G/L journal instead of the job journal.';
                }
                action("Projects List")
                {
                    ApplicationArea = RMSJobs;
                    Caption = 'Projects List';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job List";
                    // RunPageView = WHERE(Recurring = CONST(true));
                    //ToolTip = 'Reuse preset journal lines to record recurring job expenses or usage in the job ledger.';
                }
            }
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            group("Survey")
            {
                Caption = 'Survey';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action("Global Road Inventory")
                {
                    ApplicationArea = Survey;
                    Caption = 'Global Road Inventory';
                    RunObject = Page "72148";
                    //  ToolTip = 'Define a project activity by creating a job card with integrated job tasks and job planning lines, structured in two layers. The job task enables you to set up job planning lines and to post consumption to the job. The job planning lines specify the detailed use of resources, items, and various general ledger expenses.';
                }
                action("National Trunk Roads")
                {
                    ApplicationArea = Survey;
                    Caption = 'National Trunk Roads';
                    RunObject = Page "72345";
                    // RunPageView = WHERE(Status = FILTER(Open));
                    // ToolTip = 'Open the card for the selected record.';
                }
                action("National Secondary Roads")
                {
                    ApplicationArea = Survey;
                    Caption = 'National Secondary Roads';
                    RunObject = Page "72347";
                    // ToolTip = 'Open the list of all planned and quoted jobs.';
                }
                action("County Roads")
                {
                    ApplicationArea = survey;
                    Caption = 'County Roads';
                    RunObject = Page "72349";
                    //RunPageView = WHERE(Status = FILTER(Completed));
                    //ToolTip = 'Open the list of all completed jobs.';
                }
                action("Urban Roads")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Urban Roads';
                    RunObject = Page "72520";
                    // RunPageView = WHERE("Person Responsible" = FILTER(''));
                    //ToolTip = 'Open the list of all unassigned jobs.';
                }
                action("KWSRoads")
                {
                    ApplicationArea = Suite;
                    Caption = 'KWS Roads';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "72522";
                    // ToolTip = 'Open the list of ongoing job tasks. Job tasks represent the actual work that is performed in a job, and they enable you to set up job planning lines and to post consumption to the job.';
                }
                action("SpecialPurposeRoads")
                {
                    ApplicationArea = Survey;
                    Caption = 'Special Purpose Roads';
                    Image = JobRegisters;
                    RunObject = Page "72526";
                    // ToolTip = 'View auditing details for all job ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
                action("Road Structures Inventory")
                {
                    ApplicationArea = Survey;
                    Caption = 'Road Structures Inventory';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "72524";
                    //  ToolTip = 'Open the list of ongoing job planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that he should pay for the job (billable).';
                }
                action("UnclassifiedRoads")
                {
                    ApplicationArea = survey;
                    Caption = 'Unclassified Roads';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "72526";
                    //  RunPageView = WHERE(Recurring = CONST(false));
                    //ToolTip = 'Record job expenses or usage in the job ledger, either by reusing job planning lines or by manual entry.';
                }
                action("RoadFacilitiesInventory")
                {
                    ApplicationArea = Survey;
                    Caption = 'Road Facilities Inventory';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "72353";
                    //  RunPageView = WHERE("Template Type" = CONST(Jobs),
                    //                     Recurring = CONST(false));
                    // ToolTip = 'Record job expenses or usage in job accounts in the general ledger. For expenses or usage of type G/L Account, use the job G/L journal instead of the job journal.';
                }
                action("RegisteredRoadEnvirons")
                {
                    ApplicationArea = Survey;
                    Caption = 'Registered Road Environs';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "72355";
                    // RunPageView = WHERE(Recurring = CONST(true));
                    //ToolTip = 'Reuse preset journal lines to record recurring job expenses or usage in the job ledger.';
                }
            }

            ///////++++++++++++++++++++++++++++++++++++++///////////////////////////////////////////////////////////////////		-----------------------------------

            group("Budgeting&Workplanning")
            {
                Caption = 'Budgeting & Workplanning';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action("Multi Year Financing Projections")
                {
                    ApplicationArea = BudgetingWorkplanning;
                    Caption = 'Multi Year Financing Projections';
                    RunObject = Page "72374";
                    //  ToolTip = 'Define a project activity by creating a job card with integrated job tasks and job planning lines, structured in two layers. The job task enables you to set up job planning lines and to post consumption to the job. The job planning lines specify the detailed use of resources, items, and various general ledger expenses.';
                }
                action("AnnualBudgetAllocationConstruction")
                {
                    ApplicationArea = BudgetingWorkplanning;
                    Caption = 'Annual Budget Allocation Construction';
                    RunObject = Page "72332";
                    // RunPageView = WHERE(Status = FILTER(Open));
                    // ToolTip = 'Open the card for the selected record.';
                }
                action("AnnualBudgetAllocationMaintenance")
                {
                    ApplicationArea = BudgetingWorkplanning;
                    Caption = 'Annual Budget Allocation Maintenance';
                    RunObject = Page "72309";
                    // ToolTip = 'Open the list of all planned and quoted jobs.';
                }
                action("AnnualBudgetAllocationConsultancy")
                {
                    ApplicationArea = BudgetingWorkplanning;
                    Caption = 'Annual Budget Allocation Consultancy';
                    RunObject = Page "72721";
                    //RunPageView = WHERE(Status = FILTER(Completed));
                    //ToolTip = 'Open the list of all completed jobs.';
                }
                action("RoadWorkplansMaintenance12")
                {
                    ApplicationArea = BudgetingWorkplanning;
                    Caption = 'Road Workplans Maintenance';
                    RunObject = Page "72305";
                    // RunPageView = WHERE("Person Responsible" = FILTER(''));
                    //ToolTip = 'Open the list of all unassigned jobs.';
                }
                action("ScheduleofDevelopment Projects")
                {
                    ApplicationArea = BudgetingWorkplanning;
                    Caption = 'Schedule Of Planned Projects';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "72341";
                    // ToolTip = 'Open the list of ongoing job tasks. Job tasks represent the actual work that is performed in a job, and they enable you to set up job planning lines and to post consumption to the job.';
                }
                action("Workplans For Consultancy Projects1")
                {
                    ApplicationArea = BudgetingWorkplanning;
                    Caption = 'Workplans For Consultancy Projects';
                    Image = JobRegisters;
                    RunObject = Page "72729";
                    // ToolTip = 'View auditing details for all job ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
                action("Roadworks Budget Ceiling")
                {
                    Caption = 'Roadworks Budget Ceiling';
                    Image = LedgerBudget;
                    RunObject = page "Roadworks Budget Ceilings";
                }
                 action("Town RAM workplans")
                {
                    Caption = 'Urban Area Workplans';
                    Image = Planning;
                    RunObject = page "Town Workplans";
                }
                 action("Regional RAM workplans")
                {
                    Caption = 'Regional Workplans';
                    Image = LedgerBudget;
                    RunObject = page "Regional Workplans";
                }
                action("Submitted Regional RAM workplans")
                {
                    Caption = 'Submitted Regional Workplans';
                    Image = LedgerBudget;
                    RunObject = page "Submitted Regional Workplans";
                }
                action("Consolidated Regional RAM workplans")
                {
                    Caption = 'Consolidated Regional Workplans';
                    Image = LedgerBudget;
                    RunObject = page "Consolidated RegionalWorkplans";
                }

            }
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            group("DevelopmentProjects")
            {
                Caption = 'Development Projects';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action("PlannedProjects21")
                {
                    ApplicationArea = DevelopmentProjects;
                    Caption = 'Planned Projects';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER(Planned), "type of Project" = FILTER("Road Construction" | "Structure Construction"));

                }

                action("Ongoing2")
                {
                    ApplicationArea = DevelopmentProjects;
                    Caption = 'Ongoing Projects';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER(Ongoing), "type of Project" = FILTER("Road Construction"));

                }
                action("Completed/UnderDLPProjects")
                {
                    ApplicationArea = DevelopmentProjects;
                    Caption = 'Completed/Under DLP Projects';
                    RunObject = Page "Job List";
                    RunPageView = WHERE(Status = FILTER("Completed/Under DLP"), "type of Project" = FILTER("Road Construction" | "Structure Construction"));

                }
                action("ProjectsUnderPBRM")
                {
                    ApplicationArea = DevelopmentProjects;
                    Caption = 'Projects Under PBRM';
                    RunObject = Page "Job List";
                    RunPageView = WHERE(Status = FILTER("Under PBRM"), "type of Project" = FILTER("Road Construction" | "Structure Construction"));

                }
                action("CompletedProjects")
                {
                    ApplicationArea = DevelopmentProjects;
                    Caption = 'Completed Projects';
                    RunObject = Page "Job List";
                    RunPageView = WHERE(Status = FILTER("Completed"), "type of Project" = FILTER("Road Construction" | "Structure Construction"));

                }


            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            group("MaintenanceProjects")
            {
                Caption = 'Maintenance Projects';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action("PlannedProjects")
                {
                    ApplicationArea = MaintenanceProjects;
                    Caption = 'Planned Projects';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER("Planned"), "type of Project" = FILTER("Maintenance"));

                }
                action("OngoingProjects1")
                {
                    ApplicationArea = MaintenanceProjects;
                    Caption = 'Ongoing Projects';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER("Ongoing"), "type of Project" = FILTER("Maintenance"));

                }
                action("Completed/UnderDLP")
                {
                    ApplicationArea = MaintenanceProjects;
                    Caption = 'Completed/Under DLP Projects';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER("Completed/Under DLP"), "type of Project" = FILTER("Maintenance"));

                }
                action("ProjectsUnderPBRM21")
                {
                    ApplicationArea = MaintenanceProjects;
                    Caption = 'Projects Under PBRM';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER("Under PBRM"), "type of Project" = FILTER("Maintenance"));


                }
                action("CompletedProjects2")
                {
                    ApplicationArea = MaintenanceProjects;
                    Caption = 'Completed Projects';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER("Completed"), "type of Project" = FILTER("Maintenance"));

                }

            }
            /// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            group("ConsultancyProjects")
            {
                Caption = 'Consultancy Projects';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action("ESIA Studies")
                {
                    ApplicationArea = ConsultancyProjects;
                    Caption = 'ESIA Studies';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER("Planned"), "type of Project" = FILTER("Survey/Study"));

                }
                action("Feasibility Studies")
                {
                    ApplicationArea = ConsultancyProjects;
                    Caption = 'Feasibility Studies';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER("Ongoing"), "type of Project" = FILTER("Survey/Study"));

                }
                action("Topographic Surveys")
                {
                    ApplicationArea = ConsultancyProjects;
                    Caption = 'Topographic Surveys';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER("Completed"), "type of Project" = FILTER("Survey/Study"));

                }
                action("Traffic Census")
                {
                    ApplicationArea = ConsultancyProjects;
                    Caption = 'Traffic Census';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER("Completed"), "type of Project" = FILTER("Survey/Study"));

                }
                action("Road Safety Audits")
                {
                    ApplicationArea = ConsultancyProjects;
                    Caption = 'Road Safety Audits';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER("Completed"), "type of Project" = FILTER("Survey/Study"));

                }
                action("Design Works")
                {
                    ApplicationArea = ConsultancyProjects;
                    Caption = 'Design Works';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER("Completed"), "type of Project" = FILTER("Survey/Study"));

                }
                action("Environmental Audits")
                {
                    ApplicationArea = ConsultancyProjects;
                    Caption = 'Environmental Audits';
                    RunObject = Page "89";
                    RunPageView = WHERE(Status = FILTER("Completed"), "type of Project" = FILTER("Survey/Study"));

                }

            }
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            group("ProcurementofWorks")
            {
                Caption = 'Procurement of Works';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action("Works Purchase Requisitions")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Works Purchase Requisitions';
                    RunObject = Page "75070";
                    // RunPageView = WHERE(Status = FILTER("Planned"), "type of Project" = FILTER("Survey/Study"));

                }
                action("Approved Works Requisitions")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Approved Works Requisitions';
                    RunObject = Page "75071";
                    // RunPageView = WHERE(Status = FILTER("Planned"), "type of Project" = FILTER("Survey/Study"));

                }

                action("Awarded Works Contracts")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Awarded Works Contracts';
                    RunObject = Page "75310";
                    // RunPageView = WHERE(Status = FILTER("Planned"), "type of Project" = FILTER("Survey/Study"));

                }
                action("Requisitions for Consultancies")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Requisitions for Consultancies';
                    RunObject = Page "72739";
                    // RunPageView = WHERE(Status = FILTER("Planned"), "type of Project" = FILTER("Survey/Study"));
                }
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////			

            group("ProjectMobilization1")
            {
                Caption = 'Project Mobilization';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';

                action("Project Mobilization")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Project Mobilization';
                    RunObject = Page "72207";
                    RunPageView = WHERE(Status = FILTER("Open" | "Pending Approval"));
                }
                action("Approved Orders to Commence")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Approved Orders to Commence';
                    RunObject = Page "72207";
                    RunPageView = WHERE(Status = FILTER("Released"));
                }
                action("Issued Orders to Commence")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Issued Orders to Commence';
                    RunObject = Page "72384";
                    RunPageView = WHERE("Posted" = CONST(TRUE), "Acknowledgement Status" = FILTER("Pending Acknowledgement"));
                }
                action("AcknowledgedOrderstoCommence")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Acknowledged Orders to Commence';
                    RunObject = Page "72384";
                    //RunPageView = WHERE("Posted" = CONST(TRUE), "Acknowledgement Status" = FILTER("Acknowledged"));
                }
                action("Acknowledged Orders to Commence")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Acknowledged Orders to Commence';
                    RunObject = Page "72384";
                    // RunPageView = WHERE("Posted" = CONST(TRUE), "Acknowledgement Status" = FILTER("Acknowledged"));
                }
                action("Submitted Program of Works")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Submitted Program of Works';
                    RunObject = Page "72241";
                    //RunPageView = WHERE("Portal Status" = FILTER("Submitted"), Status = FILTER("Open" | "Pending Approval"));
                }
                action("Approved Program of Works")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Approved Program of Works';
                    RunObject = Page "72274";
                    // RunPageView = WHERE(Status = FILTER("Released"), "Portal Status" = FILTER("Submitted"));
                }
                action("Project Communication Plans")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Project Communication Plans';
                    RunObject = Page "95003";
                }
                action("Project Risk Management Plans")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Project Risk Management Plans';
                    RunObject = Page "95036";
                }
                action("ProjectQualityManagement Plans1")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Project Quality Management Plans';
                    RunObject = Page "72543";
                }
                action("Project Quality Management Plans")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Project Quality Management Plans';
                    RunObject = Page "72543";
                }
                action("Project Staff Appointments")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Project Implementation Team';
                    RunObject = Page "Project Staff Appointment list";
                    RunPageView = WHERE(Status = FILTER("Open" | "Pending Approval"), Posted = CONST(FALSE));
                }
                action("Approved Staff Appointments")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Approved Project Implementation Team';
                    RunObject = Page "Project Staff Appointment list";
                    RunPageView = WHERE(Status = FILTER("Released"), Posted = CONST(FALSE));
                }
                action("Project Staff Disengagements")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Project Staff Disengagements';
                    RunObject = Page "72222";
                    RunPageView = WHERE(Status = FILTER("Open" | "Pending Approval"));
                }
                action("Approved Staff Disengagements")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Approved Staff Disengagements';
                    RunObject = Page "72222";
                    RunPageView = WHERE(Status = FILTER("Released"), Posted = FILTER(FALSE));
                }
                action("Project Mobilization Checklist")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Project Mobilization Checklist';
                    RunObject = Page "72618";

                }
                action("Mobiliza Checklist Status Report")
                {
                    ApplicationArea = ProcurementofWorks;
                    Caption = 'Mobiliza Checklist Status Report';
                    RunObject = Page "72620";
                }
                group("CIT Nomination")
                {
                    Caption = 'CIT Nomination';
                    action("CIT committee Appointments")
                    {
                        ApplicationArea = ProcurementofWorks;
                        RunObject = Page "CIT committee Appointments";
                    }
                    action("Evaluations For PC SumExpensing")
                    {
                        ApplicationArea = ProcurementofWorks;

                        RunObject = Page EvaluationsForPCSumExpensing;
                    }
                    action("Requests For PC Sum Expensing")
                    {
                        ApplicationArea = ProcurementofWorks;

                        RunObject = Page "Requests For PC Sum Expensing";
                    }
                    action("CIT Report")
                    {
                        ApplicationArea = ProcurementofWorks;
                        RunObject = Report "CIT RMLF";
                    }
                }

            }
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            ////////////////////////////////////////////////////////////////////////////////
            group("ContractorSubmissions")
            {
                Caption = 'Contractor Submissions';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action("Submitted Insurance of Works")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Submitted Insurance of Works';
                    RunObject = Page "72625";
                    RunPageView = WHERE("Revision Type" = FILTER("Original"), Status = FILTER("Open" | "Pending Approval"));

                }

                action("Approved Insurance of Works")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Approved Insurance of Works';
                    RunObject = Page "72625";
                    RunPageView = WHERE("Revision Type" = FILTER("Original"), Status = FILTER("Approved"));
                }
                action("Submitted Advance Guarantees")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Submitted Advance Guarantees';
                    RunObject = Page "72633";
                    RunPageView = WHERE(Status = FILTER("Open" | "Pending Approval"), "Revision Type" = FILTER("Original"));
                }
                action("Approved Advance Guarantees")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Approved Advance Guarantees';
                    RunObject = Page "72633";
                    RunPageView = WHERE(Status = FILTER("Approved"), "Revision Type" = FILTER("Original"));
                }
                action("Submitted Professional Indemnity")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Submitted Professional Indemnity';
                    RunObject = Page "72633";
                    RunPageView = WHERE(Status = FILTER("Open" | "Pending Approval"), "Revision Type" = FILTER(Original));
                }
                action("Approved Performance Guarantees")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Approved Performance Guarantees';
                    RunObject = Page "72633";
                    RunPageView = WHERE(Status = FILTER("Approved"));
                }

                action("Site Agent Nomination")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Site Agent Nomination';
                    RunObject = Page 72537;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), Status = FILTER("Open" | "Pending Approval"), "Approval Type" = FILTER(' '));
                }

                action("Approved Site Agent Nomination")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Approved Site Agent Nomination';
                    RunObject = Page 72537;
                    RunPageView = WHERE("Portal Status" = FILTER(Realesed), Status = FILTER("Rejected" | "TemporaryApproval"), "Approval Type" = FILTER(' '));
                }

                action("Submitted Contract Supervision Requirements")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Submitted PC SUM expenditures';
                    RunObject = Page 72528;
                    RunPageView = WHERE("Status" = FILTER("Pending Approval" | "Open"), "Rejection Remarks" = FILTER(1));
                }

                action("Approved Contract Supervision Requirements")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Approved PC SUM expenditures';
                    RunObject = Page 72528;
                    RunPageView = WHERE("Status" = FILTER("Released"));
                }

                action("Schedule of Equipment Delivery to Site")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Schedule of Equipment Delivery to Site';
                    RunObject = Page 72541;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), "Status" = FILTER("Open" | "Pending Approval"));
                }
                action("Approved Schedule of Equipment Delivery to Site")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Approved Schedule of Equipment Delivery to Site';
                    RunObject = Page 72541;
                    RunPageView = WHERE("Status" = FILTER("Released"), "Portal Status" = FILTER("Submitted"));
                }
                action("Contractor Key Staff Appointment")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Contractor Key Staff Appointment';
                    RunObject = Page 72539;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), "Status" = FILTER("Open" | "Pending Approval"));
                }

                action("Approved Contractor Key Staff Appointment")
                {
                    ApplicationArea = ContractorSubmissions;
                    Caption = 'Approved Contractor Key Staff Appointment';
                    RunObject = Page 72539;
                    RunPageView = WHERE("Status" = FILTER("Released"), "Portal Status" = FILTER("Submitted"));
                }

            }
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            group("WorksImplementation")
            {
                Caption = 'Works Implementation';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action("SubmittedInsurance ofWorks")
                {
                    ApplicationArea = "WorksImplementation";
                    Caption = 'Submitted Insurance of Works';
                    RunObject = Page "72625";
                    RunPageView = WHERE("Revision Type" = FILTER("Original"), Status = FILTER("Open" | "Pending Approval"));

                }
                action("Daily Work Records")
                {
                    ApplicationArea = "WorksImplementation";
                    Caption = 'Daily Work Records';
                    RunObject = Page "72436";
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"), "Posted" = FILTER(FALSE));
                }
                action("Project Meeting Minutes")
                {
                    ApplicationArea = "WorksImplementation";
                    Caption = 'Project Meeting Minutes';
                    RunObject = Page "72255";
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"));
                }
                action("RE Payment Schedules")
                {
                    ApplicationArea = "WorksImplementation";
                    Caption = 'RE Payment Schedules';
                    RunObject = Page "72683";
                    RunPageView = WHERE("Posted" = CONST(FALSE));
                }
                action("Contractor Staff Disengagement")
                {
                    ApplicationArea = "WorksImplementation";
                    Caption = 'Contractor Staff Disengagement';
                    RunObject = Page 72686;
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"), "Rejection Remarks" = CONST());
                }
                action("Approved Contractor Staff Disengagement")
                {
                    ApplicationArea = "WorksImplementation";
                    Caption = 'Approved Contractor Staff Disengagement';
                    RunObject = Page 72686;
                    RunPageView = WHERE("Status" = FILTER("Released"), "Rejection Remarks" = CONST());
                }

            }
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            group("ContractVariations")
            {
                Caption = 'Contract Variations';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action("Extention of Time Requests")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Extention of Time Requests';
                    RunObject = Page 72481;
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"), "Posted" = CONST(False));

                }
                action("Approved EoT Requests")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Approved EoT Requests';
                    RunObject = Page 72481;
                    RunPageView = WHERE("Status" = FILTER("Released"), "Posted" = CONST(FALSE));

                }

                action("Contractor Variation Requests")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Contractor Variation Requests';
                    RunObject = Page "72483";
                }

                action("Approved Contractor Variation")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Approved Contractor Variation';
                    RunObject = Page "72491";
                    RunPageView = WHERE("Posted" = CONST(False));
                }
                action("Engineer Variation Requests")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Engineer Variation Requests';
                    RunObject = Page "72602";
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"), "Posted" = CONST(False));
                }
                action("Approved Engineer Variation Requests")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Approved Engineer Variation Requests';
                    //  RunObject = Page "72602";
                    //  RunPageView = WHERE("Status" = FILTER("Released"), "Posted" = CONST(False));
                }

                action("Cost Claims")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Cost Claims';
                    RunObject = Page "72705";
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"), "Posted" = CONST(False));
                }
                action("Approved Cost Claims")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Approved Cost Claims';
                    RunObject = Page "72705";
                    RunPageView = WHERE("Status" = FILTER("Released"), "Posted" = CONST(FALSE));
                }
                action("Subcontractor/Assignee Requests")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Subcontractor/Assignee Requests';
                    RunObject = Page 72597;
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"), "Posted" = CONST(FALSE));
                }
                action("Approved Subcontractor/Assignee Req")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Approved Subcontractor/Assignee Req';
                    RunObject = Page 72597;
                    RunPageView = WHERE("Status" = FILTER("Released"), "Posted" = CONST(FALSE));
                }
                action("Evaluation Committee Appointment")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Evaluation Committee Appointment';
                    RunObject = Page 72653;
                    RunPageView = WHERE("Approval Status" = FILTER("Open" | "Pending Approval"));
                }
                action("EoT Evaluation Reports")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'EoT Evaluation Reports';
                    RunObject = Page 72666;
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"), "Posted" = CONST(FALSE));
                }
                action("EoT Professional Opinions")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'EoT Professional Opinions';
                    RunObject = Page 72667;
                    RunPageView = WHERE("Posted" = CONST(FALSE));
                }
                action("Contractor Variation Requests Evaluation Reports")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Contractor Variation Requests Evaluation Reports';
                    RunObject = Page 72666;
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"), "Posted" = CONST(FALSE));
                }
                action("CVR Professional Opinions")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'CVR Professional Opinions';
                    RunObject = Page 72667;
                    RunPageView = WHERE("Posted" = CONST(FALSE));
                }
                action("EVR Evaluation Reports")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'EVR Evaluation Reports';
                    RunObject = Page 72666;
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"), "Posted" = CONST(False));
                }
                action("EVR Professional Opinions")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'EVR Professional Opinions';
                    RunObject = Page 72667;
                    RunPageView = WHERE("Posted" = CONST(FALSE));
                }
                action("Subcontracting Evaluation Report")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Subcontracting Evaluation Report';
                    RunObject = Page 72666;
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"), "Posted" = CONST(FALSE));
                }
                action("Subcontracting Prof Opinion")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Subcontracting Prof Opinion';
                    RunObject = Page 72667;
                    RunPageView = WHERE("Posted" = CONST(FALSE));
                }
                action("Cost Claim Evaluation Reports")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Cost Claim Evaluation Reports';
                    RunObject = Page 72666;
                    RunPageView = WHERE("Posted" = CONST(False), "Status" = FILTER("Open" | "Pending Approval"));
                }
                action("Cost Claim Professional Opinions")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Cost Claim Professional Opinions';
                    RunObject = Page 72667;
                    RunPageView = WHERE("Posted" = CONST(FALSE));
                }
                action("Contract Variation Orders")
                {
                    ApplicationArea = ContractVariations;
                    Caption = 'Contract Variation Orders';
                    RunObject = Page 72489;
                    RunPageView = WHERE(Posted = CONST(False));
                }
            }
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            group("QA and Control")
            {
                Caption = 'Quality Assurance and Control';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action("Quality Management Plans")
                {
                    ApplicationArea = QAandControl;
                    Caption = 'Quality Management Plans';
                    RunObject = Page 72481;
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"), "Posted" = CONST(False));

                }
                action("Survey Quality Checks")
                {
                    ApplicationArea = QAandControl;
                    Caption = 'Survey Quality Checks';
                    RunObject = Page 72680;
                }
                action("Material Test Records")
                {
                    ApplicationArea = QAandControl;
                    Caption = 'Material Test Records';
                    RunObject = Page 72456;
                }
                action("Material Test Cert Submission")
                {
                    ApplicationArea = QAandControl;
                    Caption = 'Material Test Cert Submission';
                    RunObject = Page 72690;
                    RunPageView = WHERE("Portal Status" = FILTER("Draft"));
                }
                action("Pavement Lab Tests")
                {
                    ApplicationArea = QAandControl;
                    Caption = 'Pavement Lab Tests';
                    RunObject = Page 72713;
                    RunPageView = WHERE("Posted" = CONST(FALSE));
                }
                action("Weekly Work Plans")
                {
                    ApplicationArea = QAandControl;
                    Caption = 'Weekly Work Plans';
                    RunObject = Page 72637;
                }
                action("Monthly Work Plans")
                {
                    ApplicationArea = QAandControl;
                    Caption = 'Monthly Work Plans';
                    RunObject = Page 72641;
                }
                action("Inspection and Test Requests")
                {
                    ApplicationArea = QAandControl;
                    Caption = 'Inspection and Test Requests';
                    RunObject = Page 72648;
                }
                action("PC Targets & Outputs")
                {
                    ApplicationArea = QAandControl;
                    Caption = 'PC Targets & Outputs';
                    RunObject = Page 72717;
                }



            }
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            group("ProjectRiskManagement")
            {
                Caption = 'Project Risk Management';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action("Project Risk Registers")
                {
                    ApplicationArea = ProjectRiskManagement;
                    Caption = 'Project Risk Registers';
                    RunObject = Page 95090;
                }
                action("Risk Status Reports")
                {
                    ApplicationArea = ProjectRiskManagement;
                    Caption = 'Risk Status Reportss';
                    RunObject = Page 95089;
                }
                action("Risk Incident Logs")
                {
                    ApplicationArea = ProjectRiskManagement;
                    Caption = 'Risk Incident Logs';
                    RunObject = Page 95104;
                }
                action("New Risk Logs")
                {
                    ApplicationArea = ProjectRiskManagement;
                    Caption = 'New Risk Logs';
                    RunObject = Page 95088;
                }
                action("RMF")
                {
                    ApplicationArea = ProjectRiskManagement;
                    Caption = 'Risk Management Frameworks';
                    RunObject = Page 95012;
                }

            }


            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////			
            group("MeasurementsPayments")
            {
                Caption = 'Measurements & Payments';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management.';
                action("Submitted Advance Payment Requests")
                {
                    ApplicationArea = MeasurementsPayments;
                    Caption = 'Submitted Advance Payment Requests';
                    RunObject = Page 72296;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), Status = FILTER("Open" | "Pending Approval"));
                }
                action("Approved Advance Payment Requests")
                {
                    ApplicationArea = MeasurementsPayments;
                    Caption = 'Approved Advance Payment Requests';
                    RunObject = Page 72307;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), "Status" = FILTER("Released"), "Posted" = CONST(FALSE));
                }
                action("Submitted Interim Payments Requests")
                {
                    ApplicationArea = MeasurementsPayments;
                    Caption = 'Submitted Interim Payments Requests';
                    RunObject = Page 72772;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), "Status" = FILTER("Open" | "Pending Approval"));
                }
                action("Approved Interim Payments Requests")
                {
                    ApplicationArea = MeasurementsPayments;
                    Caption = 'Approved Interim Payments Requests';
                    RunObject = Page ApprovedInterimPaymentRequests;

                }
                action("Submitted Interest Payment Requests")
                {
                    ApplicationArea = MeasurementsPayments;
                    Caption = 'Submitted Interest Payment Requests';
                    RunObject = Page 72775;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), "Status" = FILTER("Open" | "Pending Approval"));
                }
                action("Approved Interest Payment Requests")
                {
                    ApplicationArea = MeasurementsPayments;
                    Caption = 'Approved Interest Payment Requests';
                    RunObject = Page 72775;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), "Status" = FILTER("Released"), "Posted" = CONST(FALSE));
                }
                action("Submitted Retention Payment Requests")
                {
                    ApplicationArea = MeasurementsPayments;
                    Caption = 'Submitted Retention Payment Requests';
                    RunObject = Page 72774;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), "Status" = FILTER("Open" | "Pending Approval"));
                }
                action("Approved Retention Payment Requests")
                {
                    ApplicationArea = MeasurementsPayments;
                    Caption = 'Approved Retention Payment Requests';
                    RunObject = Page 72774;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), "Status" = FILTER("Released"), "Posted" = CONST(FALSE));
                }
                action("Submitted Final Payments Requests")
                {
                    ApplicationArea = MeasurementsPayments;
                    Caption = 'Submitted Final Payments Requests';
                    RunObject = Page 72773;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), "Status" = FILTER("Open" | "Pending Approval"));
                }
                action("Approved Final Payments Requests")
                {
                    ApplicationArea = MeasurementsPayments;
                    Caption = 'Approved Final Payments Requests';
                    RunObject = Page 72773;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), "Status" = FILTER("Released"), "Posted" = CONST(FALSE));
                }
                action("Submitted Fee Notes")
                {
                    ApplicationArea = MeasurementsPayments;
                    Caption = 'Submitted Fee Notes';
                    RunObject = Page 72227;
                }
                action("Approved Fee Notes")
                {
                    ApplicationArea = MeasurementsPayments;
                    Caption = 'Approved Fee Notes';
                    RunObject = Page 72227;
                }



            }
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            group("ProjectCompletion")
            {
                Caption = 'Project Completion';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management.';
                action("Submitted Reqs for Taking Over")
                {
                    ApplicationArea = ProjectCompletion;
                    Caption = 'Submitted Reqs for Taking Over';
                    RunObject = Page 72556;
                    RunPageView = WHERE("Portal Status" = FILTER(Submitted), Status = FILTER("Open" | "Pending Approval"));

                }
                action("Approved Requests for Taking Over")
                {
                    ApplicationArea = ProjectCompletion;
                    Caption = 'Approved Requests for Taking Over';
                    RunObject = Page 72307;
                    RunPageView = WHERE("Portal Status" = FILTER(Submitted), "Status" = FILTER("Released"), Posted = CONST(FALSE));

                }
                action("Taking Over Inspections")
                {
                    ApplicationArea = ProjectCompletion;
                    Caption = 'Taking Over Inspections';
                    RunObject = Page 72569;
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"));
                }
                action("Approved Taking Over Inspections")
                {
                    ApplicationArea = ProjectCompletion;
                    Caption = 'Approved Taking Over Inspections';
                    RunObject = Page 72569;
                    RunPageView = WHERE("Status" = FILTER("Released"), "Posted" = CONST(FALSE));
                }
                action("Submitted Requests for End of DLP")
                {
                    ApplicationArea = ProjectCompletion;
                    Caption = 'Submitted Requests for End of DLP';
                    RunObject = Page 72577;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), "Status" = FILTER("Released"), "Posted" = CONST(FALSE));
                }
                action("Approved Requests for End of DLP")
                {
                    ApplicationArea = ProjectCompletion;
                    Caption = 'Approved Requests for End of DLP';
                    RunObject = Page 72577;
                    RunPageView = WHERE("Portal Status" = FILTER("Submitted"), "Status" = FILTER("Released"), "Posted" = CONST(FALSE));
                }
                action("End of DLP Inspections")
                {
                    ApplicationArea = ProjectCompletion;
                    Caption = 'End of DLP Inspections';
                    RunObject = Page 72579;
                    RunPageView = WHERE("Status" = FILTER("Open" | "Pending Approval"), "Posted" = CONST(FALSE));
                }
                action("Approved End of DLP Inspections")
                {
                    ApplicationArea = ProjectCompletion;
                    Caption = 'Approved End of DLP Inspections';
                    RunObject = Page 72579;
                    RunPageView = WHERE("Status" = FILTER("Released"), "Posted" = CONST(FALSE));
                }
                action("Project Transition to PBRM")
                {
                    ApplicationArea = ProjectCompletion;
                    Caption = 'Project Transition to PBRM';
                    RunObject = Page 72702;
                }
                action("Final Accounts")
                {
                    ApplicationArea = ProjectCompletion;
                    Caption = 'Final Accounts';
                    RunObject = Page 72612;
                }
                action("Inspection Commitee Appointment")
                {
                    ApplicationArea = ProjectCompletion;
                    Caption = 'Inspection Commitee Appointment';
                    RunObject = Page 72653;
                    //RunPageView=WHERE("Committee Type"=FILTER("TA"|"DLP"));
                }




            }
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            group("iRMSReports")
            {
                Caption = 'i-RMS Reports';
                group("i-RMS Reports")
                {
                    Caption = 'i-RMS Reports';
                    //Image = ReferenceData;
                    action(Action82)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Road Inventory';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        //RunObject = Report "Road Inventory";
                    }
                    action("<Report Multi Year Projections")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Multi Year Projections List';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        //RunObject = Report "Multi Year Projections List";
                    }
                    action("Annual Budget Allocations List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Annual Budget Allocations List';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        //RunObject = Report "Annual Budget Allocations List";
                    }
                    action("Road WorkPlan Summary")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Road WorkPlan Summary';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        // RunObject = Report "Road WorkPlan Summary";
                    }
                    action("Project Mobilization Status")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Project Mobilization Status Report';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        // RunObject = Report "Order to Commence List";
                    }
                    action("Insurance/Guarantee Report")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        // RunObject = Report "Insurance/Guarantee Report";
                    }
                    action("Project Meeting Registers")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        //  RunObject = Report "Project Meetings";
                    }
                    action("PC Targets and Output Report")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        // RunObject = Report "PC Targets&Output";
                    }
                    action("Advance Payment Requests")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        //RunObject = Report "Advance Payment Requests";
                    }
                    action("Contractor Payment Requests")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        //  RunObject = Report "Contractor Payment Requests";
                    }
                    action("Taking Over Inspections List")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        // RunObject = Report "Taking Over Inspections";
                    }
                    action("End of DLP Inspections List")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        //  RunObject = Report "End of DLP Inspections";
                    }
                    action("Pavement Record Chart")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pavement Record Chart';
                        Image = "Report";
                        // RunObject = Report "Pavement Chart";
                    }
                    action("Final Account List")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        // RunObject = Report "Final Account List";
                    }
                    action("Project Status Report")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        // RunObject = Report "Project Status Report";
                    }
                    action("Project Progress Report")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        //RunObject = Report "Progress Report";
                    }
                }
            }
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




            /// 
            /// cccccccccccccccccccccccc////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            group(Action2)
            {
                Caption = 'Jobs';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action(Action90)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Jobs';
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job List";
                    ToolTip = 'Define a project activity by creating a job card with integrated job tasks and job planning lines, structured in two layers. The job task enables you to set up job planning lines and to post consumption to the job. The job planning lines specify the detailed use of resources, items, and various general ledger expenses.';
                }
                action(Open)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Open';
                    RunObject = Page "Job List";
                    RunPageView = WHERE(Status = FILTER(Open));
                    ToolTip = 'Open the card for the selected record.';
                }
                action(JobsPlannedAndQuotd)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Planned and Quoted';
                    RunObject = Page "Job List";
                    RunPageView = WHERE(Status = FILTER(Quote | Planning));
                    ToolTip = 'Open the list of all planned and quoted jobs.';
                }
                action(JobsCompleted)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Completed';
                    RunObject = Page "Job List";
                    RunPageView = WHERE(Status = FILTER(Completed));
                    ToolTip = 'Open the list of all completed jobs.';
                }
                action(JobsUnassign)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Unassigned';
                    RunObject = Page "Job List";
                    RunPageView = WHERE("Person Responsible" = FILTER(''));
                    ToolTip = 'Open the list of all unassigned jobs.';
                }
                action(Action3)
                {
                    ApplicationArea = Suite;
                    Caption = 'Job Tasks';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job Task List";
                    ToolTip = 'Open the list of ongoing job tasks. Job tasks represent the actual work that is performed in a job, and they enable you to set up job planning lines and to post consumption to the job.';
                }
                action("Job Registers")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job Registers';
                    Image = JobRegisters;
                    RunObject = Page "Job Registers";
                    ToolTip = 'View auditing details for all job ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
                action("Job Planning Lines")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job Planning Lines';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job Planning Lines";
                    ToolTip = 'Open the list of ongoing job planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that he should pay for the job (billable).';
                }
                action(JobJournals)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job Journals';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job Journal Batches";
                    RunPageView = WHERE(Recurring = CONST(false));
                    ToolTip = 'Record job expenses or usage in the job ledger, either by reusing job planning lines or by manual entry.';
                }
                action(JobGLJournals)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job G/L Journals';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(Jobs),
                                        Recurring = CONST(false));
                    ToolTip = 'Record job expenses or usage in job accounts in the general ledger. For expenses or usage of type G/L Account, use the job G/L journal instead of the job journal.';
                }
                action(RecurringJobJournals)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Recurring Job Journals';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job Journal Batches";
                    RunPageView = WHERE(Recurring = CONST(true));
                    ToolTip = 'Reuse preset journal lines to record recurring job expenses or usage in the job ledger.';
                }
            }
            group(Action91)
            {
                Caption = 'Resources';
                Image = Journals;
                ToolTip = 'Manage the people or machines that are used to perform job tasks. ';
                action(Action93)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Resources';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Resource List";
                    ToolTip = 'Manage your resources'' job activities by setting up their costs and prices. The job-related prices, discounts, and cost factor rules are set up on the respective job card. You can specify the costs and prices for individual resources, resource groups, or all available resources of the company. When resources are used or sold in a job, the specified prices and costs are recorded for the project.';
                }
                action("Resource Groups")
                {
                    ApplicationArea = Suite;
                    Caption = 'Resource Groups';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Resource Groups";
                    ToolTip = 'Organize resources in groups, such as Consultants, for easier assignment of common values and to analyze financial figures by groups.';
                }
                action(ResourceJournals)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Resource Journals';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Resource Jnl. Batches";
                    RunPageView = WHERE(Recurring = CONST(false));
                    ToolTip = 'Post usage and sales of your resources for internal use and statistics. Use time sheet entries as input. Note that unlike with job journals, entries posted with resource journals are not posted to G/L accounts.';
                }
                action(RecurringResourceJournals)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Recurring Resource Journals';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Resource Jnl. Batches";
                    RunPageView = WHERE(Recurring = CONST(true));
                    ToolTip = 'Post recurring usage and sales of your resources for internal use and statistics in a journal that is preset for your usual posting.';
                }
                action("Resource Registers")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Resource Registers';
                    Image = ResourceRegisters;
                    RunObject = Page "Resource Registers";
                    ToolTip = 'View auditing details for all resource ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
            }
            group(Journals)
            {
                Caption = 'Journals';
                Image = Journals;
                ToolTip = 'Post entries directly to G/L accounts.';
                action(ItemJournals)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Item Journals';
                    RunObject = Page "Item Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(Item),
                                        Recurring = CONST(false));
                    ToolTip = 'Post item transactions directly to the item ledger to adjust inventory in connection with purchases, sales, and positive or negative adjustments without using documents. You can save sets of item journal lines as standard journals so that you can perform recurring postings quickly. A condensed version of the item journal function exists on item cards for quick adjustment of an items inventory quantity.';
                }
                action(RecurringItemJournals)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Recurring Item Journals';
                    RunObject = Page "Item Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(Item),
                                        Recurring = CONST(true));
                    ToolTip = 'Post recurring item transactions directly to the item ledger in a journal that is preset for your usual posting.';
                }
            }
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View the posting history for sales, shipments, and inventory.';
                action("Posted Shipments")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Posted Shipments';
                    RunObject = Page "Posted Sales Shipments";
                    ToolTip = 'Open the list of posted shipments.';
                }
                action("Posted Sales Invoices")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
                action("Posted Sales Credit Memos")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
                }
                action("Posted Purchase Receipts")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Open the list of posted purchase receipts.';
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action("G/L Registers")
                {
                    ApplicationArea = Jobs;
                    Caption = 'G/L Registers';
                    Image = GLRegisters;
                    RunObject = Page "G/L Registers";
                    ToolTip = 'View auditing details for all G/L entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
                action(Action74)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job Registers';
                    Image = JobRegisters;
                    RunObject = Page "Job Registers";
                    ToolTip = 'View auditing details for all item ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
                action("Item Registers")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Item Registers';
                    Image = ItemRegisters;
                    RunObject = Page "Item Registers";
                    ToolTip = 'View auditing details for all item ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
                action(Action76)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Resource Registers';
                    Image = ResourceRegisters;
                    RunObject = Page "Resource Registers";
                    ToolTip = 'View auditing details for all resource ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
            }
#if not CLEAN18
            group(SetupAndExtensions)
            {
                Caption = 'Setup & Extensions';
                Image = Setup;
                ToolTip = 'Overview and change system and application settings, and manage extensions and services';
                Visible = false;
                ObsoleteState = Pending;
                ObsoleteReason = 'The new common entry points to all Settings is introduced in the app bar''s cogwheel menu (aligned with the Office apps).';
                ObsoleteTag = '18.0';
                action("Assisted Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Assisted Setup';
                    Image = QuestionaireSetup;
                    RunObject = Page "Assisted Setup";
                    ToolTip = 'Set up core functionality such as sales tax, sending documents as email, and approval workflow by running through a few pages that guide you through the information.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'The new common entry points to all Settings is introduced in the app bar''s cogwheel menu (aligned with the Office apps).';
                    ObsoleteTag = '18.0';
                }
                action("Manual Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Manual Setup';
                    RunObject = Page "Manual Setup";
                    ToolTip = 'Define your company policies for business departments and for general activities by filling setup windows manually.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'The new common entry points to all Settings is introduced in the app bar''s cogwheel menu (aligned with the Office apps).';
                    ObsoleteTag = '18.0';
                }
                action("Service Connections")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Service Connections';
                    Image = ServiceTasks;
                    RunObject = Page "Service Connections";
                    ToolTip = 'Enable and configure external services, such as exchange rate updates, Microsoft Social Engagement, and electronic bank integration.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'The new common entry points to all Settings is introduced in the app bar''s cogwheel menu (aligned with the Office apps).';
                    ObsoleteTag = '18.0';
                }
                action(Extensions)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Extensions';
                    Image = NonStockItemSetup;
                    RunObject = Page "Extension Management";
                    ToolTip = 'Install Extensions for greater functionality of the system.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'The new common entry points to all Settings is introduced in the app bar''s cogwheel menu (aligned with the Office apps).';
                    ObsoleteTag = '18.0';
                }
                action(Workflows)
                {
                    ApplicationArea = Suite;
                    Caption = 'Workflows';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page Workflows;
                    ToolTip = 'Set up or enable workflows that connect business-process tasks performed by different users. System tasks, such as automatic posting, can be included as steps in workflows, preceded or followed by user tasks. Requesting and granting approval to create new records are typical workflow steps.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'The new common entry points to all Settings is introduced in the app bar''s cogwheel menu (aligned with the Office apps).';
                    ObsoleteTag = '18.0';
                }
            }
#endif
        }

        area(processing)
        {
            group(NewGroup)
            {
                Caption = 'New';
                action("Page Job")
                {
                    AccessByPermission = TableData Job = IMD;
                    ApplicationArea = Jobs;
                    Caption = 'Job';
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = New;
                    RunObject = Page "Job Creation Wizard";
                    RunPageMode = Create;
                    ToolTip = 'Create a new job.';
                }
                ///////////////////////////////////////////////////////////////////////////////////////
                action("Road Activities Categories")
                {
                    AccessByPermission = TableData Job = IMD;
                    ApplicationArea = Jobs;
                    Caption = 'Road Activities Categories';
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = New;
                    RunObject = Page "Road Activities";
                    RunPageMode = Create;
                    ///ToolTip = 'Create a new job.';
                }

                action("Road Asset")
                {
                    AccessByPermission = TableData Job = IMD;
                    ApplicationArea = Jobs;
                    Caption = 'Road Asset';
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = New;
                    RunObject = Page "Road Asset Survey Items";
                    RunPageMode = Create;
                    ///ToolTip = 'Create a new job.';
                }

                action("Job J&ournal")
                {
                    AccessByPermission = TableData "Job Journal Template" = IMD;
                    ApplicationArea = Jobs;
                    Caption = 'Job J&ournal';
                    Image = JobJournal;
                    Promoted = true;
                    PromotedCategory = New;
                    RunObject = Page "Job Journal";
                    ToolTip = 'Prepare to post a job activity to the job ledger.';
                }
                action("Job G/L &Journal")
                {
                    AccessByPermission = TableData "Gen. Journal Template" = IMD;
                    ApplicationArea = Jobs;
                    Caption = 'Job G/L &Journal';
                    Image = GLJournal;
                    Promoted = true;
                    PromotedCategory = New;
                    RunObject = Page "Job G/L Journal";
                    ToolTip = 'Prepare to post a job activity to the general ledger.';
                }
                action("R&esource Journal")
                {
                    AccessByPermission = TableData "Res. Journal Template" = IMD;
                    ApplicationArea = Suite;
                    Caption = 'R&esource Journal';
                    Image = ResourceJournal;
                    Promoted = true;
                    PromotedCategory = New;
                    RunObject = Page "Resource Journal";
                    ToolTip = 'Prepare to post resource usage.';
                }
                action("Job &Create Sales Invoice")
                {
                    AccessByPermission = TableData "Job Task" = IMD;
                    ApplicationArea = Jobs;
                    Caption = 'Job &Create Sales Invoice';
                    Image = CreateJobSalesInvoice;
                    RunObject = Report "Job Create Sales Invoice";
                    ToolTip = 'Use a function to automatically create a sales invoice for one or more jobs.';
                }
                action("Update Job I&tem Cost")
                {
                    ApplicationArea = Suite;
                    Caption = 'Update Job I&tem Cost';
                    Image = "Report";
                    RunObject = Report "Update Job Item Cost";
                    ToolTip = 'Use a function to automatically update the cost of items used in jobs.';
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                group("Job Reports")
                {
                    Caption = 'Job Reports';
                    Image = ReferenceData;
                    action("Job &Analysis")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Job &Analysis';
                        Image = "Report";
                        RunObject = Report "Job Analysis";
                        ToolTip = 'Analyze your jobs. For example, you can create a report that shows you the scheduled prices, usage prices, and contract prices, and then compares the three sets of prices.';
                    }
                    action("Job Actual To &Budget")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Job Actual To &Budget';
                        Image = "Report";
                        RunObject = Report "Job Actual To Budget";
                        ToolTip = 'Compare scheduled and usage amounts for selected jobs. All lines of the selected job show quantity, total cost, and line amount.';
                    }
                    action("Job - Pla&nning Line")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Job - Pla&nning Line';
                        Image = "Report";
                        RunObject = Report "Job - Planning Lines";
                        ToolTip = 'Define job tasks to capture any information that you want to track for a job. You can use planning lines to add information such as what resources are required or to capture what items are needed to perform the job.';
                    }
                    separator(Action16)
                    {
                    }
                    action("Job Su&ggested Billing")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Job Su&ggested Billing';
                        Image = "Report";
                        RunObject = Report "Job Suggested Billing";
                        ToolTip = 'View a list of all jobs, grouped by customer, how much the customer has already been invoiced, and how much remains to be invoiced, that is, the suggested billing.';
                    }
                    action("Jobs per &Customer")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Jobs per &Customer';
                        Image = "Report";
                        RunObject = Report "Jobs per Customer";
                        ToolTip = 'View a list of all jobs, grouped by customer where you can compare the scheduled price, the percentage of completion, the invoiced price, and the percentage of invoiced amounts for each bill-to customer.';
                    }
                    action("Items per &Job")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Items per &Job';
                        Image = "Report";
                        RunObject = Report "Items per Job";
                        ToolTip = 'View which items are used for which jobs.';
                    }
                    action("Jobs per &Item")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Jobs per &Item';
                        Image = "Report";
                        RunObject = Report "Jobs per Item";
                        ToolTip = 'View on which job a specific item is used.';
                    }
                }
                group("Absence Reports")
                {
                    Caption = 'Absence Reports';
                    Image = ReferenceData;
                    ToolTip = 'Analyze employee absence.';
                    action("Employee - Staff Absences")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee - Staff Absences';
                        Image = "Report";
                        RunObject = Report "Employee - Staff Absences";
                        ToolTip = 'View a list of employee absences by date. The list includes the cause of each employee absence.';
                    }
                    action("Employee - Absences by Causes")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee - Absences by Causes';
                        Image = "Report";
                        RunObject = Report "Employee - Absences by Causes";
                        ToolTip = 'View a list of all your employee absences categorized by absence code.';
                    }
                }
            }
            group(Manage)
            {
                Caption = 'Manage';
                group(Timesheet)
                {
                    Caption = 'Time Sheet';
                    Image = Worksheets;
                    action("Create Time Sheets")
                    {
                        AccessByPermission = TableData "Time Sheet Header" = IMD;
                        ApplicationArea = Jobs;
                        Caption = 'Create Time Sheets';
                        Image = JobTimeSheet;
                        RunObject = Report "Create Time Sheets";
                        ToolTip = 'As the time sheet administrator, create time sheets for resources that have the Use Time Sheet check box selected on the resource card. Afterwards, view the time sheets that you have created in the Time Sheets window.';
                    }
                    action("Manage Time Sheets")
                    {
                        AccessByPermission = TableData "Time Sheet Header" = IMD;
                        ApplicationArea = Jobs;
                        Caption = 'Manager Time Sheets';
                        Image = JobTimeSheet;
                        RunObject = Page "Manager Time Sheet";
                        ToolTip = 'Approve or reject your resources'' time sheet entries in a window that contains lines for all time sheets that resources have submitted for review.';
                    }
                    action("Manager Time Sheet by Job")
                    {
                        AccessByPermission = TableData "Time Sheet Line" = IMD;
                        ApplicationArea = Jobs;
                        Caption = 'Manager Time Sheet by Job';
                        Image = JobTimeSheet;
                        RunObject = Page "Manager Time Sheet by Job";
                        ToolTip = 'Open the list of time sheets for which your name is filled into the Person Responsible field on the related job card.';
                    }
                    separator(Action5)
                    {
                    }
                    separator(Action7)
                    {
                    }
                }
                group(WIP)
                {
                    Caption = 'Job Closing';
                    Image = Job;
                    ToolTip = 'Perform various post-processing of jobs.';
                    action("Job Calculate &WIP")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Job Calculate &WIP';
                        Image = CalculateWIP;
                        RunObject = Report "Job Calculate WIP";
                        ToolTip = 'Calculate the general ledger entries needed to update or close the job.';
                    }
                    action("Jo&b Post WIP to G/L")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Jo&b Post WIP to G/L';
                        Image = PostOrder;
                        RunObject = Report "Job Post WIP to G/L";
                        ToolTip = 'Post to the general ledger the entries calculated for your jobs.';
                    }
                    action("Job WIP")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Job WIP';
                        Image = WIP;
                        RunObject = Page "Job WIP Cockpit";
                        ToolTip = 'Overview and track work in process for all of your projects. Each line contains information about a job, including calculated and posted WIP.';
                    }
                }
            }
            group(History)
            {
                Caption = 'History';
               
                action("Navi&gate")
                {
                    ApplicationArea = Suite;
                    Caption = 'Find entries...';
                    Image = Navigate;
                    RunObject = Page Navigate;
                    ShortCutKey = 'Ctrl+Alt+Q';
                    ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
                }
            }
        }
    }
}
profile EgineerRoleCenter
{
    ProfileDescription = 'Eng Profile';
    RoleCenter = EngineerRoleCenter;
    Caption = 'Engineer Role Center';
}