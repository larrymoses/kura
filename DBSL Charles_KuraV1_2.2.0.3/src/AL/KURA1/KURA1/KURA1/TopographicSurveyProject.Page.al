#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72034 "Topographic Survey Project"
{
    PageType = Card;
    SourceTable = Job;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field("Search Description"; "Search Description")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Description 2"; "Description 2")
                {
                    ApplicationArea = Basic;
                }
                field("Year Code"; "Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Request No"; "Request No")
                {
                    ApplicationArea = Basic;
                }
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Type of Project"; "Type of Project")
                {
                    ApplicationArea = Basic;
                }
                field("Study/Survey Type"; "Study/Survey Type")
                {
                    ApplicationArea = Basic;
                }
                field("Execution Approach"; "Execution Approach")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID"; "Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Code';
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Source';
                }
                field("Job Posting Group"; "Job Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager"; "Project Manager")
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsible Officer';
                }
                field("Project Budget"; "Project Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Contract Sum';
                }
                field("Actual Project Costs"; "Actual Project Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Workplanned Length"; "Workplanned Length")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID"; "Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No."; "Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; "Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Project Imprest Memos"; "No. Of Project Imprest Memos")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Code"; "Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; "Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Total Project Cost Excl. VAT"; "Total Project Cost Excl. VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Contingency Amount"; "Contingency Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Variation of Price Amount"; "Variation of Price Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Project Cost Incl. VAT"; "Total Project Cost Incl. VAT")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(JobTaskLines; "Job Task Lines Subform")
            {
                ApplicationArea = Jobs;
                Caption = 'Project Activities';
                SubPageLink = "Job No." = field("No.");
                SubPageView = sorting("Job Task No.")
                              order(ascending);
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date/Time"; "Creation Date/Time")
                {
                    ApplicationArea = Basic;
                }
                field("Notice of Award No."; "Notice of Award No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Location ID"; "Project Location ID")
                {
                    ApplicationArea = Basic;
                }
                field("Award Date"; "Award Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date"; "Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; "Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Road Project Catergory"; "Road Project Catergory")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Works Category"; "Primary Works Category")
                {
                    ApplicationArea = Basic;
                }
                field("Starting Date"; "Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Ending Date"; "Ending Date")
                {
                    ApplicationArea = Basic;
                }
                field("Revised End Date"; "Revised End Date")
                {
                    ApplicationArea = Basic;
                }
                field("External Contract Reference"; "External Contract Reference")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bid No"; "Awarded Bid No")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Appmnt Voucher ID"; "Staff Appmnt Voucher ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Commencement Order"; "Project Commencement Order")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan ID"; "Work Execution Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Global Budget Book ID"; "Global Budget Book ID")
                {
                    ApplicationArea = Basic;
                }
                field("KeRRA Budget Code"; "KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; "Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Job")
            {
                Caption = '&Job';
                Image = Job;
                action(JobPlanningLines)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job &Planning Lines';
                    Image = JobLines;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (Budget) or you can specify what you actually agreed with your customer that he should pay for the job (Billable).';

                    trigger OnAction()
                    var
                        JobPlanningLine: Record "Job Planning Line";
                        JobPlanningLines: Page "Job Planning Lines";
                    begin
                        TestField("No.");
                        JobPlanningLine.FilterGroup(2);
                        JobPlanningLine.SetRange("Job No.", "No.");
                        JobPlanningLine.FilterGroup(0);
                        JobPlanningLines.SetJobTaskNoVisible(true);
                        JobPlanningLines.SetTableview(JobPlanningLine);
                        JobPlanningLines.Editable := true;
                        JobPlanningLines.Run;
                    end;
                }
                action("&Dimensions")
                {
                    ApplicationArea = Dimensions;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    // RunObject = Page "Default Dimensions";
                    // RunPageLink = "Table ID"=const(167),
                    //               "No."=field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to journal lines to distribute costs and analyze transaction history.';
                }
                action("Contract Details")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = ContractPayment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Contract List";
                    RunPageLink = Job = field("No."),
                                  "Contract Status" = filter(" ");
                }
                action("Generate Payment Certificate")
                {
                    ApplicationArea = Basic;
                    Image = CalculateConsumption;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Report "Customer - List";
                    Visible = false;
                }
                action("Project Funding Sources")
                {
                    ApplicationArea = Basic;
                    Image = MapSetup;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Funding Source List";
                }
                action("Project Road Links")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Road Links';
                    Image = LiFo;
                    Promoted = true;
                    RunObject = Page "Project Road Links";
                    RunPageLink = "Global Budget Book Code" = field("No."),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Project Road Links';
                }
                action("Initate Procurement Process")
                {
                    ApplicationArea = Basic;
                    Image = Process;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Funding Source List";
                }
                action("Project Funding Line")
                {
                    ApplicationArea = Basic;
                    Image = PlanningWorksheet;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Project Funding Line";
                    RunPageLink = "Project No" = field("No.");
                }
                action("&Statistics")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    RunObject = Page "Job Statistics";
                    RunPageLink = "No." = field("No.");
                    ShortCutKey = 'F7';
                    ToolTip = 'View this job''s statistics.';
                }
                separator(Action60)
                {
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Job),
                                  "No." = field("No.");
                    ToolTip = 'View or add comments for the record.';
                }
                action("&Online Map")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Online Map';
                    Image = Map;
                    ToolTip = 'View online map for addresses assigned to this job.';

                    trigger OnAction()
                    begin
                        DisplayMap;
                    end;
                }
                action("Import Job Task(s)")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = ImportChartOfAccounts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = XMLport "Import Job Tasks";
                }
                action("Import Job Planning Lines")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = ImportChartOfAccounts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = XMLport "Import Job Planning Lines";
                }
                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category7;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
                action("Meeting Register")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Meeting Register';
                    Image = ViewJob;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    RunObject = Page "Project Meeting Registers";
                    RunPageLink = "Project ID" = field("No.");
                    RunPageMode = View;
                    ToolTip = 'View the job''s resource group allocation.';
                }
                action("Linked Road Works Projects")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Study/Survey Road Projects";
                    RunPageLink = "No." = field("No.");
                }
                action("List of Maps")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Study Cost Benefit Analysis";
                    // RunPageLink = "Study ID"=field("Study/Survey Type"),
                    //               "Option ID"=filter('3'),
                    //               "Entry Type"=field("No.");
                }
                action("Technical Reports")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Road Study Sections";
                    // RunPageLink = "Section ID"=field("Study/Survey Type"),
                    //               Description=filter('0'),
                    //               "Section Distance (Km)"=field("No.");
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Ledger E&ntries';
                    Image = JobLedger;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    RunObject = Page "Job Ledger Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Task No.", "Entry Type", "Posting Date")
                                  order(descending);
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
            }
            group("Task Lines")
            {
                action("Populate Task Lines")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        // ProjectTemplates.RESET;
                        // ProjectTemplates.SETRANGE(Blocked,FALSE);
                        // ProjectTemplates.SETFILTER("Project  Task No.",'<>%1','');
                        // IF ProjectTemplates.FIND('-') THEN BEGIN
                        //  REPEAT
                        //    JobTaskLines.RESET;
                        //    JobTaskLines.SETRANGE("Job No.","No.");
                        //    JobTaskLines.SETRANGE("Job Task No.",ProjectTemplates."Project  Task No.");
                        //    IF NOT JobTaskLines.FINDSET THEN BEGIN
                        //
                        //        JobTaskLines.INIT;
                        //        JobTaskLines."Job No.":="No.";
                        //        JobTaskLines."Job Task No.":=ProjectTemplates."Project  Task No.";
                        //        JobTaskLines.Description:=ProjectTemplates."Project Description";
                        //        JobTaskLines.INSERT(TRUE);
                        //    END;
                        //  UNTIL ProjectTemplates.NEXT=0;
                        // END;
                        // MESSAGE('Job Task Lines loaded successfully');
                    end;
                }
            }
        }
        area(processing)
        {
            group("&Copy")
            {
                Caption = '&Copy';
                Image = Copy;
                action("Copy Job Tasks &from...")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Copy Job Tasks &from...';
                    Ellipsis = true;
                    Image = CopyToTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Open the Copy Job Tasks page.';

                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetToJob(Rec);
                        CopyJobTasks.RunModal;
                    end;
                }
                action("Copy Project Activities &to...")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Copy Project Activities &to...';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Open the Copy Jobs To page.';

                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetFromJob(Rec);
                        CopyJobTasks.RunModal;
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Job Actual to Budget")
            {
                ApplicationArea = Suite;
                Caption = 'Job Actual to Budget';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job Actual To Budget";
                ToolTip = 'Compare budgeted and usage amounts for selected jobs. All lines of the selected job show quantity, total cost, and line amount.';
            }
            action("Job Analysis")
            {
                ApplicationArea = Suite;
                Caption = 'Job Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job Analysis";
                ToolTip = 'Analyze the job, such as the budgeted prices, usage prices, and billable prices, and then compares the three sets of prices.';
            }
            action("Job - Planning Lines")
            {
                ApplicationArea = Suite;
                Caption = 'Job - Planning Lines';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job - Planning Lines";
                ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that he should pay for the job (billable).';
            }
            action("Job - Suggested Billing")
            {
                ApplicationArea = Suite;
                Caption = 'Job - Suggested Billing';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job Suggested Billing";
                ToolTip = 'View a list of all jobs, grouped by customer, how much the customer has already been invoiced, and how much remains to be invoiced, that is, the suggested billing.';
            }
            action("Report Job Quote")
            {
                ApplicationArea = Suite;
                Caption = 'Preview Job Quote';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Category8;
                ToolTip = 'Open the Job Quote report.';

                trigger OnAction()
                var
                    Job: Record Job;
                begin
                    Job.SetCurrentkey("No.");
                    Job.SetFilter("No.", "No.");
                    Report.Run(Report::"Job Quote", true, false, Job);
                end;
            }
            action("Send Job Quote")
            {
                ApplicationArea = Suite;
                Caption = 'Send Job Quote';
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Category8;
                ToolTip = 'Send the job quote to the customer. You can change the way that the document is sent in the window that appears.';

                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::"Jobs-Send", Rec);
                end;
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Documentations & Photos';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;

                trigger OnAction()
                begin
                    //DMSManagement.UploadDocument(DMSDocuments."Document Type"::"Road Link","Road Code",'Road Link',RECORDID);
                    DMSManagement.UploadRoadLinkDocuments("No.", 'Project Number', RecordId, "Region ID");
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Study/Survey Type" := "study/survey type"::"Topographic Survey";
    end;

    var
        JobTaskLines: Record "Job Task";
        ProjectTemplates: Record "Project Templates";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
}

