#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80340 "Employee Experience"
{
    PageType = Card;
    SourceTable = "Business Research Survey";
    SourceTableView = where("Business Research Category" = const("Employee Experience"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Survey Type"; "Survey Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Business Research Template ID"; "Business Research Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Target Respondent Type"; "Target Respondent Type")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department ID"; "Primary Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate ID"; "Primary Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field(Published; Published)
                {
                    ApplicationArea = Basic;
                }
                field("Date Published"; "Date Published")
                {
                    ApplicationArea = Basic;
                }
                field("Response Due Date"; "Response Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Creation Date"; "Creation Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Creation Time"; "Creation Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Responses"; "No. of Responses")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control32; "BR Survey Questions")
            {
                SubPageLink = "Survey ID" = field("Document No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("BR Survey Section")
            {
                ApplicationArea = Basic;
                Caption = 'Survey Section';
                Image = AbsenceCategory;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "BR Survey Section";
                RunPageLink = "Survey ID" = field("Document No.");
            }
            action("Suggest Business Sections")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    TestField("Business Research Template ID");
                    BRTemplateSection.Reset;
                    BRTemplateSection.SetRange("Template ID", "Business Research Template ID");
                    if BRTemplateSection.FindFirst then begin
                        repeat
                            BRSurveySection.Init;
                            BRSurveySection."Survey ID" := "Document No.";
                            BRSurveySection."Section Code" := BRTemplateSection."Section Code";
                            BRSurveySection.Description := BRTemplateSection.Description;
                            BRSurveySection."Section Completion Instruction" := BRTemplateSection."Section Completion Instruction";
                            BRSurveySection."No. of Questions" := BRTemplateSection."No. of Questions";
                            BRSurveySection."Total Weight %" := BRTemplateSection."Total Weight %";
                            BRSurveySection.Insert;
                        until BRTemplateSection.Next = 0;
                    end;

                    BRTemplateLine.Reset;
                    BRTemplateLine.SetRange("Template ID", "Business Research Template ID");
                    if BRTemplateLine.FindFirst then begin
                        repeat
                            BRSurveyQuestion.Init;
                            BRSurveyQuestion."Survey ID" := "Document No.";
                            BRSurveyQuestion."Section Code" := BRTemplateLine."Section ID";
                            BRSurveyQuestion."Question ID" := BRTemplateLine."Question ID";
                            BRSurveyQuestion.Question := BRTemplateLine.Question;
                            BRSurveyQuestion."Rating Type" := BRTemplateLine."Rating Type";
                            BRSurveyQuestion."Option Text Response Type" := BRTemplateLine."Option Text Response Type";
                            BRSurveyQuestion."Assigned Weight %" := BRTemplateLine."Assigned Weight %";
                            BRSurveyQuestion."Desired Perfomance Direction" := BRTemplateLine."Desired Perfomance Direction";
                            BRSurveyQuestion.Insert;

                            BRTemplateScoreGuide.Reset;
                            BRTemplateScoreGuide.SetRange("Template ID", "Business Research Template ID");
                            BRTemplateScoreGuide.SetRange("Section ID", BRTemplateLine."Section ID");
                            BRTemplateScoreGuide.SetRange("Question ID", BRTemplateLine."Question ID");
                            if BRTemplateScoreGuide.FindFirst then begin
                                BRSurveyScoreGuide.Init;
                                BRSurveyScoreGuide."Survey ID" := "Document No.";
                                BRSurveyScoreGuide."Section Code" := BRTemplateScoreGuide."Section ID";
                                BRSurveyScoreGuide."Question ID" := BRTemplateScoreGuide."Question ID";
                                BRSurveyScoreGuide."Line No." := BRTemplateScoreGuide."Line No.";
                                BRSurveyScoreGuide."Rating Type" := BRSurveyScoreGuide."Rating Type";
                                BRSurveyScoreGuide."Desired Perfomance Direction" := BRSurveyScoreGuide."Desired Perfomance Direction";
                                BRSurveyScoreGuide."Response Value" := BRSurveyScoreGuide."Response Value";
                                BRSurveyScoreGuide."Score %" := BRSurveyScoreGuide."Score %";
                                BRSurveyScoreGuide.Insert
                            end;

                        until BRTemplateLine.Next = 0;
                    end;


                    Message('Lines Suggested Successfully');
                end;
            }
            separator(Action31)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                //  ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    TestField("Approval Status", "approval status"::Open);

                    "Approval Status" := "approval status"::Released;
                    Modify;
                    Message('Document has been approved Automatically');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    TestField("Approval Status", "approval status"::"Pending Approval");//status must be open.
                                                                                        /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                        ApprovalsMgmt.""(Rec);*/
                    "Approval Status" := "approval status"::Open;
                    Modify;
                    Message('Document has been Re-Opened');

                end;
            }
            separator(Action27)
            {
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Printed Successfully');
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Generate Participant Invites")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Generate Participant Invites';
                    Ellipsis = true;
                    Image = CreateDocument;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    // RunObject = Report "Create Employee BR Participate";
                    ToolTip = 'Generate Participant Invites';

                    trigger OnAction()
                    var
                        CopyJob: Page "Copy WorkPlan";
                    begin
                    end;
                }
                action("Participant Invitations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Participant Invitations';
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    RunObject = Page "BR Survey Participants";
                    RunPageLink = "Document No." = field("Document No.");
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Business Research Category" := "business research category"::"Employee Experience";
    end;

    trigger OnOpenPage()
    begin
        "Business Research Category" := "business research category"::"Employee Experience";
    end;

    var
        BRTemplateLine: Record "BR Template Line";
        BRSurveySection: Record "BR Survey Section";
        BRSurveyQuestion: Record "BR Survey Question";
        BRSurveyScoreGuide: Record "BR Survey Score Guide";
        BRTemplateSection: Record "BR Template Section";
        BRTemplateScoreGuide: Record "BR Template Score Guide";
}

