#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95095 "Directora Risk Management Plan"
{
    PageType = Card;
    SourceTable = "Risk Management Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Directorate ID";"Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID";"Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Year Code";"Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary MIssion";"Primary MIssion")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer No.";"Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Start Date";"Planning Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Planning End Date";"Planning End Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Risk Likelihood Rate Scale ID";"Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Rating Scale ID";"Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Risk Rating Scale ID";"Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Appetite Rating Scale ID";"Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date Time";"Created Date Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control41;"Risk Management Plan Lines")
            {
                Caption = 'Operational Risk Register(Directorate)';
                SubPageLink = "Document Type"=field("Document Type"),
                              "Document No"=field("Document No");
            }
        }
        area(factboxes)
        {
            part(Control44;"RMP Statistics")
            {
                Caption = 'Risk Statistics';
                SubPageLink = "Document No"=field("Document No"),
                              "Document Type"=field("Document Type");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Purpose(Goals & Objectives)")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "RMP Objectives";
            }
            action("Risk & Compliance Roles")
            {
                ApplicationArea = Basic;
                Image = Restore;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "RMP Roles";
            }
            action("Risk Register Summary")
            {
                ApplicationArea = Basic;
                Image = Reuse;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Document Type","Document Type");
                    SetRange("Document No","Document No");
                    if FindSet then
                    Report.Run(95002,true,false,Rec);
                end;
            }
            action("Copy Document")
            {
                ApplicationArea = Basic;
                Image = CopyDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ObjRiskMgt.FnCopyRiskManagementPlanDocument(Rec,RMPLine,"Document Type",'');
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Status:=Status::Released;
                    Modify;
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Status:=Status::Open;
                    Modify;
                end;
            }
            action("New Risk Vouchers")
            {
                ApplicationArea = Basic;
                Image = New;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "New Risk Vouchers";
                RunPageView = where("Document Type"=filter("New Risk Voucher"));
            }
            action("Risk Status Reports")
            {
                ApplicationArea = Basic;
                Image = Status;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Periodic Risk Status Reports";
            }
            action("Risk Incident Logs")
            {
                ApplicationArea = Basic;
                Image = Log;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Periodic Risk Status Reports";
            }
            action("Risk Incident Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "New Risk Voucher Lines";
            }
            action("Risk Ownership")
            {
                ApplicationArea = Basic;
                Image = "Order";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "RMP Line Risk Ownerships";
                RunPageLink = "Document No"=field("Document No"),
                              "Document Type"=field("Document Type");
            }
            action("Risk Response Actions")
            {
                ApplicationArea = Basic;
                Image = Restore;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "RMP Line Response Actions";
                RunPageLink = "Document Type"=field("Document Type"),
                              "Document No"=field("Document No");
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Process;
                // PromotedIsBig = true;
                // RunObject = Page "Default Dimensions";
                // RunPageLink = "No."=field("Document No");
            }
            action("Directorate RMPs")
            {
                ApplicationArea = Basic;
                Image = DataEntry;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Directorate Risk Mgt. Plans";
                RunPageLink = "Document Type"=filter("Functional (Directorate)");
            }
            action("Departmental RMps")
            {
                ApplicationArea = Basic;
                Image = DataEntry;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Departmental Risk Mgt. Plans";
                RunPageLink = "Document Type"=filter("Functional (Department)");
            }
            action("Regional RMPs")
            {
                ApplicationArea = Basic;
                Image = DataEntry;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Regional Risk Mgt. Plans";
                RunPageLink = "Document Type"=filter("Functional (Region)");
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"Functional (Directorate)";
    end;

    var
        ObjRiskMgt: Codeunit "Risk Management";
        RMPLine: Record "Risk Management Plan Line";
}

