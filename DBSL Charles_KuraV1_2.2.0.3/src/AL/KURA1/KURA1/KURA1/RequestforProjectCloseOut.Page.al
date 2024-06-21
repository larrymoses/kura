#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72557 "Request for Project Close-Out"
{
    Caption = 'Request for Project Taking Over';
    PageType = Card;
    SourceTable = "Measurement &  Payment Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
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
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Taking Over Request No."; "Taking Over Request No.")
                {
                    ApplicationArea = Basic;
                }
                field("Close-Out Justification"; "Close-Out Justification")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan 1D"; "Work Execution Plan 1D")
                {
                    ApplicationArea = Basic;
                    Caption = 'Work Execution Plan ID';
                }
                field("Commencement Order No."; "Commencement Order No.")
                {
                    ApplicationArea = Basic;
                }
                field("Defects Liability Period"; "Defects Liability Period")
                {
                    ApplicationArea = Basic;
                }
                field("Works Start Chainage"; "Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage"; "Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Workplanned Length (KM)"; "Workplanned Length (KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Taking Over Length (KM)"; "Taking Over Length (KM)")
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
                field("Payments To Date"; "Payments To Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; "Posted By")
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
            part(Control41; "Measurement & Payment Entries")
            {
                SubPageLink = "Job No." = field("Project ID"),
                              "Document Type" = field("Document Type");
                Visible = false;
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                Editable = false;
                field("Project Start Date"; "Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; "Project End Date")
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
                field("Project Engineer Name"; "Project Engineer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Resident Engineer Mail"; "Resident Engineer Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Resident Engineer No."; "Resident Engineer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Resident Engineer Name"; "Resident Engineer Name")
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
                field("Portal Status"; "Portal Status")
                {
                    ApplicationArea = Basic;
                }
                field("Total Contract Sum"; "Total Contract Sum")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Sum"; "Contract Sum")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source ID"; "Funding Source ID")
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
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Submit)
            {
                ApplicationArea = Basic;
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                visible = false;

                trigger OnAction()
                begin
                    "Portal Status" := "portal status"::Submitted;
                    Modify();
                    Message('Request Submitted Successfully');



                    ObjJob.Reset;
                    ObjJob.SetRange(ObjJob."No.", "Project ID");
                    if ObjJob.FindSet then begin
                        ObjJob."Last Taking Over Request No." := "Taking Over Request No." + 1;
                        ObjJob.Modify(true);
                    end;

                    //Notify The RE that the Contractor has submitted a request for completion
                    ProcurementProcessing.FnNotifyRERequestForTakingOver(Rec);
                end;
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
                RunPageLink = "Inspection No" = field("Document No."),
                              "Document Type" = field("Document Type");
            }
            action("Snag List")
            {
                ApplicationArea = Basic;
                Image = SKU;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                PromotedOnly = true;
                RunObject = Page "Inspection Snag List";
                RunPageLink = "Inspection No" = field("Document No.");
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Contractor Request for Taking Over";
    end;

    var
        ObjJob: Record Job;
        ProcurementProcessing: Codeunit "Procurement Processing";
}

