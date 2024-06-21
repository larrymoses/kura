#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72580 "End of DLP Inspection"
{
    PageType = Card;
    SourceTable = "Inspection Headersss";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Inspection No"; "Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Type"; "Inspection Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID"; "Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Request No"; "Contractor Request No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date"; "Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; "Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; "Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Committee No"; "Committee No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Supervision Template"; "Project Supervision Template")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date"; "Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; "Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("DLP Start Date"; "DLP Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("DLP Period"; "DLP Period")
                {
                    ApplicationArea = Basic;
                }
                field("DLP End Date"; "DLP End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Refence No"; "Refence No")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Tender Sum Inc Tax"; "Awarded Tender Sum Inc Tax")
                {
                    ApplicationArea = Basic;
                }
                field("Payments To Date"; "Payments To Date")
                {
                    ApplicationArea = Basic;
                }
                field("Clause No."; "Clause No.")
                {
                    ApplicationArea = Basic;
                }
                field("Clause Description"; "Clause Description")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; "Created DateTime")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control41; "Project Inspection Line Subpag")
            {
                SubPageLink = "Inspection No" = field("Inspection No"),
                              "Inspection Type" = field("Inspection Type");
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                Editable = false;
                field("Works Start Chainage"; "Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage"; "Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contractor Rep."; "Primary Contractor Rep.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Representative Role"; "Contractor Representative Role")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Rep. Email"; "Contractor Rep. Email")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan 1D"; "Work Execution Plan 1D")
                {
                    ApplicationArea = Basic;
                }
                field("Commencement Order No"; "Commencement Order No")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager/Engineer"; "Project Manager/Engineer")
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
                field("Constituency ID"; "Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency No."; "Funding Agency No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Overall Committee Decision")
            {
                Caption = 'Overall Committee Decision';
                field("Committee Decision"; "Committee Decision")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(72274),
                              "No." = field("Inspection No");
                // , "Document Type" = field("Document Type");
            }
            systempart(Control55; Links)
            {
            }
            systempart(Control57; Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Inspection Recommendations")
            {
                ApplicationArea = Basic;
                Caption = 'Inspection Committee Recommendations';
                Image = LedgerEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Committee Recommendations";
                RunPageLink = "Inpection Type" = field("Inspection Type"),
                              "Inspection No" = field("Inspection No");
            }
            action("Committee Members")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "IFS Tender Committee Member";
                RunPageLink = "Document No." = field("Committee No");
            }
            action("Inspection Snag List")
            {
                ApplicationArea = Basic;
                Image = AdjustEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Inspection Snag List";
                RunPageLink = "Inspection No" = field("Inspection No"),
                              "Inspection Type" = field("Inspection Type");
            }
            action("Sections Taken Over")
            {
                ApplicationArea = Basic;
                Image = SKU;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Taking Over Sections";
                RunPageLink = "Inspection No" = field("Inspection No"),
                              "Document Type" = field("Inspection Type");
            }
            action("Minutes Circulation Team")
            {
                ApplicationArea = Basic;
                Image = SignUp;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Contract Circulation Team";
                RunPageLink = "Document Type" = filter("End of DLP Inspection"),
                              No = field("Inspection No");
            }
            action("End of DLP Certificate")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    //Get The Total Workplanned length from the Job

                    //Get The Taken Over sections workplanned length sum
                    //Compare the two to see if they are equal
                    //if not dont print the cert
                    if FnGetTotalWPlannedLengthInKM <= FnGetTotalTakenOverSectionLength then begin
                        Reset;
                        SetRange("Inspection Type", "Inspection Type");
                        SetRange("Inspection No", "Inspection No");
                        if FindSet then begin
                            Report.Run(72055, true, false, Rec);
                        end;
                    end
                    else
                        Error('Please confirm if the workplanned length has been fully taen over.');
                end;
            }
            action("Attach Docs")
            {
                ApplicationArea = Basic;
                Caption = 'Attach Meeting Minutes';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    // DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition",Rec."Inspection No",'Testing',RecordId,'');
                    //Attached:=TRUE;
                    Modify();
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    if "Has PBRM Component" = true then begin
                        if Confirm('Are you sure you want to post' + ' ' + "Inspection No", true) = true then begin
                            TestField(Posted, false);
                            TestField(Status, Status::Released);


                            ProjectTransitionHeader.Init;
                            ProjectTransitionHeader."Document No." := '';
                            ProjectTransitionHeader."Project ID" := "Project ID";
                            ProjectTransitionHeader.Validate("Project ID");
                            ProjectTransitionHeader."Contractor No." := "Contractor No";
                            ProjectTransitionHeader.Validate("Contractor No.");
                            ProjectTransitionHeader."Purchase Contract ID" := "Contract ID";
                            ProjectTransitionHeader.Validate("Purchase Contract ID");
                            ProjectTransitionHeader."Shortcut Dimension 1 Code" := "Region ID";
                            ProjectTransitionHeader.Insert(true);

                            ProjecttTraHeaderNo := ProjectTransitionHeader."Document No.";

                            ProjectTransitionHeader.Reset;
                            ProjectTransitionHeader.SetRange(ProjectTransitionHeader."Document No.", ProjecttTraHeaderNo);
                            if ProjectTransitionHeader.FindSet then begin
                                ProjectTransition.SetTableview(ProjectTransitionHeader);
                                ProjectTransition.Run();
                            end;
                        end;
                    end;
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Dialog.Message('Sent');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Dialog.Message('Cancelled');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Dialog.Message('Approvals');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Status := Status::Open;
                    Modify();
                    Dialog.Message('Document Reopened successfully');
                end;
            }
            action("Appraise Vendor")
            {
                ApplicationArea = Basic;
                Image = "Order";
                Promoted = true;
                PromotedCategory = Process;
                //  RunObject = Page "Vendor Appraisal Voucher";
                //RunPageLink = "No." = field("Contract/Order No");
                trigger OnAction()
                var
                    VendApp: Record "Vendor Appraisal Voucher";
                begin
                    if confirm('Are you sure you want to proceed with this Appraisal?', false) = true then begin
                        VendApp.Init();
                        VendApp."Appraisal Method" := VendApp."Appraisal Method"::Inspection;
                        VendApp.Validate("Appraisal Method");
                        VendApp."Document Date" := today;
                        VendApp."Inspection No." := Rec."Inspection No";
                        vendapp."Document Type" := vendapp."Document Type"::Debarment;
                        vendapp.insert(true);
                        page.Run(75449, VendApp);

                    end;
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Status := Status::Released;
                    Modify();
                    Dialog.Message('Document Released successfully');
                end;
            }
            action("Print Acknowledgement Letter")
            {
                ApplicationArea = Basic;
                Caption = 'Print Acknowledgement Letter';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    TestField("Refence No");
                    SetRange("Inspection No", "Inspection No");
                    if FindSet then
                        Report.Run(72093, true, false, Rec);
                end;
            }
            action("Send Acknowledgement Letter")
            {
                ApplicationArea = Basic;
                Image = Receipt;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ProcProcess.FnNotifyContractorDLPAcknowledgementLetterNew(Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Inspection Type" := "inspection type"::"End of DLP Inspection";
    end;

    var
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
        ProjectTransitionHeader: Record "Project Transition Header";
        ProjectTransition: Page "Project Transition";
        ProjecttTraHeaderNo: Code[20];
        ProcProcess: Codeunit "Procurement Processing";
        TotalWPlannedLength: Decimal;
        TotalTakenOverLength: Decimal;
        ObjJob: Record Job;
        TakingOverSectionLine: Record "Taking Over Section Line";


    procedure FnGetTotalWPlannedLengthInKM(): Decimal
    begin
        ObjJob.Reset;
        ObjJob.SetRange(ObjJob."No.", "Project ID");
        if ObjJob.FindSet then begin
            TotalWPlannedLength := ObjJob."Workplanned Length";
        end;
        exit(TotalWPlannedLength);
    end;


    procedure FnGetTotalTakenOverSectionLength(): Decimal
    begin
        TakingOverSectionLine.Reset;
        TakingOverSectionLine.SetRange(TakingOverSectionLine."Document No", "Inspection No");
        TakingOverSectionLine.SetRange(TakingOverSectionLine."Project ID", "Project ID");
        TakingOverSectionLine.CalcSums("Taking Over Length");
        TotalTakenOverLength := TakingOverSectionLine."Taking Over Length";
        exit(TotalTakenOverLength);
    end;
}

