#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72769 "EVR Evaluation Report"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Project Evaluation Header";

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
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Cost Claim Amount"; "Cost Claim Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Variation Order No"; "Variation Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Variation Reason Code"; "Variation Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary"; "Executive Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID"; "Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("External Contract Reference"; "External Contract Reference")
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
                field("Contractor Representative"; "Contractor Representative")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Rep Email"; "Contractor Rep Email")
                {
                    ApplicationArea = Basic;
                }
                field("Original Value of Work (LCY)"; "Original Value of Work (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Value of Work Added"; "Value of Work Added")
                {
                    ApplicationArea = Basic;
                }
                field("Value of Work Omitted"; "Value of Work Omitted")
                {
                    ApplicationArea = Basic;
                }
                field("Net Change Value of Work (LCY)"; "Net Change Value of Work (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("New Varied Works Value (LCY)"; "New Varied Works Value (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Net Change(LCY)"; "Approved Net Change(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Variation Percentage(%)"; "Variation Percentage(%)")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Review Status"; "Review Status")
                {
                    ApplicationArea = Basic;
                }
                field("Review Rejection Notes"; "Review Rejection Notes")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time"; "Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Sum Variation %"; "Contract Sum Variation %")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Allowed Variation %"; "Maximum Allowed Variation %")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Variation Of Works"; "Maximum Variation Of Works")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control9; "EVR Project Evaluation Lines")
            {
                Caption = 'Valuation of Proposed Varied Works';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer No."; "Project Engineer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager"; "Project Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; "Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No."; "Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; "Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; "Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; "Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Award Tender Sum Inc Taxes"; "Award Tender Sum Inc Taxes")
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
            action("Variation Justification")
            {
                ApplicationArea = Basic;
                Image = ExtendedDataEntry;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter(Justification);
            }
            action("Scope Change Summary")
            {
                ApplicationArea = Basic;
                Image = SelectChart;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter("Scope Impact");
            }
            action("Cost Change Summary")
            {
                ApplicationArea = Basic;
                Image = SelectChart;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter("Cost Impact");
            }
            action("Schedule Change Summary")
            {
                ApplicationArea = Basic;
                Image = SelectChart;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter("Schedule Impact");
            }
            action("Other Variation Impact")
            {
                ApplicationArea = Basic;
                Image = SelectChart;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter("Other Impact");
            }
            action("Referenced Contract Clauses")
            {
                ApplicationArea = Basic;
                Caption = 'Referenced Contract Clauses';
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter("Contract Clause");
            }
            action("Additional Notes/Notes")
            {
                ApplicationArea = Basic;
                Image = Note;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variation Sections";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              Section = filter(Comments);
            }
            action("Decline Variation Request")
            {
                ApplicationArea = Basic;
                Caption = 'Decline Variation Request';
                Image = ReviewWorksheet;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    /*IF "Project Manager"<>USERID THEN
                      ERROR('You do not have permissions to decline this request. \\Only project engineers are authorised to decline.');
                    
                    TESTFIELD("Review Rejection Notes");
                    "Review Status":="Review Status"::Declined;
                    MODIFY(TRUE);
                    
                    TESTFIELD("Contractor Rep Email");
                    
                    RoadManagementSetup.GET();
                    IF RoadManagementSetup."Contractor Variation Notify"=TRUE THEN BEGIN
                      RMSManagement.FnNotifyContractorRepDecline(Rec);
                      END;
                    MESSAGE(FORMAT("Document Type")+' '+"Document No."+' '+'posted successfully.');
                    */

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
                    Reset;
                    SetRange("Document Type", "Document Type");
                    SetRange("Document No.", "Document No.");
                    if FindSet then
                        Report.Run(72049, true, true, Rec);
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
                    ShowDocDim();
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
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action("Create Variation Order")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    /*TESTFIELD(Status,Status::Released);
                    TESTFIELD(Posted,FALSE);
                    //TESTFIELD("Review Status",'<>%1',"Review Status"::Declined);
                    IF "Review Status"="Review Status"::Declined THEN
                      ERROR('This Variation Order %1 has been declined. Please process another one.',"Document No.");
                    RMSManagement.FnCreateVariationOrder(Rec,ProjectVariationLine,ProjectVariationSection,ProjectVariationCommittee);
                    "Review Status":="Review Status"::Approved;
                    // "Contractor Variation Req No.":="Document No.";
                    "Project Variation Order No.":="Document No.";
                    VALIDATE("Contractor Variation Req No.");
                    MODIFY(TRUE);
                    
                    //Update Job
                    Job.RESET;
                    Job.SETRANGE(Job."No.","Project ID");
                    IF Job.FINDSET THEN BEGIN
                      Job."Last Variation Request No.":="Variation Order No";
                      Job.MODIFY(TRUE);
                      END;*/

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
                    CalcFields("Value of Work Added");
                    if "Value of Work Added" > "Maximum Variation Of Works" then begin
                        Error('You cannot exceed the maximum Variation of works in the contract %1', "Maximum Variation Of Works");
                    end;

                    //IF ApprovalsMgmt.CheckPVHReqApprovalPossible(Rec) THEN
                    //ApprovalsMgmt.OnSendPVHReqForApproval(Rec);
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
                    //ApprovalsMgmt.OnCancelPVHReqApprovalRequest(Rec);
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
                    Status := Status::Released;
                    Modify();
                    Message('Document %1 released successfully', "Document No.");
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
                    Status := Status::Open;
                    Modify();
                    Message('Document %1 reopened successfully', "Document No.");
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
                    TestField(Status, Status::Released);
                    TestField(Posted, false);
                    //RMSManagement.FnPostEngineerVariationRequest(Rec);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CalcFields("New Varied Works Value (LCY)", "Original Value of Work (LCY)");
        if "Original Value of Work (LCY)" <> 0 then
            "Variation Percentage(%)" := ("New Varied Works Value (LCY)" - "Original Value of Work (LCY)") / "Original Value of Work (LCY)" * 100;


        if "Total Project Cost Excl. VAT" <> 0 then
            "Contract Sum Variation %" := ("New Varied Works Value (LCY)" - "Total Project Cost Excl. VAT") / "Total Project Cost Excl. VAT" * 100;
    end;

    trigger OnAfterGetRecord()
    begin
        CalcFields("New Varied Works Value (LCY)", "Original Value of Work (LCY)");
        if "Original Value of Work (LCY)" <> 0 then
            "Variation Percentage(%)" := ("New Varied Works Value (LCY)" - "Original Value of Work (LCY)") / "Original Value of Work (LCY)" * 100;


        if "Total Project Cost Excl. VAT" <> 0 then
            "Contract Sum Variation %" := ("New Varied Works Value (LCY)" - "Total Project Cost Excl. VAT") / "Total Project Cost Excl. VAT" * 100;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Document Type":="Document Type"::"Engineer Variation Request";
    end;

    trigger OnOpenPage()
    begin
        CalcFields("New Varied Works Value (LCY)", "Original Value of Work (LCY)");
        if "Original Value of Work (LCY)" <> 0 then
            "Variation Percentage(%)" := ("New Varied Works Value (LCY)" - "Original Value of Work (LCY)") / "Original Value of Work (LCY)" * 100;


        if "Total Project Cost Excl. VAT" <> 0 then
            "Contract Sum Variation %" := ("New Varied Works Value (LCY)" - "Total Project Cost Excl. VAT") / "Total Project Cost Excl. VAT" * 100;
    end;

    var
        RMSManagement: Codeunit "RMS Management";
        JobPlanningLine: Record "Job Planning Line";
        ExtensionofTimeLine: Record "Extension of Time Line";
        RoadManagementSetup: Record "Road Management Setup";
        ProjectVariationHeader: Record "Project Variation Header";
        ProjectVariationLine: Record "Project Variation Line";
        ProjectVariationSection: Record "Project Variation Section";
        ProjectVariationCommittee: Record "Project Variation Committee";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Job: Record Job;
}

