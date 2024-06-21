#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72703 "Project Transition"
{
    PageType = Card;
    SourceTable = "Project Transition Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Email"; Rec."Contractor Email")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Address"; Rec."Contractor Address")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("PBRM BoQ Template ID"; Rec."PBRM BoQ Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control17; "Project Transition Line")
            {
                SubPageLink = "Document No." = field("Document No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Submit Perf Guarantee")
            {
                ApplicationArea = Basic;
                Caption = 'Submit Performance Guarantee';
                Image = SpecialOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField("Contractor Email");
                    Rec.TestField(Status, Rec.Status::Approved);
                    Rec.TestField(Posted, false);
                    ProcurementProcessing.FnNotifyContractorProjectTransition(Rec);
                    Message('Contractor %1 notified successfully', Rec."Contractor Name");
                end;
            }
            action("Upload PBRM BoQ")
            {
                ApplicationArea = Basic;
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // RMSManagement.FnSuggestPBRMBoQ(Rec);
                    Message('PBRM BoQ Uploaded Successfully.Kindly Proceed to upload the signed PBRM Copy.');
                end;
            }
            action("Upload Signed Copy")
            {
                ApplicationArea = Basic;
                Caption = 'Upload Signed Copy Of PBRM Contract';
                Image = AddAction;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField("Shortcut Dimension 1 Code");
                    DMSManagement.UploadStaffClaimDocuments(DMSDocuments."document type"::"Project Transition", Rec."Document No.", 'Project Transition', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // RESET;
                    // SETRANGE("Document Type","Document Type");
                    // SETRANGE("Document No.","Document No.");
                    // IF FINDSET THEN
                    //  REPORT.RUN(72049,TRUE,TRUE,Rec);

                    Dialog.Message('Printed');
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //ShowDocDim();
                    CurrPage.SaveRecord();
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category20;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Approvals');
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category20;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Approvals sent');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category20;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Approvals Cancelled');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Category18;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify();
                    Message('Document %1 released successfully', Rec."Document No.");
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category18;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify();
                    Message('Document %1 reopened successfully', Rec."Document No.");
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Approved);
                    Rec.TestField(Posted, false);

                    JobPlanningLine.Reset;
                    JobPlanningLine.SetRange(JobPlanningLine."Job No.", Rec."Project ID");
                    JobPlanningLine.SetRange(JobPlanningLine."Contract Type", JobPlanningLine."contract type"::Construction);
                    if JobPlanningLine.FindSet then begin
                        repeat
                            JobPlanningLine.Active := false;
                            JobPlanningLine.Modify(true);
                        until JobPlanningLine.Next = 0;
                    end;

                    JobPlanningLine.Reset;
                    JobPlanningLine.SetRange(JobPlanningLine."Job No.", Rec."Project ID");
                    JobPlanningLine.SetRange(JobPlanningLine."Contract Type", JobPlanningLine."contract type"::PBRM);
                    if JobPlanningLine.FindSet then begin
                        repeat
                            JobPlanningLine.Active := true;
                            JobPlanningLine.Modify(true);
                        until JobPlanningLine.Next = 0;
                    end;

                    Dialog.Message('Document %1 posted successfully.', Rec."Document No.");
                end;
            }
        }
    }

    var
        ProcurementProcessing: Codeunit "Procurement Processing";
        RMSManagement: Codeunit "RMS Management";
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";
        JobPlanningLine: Record "Job Planning Line";
}

#pragma implicitwith restore

