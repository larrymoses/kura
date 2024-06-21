
Page 72760 "Project Approval Setup Matrice"
{
    // CardPageID = 72761;
    PageType = List;
    SourceTable = "Project Approval Setup Matrix";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Area ID"; Rec."Assignment Area ID")
                {
                    ApplicationArea = Basic;
                    Visible=false;
                }
                field("Approver ID"; Rec."Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field("Sequence No."; Rec."Sequence No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Role Code"; Rec."Project Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Email"; Rec."Employee Email")
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
            action("Suggest Def  Project Approvers")
            {
                ApplicationArea = Jobs;
                Caption = 'Suggest Default  Project Approvers';
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                RunPageMode = View;
                ToolTip = 'View the job''s resource group allocation.';
                Visible=false;
                trigger OnAction()
                begin
                    FnSuggestDefaultApprovers();
                end;
            }
            action("Copy Approval User SetUp")
            {
                ApplicationArea = Basic;
                Caption = 'Copy Approval User SetUp';
                Image = Copy;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible=false;
                //   RunObject = Report UnknownReport72092;
            }
        }
    }

    var
        ProjectTemplateHeader: Record "Project Template Header";
        //   ProjectTemplateLineSub: Record UnknownRecord72377;
        ProjectApprovalSetupMatrix: Record "Project Approval Setup Matrix";
        Job: Record Job;

    procedure FnGetProjectType(ProjectID: Code[100]): Text
    var
        ObjJob: Record Job;
    begin
        ObjJob.Reset;
        ObjJob.SetRange(ObjJob."No.", ProjectID);
        if ObjJob.FindSet then
            exit(Format(ObjJob."Type of Project"));
    end;


    procedure FnSuggestDefaultApprovers()
    begin
        Job.Reset;
        Job.SetRange(Job."No.", Rec."Project ID");
        if Job.FindSet then begin
            Job.TestField("Assignment Area ID");
            ProjectTemplateHeader.Reset;
            ProjectTemplateHeader.SetRange(ProjectTemplateHeader."Project Type", Job."Type of Project");
            ProjectTemplateHeader.SetRange(ProjectTemplateHeader."Assignment Area ID", Job."Assignment Area ID");
            if ProjectTemplateHeader.FindSet then begin
                ProjectTemplateHeader.TestField("Assignment Area ID");
                Job."Assignment Area ID" := ProjectTemplateHeader."Assignment Area ID";
                Job.Validate("Assignment Area ID");
                // ProjectTemplateLineSub.Reset;
                // ProjectTemplateLineSub.SetRange(ProjectTemplateLineSub."Template ID", ProjectTemplateHeader."Template ID");
                // if ProjectTemplateLineSub.FindSet then
                //     repeat
                //         ProjectApprovalSetupMatrix.Init;
                //         ProjectApprovalSetupMatrix."Project ID" := "Project ID";
                //         ProjectApprovalSetupMatrix."Line No." := ProjectApprovalSetupMatrix.Count + 1;
                //         ProjectApprovalSetupMatrix."Document Type" := ProjectTemplateLineSub."Document Type";
                //         ProjectApprovalSetupMatrix."Assignment Area ID" := ProjectTemplateHeader."Assignment Area ID";
                //         ProjectApprovalSetupMatrix."Sequence No." := ProjectTemplateLineSub."Sequence No.";
                //         ProjectApprovalSetupMatrix."Project Role Code" := ProjectTemplateLineSub."Project Role Code";
                //         ProjectApprovalSetupMatrix."Approver ID" := ProjectTemplateLineSub."Approver ID";
                //         ProjectApprovalSetupMatrix.Validate("Approver ID");
                //         if not ProjectApprovalSetupMatrix.Insert(true) then
                //             ProjectApprovalSetupMatrix.Modify(true);
                //     until ProjectTemplateLineSub.Next = 0;
            end;
        end;
    end;
}



