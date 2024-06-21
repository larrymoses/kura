#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69751 "Background Checks Card"
{
    PageType = Card;
    SourceTable = "Background Checks Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID"; "Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Application No."; "Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("Panel Interview Report ID"; "Panel Interview Report ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead HR Officer"; "Lead HR Officer")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Candidate No."; "Candidate No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; "First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; "Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; "Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Mobile Phone No."; "Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Email)
                {
                    ApplicationArea = Basic;
                }
                field("Birth Date"; "Birth Date")
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Gender)
                {
                    ApplicationArea = Basic;
                }
                field("ID Number"; "ID Number")
                {
                    ApplicationArea = Basic;
                }
                field("Passport No."; "Passport No.")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Registration(PIN)"; "Tax Registration(PIN)")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; "Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control30; "Background Checks Documents")
            {
                SubPageLink = "Document No." = field("Document No.");
            }
            part(Control40; "Background Checks Reference")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Vacancy Id" = field("Vacancy ID"),
                              "Application No." = field("Application No.");
            }
        }
        area(factboxes)
        {
            systempart(Control26; Outlook)
            {
            }
            systempart(Control27; Notes)
            {
            }
            systempart(Control28; MyNotes)
            {
            }
            systempart(Control29; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Offer Employment")
            {
                ApplicationArea = Basic;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    JobApplications.Reset;
                    JobApplications.SetRange("Application No.", "Application No.");
                    if JobApplications.FindFirst then begin
                        Recruitment.NotifyBackgroundCheckResult(Rec);
                        JobApplications."Background Checks Pass" := true;
                        JobApplications.Modify(true);
                        //offer employment
                        Recruitment.CreateEmploymentOffer(Rec);
                        "Document Status" := "document status"::Closed;
                        Modify(true);
                    end
                end;
            }
            action("Dis-Qualify Applicant")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    JobApplications.Reset;
                    JobApplications.SetRange("Application No.", "Application No.");
                    if JobApplications.FindFirst then begin
                        Recruitment.NotifyBackgroundCheckResult(Rec);
                        JobApplications."Background Checks Pass" := false;
                        JobApplications.Modify(true);
                        "Document Status" := "document status"::Closed;
                        Modify(true);
                    end
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetRange("Document No.", "Document No.");
                    Report.Run(69626, true, false, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                Promoted = true;
                PromotedIsBig = true;
                ShortCutKey = 'Shift+Ctrl+D';

                trigger OnAction()
                begin
                    CurrPage.SaveRecord;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
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
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    /*TESTFIELD("Approval Status","Approval Status"::Open);
                    MESSAGE('Approval Request has been approved');
                    "Approval Status":="Approval Status"::Released;*/
                    Modify(true);

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
                    /*TESTFIELD("Approval Status","Approval Status"::"Pending Approval");
                    MESSAGE('Approval Request has been cancelled');
                    "Approval Status":="Approval Status"::Open;*/
                    Modify(true);

                end;
            }
            separator(Action34)
            {
            }
            action("Referee Recommendations")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Page "Referee Recommendation";
                RunPageLink = "Application No." = field("Application No.");
                RunPageMode = View;
            }
            action("Medical Report")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Page "Medical Check Reports";
                RunPageLink = "Application No." = field("Application No.");
                RunPageMode = View;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Status" := "document status"::Active;
    end;

    var
        JobApplications: Record "Job Applications";
        Recruitment: Codeunit Recruitment;
}

