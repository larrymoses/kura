// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// PageExtension 50124 pageextension50124 extends "Production Planner Activities"
// {

//     //Unsupported feature: Property Modification (Name) on ""Production Planner Activities"(Page 9038)".

//     Caption = 'Engineer', Comment = '{Dependency=Match,"ProfileDescription_SMALLBUSINESS"}';

//     //Unsupported feature: Property Modification (PageType) on ""Production Planner Activities"(Page 9038)".

//     layout
//     {
//         modify(Control1900000001)
//         {
//             Visible = false;
//         }
//         modify("Intelligent Cloud")
//         {
//             Visible = false;
//         }
//         modify("Production Orders")
//         {
//             Visible = false;
//         }
//         modify("Simulated Prod. Orders")
//         {
//             Visible = false;
//         }
//         modify("Planned Prod. Orders - All")
//         {
//             Visible = false;
//         }
//         modify("Firm Plan. Prod. Orders - All")
//         {
//             Visible = false;
//         }
//         modify("Released Prod. Orders - All")
//         {
//             Visible = false;
//         }
//         modify("Planning - Operations")
//         {
//             Visible = false;
//         }
//         modify("Purchase Orders")
//         {
//             Visible = false;
//         }
//         modify(Design)
//         {
//             Visible = false;
//         }
//         modify("Prod. BOMs under Development")
//         {
//             Visible = false;
//         }
//         modify("Routings under Development")
//         {
//             Visible = false;
//         }
//         modify("My User Tasks")
//         {
//             Visible = false;
//         }
//         modify("UserTaskManagement.GetMyPendingUserTasksCount")
//         {
//             Visible = false;
//         }
//         addfirst(rolecenter)
//         {
//             part(Control55; "Roads Operations Activities")
//             {
//                 AccessByPermission = TableData "Assisted Setup" = I;
//                 ApplicationArea = Basic, Suite;
//                 Caption = '<Roads Operations Activities>';
//             }
//             part(Control98; "Power BI Report Spinner Part")
//             {
//                 AccessByPermission = TableData "Power BI User Configuration" = I;
//                 ApplicationArea = Basic, Suite;
//             }
//             part(Control96; "Report Inbox Part")
//             {
//                 AccessByPermission = TableData "Report Inbox" = IMD;
//                 ApplicationArea = Basic, Suite;
//             }
//         }
//     }
//     actions
//     {
//         modify("Set Up Cues")
//         {

//             //Unsupported feature: Property Modification (ActionType) on ""Set Up Cues"(Action 8)".


//             //Unsupported feature: Property Modification (Name) on ""Set Up Cues"(Action 8)".

//             Caption = 'Home';
//             ToolTip = 'Manage your business. See KPIs, trial balance, and favorite customers.';

//             //Unsupported feature: Property Insertion (ActionContainerType) on ""Set Up Cues"(Action 8)".

//         }
//         modify(ActionContainer9)
//         {
//             Visible = false;
//         }
//         modify("Set Up Cues")
//         {
//             Visible = false;
//         }

//         //Unsupported feature: Property Deletion (Level) on ""Set Up Cues"(Action 8)".


//         //Unsupported feature: Property Deletion (ApplicationArea) on ""Set Up Cues"(Action 8)".


//         //Unsupported feature: Property Deletion (Image) on ""Set Up Cues"(Action 8)".


