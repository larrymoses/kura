#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69722 "Interview invitation Card"
{
    PageType = Card;
    SourceTable = "Candidate Selection Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Mode";"Interview Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Scoresheet Template";"Interview Scoresheet Template")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Appointed Selection Comm ID";"Appointed Selection Comm ID")
                {
                    ApplicationArea = Basic;
                }
                field("Selection Committee Chair";"Selection Committee Chair")
                {
                    ApplicationArea = Basic;
                }
                field("Lead HR Officer";"Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Planned Start Date";"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned end Date";"Planned end Date")
                {
                    ApplicationArea = Basic;
                }
                field("Source Type";"Source Type")
                {
                    ApplicationArea = Basic;
                }
                field("Source Document No.";"Source Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Person";"Primary Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Phone";"Primary Contact Phone")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Email";"Primary Contact Email")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments";"Additional Comments")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Document Status";"Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                group("Shortlisting Fields")
                {
                    Visible = false;
                    field("Minimum Academic Qualification";"Minimum Academic Qualification")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Min Academic Hierarchy Pointer";"Min Academic Hierarchy Pointer")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Minimum Work Experience";"Minimum Work Experience")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Minimum Mngmnt Experience";"Minimum Mngmnt Experience")
                    {
                        ApplicationArea = Basic;
                    }
                }
                group(Statistics)
                {
                    Visible = false;
                    field("No. of Submitted Applications";"No. of Submitted Applications")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No. of Apptitude Invitees";"No. of Apptitude Invitees")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No. of Final Shortlisted Candi";"No. of Final Shortlisted Candi")
                    {
                        ApplicationArea = Basic;
                        Caption = 'No. of Final Shortlisted Candidates';
                    }
                    field("Missed Academic Total";"Missed Academic Total")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Missed Management Total";"Missed Management Total")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Missed General Total";"Missed General Total")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            part(Control22;"Interview Lines")
            {
                Caption = 'Interview-Stage Job Applications';
                SubPageLink = "Document No."=field("Document No."),
                              "Document Type"=field("Document Type");
            }
            group("Vacancy Details")
            {
                Editable = false;
                field("Position ID";"Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title";"Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("No. of openings";"No. of openings")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field(Region;Region)
                {
                    ApplicationArea = Basic;
                }
                field("Seniority Level";"Seniority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Default Terms of Service Code";"Default Terms of Service Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type";"Employment Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6;Outlook)
            {
            }
            systempart(Control5;Notes)
            {
            }
            systempart(Control4;MyNotes)
            {
            }
            systempart(Control3;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Interview Panels")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Candidate Shortlist Committee";
                RunPageLink = "Document No."=field("Document No.");
            }
            action("Required Documents")
            {
                ApplicationArea = Basic;
                Image = DocumentsMaturity;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                RunObject = Page "Requisition Required Documents";
                RunPageLink = "Document No."=field("Vacancy ID");
            }
            action("Suggest Job Applications")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest job applicants';
                begin
                    if Confirm(TXT001)=true then begin
                    Recruitment.SuggestInterviewCandidates(Rec);
                    end
                end;
            }
            action("Notify Panelist")
            {
                ApplicationArea = Basic;
                Image = NewOpportunity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to invite the panelitsts?';
                begin
                    if Confirm(TXT001)=true then begin
                    Recruitment.NotifyInterviewPanelist(Rec);
                    end
                end;
            }
            action("Invite Candidates")
            {
                ApplicationArea = Basic;
                Image = Alerts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to invite the candidates';
                begin
                    if Confirm(TXT001)=true then begin
                    Recruitment.NotifyInterviewCandidates(Rec);
                    end;
                    Message('Candidates Notified Successfully');
                end;
            }
        }
        area(reporting)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetRange("Document No.","Document No.");
                    Report.Run(69623,true,false,Rec);
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category6;

                    trigger OnAction()
                    begin
                        ApprovalEntries.Setfilters(Database::"HR Leave Applications",15,"Document No.");
                        ApprovalEntries.Run;
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Message('');
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Message('');
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"Interview Invitation";
    end;

    var
        ApprovalEntries: Page "Approval Entries";
        Recruitment: Codeunit Recruitment;
}

