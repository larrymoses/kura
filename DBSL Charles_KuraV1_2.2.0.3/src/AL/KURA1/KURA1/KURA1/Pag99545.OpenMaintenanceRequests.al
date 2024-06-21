page 99545 "Open Maintenance Requests"
{
    Caption = 'Open Maintenance Requests';
    PageType = List;
  
    ApplicationArea = Basic;
    CardPageID = "Maintenance Request";
    DeleteAllowed = false;
    Editable = false;

    SourceTable = "Fuel & Maintenance Requisition";
    SourceTableView = where(Status = const(Open),
                            Type = filter(Maintenance));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Requisition No"; "Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Constituency Name';
                }
                field("Vehicle Reg No"; "Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                    Editable = VehicleRegNoEditable;
                }
                field("Vendor(Dealer)"; "Vendor(Dealer)")
                {
                    ApplicationArea = Basic;
                    Editable = vendorEditable;
                    LookupPageID = "Vendor List";
                }
                field("Vendor Name"; "Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Odometer Reading"; "Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Odometer Reading"; "Previous Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Next Odometer Reading"; "Next Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Request Date"; "Request Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Taken for Maintenance"; "Date Taken for Maintenance")
                {
                    ApplicationArea = Basic;
                    Editable = PoCreated;
                    Visible = PoCreated;
                }
                field("Date Returned from Maintenance"; "Date Returned from Maintenance")
                {
                    ApplicationArea = Basic;
                    Editable = PoCreated;
                    Visible = PoCreated;
                }
                field("Service Type"; "Service Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Service Code"; "Service Code")
                {
                    ApplicationArea = Basic;
                }
                field("Service Name"; "Service Name")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account"; "G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account Name"; "G/L Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Prepared By"; "Prepared By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Closed By"; "Closed By")
                {
                    ApplicationArea = Basic;
                    Editable = closedbyEditable;
                    LookupPageID = "User Setup";
                    Visible = false;
                }
                field("Date Closed"; "Date Closed")
                {
                    ApplicationArea = Basic;
                    Editable = DateclosedEditable;
                    Visible = false;
                }
                field("Vendor Invoice No"; "Vendor Invoice No")
                {
                    ApplicationArea = Basic;
                    Editable = vendorInvoiceEditable;
                    LookupPageID = "Purchase Invoices";
                    Visible = false;
                }
                field("Posted Invoice No"; "Posted Invoice No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted LSO';
                    Editable = postedInvoiceEditable;
                    LookupPageID = "Posted Purchase Invoice";
                    Visible = true;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            // action("Cancel Approval Request")
            // {
            //     ApplicationArea = Basic;
            //     Image = CancelApprovalRequest;
            //     Promoted = true;

            //     trigger OnAction()
            //     begin
            //         //ApprovalMgt.CancelMaintApprovalRequest(Rec,TRUE,TRUE);

            //         // ApprovalsMgmt.OnCancelMaintenaceApprovalRequest(Rec);
            //     end;
            // }
            // action(Approvals)
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Approvals';
            //     Image = Approvals;
            //     Promoted = true;
            //     PromotedCategory = New;
            //     PromotedIsBig = false;

            //     trigger OnAction()
            //     var
            //         ApprovalEntries: Page "Approval Entries";
            //     begin

            //         //   ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
            //     end;
            // }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Approve the requested changes.';

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //CheckAllocationDetails;
                        // ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                        //MESSAGE('Requision approved...');
                        CurrPage.Close;
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //CheckAllocationDetails;
                        // ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Rec."Requisition No", "Requisition No");
                        Report.Run(59020, true, true, Rec);
                    end;
                }
            }
        }
    }

    var
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        // ApprovalMgt: Codeunit "Approvals Mgmt.";
        VehicleRegNoEditable: Boolean;
        vendorEditable: Boolean;
        RequestDateEditable: Boolean;
        DateofMaintenanceEditable: Boolean;
        typeofmaintenanceEditable: Boolean;
        chequenoEditable: Boolean;
        closedbyEditable: Boolean;
        DateclosedEditable: Boolean;
        vendorInvoiceEditable: Boolean;
        postedInvoiceEditable: Boolean;
        GLSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        LineNo2: Code[20];
        gCuNoSeriesMngmnt: Codeunit NoSeriesManagement;
        PurchaseHeader: Record "Purchase Header";
        purchaseLine: Record "Purchase Line";
        RequsitionManager: Codeunit "Requisition Management";
        UserSetup: Record "User Setup";
        DocAtt: Record "Document Attachment";
        Attachments: Integer;
        PoCreated: Boolean;
}


