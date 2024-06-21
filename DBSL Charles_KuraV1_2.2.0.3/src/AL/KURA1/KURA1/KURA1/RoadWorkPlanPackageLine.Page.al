#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72367 "Road WorkPlan Package Line"
{
    PageType = ListPart;
    SourceTable = "Road WorkPlan Package";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Work Program ID"; Rec."Road Work Program ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                }
                field("KeRRA Budget Code"; Rec."KERRA Budget Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'KURA Budget Code';
                }
                field("Budget Entry No"; Rec."Budget Entry No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Entry No';
                }
                field("Package Name"; Rec."Package Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Name';
                }
                field("Has PBRM Component"; Rec."Has PBRM Component")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Road Works Category"; Rec."Road Works Category")
                {
                    ApplicationArea = Basic;
                }
                field("Pavement Surface Type"; Rec."Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Works Type';
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Workplanned Length (Km)"; Rec."Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency ID"; Rec."Funding Agency ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("BoQ Template Code"; Rec."BoQ Template Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Construction BoQTemplate Code';
                }
                field("PBRM BoQ Template Code"; Rec."PBRM BoQ Template Code")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Specs Template"; Rec."Equipment Specs Template")
                {
                    ApplicationArea = basic;
                }
                field("Personnel Specs Template"; Rec."Personnel Specs Template")
                {
                    ApplicationArea = basic;
                }
                field("Road Project Category"; Rec."Road Project Category")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class"; Rec."Road Class")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Code';
                }
                field("Project Status"; Rec."Project Status")
                {
                    ApplicationArea = Basic;
                }
                field("Total Road Section Length"; Rec."Total Road Section Length")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budget Cost"; Rec."Total Budget Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Year Budget';
                    Editable = false;
                }
                field("Global Budget ID"; Rec."Global Budget ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Global Budget ID';
                    Visible = false;
                }
                field("Total Project Cost Exc. VAT"; Rec."Total Project Cost Exc. VAT")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Project Cost Exc. VAT(KES)';
                }
                field("Total Project Cost Inc. VAT"; Rec."Total Project Cost Inc. VAT")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Project Cost Inc. VAT(KES)';
                }
                field("Bid Sum 1"; Rec."Bid Sum 1")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Sum 2"; Rec."Bid Sum 2")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Sum 1 Contingency Rate"; Rec."Bid Sum 1 Contingency Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Sum 1 VoP Rate"; Rec."Bid Sum 1 VoP Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Sum 2 Contingency Rate"; Rec."Bid Sum 2 Contingency Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Sum 2 VoP Rate"; Rec."Bid Sum 2 VoP Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Sum 1 Contingency Amount"; Rec."Bid Sum 1 Contingency Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Sum 2 Contingency Amount"; Rec."Bid Sum 2 Contingency Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Sum 1 VoP Amount"; Rec."Bid Sum 1 VoP Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Sum 2 VoP Amount"; Rec."Bid Sum 2 VoP Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Bid Sum 1 Incl. VAT"; Rec."Total Bid Sum 1 Incl. VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Total Bid Sum 2 Incl. VAT"; Rec."Total Bid Sum 2 Incl. VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Total Contract Sum Incl. VAT"; Rec."Total Contract Sum Incl. VAT")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Project Details")
            {
                Caption = '&Project Details';
                action("Road Links")
                {
                    ApplicationArea = Basic;
                    Image = CreateJobSalesInvoice;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Project Road Links";
                    RunPageLink = "KeRRA Budget Code" = field("KeRRA Budget Code"),
                                  "Global Budget Book Code" = field("Road Work Program ID");
                }
                action("Road Facilities")
                {
                    ApplicationArea = Basic;
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Project Road Facility Items";
                    RunPageLink = "KeRRA Budget Code" = field("KeRRA Budget Code"),
                                  "Global Budget Book Code" = field("Road Work Program ID");
                }
                action(Tasks)
                {
                    ApplicationArea = Basic;
                    Caption = 'BoQ';
                    Ellipsis = true;
                    Image = TaskList;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Work Plan Tasks";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "Package No." = field("Project No");
                }
                action("Planning Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'BiIl Items';
                    Ellipsis = true;
                    Image = Planning;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "WP Plan Lines";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "Project No" = field("Project No"),
                                  "Budget Entry No" = field("Budget Entry No");
                    Visible = false;
                }
                action("Funding Sources")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "Project Funding Sources";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                }
                action("Equipment Specifications")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "SPP Equipment Specifications";
                    RunPageLink = "Project No" = field("Project No"),
                                  "Line No" = field("Entry No"), "KeRRA Budget Code" = field("KeRRA Budget Code");

                }
                action("Required Past Experience")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "SPP Required Past Experience";
                    RunPageLink = "Document No" = field("Road Work Program ID")
                    , "Project No" = field("Project No"),
                                  "Line No" = field("Entry No"), "KeRRA Budget Code" = field("KeRRA Budget Code");

                }

                action("Required Financials")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "SPP Financials";
                    RunPageLink = "Document No" = field("Road Work Program ID")
                    , "Project No" = field("Project No"),
                                  "Line No" = field("Entry No"), "KeRRA Budget Code" = field("KeRRA Budget Code");

                }
                action("Required Litigation")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "SPP Litigation";
                    RunPageLink = "Document No" = field("Road Work Program ID")
                    , "Project No" = field("Project No"),
                                  "Line No" = field("Entry No"), "KeRRA Budget Code" = field("KeRRA Budget Code");

                }
                action("Personnel Specification")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "SPP Staff Specifications";
                    RunPageLink = "Project No" = field("Project No"),
                                  "Line No" = field("Entry No");
                }
                action("SPP Risk Register")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "SPP Risk Register";
                    RunPageLink = "Document No" = field("Road Work Program ID")
                    , "Project No" = field("Project No"),
                                  "Line No" = field("Entry No"), "KeRRA Budget Code" = field("KeRRA Budget Code");
                }

                action("Attach Tender Instr.to Bidders")
                {
                    ApplicationArea = Basic;
                }
                action("Attach Project Special Specs")
                {
                    ApplicationArea = Basic;
                }
                action("Attach Standard Specs")
                {
                    ApplicationArea = Basic;
                }
                action("Attach Contract Conditions")
                {
                    ApplicationArea = Basic;
                }
                action("Attach Drawings")
                {
                    ApplicationArea = Basic;
                }
                action("Attach Tender Documents")
                {
                    ApplicationArea = Basic;
                    Image = TestReport;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "WorkPlan Document Attachments";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "Budget Entry No" = field("Budget Entry No"),
                                  "Project No" = field("Project No"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code"),
                                  "Entry No" = field("Entry No");

                    trigger OnAction()
                    begin
                        //DMSManagement.UploadAIEAttchmentDocuments("Road Work Program ID",'Testing',RECORDID,'');
                        //DIALOG.MESSAGE('Attached');
                    end;
                }
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

