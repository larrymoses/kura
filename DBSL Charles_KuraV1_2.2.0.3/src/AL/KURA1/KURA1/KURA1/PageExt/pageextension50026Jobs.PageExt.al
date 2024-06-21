#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50026 "pageextension50026" extends "Job Card"
{
    Caption = 'Project Card';
PromotedActionCategories = 'New,Process,Report,Prices & Discounts,WIP,Navigate,Job,Print/Send,Approvals';


    layout
    {
        modify("No.")
        {

            //Unsupported feature: Property Modification (Visible) on ""No."(Control 2)".

            Caption = 'Project Number';
        }
        modify(Description)
        {
            Caption = 'Project Description';
        }
    
        modify("Bill-to Name")
        {
            Caption = 'Contractor Name';
            Visible = true;
            Editable = false;

            //Unsupported feature: Property Insertion (Visible) on ""Bill-to Name"(Control 8)".

        }
        addafter("Bill-to Name")
        {
            field("CIT Committee No.";Rec."CIT Committee No.")
            {
                ApplicationArea=Basic;
            }
        }
       
        modify("Bill-to Address 2")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Bill-to Address 2"(Control 47)".


            //Unsupported feature: Property Modification (Name) on ""Bill-to Address 2"(Control 47)".

        }

        //Unsupported feature: Property Modification (Visible) on "Control56(Control 56)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to County"(Control 52)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to Post Code"(Control 55)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to City"(Control 49)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to Country/Region Code"(Control 43)".


        //Unsupported feature: Property Insertion (Visible) on ""Bill-to Contact"(Control 51)".

        modify("Person Responsible")
        {
            Caption = 'Resident Engineer';

            //Unsupported feature: Property Insertion (Visible) on ""Person Responsible"(Control 6)".

        }
        modify("Project Manager")
        {
            Caption = 'Resident Engineer';
        }
        modify(JobTaskLines)
        {
            Caption = 'Project Activities';
        }
        // modify("Bill-to Customer No.")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Bill-to Customer No."(Control 32)".


        //Unsupported feature: Property Deletion (Importance) on ""Bill-to Customer No."(Control 32)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Bill-to Customer No."(Control 32)".

        // modify("Bill-to Contact No.")
        // {
        //     Visible = false;
        // }
        modify("Bill-to Address")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Bill-to Address 2"(Control 47)".


        //Unsupported feature: Property Deletion (Importance) on ""Bill-to Address 2"(Control 47)".


        //Unsupported feature: Property Deletion (QuickEntry) on ""Bill-to Address 2"(Control 47)".


        //Unsupported feature: Code Modification on "Status(Control 34).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF (Status = Status::Completed) AND Complete THEN BEGIN
          RecalculateJobWIP;
          CurrPage.UPDATE(FALSE);
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF (Status = Status::"Under PBRM") AND Complete THEN BEGIN
        #2..4
        */
        //end;
        modify("Sell-to")
        {
            Visible = false;
        }
        addbefore("Sell-to")
        {
            field("Contractor No."; Rec."Contractor No.")
            {
                ApplicationArea = Basic;
                //visible = true;
                Caption = 'Contracting Vendor No.';

            }
            field("Contractor Name"; Rec."Contractor Name")
            {
                ApplicationArea = Basic;
                //  visible = true;
                editable = false;
            }
            field("Vendor Bank Account No.";Rec."Vendor Bank Account No.")
            {
                Caption ='Contractor Bank Account';
                ApplicationArea = Basic;
            }
            field("Purchase Contract ID";Rec."Purchase Contract ID")
            {
                ApplicationArea = Basic;
            }
            field("Contract Start Date";Rec."Contract Start Date")
            {
                ApplicationArea = Basic;
            }
            field("Contract End Date";Rec."Contract End Date")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Description 3"; Rec."Description 3")
            {
                ApplicationArea = Basic;
                caption = 'Project Description 2';
                Visible = true;
            }
        }

        addafter("Bill-to Name")
        {


            field("Road Class ID"; Rec."Road Class ID")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Year Code"; Rec."Year Code")
            {
                ApplicationArea = Basic;
            }

            field("Type of Project"; Rec."Type of Project")
            {
                ApplicationArea = Basic;
            }
            field("Road Code"; Rec."Road Code")
            {
                ApplicationArea = Basic;
                Visible = false;
            }

            field("Road Length(KM)"; Rec."Road Length(KM)")
            {
                ApplicationArea = Basic;
                Caption = 'Road Length(KM)';
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = Basic;
                Caption = 'Region Code';
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = Basic;
                Caption = 'Funding Source';
            }
            field("Assignment Area ID"; Rec."Assignment Area ID")
            {
                ApplicationArea = Basic;
            }
            field("Assignment Area Name"; Rec."Assignment Area Name")
            {
                ApplicationArea = Basic;
            }
            field("Constituency ID"; Rec."Constituency ID")
            {
                ApplicationArea = Basic;
            }
            field("Road Section No"; Rec."Road Section No")
            {
                ApplicationArea = Basic;
                Visible = false;
            }

            field("Road Project Catergory"; Rec."Road Project Catergory")
            {
                ApplicationArea = Basic;
                Visible = false;
            }

        }
        addafter("Project Manager")
        {
            field("Directorate Code"; Rec."Directorate Code")
            {
                ApplicationArea = Basic;
            }
            field("Department ID"; Rec."Department ID")
            {
                ApplicationArea = Basic;
            }
            field("Work Execution Plan ID"; Rec."Work Execution Plan ID")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field("Total Project Cost Excl. VAT"; Rec."Total Project Cost Excl. VAT")
            {
                ApplicationArea = Basic;
            }
            field("Contingency Amount"; Rec."Contingency Amount")
            {
                ApplicationArea = Basic;
            }
            field("Variation of Price Amount"; Rec."Variation of Price Amount")
            {
                ApplicationArea = Basic;
            }
            field("Total Project Cost Incl. VAT"; Rec."Total Project Cost Incl. VAT")
            {
                ApplicationArea = Basic;
            }
            field("Project Location ID"; Rec."Project Location ID")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field("Total Contract Sum Inc VAT"; Rec."Total Contract Sum Inc VAT")
            {
                ApplicationArea = All;
            }
            field("Last Variation Request No."; Rec."Last Variation Request No.")
            {
                ApplicationArea = Basic;
            }
            field("% Physical Progress"; Rec."% Physical Progress")
            {
                ApplicationArea = Basic;
            }
            field("KM of Tarmac Completed"; Rec."KM of Tarmac Completed")
            {
                ApplicationArea = Basic;
            }
            field("Total KM Designed"; Rec."Total KM Designed")
            {
                ApplicationArea = Basic;
            }
            field("Workplanned Length"; Rec."Workplanned Length")
            {
                ApplicationArea = Basic;
            }

            field("No of Structures(Planned)"; Rec."No of Structures(Planned)")
            {
                ApplicationArea = Basic;
            }
            field("No of Structures Completed"; Rec."No of Structures Completed")
            {
                ApplicationArea = Basic;
            }
            field("Total No of Men Employed"; Rec."Total No of Men Employed")
            {
                ApplicationArea = Basic;
            }
            field("Total No of Women Employed"; Rec."Total No of Women Employed")
            {
                ApplicationArea = Basic;
            }
            field("Total Men Mandays"; Rec."Total Men Mandays")
            {
                ApplicationArea = Basic;
            }
            field("Total Women Mandays"; Rec."Total Women Mandays")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Bill-to Address 2")
        {
            group(Control144)
            {

            }
        }
        addafter("Last Date Modified")
        {
            field("Opportunity Reference"; Rec."Opportunity Reference")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Fund Opportunity Name"; Rec."Fund Opportunity Name")
            {
                ApplicationArea = Basic;
                Editable = false;
                Visible = false;
            }
            field("Grant Amount"; Rec."Grant Amount")
            {
                ApplicationArea = Basic;
                Editable = false;
                Visible = false;
            }
            field(exchequer; Rec.exchequer)
            {
                ApplicationArea = Basic;
            }
            group("Project Details")
            {
                Visible = false;
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                }
                field("Research Program"; Rec."Research Program")
                {
                    ApplicationArea = Basic;
                    Caption = 'Road';
                }
                field("Research Project Area"; Rec."Research Project Area")
                {
                    ApplicationArea = Basic;
                }
                field("Researcher Code"; Rec."Researcher Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        addafter("Last Date Modified")
        {
            field("Created By"; Rec."Created By")
            {
                ApplicationArea = basic;
                editable = false;
            }
        }
        addafter(JobTaskLines)
        {
            part(Control75; "Project Monthly Progress List")
            {
                SubPageLink = "Job No" = field("No.");
            }
            // part("Other Related Project s";"Job List")
            // {
            //     Caption = 'Other Related Projects';
            //     SubPageLink = "Type of Proje = t"=filter("Survey/Stu | y"|"Structure Construction");
            // }
            group("Virtual Reality")
            {
                Caption = 'Virtual Reality';
                field("Virtual Reality Link"; Rec."VR Link")
                {
                    ApplicationArea = Basic;
                    Caption = 'Virtual Reality Link';
                }
            }
        }
        addafter(Status)
        {
            field("Reasons for Suspension"; Rec."Reasons for Suspension")
            {
                ApplicationArea = Basic;
            }
        }
        addfirst(Duration)
        {
            field("Commencement Date"; Rec."Commencement Date")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Ending Date")
        {
            field("Revised End Date"; Rec."Revised End Date")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("Bill-to Name"; "Project Manager")
    }
    actions
    {
        modify("Copy Job Tasks &to...")
        {
            Caption = 'Copy Project Activities &to...';

            //Unsupported feature: Property Modification (Name) on ""Copy Job Tasks &to..."(Action 27)".

        }
        addafter("&Dimensions")
        {
            action("Contract Details")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = ContractPayment;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Contract List";
                RunPageLink = Job = field("No."),
                              "Contract Status" = filter(" ");
            }
            action("Generate Payment Certificate")
            {
                ApplicationArea = Basic;
                Image = CalculateConsumption;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Report "Customer - List";
                Visible = false;
            }
            action("Internal Project Resources")
            {
                ApplicationArea = Basic;
                Image = Resource;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Internal Project Resources";
                RunPageLink = "Project ID" = field("No.");
                //  Visible = false;
            }
            action("Project Funding Sources")
            {
                ApplicationArea = Basic;
                Image = MapSetup;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Funding Source List";
            }
            action("Project Road Links")
            {
                ApplicationArea = Basic;
                Caption = 'Project Road Links';
                Image = LiFo;
                Promoted = true;
                RunObject = Page "Project Road Links";
                RunPageLink = "Global Budget Book Code" = field("No."),
                              "KeRRA Budget Code" = field("KeRRA Budget Code");
                ToolTip = 'Project Road Links';
            }
            action("Project Road Facilities")
            {
                ApplicationArea = Basic;
                Caption = 'Project Road Facilities';
                Image = Components;
                Promoted = true;
                RunObject = Page "Project Road Facility Items";
                RunPageLink = "Global Budget Book Code" = field("No."),
                              "KeRRA Budget Code" = field("KeRRA Budget Code");
                ToolTip = 'Project Road Facilities';
            }
            action("Initate Procurement Process")
            {
                ApplicationArea = Basic;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Funding Source List";
            }
            action("Project Funding Line")
            {
                ApplicationArea = Basic;
                Image = PlanningWorksheet;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Project Funding Line";
                RunPageLink = "Project No" = field("No.");
            }
            action("Approval User SetUp")
            {
                ApplicationArea = Jobs;
                Caption = 'Approval User SetUp';
                Image = Default;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedOnly = true;
                RunObject = Page "Project Approval Setup Matrice";
                RunPageLink = "Project ID" = field("No.");
                RunPageMode = View;
                ToolTip = 'View the job''s resource group allocation.';
            }
            action("Suggest Def  Project Approvers")
            {
                // ApplicationArea = Jobs;
                // Caption = 'Suggest Default  Project Approvers';
                // Image = Suggest;
                // Promoted = true;
                // PromotedCategory = Category4;
                // PromotedOnly = true;
                // RunPageMode = View;
                // ToolTip = 'View the job''s resource group allocation.';
                // Visible = false;

                // trigger OnAction()
                // begin
                //     ProjectTemplateHeader.Reset;
                //     ProjectTemplateHeader.SetRange(ProjectTemplateHeader."Project Typ e","Type of Project");
                //     ProjectTemplateHeader.SetRange(ProjectTemplateHeader."Assignment Area I D","Assignment Area ID");
                //     if ProjectTemplateHeader.FindSet then begin
                //         ProjectTemplateHeader.TestField("Assignment Area ID");
                //         "Assignment Area  := ":=ProjectTemplateHeader."Assignment Area ID";
                //         Validate("Assignment Area ID");
                //         ProjectTemplateLineSub.Reset;
                //         ProjectTemplateLineSub.SetRange(ProjectTemplateLineSub."Template I D",ProjectTemplateHeader."Template ID");
                //         if ProjectTemplateLineSub.FindSet then
                //          repeat
                //           ProjectApprovalSetupMatrix.Init;
                //                 ProjectApprovalSetupMatrix."Project  := "No.";
                //           ProjectApprovalSetupMatrix."Line N := ":=ProjectApprovalSetupMatrix.Co + 1;
                //           ProjectApprovalSetupMatrix."Document Ty := ":=ProjectTemplateLineSub."Document Type";
                //                 ProjectApprovalSetupMatrix."Assignment Area  := ":=ProjectTemplateHeader."Assignment Area ID";
                //                 ProjectApprovalSetupMatrix."Sequence N := ":=ProjectTemplateLineSub."Sequence No.";
                //                 ProjectApprovalSetupMatrix."Project Role Co := ":=ProjectTemplateLineSub."Project Role Code";
                //                 ProjectApprovalSetupMatrix."Approver  := ":=ProjectTemplateLineSub."Approver ID";
                //                 ProjectApprovalSetupMatrix.Validate("Approver ID");
                //                 if not ProjectApprovalSetupMatrix.Insert(true) then
                //                     ProjectApprovalSetupMatrix.Modify(true);
                //             until ProjectTemplateLineSub.N = 0;
                //       end;
                // end;
            }
        }
        addafter("&Statistics")
        {
            action(EOTs)
            {
                ApplicationArea = Basic;
                Image = BOMLedger;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variations";
                RunPageLink = "Project ID" = field("No.");
                RunPageView = where("Document Type" = filter("Extension of Time Request"));
            }
            action("Contractor Variation Requests")
            {
                ApplicationArea = Basic;
                Image = BreakpointsList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variations";
                RunPageLink = "Project ID" = field("No.");
                RunPageView = where("Document Type" = filter("Contractor Variation Request"));
            }
            action("Cost Claims")
            {
                ApplicationArea = Basic;
                Image = ActivateDiscounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variations";
                RunPageLink = "Project ID" = field("No.");
                RunPageView = where("Document Type" = filter("Cost Claim"));
            }
            action("Engineer's Variation Requests")
            {
                ApplicationArea = Basic;
                Image = CancelAttachment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Variations";
                RunPageLink = "Project ID" = field("No.");
                RunPageView = where("Document Type" = filter("Engineer Variation Request"));
            }
            action("Other Related Projects")
            {
                ApplicationArea = Basic;
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Other Related Projects";
            }
        }
        addafter("&Online Map")
        {
            action("Import Job Task(s)")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = ImportChartOfAccounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = XMLport "Import Job Tasks";
            }
            action("Import Job Planning Lines")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = ImportChartOfAccounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = XMLport "Import Job Planning Lines";
            }
        }
        addafter(Attachments)
        {
            action("Meeting Register")
            {
                ApplicationArea = Jobs;
                Caption = 'Meeting Register';
                Image = ViewJob;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                RunObject = Page "Project Meeting Registers";
                RunPageLink = "Project ID" = field("No.");
                RunPageMode = View;
                ToolTip = 'View the job''s resource group allocation.';
            }
        }
        addafter(History)
        {
            group("Task Lines")
            {
                action("Populate Task Lines")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        ProjectTemplates.Reset;
                        ProjectTemplates.SetRange(Blocked, false);
                        ProjectTemplates.SetFilter("Project  Task No.", '<>%1', '');
                        if ProjectTemplates.Find('-') then begin
                            repeat
                                JobTaskLines.Reset;
                                JobTaskLines.SetRange("Job No.", Rec."No.");
                                JobTaskLines.SetRange("Job Task No.", ProjectTemplates."Project  Task No.");
                                if not JobTaskLines.FindSet then begin

                                    JobTaskLines.Init;
                                    JobTaskLines."Job No." := Rec."No.";
                                    JobTaskLines."Job Task No." := ProjectTemplates."Project  Task No.";
                                    JobTaskLines.Description := ProjectTemplates."Project Description";
                                    JobTaskLines.Insert(true);
                                end;
                            until ProjectTemplates.Next = 0;
                        end;
                        Message('Job Task Lines loaded successfully');
                    end;
                }
            }
        }
        addafter("Send Job Quote")
        {
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Documentations & Photos';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;

                trigger OnAction()
                begin
                    //DMSManagement.UploadDocument(DMSDocuments."Document Type"::"Road Link","Road Code",'Road Link',RECORDID);
                    //  DMSManagement.UploadRoadLinkDocuments("No. 'Project Number', RecordId, d,"Region ID");
                end;
            }
        }

    }

    var
        TotalBudgetCommitments: Decimal;
        AvailableFunds: Decimal;

    var
        JobTaskLines: Record "Job Task";
        ProjectTemplates: Record "Project Templates";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        RoadManagementSetup: Record "Road Management Setup";
        ProjectTemplateLine: Record "Project Template Line";
        ProjectTemplateHeader: Record "Project Template Header";
        ProjectApprovalSetup: Record "Project Approval Setup";
        //ProjectTemplateLineSub: Record UnknownRecord72377;
        ProjectApprovalSetupMatrix: Record "Project Approval Setup Matrix";


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetNoFieldVisible;
    IsCountyVisible := FormatAddress.UseCounty("Bill-to Country/Region Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //Ushindi
    CALCFIELDS("Project Budget","Actual Project Costs","PO Commitments","PRN Commitments","Store Requisition Commitments","Imprest Application Commitment");
    TotalBudgetCommitments:="PO Commitments"+"PRN Commitments"+"Store Requisition Commitments"+"Imprest Application Commitment";
    AvailableFunds:="Project Budget"-"Actual Project Costs"-TotalBudgetCommitments;
    //Ushindi

    SetNoFieldVisible;
    IsCountyVisible := FormatAddress.UseCounty("Bill-to Country/Region Code");
    */
    //end;
}