//         addfirst(creation)
//         {
//             action("Global Road Inventory")
//             {
//                 AccessByPermission = TableData "Sales Header" = IMD;
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Global Road Inventory';
//                 Image = NewSalesQuote;
//                 RunObject = Page "Global Road Inventory";
//                 RunPageMode = Create;
//                 ToolTip = 'Offer items or services to a customer.';
//             }
//             action("Road Structures Inventory")
//             {
//                 AccessByPermission = TableData "Sales Header" = IMD;
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Road Structures Inventory';
//                 Image = NewOrder;
//                 RunObject = Page "Registered Road Structures";
//                 RunPageMode = Create;
//                 ToolTip = 'Create a new sales order for items or services.';
//             }
//             action("Road Facilities Inventory")
//             {
//                 AccessByPermission = TableData "Sales Header" = IMD;
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Road Facilities Inventory';
//                 Image = NewSalesInvoice;
//                 RunObject = Page "Registered Road Furnitures";
//                 RunPageMode = Create;
//                 ToolTip = 'Create a new invoice for the sales of items or services. Invoice quantities cannot be posted partially.';
//             }
//             action("Registered Road Environs")
//             {
//                 AccessByPermission = TableData "Purchase Header" = IMD;
//                 ApplicationArea = Suite;
//                 Caption = 'Registered Road Environs';
//                 Image = NewSalesQuote;
//                 RunObject = Page "Registered Road Environs";
//                 RunPageMode = Create;
//                 ToolTip = 'Create a new purchase quote.';
//             }
//         }
//         addfirst(processing)
//         {
//             group(RICS)
//             {
//                 Caption = 'RICS';
//                 Image = New;
//                 action("RICS (Existing Road Links)")
//                 {
//                     AccessByPermission = TableData Customer = IMD;
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'RICS (Existing Road Links)';
//                     Image = Customer;
//                     RunObject = Page "Road Condition Surveys(Existin";
//                     RunPageMode = Create;
//                     ToolTip = 'Register a new customer.';
//                 }
//                 action("RICS (New Road Links)")
//                 {
//                     AccessByPermission = TableData Vendor = IMD;
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'RICS (New Road Links)';
//                     Image = Vendor;
//                     RunObject = Page "Road Condition Surveys(New Ro)";
//                     RunPageMode = Create;
//                     ToolTip = 'Register a new vendor.';
//                 }
//             }
//             group(Projects)
//             {
//                 Caption = 'Projects';
//                 action("Planned Projects")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Planned Projects';
//                     RunObject = Page "Job List";
//                     RunPageView = where(Status = filter(Planned));
//                 }
//                 action("Ongoing Projects")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Ongoing Projects';
//                     Image = ApplyEntries;
//                     RunObject = Page "Job List";
//                     RunPageView = where(Status = filter(Ongoing));
//                 }
//                 action("Completed/Under DLP Projects")
//                 {
//                     AccessByPermission = TableData "Bank Export/Import Setup" = IMD;
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Completed/Under DLP Projects';
//                     Image = Import;
//                     RunObject = Page "Job List";
//                     RunPageView = where(Status = filter("Completed/Under DLP"));
//                     ToolTip = 'To start the process of reconciling new payments, import a bank feed or electronic file containing the related bank transactions.';
//                 }
//                 action("Projects Under PBRM")
//                 {
//                     AccessByPermission = TableData "Payment Registration Setup" = IMD;
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Projects Under PBRM';
//                     Image = Payment;
//                     RunObject = Page "Job List";
//                     RunPageView = where(Status = filter("Under PBRM"));
//                     ToolTip = 'Process your customer payments by matching amounts received on your bank account with the related unpaid sales invoices, and then post the payments.';
//                 }
//                 action("Completed Projects")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Completed Projects';
//                     Image = SuggestVendorPayments;
//                     RunObject = Page "Job List";
//                     RunPageView = where(Status = filter(Completed));
//                     ToolTip = 'Opens vendor ledger entries for all vendors with invoices that have not been paid yet.';
//                 }
//             }
//             group(Reports)
//             {
//                 Caption = 'Reports';
//                 group("i-RMS Reports")
//                 {
//                     Caption = 'i-RMS Reports';
//                     Image = ReferenceData;
//                     action(Action82)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Road Inventory';
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "Road Inventory";
//                     }
//                     action("<Report Multi Year Projections")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Multi Year Projections List';
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "Multi Year Projections List";
//                     }
//                     action("Annual Budget Allocations List")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Annual Budget Allocations List';
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "Annual Budget Allocations List";
//                     }
//                     action("Road WorkPlan Summary")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Road WorkPlan Summary';
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "Road WorkPlan Summary";
//                     }
//                     action("Project Mobilization Status")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Project Mobilization Status Report';
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "Order to Commence List";
//                     }
//                     action("Insurance/Guarantee Report")
//                     {
//                         ApplicationArea = Basic;
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "Insurance/Guarantee Report";
//                     }
//                     action("Project Meeting Registers")
//                     {
//                         ApplicationArea = Basic;
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "Project Meetings";
//                     }
//                     action("PC Targets and Output Report")
//                     {
//                         ApplicationArea = Basic;
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "PC Targets&Output";
//                     }
//                     action("Advance Payment Requests")
//                     {
//                         ApplicationArea = Basic;
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "Advance Payment Requests";
//                     }
//                     action("Contractor Payment Requests")
//                     {
//                         ApplicationArea = Basic;
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "Contractor Payment Requests";
//                     }
//                     action("Taking Over Inspections List")
//                     {
//                         ApplicationArea = Basic;
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "Taking Over Inspections";
//                     }
//                     action("End of DLP Inspections List")
//                     {
//                         ApplicationArea = Basic;
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "End of DLP Inspections";
//                     }
//                     action("Pavement Record Chart")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Pavement Record Chart';
//                         Image = "Report";
//                         RunObject = Report "Pavement Chart";
//                     }
//                     action("Final Account List")
//                     {
//                         ApplicationArea = Basic;
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "Final Account List";
//                     }
//                     action("Project Status Report")
//                     {
//                         ApplicationArea = Basic;
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "Project Status Report";
//                     }
//                     action("Project Progress Report")
//                     {
//                         ApplicationArea = Basic;
//                         Image = "Report";
//                         Promoted = true;
//                         PromotedCategory = "Report";
//                         PromotedIsBig = true;
//                         RunObject = Report "Progress Report";
//                     }
//                 }
//             }
//             group(Setup)
//             {
//                 Caption = 'Setup';
//                 Image = Setup;
//                 action(Counties)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Counties';
//                     Image = Map;
//                     Promoted = true;
//                     PromotedIsBig = true;
//                     RunObject = Page Counties;
//                 }
//                 action(Regions)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Regions';
//                     Image = MapSetup;
//                     Promoted = true;
//                     PromotedIsBig = true;
//                     RunObject = Page "Regions List";
//                 }
//                 action(Constituencies)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Constituencies';
//                     Image = MapAccounts;
//                     Promoted = true;
//                     PromotedIsBig = true;
//                     RunObject = Page Constituencies;
//                 }
//                 action("Configuration Packages")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Configuration Packages';
//                     Image = CompanyInformation;
//                     RunObject = Page "Config. Packages";
//                 }
//                 group("i-RMS Global Setups")
//                 {
//                     Caption = 'i-RMS Global Setups';
//                     Image = ServiceSetup;
//                     action("Roads Management Setup")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Roads Management Setup';
//                         Image = CompanyInformation;
//                         RunObject = Page "Roads Management Setup";
//                     }
//                     action("Funding Year Codes")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Funding Year Codes';
//                         Image = NonStockItemSetup;
//                         RunObject = Page "Funding Year Codes";
//                         ToolTip = 'Install Extensions for greater functionality of the system.';
//                     }
//                     action("Road Works Types")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Road Works Types';
//                         Image = ServiceTasks;
//                         RunObject = Page "Works Categories";
//                     }
//                     action("Road Materials")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Road Materials';
//                         Image = ServiceTasks;
//                         RunObject = Page "Road Materialsx";
//                         ToolTip = 'Enable and configure external services, such as exchange rate updates, Microsoft Social Engagement, and electronic bank integration.';
//                     }
//                     action("Road Technologies")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Road Technologies';
//                         Image = ServiceTasks;
//                         RunObject = Page "Road Technologies";
//                     }
//                     action("Road Authorities")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Road Authorities';
//                         Image = ServiceTasks;
//                         RunObject = Page "Road Authorities";
//                     }
//                     action("Road Classes")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Road Classes';
//                         Image = ServiceTasks;
//                         RunObject = Page "Road Classes";
//                     }
//                     action("Pavement Surface Types")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Pavement Surface Types';
//                         Image = ServiceTasks;
//                         RunObject = Page "Pavement Surface Types";
//                     }
//                     action("Road Facility Types")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Road Facility Types';
//                         Image = ServiceTasks;
//                         RunObject = Page "Road Facility Type";
//                     }
//                     action("Road Environs Categories")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Road Environs Categories';
//                         Image = ServiceTasks;
//                         RunObject = Page "Road Environ Categories";
//                     }
//                     action("Pavement Layers")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Pavement Layers Setup';
//                         Image = ServiceTasks;
//                         RunObject = Page Layers;
//                     }
//                     action("Pavement Layer Test Setups")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Pavement Layer Test Setups';
//                         Image = ServiceTasks;
//                         RunObject = Page "Layer Test Setup";
//                     }
//                     action("Materials On Site Setup")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Materials On Site Setup';
//                         Image = ServiceTasks;
//                         RunObject = Page "Material On Site Setup";
//                     }
//                     action("Required Document Types")
//                     {
//                         ApplicationArea = Basic;
//                         Image = Check;
//                         RunObject = Page "Project Document Types";
//                     }
//                     action("Consultacy Report Types")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Consultacy Report Types';
//                         Image = ServiceTasks;
//                         RunObject = Page "Study/Survey/Design Reports";
//                     }
//                 }
//                 group("i-RMS Default Template Setups")
//                 {
//                     Caption = 'i-RMS Default Template Setups';
//                     Image = Setup;
//                     action("Standard BoQ Templates")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Standard BoQ Templates';
//                         Image = CompanyInformation;
//                         RunObject = Page "BoQ Requisition Template";
//                     }
//                     action("Project BoQs")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Project BoQs';
//                         Image = NonStockItemSetup;
//                         RunObject = Page "BoQ Requisition Template";
//                         ToolTip = 'Install Extensions for greater functionality of the system.';
//                     }
//                     action("Engineer's Estimates")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Engineer''s Estimates';
//                         Image = ServiceTasks;
//                         RunObject = Page "BoQ Requisition Template";
//                         ToolTip = 'Enable and configure external services, such as exchange rate updates, Microsoft Social Engagement, and electronic bank integration.';
//                     }
//                     action("Project Staff Templates")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Project Staff Templates';
//                         Image = ServiceTasks;
//                         RunObject = Page "Project Works Staff Template";
//                     }
//                     action("Equipment Specs Templates")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Project Staff Templates';
//                         Image = ServiceTasks;
//                         RunObject = Page "Works Equipment Template";
//                     }
//                     action("Required Document Templates")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Required Document Templates';
//                         Image = ServiceTasks;
//                         RunObject = Page "Project Document Templates";
//                     }
//                     action("Default Meeting Templates")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Default Meeting Templates';
//                         Image = ServiceTasks;
//                         RunObject = Page "Project Meeting Types";
//                     }
//                     action("Checklist Templates")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Checklist Templates';
//                         Image = ServiceTasks;
//                         RunObject = Page "Project Kickoff Templates";
//                     }
//                     action("Project Materials Templates")
//                     {
//                         ApplicationArea = Service;
//                         Caption = 'Project Materials Templates';
//                         Image = ServiceTasks;
//                         RunObject = Page "Project Material Templates";
//                     }
//                 }
//             }
//         }
//         addfirst(reporting)
//         {
//             group("iRMS Reports")
//             {
//                 Caption = 'iRMS Reports';
//                 Image = Excel;
//                 action("Road Inventory")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Road Inventory';
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "Road Inventory";
//                     RunPageMode = Edit;
//                 }
//                 action("Multi Year Projections")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Multi Year Financing Projections List';
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "Multi Year Projections List";
//                 }
//                 action("Annual Budget Allocation")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Annual Budget Allocations List';
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "Annual Budget Allocations List";
//                 }
//                 action("Road WorkPlan Summary")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Road WorkPlan Summary';
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "Road WorkPlan Summary";
//                 }
//                 action("Mobilization Status")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Project Mobilization Status Report';
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "Order to Commence List";
//                 }
//                 action("Insurance and Guarantee Report")
//                 {
//                     ApplicationArea = Basic;
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "Insurance/Guarantee Report";
//                 }
//                 action("Project Meeting Minutes")
//                 {
//                     ApplicationArea = Basic;
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "Project Meetings";
//                 }
//                 action("PC Targets&Output Report")
//                 {
//                     ApplicationArea = Basic;
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "PC Targets&Output";
//                 }
//                 action("Advance Payment Requests List")
//                 {
//                     ApplicationArea = Basic;
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "Advance Payment Requests";
//                 }
//                 action("Contractor Payment Requests List")
//                 {
//                     ApplicationArea = Basic;
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "Contractor Payment Requests";
//                 }
//                 action("Taking Over Inspection")
//                 {
//                     ApplicationArea = Basic;
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "Taking Over Inspections";
//                 }
//                 action("End of DLP Inspection")
//                 {
//                     ApplicationArea = Basic;
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "End of DLP Inspections";
//                 }
//                 action("Pavement Chart Record")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Pavement Record Chart';
//                     Image = "Report";
//                     RunObject = Report "Pavement Chart";
//                 }
//                 action("Final Account")
//                 {
//                     ApplicationArea = Basic;
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "Final Account List";
//                 }
//                 action("Project Status Reports")
//                 {
//                     ApplicationArea = Basic;
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "Project Status Report";
//                 }
//                 action("Project Progress Reports")
//                 {
//                     ApplicationArea = Basic;
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                     PromotedIsBig = true;
//                     RunObject = Report "Progress Report";
//                 }
//             }
//         }
//         addfirst("Set Up Cues")
//         {
//             action("Kenya Road Inventory")
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Kenya Road Inventory';
//                 Image = NewSalesQuote;
//                 RunObject = Page "Global Road Inventory";
//                 RunPageMode = View;
//             }
//             action("HNational Trunk Roads")
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'National Trunk Roads';
//                 Image = NewSalesQuote;
//                 RunObject = Page "Primary National Road Links";
//                 RunPageMode = View;
//             }
//             action("HNational Secondary Roads")
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'National Secondary Roads';
//                 Image = NewSalesQuote;
//                 RunObject = Page "Secondary National Road Links";
//                 RunPageMode = View;
//             }
//             action("HCounty Roads")
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'County Roads';
//                 Image = NewSalesQuote;
//                 RunObject = Page "County Road Inventory";
//                 RunPageMode = View;
//             }
//             action("HUrban Roads")
//             {
//                 AccessByPermission = TableData "Sales Header" = IMD;
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Urban Roads';
//                 Image = NewSalesQuote;
//                 RunObject = Page "Urban Roads";
//                 RunPageMode = View;
//             }
//             action("HKWS Roads")
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'KWS Roads';
//                 Image = NewSalesQuote;
//                 RunObject = Page "KWS Roads";
//                 RunPageMode = View;
//             }
//             action("HSpecial Purpose Roads")
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Special Purpose Roads';
//                 Image = NewSalesQuote;
//                 RunObject = Page "Special Purpose Roads";
//                 RunPageMode = View;
//             }
//             action("HUnclassified Roads")
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Unclassified Roads';
//                 Image = NewSalesQuote;
//                 RunObject = Page "Unclassified Roads";
//                 RunPageMode = View;
//             }
//             action(Action181)
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Road Structures Inventory';
//                 Image = NewOrder;
//                 RunObject = Page "Registered Road Structures";
//                 RunPageMode = View;
//             }
//             action(Action171)
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Road Facilities Inventory';
//                 Image = NewSalesInvoice;
//                 RunObject = Page "Registered Road Furnitures";
//                 RunPageMode = View;
//             }
//             action(Action170)
//             {
//                 ApplicationArea = Suite;
//                 Caption = 'Registered Road Environs';
//                 Image = NewSalesQuote;
//                 RunObject = Page "Registered Road Environs";
//                 RunPageMode = View;
//             }
//             action("Projects List")
//             {
//                 ApplicationArea = Suite;
//                 Caption = 'Projects List';
//                 Image = NewSalesQuote;
//                 RunObject = Page "Job List";
//                 RunPageMode = View;
//             }
// Page "Global Road Inventory";
//     RunPageMode = Create;
// Page "Primary National Road Links";
//     RunPageMode = Create;
// Page "Secondary National Road Links";
//     RunPageMode = Create;
// Page "County Road Inventory";
//     RunPageMode = Create;
// Page "Urban Roads";
//     RunPageMode = Create;
// Page "KWS Roads";
//     RunPageMode = Create;
// Page "Special Purpose Roads";
//     RunPageMode = Create;
// Page "Unclassified Roads";
//     RunPageMode = Create;
// Page "Registered Road Structures";
//     RunPageMode = Create;
// Page "Registered Road Furnitures";
//     RunPageMode = Create;
// Page "Registered Road Environs";
//     RunPageMode = Create;
// Page "Multi Year Plan";
// Page "Global Construction Budgets";
// Page "Global Maintenance Budget";
// Page "Global Studies/Surveys Budgets";
// Page "Regional Maintenance W_Plans";
// Page "Schedule Of Con Road Projects";
// Page "Workplans for Studies/Surveys";
// Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Job List";
//     RunPageView = WHERE(Status=Page "Works Purchase Requisitions";
// Page "Approved PRN";
// Page "Signed Contract List";
// Page "Survey/Study/Design Requests";
// Page "Project Commencement Orders";
//     RunPageView = WHERE(Status=Page "Project Commencement Orders";
//     RunPageView = WHERE(Status=Page "Posted Proj. Comence Oders";
//     RunPageView = WHERE(Posted=CONST(true),
//                                     "Acknowledgement Status"=Page "Posted Proj. Comence Oders";
//     RunPageView = WHERE(Posted=CONST(true),
//                                     "Acknowledgement Status"=Page "Work Execution Plans";
//     RunPageView = WHERE("Portal Status"=Page "Released Work Execution Plans";
//     RunPageView = WHERE(Status=Page "Communication Plans";
// Page "StrategicRisk Management Plans";
// Page "Quality Management Plans";
// Page "Project Staff Appointment list";
//     RunPageView = WHERE(Status=Page "Project Staff Appointment list";
//     RunPageView = WHERE(Status=Page "Project Staff Terminations";
//     RunPageView = WHERE(Status=Page "Project Staff Terminations";
//     RunPageView = WHERE(Status=Page "Proj. Mobilization Checklist L";
// Page "Checklist Status Reports";
// Page "Insurance Of Works";
//     RunPageView = WHERE("Revision Type"=Page "Insurance Of Works";
//     RunPageView = WHERE(Status=Page "Advance Payament Guarantees";
//     RunPageView = WHERE(Status=Page "Advance Payament Guarantees";
//     RunPageView = WHERE(Status=Page "Performance Guarantees";
//     RunPageView = WHERE(Status=Page "Performance Guarantees";
//     RunPageView = WHERE(Status=Page "Performance Guarantees";
//     RunPageView = WHERE(Status=Page "Performance Guarantees";
//     RunPageView = WHERE(Status=Page "Site Agent Nominations";
//     RunPageView = WHERE("Portal Status"=Page "Site Agent Nominations";
//     RunPageView = WHERE(Status=Page "Vehicle SuperV Requirements";
//     RunPageView = WHERE(Status=Page "Vehicle SuperV Requirements";
//     RunPageView = WHERE(Status=Page "Contractor Equipment List";
//     RunPageView = WHERE("Portal Status"=Page "Contractor Equipment List";
//     RunPageView = WHERE(Status=Page "Contractor Personnel App List";
//     RunPageView = WHERE("Portal Status"=Page "Contractor Personnel App List";
//     RunPageView = WHERE(Status=Page "Open RE Site Instructions";
//     RunPageView = WHERE(Posted=CONST(false));
// Page "Daily Work Records";
//     RunPageView = WHERE(Status=Page "Project Meeting Registers";
//     RunPageView = WHERE(Status=Page "RE Payment Schedules";
//     RunPageView = WHERE(Posted=CONST(false));
// Page "Contr Staff Disengagements";
//     RunPageView = WHERE(Status=Page "Contr Staff Disengagements";
//     RunPageView = WHERE(Status=Page "EOT Requests";
//     RunPageView = WHERE(Status=Page "EOT Requests";
//     RunPageView = WHERE(Status=Page "Contractor Variation Requests";
// Page "App Contractor Variation Reqs";
//     RunPageView = WHERE(Posted=CONST(false));
// Page "Engineer Variation Requests";
//     RunPageView = WHERE(Status=Page "Engineer Variation Requests";
//     RunPageView = WHERE(Status=Page "Cost Claims";
//     RunPageView = WHERE(Status=Page "Cost Claims";
//     RunPageView = WHERE(Status=Page "Subcontractor Requests";
//     RunPageView = WHERE(Status=Page "Subcontractor Requests";
//     RunPageView = WHERE(Status=Page "RMS Inspection Committees";
//     RunPageView = WHERE("Approval Status"=Page "Project Evaluation Reports";
//     RunPageView = WHERE(Status=Page "Project Professional Opinions";
//     RunPageView = WHERE(Posted=CONST(false));
// Page "Project Evaluation Reports";
//     RunPageView = WHERE(Status=Page "Project Professional Opinions";
//     RunPageView = WHERE(Posted=CONST(false));
// Page "Project Evaluation Reports";
//     RunPageView = WHERE(Status=Page "Project Professional Opinions";
//     RunPageView = WHERE(Posted=CONST(false));
// Page "Project Evaluation Reports";
//     RunPageView = WHERE(Status=Page "Project Professional Opinions";
//     RunPageView = WHERE(Posted=CONST(false));
// Page "Project Evaluation Reports";
//     RunPageView = WHERE(Posted=CONST(false),
//                                     Status=Page "Project Professional Opinions";
//     RunPageView = WHERE(Posted=CONST(false));
// Page "Project Variation Orders";
//     RunPageView = WHERE(Posted=CONST(false));
// Page "Quality Management Plans";
// Page "Survey Quality Checks";
// Page "Material Test Records";
// Page "Material Test Cert Submissions";
//     RunPageView = WHERE("Portal Status"=Page "Pavement Lab Tests";
//     RunPageView = WHERE(Posted=CONST(false));
// Page "Weekly Work Plans";
// Page "Monthly Work Plans";
// Page "Contractor Inspection Requests";
// Page "RMS PC Targets&Output List";
// Page "Project Risk Mgt. Plans";
// Page "Periodic Risk Status Reports";
// Page "Risk Incident Logs";
// Page "New Risk Vouchers";
// Page "Risk Management Frameworks";
// Page "Contract Advance Payment Certs";
//     RunPageView = WHERE("Portal Status"=Page "Approved Advance Payment Certs";
//     RunPageView = WHERE("Portal Status"=Page "Interim Payment Requests";
//     RunPageView = WHERE("Portal Status"=Page "Interim Payment Requests";
//     RunPageView = WHERE("Portal Status"=Page "Interest Payment Requests";
//     RunPageView = WHERE("Portal Status"=Page "Interest Payment Requests";
//     RunPageView = WHERE("Portal Status"=Page "Retention Payment Requests";
//     RunPageView = WHERE("Portal Status"=Page "Retention Payment Requests";
//     RunPageView = WHERE("Portal Status"=Page "Final Payment Requests";
//     RunPageView = WHERE("Portal Status"=Page "Final Payment Requests";
//     RunPageView = WHERE("Portal Status"=Page "Final Payment Certificates";
// Page "Final Payment Certificates";
// Page "Requests for Project Close-Out";
//     RunPageView = WHERE("Portal Status"=Page "Approved Advance Payment Certs";
//     RunPageView = WHERE("Portal Status"=Page "Taking Over Inspections";
//     RunPageView = WHERE(Status=Page "Taking Over Inspections";
//     RunPageView = WHERE(Status=Page "Requests for Post DLP Inspecti";
//     RunPageView = WHERE("Portal Status"=Page "Requests for Post DLP Inspecti";
//     RunPageView = WHERE("Portal Status"=Page "End of DLP Inspections";
//     RunPageView = WHERE(Status=Page "End of DLP Inspections";
//     RunPageView = WHERE(Status=Page "Project Transitions";
// Page "Final Accounts List";
// Page "RMS Inspection Committees";
//     ""
