#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80179 "Approved Internal Policy Card"
{
    Editable = false;
    PageType = Card;
    SourceTable = Policy;
    SourceTableView = where(Type = const(Internal),
                            "Approval Status" = const(Released));

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
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field("Policy Name"; "Policy Name")
                {
                    ApplicationArea = Basic;
                }
                field(Summary; Summary)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Applies-To"; "Applies-To")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Person"; "Responsible Person")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Title; Title)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Approved"; "Date Approved")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Version No"; "Current Version No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Last Review Date"; "Last Review Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control15; "Policy Objectives")
            {
                SubPageLink = "Policy ID" = field(Code);
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
                action("Policy Stakeholder")
                {
                    ApplicationArea = Basic;
                    Image = Salutation;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Policy Stakeholder";
                    RunPageLink = "Policy ID" = field(Code);
                }
                action("Policy Statement Area")
                {
                    ApplicationArea = Basic;
                    Image = FileContract;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Policy Statement Area";
                    RunPageLink = "Policy ID" = field(Code);
                }
                action("Policy Information Sources")
                {
                    ApplicationArea = Basic;
                    Image = Info;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Information Sources";
                    RunPageLink = "Policy ID" = field(Code);
                }
                action("Policy Version")
                {
                    ApplicationArea = Basic;
                    Image = FiledOverview;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Policy Version";
                    RunPageLink = "Policy Id" = field(Code);
                }
                action("Policy Committee Member")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Policy Committee Member";
                    RunPageLink = "Policy ID" = field(upperlimit(Code));
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
                    //  ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        PolicyVersion.Init;
                        PolicyVersion."Policy Id" := Code;
                        PolicyVersion."Version Id" := '1';
                        PolicyVersion.Description := '';
                        PolicyVersion."Revision Date" := Today;
                        PolicyVersion.Insert;

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
                        TestField("Approval Status", "approval status"::"Pending Approval");
                        Modify;
                        Message('Document has been Re-Opened')
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::Internal;
    end;

    trigger OnOpenPage()
    begin
        Type := Type::Internal;
    end;

    var
        PolicyVersion: Record "Policy Version";
}

