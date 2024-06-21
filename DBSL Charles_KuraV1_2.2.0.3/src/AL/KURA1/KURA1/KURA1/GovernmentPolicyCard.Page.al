#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80178 "Government Policy Card"
{
    PageType = Card;
    SourceTable = Policy;
    SourceTableView = where(Type = const(External),
                            "Approval Status" = const(Open));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field("No. of Policy Revisions"; "No. of Policy Revisions")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Policy Attestations"; "Employee Policy Attestations")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control42; "Policy Thematic Area")
            {
                SubPageLink = "Policy ID" = field(Code);
            }
            group("Key Dates")
            {
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                }
                field("Drafting Date"; "Drafting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Date"; "Approval Date")
                {
                    ApplicationArea = Basic;
                }
                field("Last Revision Date"; "Last Revision Date")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Attestation Due Date"; "Employee Attestation Due Date")
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
            group(Performance)
            {
                Caption = 'Performance';
                Image = Vendor;
                action("Policy Core Value")
                {
                    ApplicationArea = Basic;
                    Caption = 'Company Core Values';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Core Value";
                    RunPageLink = "Policy ID" = field(Code);
                }
                action("Policy Objectives")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Objectives';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Objectives";
                    RunPageLink = "Policy ID" = field(Code);
                }
                action("Policy Guiding Principle")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Guiding Principle';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Guiding Principle";
                    RunPageLink = "Policy ID" = field(Code);
                }
                action("Policy Related Framework")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Related Framework';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Related Framework";
                    RunPageLink = "Policy ID" = field(Code);
                }
                action("Policy Stakeholder")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Stakeholder';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Stakeholder";
                    RunPageLink = "Policy ID" = field(Code);
                }
                action("Policy Information Sources")
                {
                    ApplicationArea = Basic;
                    Image = Info;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Information Sources";
                    RunPageLink = "Policy ID" = field(Code);
                }
                action("Policy Committee Member")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Committee Member";
                    RunPageLink = "Policy ID" = field(upperlimit(Code));
                }
            }
            separator(Action25)
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
            separator(Action20)
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
                    Message('Testing');
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Generate Attestation Invites")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Generate Attestation Invites';
                    Ellipsis = true;
                    Image = CreateDocument;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    // RunObject = Report "Create Attestation Invites";
                    ToolTip = 'Generate Attestation Invites';

                    trigger OnAction()
                    var
                        CopyJob: Page "Copy WorkPlan";
                    begin
                    end;
                }
                action("Attestation Invitations")
                {
                    ApplicationArea = Basic;
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    RunObject = Page "Attestation Invitations";
                    RunPageLink = "Policy ID" = field(Code);
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::External;
    end;

    trigger OnOpenPage()
    begin
        Type := Type::External;
    end;

    var
        PolicyVersion: Record "Policy Version";
}

