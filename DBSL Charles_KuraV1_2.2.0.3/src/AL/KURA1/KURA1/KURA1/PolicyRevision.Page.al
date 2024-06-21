#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80185 "Policy Revision"
{
    PageType = Card;
    SourceTable = "Policy Revision";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Revision No."; "Revision No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Policy ID"; "Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Name"; "Policy Name")
                {
                    ApplicationArea = Basic;
                }
                field("External Ref No"; "External Ref No")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Dev Institution ID"; "Policy Dev Institution ID")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Overview"; "Policy Overview")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Policy Goal"; "Policy Goal")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Policy Purpose"; "Policy Purpose")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Policy Rationale"; "Policy Rationale")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Policy Scope"; "Policy Scope")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Primary Directorate"; "Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department"; "Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("Process Owner ID"; "Process Owner ID")
                {
                    ApplicationArea = Basic;
                }
                field("Process Owner Name"; "Process Owner Name")
                {
                    ApplicationArea = Basic;
                }
                field("Process Owner Title"; "Process Owner Title")
                {
                    ApplicationArea = Basic;
                }
                field("Approved By"; "Approved By")
                {
                    ApplicationArea = Basic;
                }
                field("Approver Name"; "Approver Name")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Stage"; "Policy Stage")
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
        }
        area(creation)
        {
            group(Entities)
            {
                Caption = 'Entities';
                action("Policy Core Value")
                {
                    ApplicationArea = Basic;
                    Caption = 'Company Core Values';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Core Value Revisions";
                    // RunPageLink = "Score (%)"=field("Revision No.");
                }
                action("Policy Objective Revision")
                {
                    ApplicationArea = Basic;
                    Image = Opportunity;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Objective Revision";
                    RunPageLink = "Revision No." = field("Revision No.");
                }
                action("Revision Policy Stakeholder")
                {
                    ApplicationArea = Basic;
                    Image = Salutation;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Stakeholder Revision";
                    RunPageLink = "Revision No." = field("Revision No."),
                                  "Policy ID" = field("Policy ID");
                }
                action("Revision Policy Info Sources")
                {
                    ApplicationArea = Basic;
                    Image = Info;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Revision Info Sources";
                    RunPageLink = "Revision No." = field("Revision No."),
                                  "Policy ID" = field("Policy ID");
                }
                action("Policy Revision Committee")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Revision Committee";
                    RunPageLink = "Revision No." = field("Revision No."),
                                  "Policy ID" = field("Policy ID");
                }
                action("Policy Guiding Principle")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Guiding Principle';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Guiding Principle Rev";
                    RunPageLink = "Revision No." = field("Revision No.");
                }
                action("Policy Related Framework")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Related Framework';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Related Framework Rev";
                    RunPageLink = "Revision No." = field("Revision No.");
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
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
                    //   ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin

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
                        if ("Approval Status" = "approval status"::Released) then
                            "Approval Status" := "approval status"::Open;
                        Modify;
                        Message('Document has been Re-Opened');
                    end;
                }
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Update Policy ")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Update Policy';
                    Ellipsis = true;
                    Image = CreateDocument;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    ToolTip = 'Update Policy';

                    trigger OnAction()
                    var
                        CopyJob: Page "Copy WorkPlan";
                    begin
                        TestField("Approval Status", "approval status"::Released);
                        Policy.Reset;
                        Policy.SetRange(Code, "Policy ID");
                        if Policy.Find('-') then begin
                            Policy."Policy Name" := "Policy Name";
                            Policy."External Ref No" := "External Ref No";
                            Policy."Policy Dev Institution ID" := "Policy Dev Institution ID";
                            Policy."Policy Overview" := "Policy Overview";
                            Policy."Policy Goal" := "Policy Goal";
                            Policy."Policy Purpose" := "Policy Purpose";
                            Policy."Policy Rationale" := "Policy Rationale";
                            Policy."Policy Scope" := "Policy Scope";
                            Policy."Primary Directorate" := "Primary Directorate";
                            Policy."Primary Department" := "Primary Department";
                            Policy."Policy Stage" := "Policy Stage";
                            Policy.Modify;
                        end;

                        PolicyVersion.Reset;
                        PolicyVersion.SetRange("Policy Id", "Policy ID");
                        if PolicyVersion.Find('-') then begin
                            VersionNumber := PolicyVersion."Version Id";
                        end;

                        PolicyVersion.Init;
                        PolicyVersion."Policy Id" := "Policy ID";
                        PolicyVersion."Version Id" := VersionNumber + 1;
                        PolicyVersion.Description := "Policy Name";
                        PolicyVersion."Revision Date" := Today;
                        PolicyVersion."Policy Revision Code" := "Revision No.";
                        PolicyVersion.Insert;

                        PolicyObjectiveRevision.Reset;
                        PolicyObjectiveRevision.SetRange("Revision No.", "Revision No.");
                        if PolicyObjectiveRevision.FindFirst then begin
                            repeat
                                PolicyObjective.Reset;
                                PolicyObjective.SetRange("Policy ID", PolicyObjectiveRevision."Policy ID");
                                PolicyObjective.SetRange(Code, PolicyObjectiveRevision.Code);
                                if PolicyObjective.Find('-') then begin
                                    PolicyObjective."Policy ID" := "Policy ID";
                                    PolicyObjective.Code := PolicyObjectiveRevision.Code;
                                    PolicyObjective.Description := PolicyObjectiveRevision.Description;
                                    PolicyObjective.Modify;
                                end;
                            until PolicyObjectiveRevision.Next = 0;
                        end;


                        PolicyStakeholderRevision.Reset;
                        PolicyStakeholderRevision.SetRange("Revision No.", "Revision No.");
                        if PolicyStakeholderRevision.FindFirst then begin
                            repeat
                                PolicyStakeholder.Reset;
                                PolicyStakeholder.SetRange("Policy ID", PolicyStakeholderRevision."Policy ID");
                                PolicyStakeholder.SetRange(Code, PolicyStakeholderRevision.Code);
                                if PolicyObjective.Find('-') then begin
                                    PolicyStakeholder.Code := PolicyStakeholderRevision.Code;
                                    PolicyStakeholder."Stakeholder Group ID" := PolicyStakeholderRevision."Stakeholder Group ID";
                                    PolicyStakeholder.Description := PolicyStakeholderRevision.Description;
                                    PolicyStakeholder.Modify;
                                end;


                                RevisionStakeholderRole.Reset;
                                RevisionStakeholderRole.SetRange("Revision No.", PolicyStakeholderRevision."Revision No.");
                                RevisionStakeholderRole.SetRange("Policy ID", "Policy ID");
                                RevisionStakeholderRole.SetRange(Code, PolicyStakeholder.Code);
                                if RevisionStakeholderRole.Find('-') then begin
                                    repeat
                                        NextEntryNo := FnGetEntryNumber(PolicyStakeholderRole, "Revision No.");
                                        if NextEntryNo = 0 then
                                            NextEntryNo := 1
                                        else
                                            NextEntryNo := NextEntryNo + 1;

                                        PolicyStakeholderRole.Init;
                                        PolicyStakeholderRole."Policy ID" := PolicyStakeholderRole."Policy ID";
                                        PolicyStakeholderRole.Code := PolicyStakeholderRole.Code;
                                        PolicyStakeholderRole."Entry No" := NextEntryNo;
                                        PolicyStakeholderRole.Responsibility := PolicyStakeholderRole.Responsibility;
                                        PolicyStakeholderRole.Insert;
                                    until PolicyStakeholderRole.Next = 0;
                                end;

                            until RevisionStakeholderRole.Next = 0;
                        end;

                        NextEntryNo := 0;
                        PolicyInformationSources.Reset;
                        PolicyInformationSources.SetRange("Policy ID", "Policy ID");
                        if PolicyInformationSources.Find('-') then begin
                            repeat
                                NextEntryNo := FnGetEntryNumber2(PolicyInformationSources, "Revision No.");
                                if NextEntryNo = 0 then
                                    NextEntryNo := 1
                                else
                                    NextEntryNo := NextEntryNo + 1;

                                PolicyRevisionInfoSources.Init;
                                PolicyRevisionInfoSources."Revision No." := "Revision No.";
                                PolicyRevisionInfoSources."Policy ID" := PolicyInformationSources."Policy ID";
                                PolicyRevisionInfoSources."Line No." := NextEntryNo;
                                PolicyRevisionInfoSources."Source Type" := PolicyInformationSources."Source Type";
                                PolicyRevisionInfoSources.Description := PolicyInformationSources.Description;
                                PolicyRevisionInfoSources."URL Link" := PolicyInformationSources."URL Link";
                                PolicyRevisionInfoSources.Insert;
                            until PolicyInformationSources.Next = 0;
                        end;

                        PolicyGuidingPrinciple.Reset;
                        PolicyGuidingPrinciple.SetRange("Policy ID", "Policy ID");
                        if PolicyGuidingPrinciple.Find('-') then begin
                            repeat
                                PolicyGuidingPrincipleRev.Init;
                                PolicyGuidingPrincipleRev."Revision No." := "Revision No.";
                                PolicyGuidingPrincipleRev."Policy ID" := PolicyGuidingPrinciple."Policy ID";
                                PolicyGuidingPrincipleRev.Code := PolicyGuidingPrinciple.Code;
                                PolicyGuidingPrincipleRev.Description := PolicyGuidingPrinciple.Description;
                                PolicyGuidingPrincipleRev.Insert;
                            until PolicyGuidingPrinciple.Next = 0;

                        end;

                        PolicyCoreValue.Reset;
                        PolicyCoreValue.SetRange("Policy ID", "Policy ID");
                        if PolicyCoreValue.Find('-') then begin
                            repeat
                                PolicyCoreValueRevision.Init;
                                // PolicyCoreValueRevision."Score (%)":="Revision No.";
                                PolicyCoreValueRevision.Code := PolicyCoreValue."Policy ID";
                                PolicyCoreValueRevision.Description := PolicyCoreValue."Core Value";
                                // PolicyCoreValueRevision."Rating Type":=PolicyCoreValue.Description;
                                PolicyCoreValueRevision.Insert;
                            until PolicyCoreValue.Next = 0;

                        end;

                        NextEntryNo := 0;
                        PolicyRelatedFramework.Reset;
                        PolicyRelatedFramework.SetRange("Policy ID", "Policy ID");
                        if PolicyRelatedFramework.Find('-') then begin
                            repeat
                                NextEntryNo := FnGetEntryNumber3(PolicyRelatedFramework, "Revision No.");
                                if NextEntryNo = 0 then
                                    NextEntryNo := 1
                                else
                                    NextEntryNo := NextEntryNo + 1;

                                PolicyRelatedFrameworkRev.Init;
                                PolicyRelatedFrameworkRev."Revision No." := "Revision No.";
                                PolicyRelatedFrameworkRev."Policy ID" := PolicyRelatedFramework."Policy ID";
                                PolicyRelatedFrameworkRev."Line No" := NextEntryNo;
                                PolicyRelatedFrameworkRev."Framework Code" := PolicyRelatedFramework."Framework Code";
                                PolicyRelatedFrameworkRev.Description := PolicyRelatedFramework.Description;
                                PolicyRelatedFrameworkRev.Insert;
                            until PolicyRelatedFramework.Next = 0;
                        end;


                        NextEntryNo := 0;
                        PolicyFrameworkArticle.Reset;
                        PolicyFrameworkArticle.SetRange("Policy ID", "Policy ID");
                        if PolicyFrameworkArticle.Find('-') then begin
                            repeat
                                NextEntryNo := FnGetEntryNumber4(PolicyFrameworkArticle, "Revision No.");
                                if NextEntryNo = 0 then
                                    NextEntryNo := 1
                                else
                                    NextEntryNo := NextEntryNo + 1;
                                PolicyFrameworkArticleRev.Init;
                                PolicyFrameworkArticleRev."Revision No." := "Revision No.";
                                PolicyFrameworkArticleRev."Policy ID" := "Policy ID";
                                PolicyFrameworkArticleRev."Line No" := NextEntryNo;
                                PolicyFrameworkArticleRev.Description := PolicyFrameworkArticle.Description;
                                PolicyFrameworkArticleRev."External Document No." := PolicyFrameworkArticle."External Document No.";
                                PolicyFrameworkArticleRev.Insert;
                            until PolicyFrameworkArticle.Next = 0;
                        end;


                        PolicyThematicArea.Reset;
                        PolicyThematicArea.SetRange("Policy ID", "Policy ID");
                        if PolicyThematicArea.Find('-') then begin
                            repeat
                                PolicyThematicAreaRevision.Init;
                                PolicyThematicAreaRevision."Revision No." := "Revision No.";
                                PolicyThematicAreaRevision."Policy ID" := "Policy ID";
                                PolicyThematicAreaRevision.Code := PolicyThematicArea.Code;
                                PolicyThematicAreaRevision.Description := PolicyFrameworkArticle.Description;
                                PolicyThematicAreaRevision.Insert;
                            until PolicyThematicArea.Next = 0;
                        end;


                        NextEntryNo := 0;
                        PolicyCommitteeMember.Reset;
                        PolicyCommitteeMember.SetRange("Policy ID", "Policy ID");
                        if PolicyCommitteeMember.Find('-') then begin
                            repeat
                                NextEntryNo := FnGetEntryNumber5(PolicyCommitteeMember, "Revision No.");
                                if NextEntryNo = 0 then
                                    NextEntryNo := 1
                                else
                                    NextEntryNo := NextEntryNo + 1;
                                PolicyRevisionCommittee.Init;
                                PolicyRevisionCommittee."Revision No." := "Revision No.";
                                PolicyRevisionCommittee."Policy ID" := "Policy ID";
                                PolicyRevisionCommittee."Line No" := NextEntryNo;
                                PolicyRevisionCommittee."Policy Committee Type" := PolicyCommitteeMember."Policy Committee Type";
                                PolicyRevisionCommittee."Resource No." := PolicyCommitteeMember."Resource No.";
                                PolicyRevisionCommittee.Name := PolicyCommitteeMember.Name;
                                PolicyRevisionCommittee.Role := PolicyCommitteeMember.Role;
                                PolicyRevisionCommittee."Tenure Start Date" := PolicyCommitteeMember."Tenure Start Date";
                                PolicyRevisionCommittee."Tenure End Date" := PolicyCommitteeMember."Tenure End Date";
                                PolicyRevisionCommittee.Insert;
                            until PolicyCommitteeMember.Next = 0;
                        end;

                        Message('Policy Updated Successfully');
                    end;
                }
            }
        }
    }

    var
        Policy: Record Policy;
        PolicyRevisionVoucher: Record "Policy Revision";
        VersionNumber: Integer;
        PolicyObjectiveRevision: Record "Policy Objective Revision";
        PolicyStakeholderRevision: Record "Policy Stakeholder Revision";
        RevisionStakeholderRole: Record "Revision Stakeholder Role";
        PolicyRevisionStatementArea: Record "Policy Revision Statement Area";
        PolicyRevisionCommittee: Record "Policy Revision Committee";
        PolicyVersion: Record "Policy Version";
        PolicyInformationSources: Record "Policy Information Sources";
        PolicyRevisionInfoSources: Record "Policy Revision Info Sources";
        PolicyCommitteeMember: Record "Policy Committee Member";
        PolicyObjective: Record "Policy Objective";
        PolicyStakeholder: Record "Policy Stakeholder";
        PolicyStakeholderRole: Record "Policy Stakeholder Role";
        PolicyThematicArea: Record "Policy Thematic Area";
        PolicyThematicAreaRevision: Record "Policy Thematic Area Revision";
        PolicyStatement: Record "Policy Statement";
        PolicyStatementRevision: Record "Policy Statement Revision";
        PolicyGuidingPrinciple: Record "Policy Guiding Principle";
        PolicyGuidingPrincipleRev: Record "Policy Guiding Principle Rev";
        PolicyRelatedFramework: Record "Policy Related Framework";
        PolicyRelatedFrameworkRev: Record "Policy Related Framework Rev";
        PolicyFrameworkArticle: Record "Policy Framework Article";
        PolicyFrameworkArticleRev: Record "Policy Framework Article Rev";
        NextEntryNo: Integer;
        PolicyCoreValue: Record "Policy Core Value";
        PolicyCoreValueRevision: Record "BR Option Text Response Type";


    procedure FnGetEntryNumber(PolicyStakeholderRole: Record "Policy Stakeholder Role"; RevisionCode: Code[30]) EntryNo: Integer
    var
        RevisionStakeholderRole: Record "Revision Stakeholder Role";
    begin
        RevisionStakeholderRole.Reset;
        if RevisionStakeholderRole.FindLast then begin
            EntryNo := RevisionStakeholderRole."Entry No";
        end;
        exit(EntryNo);
    end;


    procedure FnGetEntryNumber2(PolicyInformationSources: Record "Policy Information Sources"; RevisionCode: Code[30]) EntryNo: Integer
    var
        PolicyRevisionInfoSources: Record "Policy Revision Info Sources";
    begin
        PolicyRevisionInfoSources.Reset;
        if PolicyRevisionInfoSources.FindLast then begin
            EntryNo := PolicyRevisionInfoSources."Line No.";
        end;
        exit(EntryNo);
    end;


    procedure FnGetEntryNumber3(PolicyRelatedFramework: Record "Policy Related Framework"; RevisionCode: Code[30]) EntryNo: Integer
    var
        PolicyRelatedFrameworkRev: Record "Policy Related Framework Rev";
    begin
        PolicyRelatedFrameworkRev.Reset;
        if PolicyRelatedFrameworkRev.FindLast then begin
            EntryNo := PolicyRelatedFrameworkRev."Line No";
        end;
        exit(EntryNo);
    end;


    procedure FnGetEntryNumber4(PolicyFrameworkArticle: Record "Policy Framework Article"; RevisionCode: Code[30]) EntryNo: Integer
    var
        PolicyFrameworkArticleRev: Record "Policy Framework Article Rev";
    begin
        PolicyRelatedFrameworkRev.Reset;
        if PolicyRelatedFrameworkRev.FindLast then begin
            EntryNo := PolicyRelatedFrameworkRev."Line No";
        end;
        exit(EntryNo);
    end;


    procedure FnGetEntryNumber5(PolicyCommitteeMember: Record "Policy Committee Member"; RevisionCode: Code[30]) EntryNo: Integer
    var
        PolicyRevisionCommittee: Record "Policy Revision Committee";
    begin
        PolicyRevisionCommittee.Reset;
        if PolicyRevisionCommittee.FindLast then begin
            EntryNo := PolicyRevisionCommittee."Line No";
        end;
        exit(EntryNo);
    end;
}

