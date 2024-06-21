#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72731 "Workplan Studies/Surveys Lines"
{
    PageType = ListPart;
    // SourceTable = "Road WorkPlan Package";

    // layout
    // {
    //     area(content)
    //     {
    //         repeater(Group)
    //         {
    //             field("Road Work Program ID";"Road Work Program ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Project No";"Project No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("KeRRA Budget Code";"KeRRA Budget Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Budget Entry No";"Budget Entry No")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Budget Entry No';
    //             }
    //             field("Package Name";"Package Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Project Name';
    //             }
    //             field("Request No";"Request No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Road Code";"Road Code")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Road Section No.";"Road Section No.")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Section Name";"Section Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Road Works Category";"Road Works Category")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Study/Survey Type";"Study/Survey Type")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Pavement Surface Type";"Pavement Surface Type")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Funding Source ID";"Funding Source ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Procurement Category";"Procurement Category")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Works Type';
    //             }
    //             field("Start Chainage";"Start Chainage")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("End Chainage";"End Chainage")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Workplanned Length (Km)";"Workplanned Length (Km)")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Funding Agency ID";"Funding Agency ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("BoQ Template Code";"BoQ Template Code")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Standard Template Code';
    //             }
    //             field("Road Project Category";"Road Project Category")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Directorate ID";"Directorate ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Department ID";"Department ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Road Class";"Road Class")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Constituency ID";"Constituency ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("County ID";"County ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Region ID";"Region ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Global Dimension 1 Code";"Global Dimension 1 Code")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Region Code';
    //             }
    //             field("Project Status";"Project Status")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Total Road Section Length";"Total Road Section Length")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Total Budget Cost";"Total Budget Cost")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Current Year Budget';
    //                 Editable = false;
    //             }
    //             field("Global Budget ID";"Global Budget ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Global Budget ID';
    //                 Visible = false;
    //             }
    //             field("Total Project Cost Exc. VAT";"Total Project Cost Exc. VAT")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Total Project Cost Exc. VAT(KES)';
    //             }
    //             field("Total Project Cost Inc. VAT";"Total Project Cost Inc. VAT")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Total Project Cost Inc. VAT(KES)';
    //             }
    //             field("Bid Sum 1";"Bid Sum 1")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Bid Sum';
    //             }
    //             field("Bid Sum 1 Contingency Rate";"Bid Sum 1 Contingency Rate")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Contingency Rate';
    //             }
    //             field("Bid Sum 1 VoP Rate";"Bid Sum 1 VoP Rate")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'VoP Rate';
    //             }
    //             field("Bid Sum 1 Contingency Amount";"Bid Sum 1 Contingency Amount")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Contingency Amount';
    //             }
    //             field("Bid Sum 1 VoP Amount";"Bid Sum 1 VoP Amount")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'VoP Amount';
    //             }
    //             field("Total Bid Sum 1 Incl. VAT";"Total Bid Sum 1 Incl. VAT")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Total Incl. VAT';
    //             }
    //             field("Total Contract Sum Incl. VAT";"Total Contract Sum Incl. VAT")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Total Contract Sum Incl. VAT';
    //             }
    //         }
    //     }
    // }

    // actions
    // {
    //     area(processing)
    //     {
    //         group("&Project Details")
    //         {
    //             Caption = '&Project Details';
    //             action("Road Links")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = CreateJobSalesInvoice;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;
    //                 PromotedOnly = true;
    //                 RunObject = Page "Project Road Links";
    //                 RunPageLink = "KeRRA Budget Code"=field("KeRRA Budget Code"),
    //                               "Global Budget Book Code"=field("Road Work Program ID");
    //             }
    //             action(Tasks)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'BoQ';
    //                 Ellipsis = true;
    //                 Image = TaskList;
    //                 Promoted = true;
    //                 PromotedIsBig = true;
    //                 PromotedOnly = true;
    //                 RunObject = Page "Work Plan Tasks";
    //                 RunPageLink = "Road Work Program ID"=field("Road Work Program ID"),
    //                               "Package No."=field("Project No");
    //             }
    //             action("Planning Lines")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'BiIl Items';
    //                 Ellipsis = true;
    //                 Image = Planning;
    //                 Promoted = true;
    //                 PromotedIsBig = true;
    //                 PromotedOnly = true;
    //                 RunObject = Page "WP Plan Lines";
    //                 RunPageLink = "Road Work Program ID"=field("Road Work Program ID"),
    //                               "Project No"=field("Project No"),
    //                               "Budget Entry No"=field("Budget Entry No");
    //                 Visible = false;
    //             }
    //             action("Funding Sources")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = CashFlow;
    //                 RunObject = Page "Project Funding Sources";
    //                 RunPageLink = "Road Work Program ID"=field("Road Work Program ID"),
    //                               "KeRRA Budget Code"=field("KeRRA Budget Code");
    //             }
    //             action("Attach Tender Instr.to Bidders")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             action("Attach Project Special Specs")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             action("Attach Standard Specs")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             action("Attach Contract Conditions")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             action("Attach Drawings")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             action("Attach Tender Documents")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = TestReport;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;
    //                 RunObject = Page "WorkPlan Document Attachments";
    //                 RunPageLink = "Road Work Program ID"=field("Road Work Program ID"),
    //                               "Budget Entry No"=field("Budget Entry No"),
    //                               "Project No"=field("Project No"),
    //                               "KeRRA Budget Code"=field("KeRRA Budget Code"),
    //                               "Entry No"=field("Entry No");

    //                 trigger OnAction()
    //                 begin
    //                     //DMSManagement.UploadAIEAttchmentDocuments("Road Work Program ID",'Testing',RECORDID,'');
    //                     //DIALOG.MESSAGE('Attached');
    //                 end;
    //             }
    //         }
    //     }
    // }

    // var
    //     DMSManagement: Codeunit "DMS Management";
}

