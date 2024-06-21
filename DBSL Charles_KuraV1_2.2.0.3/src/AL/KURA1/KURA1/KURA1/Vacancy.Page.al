#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69630 "Vacancy"
{
    PageType = Card;
    SourceTable = "Recruitment Requisition Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vacancy No.';
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requester Staff No"; "Requester Staff No")
                {
                    ApplicationArea = Basic;
                }
                field("Requester Name"; "Requester Name")
                {
                    ApplicationArea = Basic;
                }
                field("Requester ID"; "Requester ID")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition ID"; "Requisition ID")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan Type"; "Recruitment Plan Type")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan ID"; "Recruitment Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID"; "Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation"; "Job Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field("No of Openings"; "No of Openings")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Directorate)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(Region; Region)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Primary Recruitment Reason"; "Primary Recruitment Reason")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Justification"; "Recruitment Justification")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Target Candidate Source"; "Target Candidate Source")
                {
                    ApplicationArea = Basic;
                }
                field("Sourcing Method"; "Sourcing Method")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
            }
            part("Roles & Responsibilities"; "Vacancy Responsibilities")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = field("Document Type");
            }
            group("Recruitment Timelines")
            {
                field("Recruitment Cycle Type"; "Recruitment Cycle Type")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Lead Time"; "Recruitment Lead Time")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Recruitment Start Date"; "Planned Recruitment Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Recruitment End Date"; "Planned Recruitment End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Employment Start Date"; "Planned Employment Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Employment End Date"; "Planned Employment End Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Recruitment Budget")
            {
                field("Funding Source ID"; "Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Finacial Year Code"; "Finacial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Line Budget Cost"; "Recruitment Line Budget Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Average Cost/Hire"; "Average Cost/Hire")
                {
                    ApplicationArea = Basic;
                }
                field("Job No."; "Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No."; "Job Task No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Job Information")
            {
                field("Staff Establishment"; "Staff Establishment")
                {
                    ApplicationArea = Basic;
                }
                field("Current Headcount"; "Current Headcount")
                {
                    ApplicationArea = Basic;
                }
                field("Hierarchically Reports To"; "Hierarchically Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Functionally  Reports To"; "Functionally  Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Estimate Annual Salary"; "Estimate Annual Salary")
                {
                    ApplicationArea = Basic;
                }
                field("Job Grade ID"; "Job Grade ID")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Appointment Authority"; "Overall Appointment Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Seniority Level"; "Seniority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Default Terms of Service Code"; "Default Terms of Service Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type"; "Employment Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
            }
            systempart(Control21; Notes)
            {
            }
            systempart(Control22; MyNotes)
            {
            }
            systempart(Control23; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    TestField("Approval Status", "approval status"::Open);
                    Message('Approval Request has been approved');
                    "Approval Status" := "approval status"::Released;
                    Modify(true);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    //ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
                    ApprovalEntries.Setfilters(Database::"Purchase Header", 14, "Document No.");
                    ApprovalEntries.Run;
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    TestField("Approval Status", "approval status"::"Pending Approval");
                    Message('Approval Request has been cancelled');
                    "Approval Status" := "approval status"::Open;
                    Modify(true);
                end;
            }
            separator(Action84)
            {
            }
            separator(Action85)
            {
            }
            action("Create Vacancy Announcement")
            {
                ApplicationArea = Basic;
                Image = CreateBinContent;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to create a vacancy announcement voucher?') = true then begin
                    end
                end;
            }
            action("Cancel/Terminate Recruitment")
            {
                ApplicationArea = Basic;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Published := false;
                    "Vacancy Status" := "vacancy status"::Cancelled;
                    Modify(true);
                end;
            }
            action("Close Recruitment Project")
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Published := false;
                    "Vacancy Status" := "vacancy status"::Cancelled;
                    Modify(true);
                end;
            }
            action("Publish to E-Recruitment Portal")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure yo want to publish the vacancy %1 to the E-recruitment portal', true, "Document No.") = true then begin
                        Published := true;
                        Modify(true);
                    end
                end;
            }
        }
        area(reporting)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetRange("Document No.", "Document No.");
                    Report.Run(69605, true, false, Rec);
                end;
            }
        }
        area(navigation)
        {
            group("Vacancy Details")
            {
                action("Position Requirements")
                {
                    ApplicationArea = Basic;
                    Image = Register;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Requirements";
                    RunPageLink = "Document No." = field("Document No.");
                }
                action("Vacancy Substitutes")
                {
                    ApplicationArea = Basic;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Substitutes";
                }
                action("Position Responsibilities")
                {
                    ApplicationArea = Basic;
                    Image = ReceiveLoaner;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Responsibilities";
                }
                action("Position Work Condition")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenter;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Work Condition";
                }
                action("Position Benefits")
                {
                    ApplicationArea = Basic;
                    Image = BankAccountLedger;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Benefit Plan Grade";
                    RunPageLink = "Job Grade ID" = field("Job Grade ID");
                }
                action("Required Documents")
                {
                    ApplicationArea = Basic;
                    Image = Replan;
                    RunObject = Page "Requisition Required Documents";
                    RunPageLink = "Document No." = field("Requisition ID");
                }
            }
            group(Applications)
            {
                action("Vacancy Announcement Events")
                {
                    ApplicationArea = Basic;
                    Image = Alerts;
                }
                action("Job Applications")
                {
                    ApplicationArea = Basic;
                    Image = JobJournal;
                    RunObject = Page "Job Applications";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                }
                action("Shortlisting History")
                {
                    ApplicationArea = Basic;
                    Image = History;
                }
                action("Background Check Reports")
                {
                    ApplicationArea = Basic;
                    Image = CheckRulesSyntax;
                }
                action("Pre-hire Medical Reports")
                {
                    ApplicationArea = Basic;
                    Image = MaintenanceRegistrations;
                }
                action("Employment Offers")
                {
                    ApplicationArea = Basic;
                    Image = NewSparkle;
                }
            }
            group(History)
            {
                action("Vacancy Posting")
                {
                    ApplicationArea = Basic;
                    Image = VendorPayment;
                    RunObject = Page "Vacancy Posting";
                    RunPageLink = "Vacancy ID" = field("Document No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Job Vacancy";
    end;
}

