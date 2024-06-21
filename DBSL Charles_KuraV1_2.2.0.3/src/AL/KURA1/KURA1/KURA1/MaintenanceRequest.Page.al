
Page 59036 "Maintenance Request"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fuel & Maintenance Requisition";
    PopulateAllFields =true;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vehicle Reg No"; Rec."Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                    Editable = VehicleRegNoEditable;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Source Name';
                }
                field("Vendor(Dealer)"; Rec."Vendor(Dealer)")
                {
                    ApplicationArea = Basic;
                    Editable = vendorEditable;
                    LookupPageID = "Vendor List";
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Odometer Reading"; Rec."Previous Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Next Odometer Reading"; Rec."Next Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Taken for Maintenance"; Rec."Date Taken for Maintenance")
                {
                    ApplicationArea = Basic;
                    Editable = PoCreated;
                    Visible = PoCreated;
                }
                field("Date Returned from Maintenance"; Rec."Date Returned from Maintenance")
                {
                    ApplicationArea = Basic;
                    Editable = PoCreated;
                    Visible = PoCreated;
                }
                field("Service Type"; Rec."Service Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Total Price of Fuel"; Rec."Total Price of Fuel")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Maintenance Amount';
                }
                field("Service Code"; Rec."Service Code")
                {
                    ApplicationArea = Basic;
                }
                field("Service Name"; Rec."Service Name")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    Editable = closedbyEditable;
                    LookupPageID = "User Setup";
                    Visible = false;
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    Editable = DateclosedEditable;
                    Visible = false;
                }
                field("Vendor Invoice No"; Rec."Vendor Invoice No")
                {
                    ApplicationArea = Basic;
                    Editable = vendorInvoiceEditable;
                    LookupPageID = "Purchase Invoices";
                    Visible = false;
                }
                field("Posted Invoice No"; Rec."Posted Invoice No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted LSO';
                    Editable = postedInvoiceEditable;
                    LookupPageID = "Posted Purchase Invoice";
                    Visible = PoCreated;
                }
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control13; "Fuel and Maintenance List")
            {
                Caption = 'Maintenance Requests List';
                Editable = false;
                SubPageLink = "Vehicle Reg No" = field("Vehicle Reg No");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;

                trigger OnAction()
                begin
                    //ApprovalMgt.SendMaintApprovalRequest(Rec);
                    DocAtt.Reset;
                    DocAtt.SetRange(DocAtt."No.", Rec."Requisition No");
                    Attachments := DocAtt.Count;
                    if Attachments < 1 then
                        Error('You have not attached any documents to this Request\Please attach documents to proceed', Attachments);
                    if Rec.Status <> Rec.Status::Open then
                        Error('Status must be open');


                    //if ApprovalMgt.CheckMaintenaceApprovalsWorkflowEnabled(Rec) then
                    ///  / ApprovalMgt.OnSendMaintenaceForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = approval;
                Promoted = true;

                trigger OnAction()
                begin
                    //ApprovalMgt.CancelMaintApprovalRequest(Rec,TRUE,TRUE);

                    // ApprovalMgt.OnCancelMaintenaceApprovalRequest(Rec);
                end;
            }
            action("Close Maintenance Request.")
            {
                ApplicationArea = Basic;
                Image = RegisteredDocs;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField("Posted Invoice No");
                    if Rec."PO Created" = true then begin
                        if Confirm('Are you sure you want to close this Maintenance Request?', true) = false then begin
                            exit
                        end else
                            Rec.Status := Rec.Status::Closed;
                        Rec."Closed By" := UserId;
                        Rec."Date Closed" := Today;
                        Rec.Modify;
                    end else
                        Error('You cannot close the request until the LSO is created');
                end;
            }
            action("Process LSO")
            {
                ApplicationArea = Basic;
                Image = Purchasing;
                Promoted = true;
                PromotedCategory = Process;
                Visible = stat;

                trigger OnAction()
                begin

                    if Rec.Status = Rec.Status::Approved then begin
                        if Confirm(Text004, false) then begin
                            // RequsitionManager.MaintanceReview(Rec);
                            Rec."PO Created By" := UserId;
                            Rec."Date PO Created" := Today;
                            Rec."PO Created" := true;
                            Rec.Modify;
                            Message(Text005);
                        end;
                    end;
                end;
            }
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category7;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                // trigger OnAction()
                // var
                //     DocumentAttachmentDetails: Page "Document Attachment Details";
                //     RecRef: RecordRef;
                // begin
                //     RecRef.GetTable(Rec);
                //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                //     DocumentAttachmentDetails.RunModal;
                // end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."Requisition No", Rec."Requisition No");
                    Report.Run(59020, true, true, Rec);
                end;
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;

                trigger OnAction()
                begin
                    //  DMSManagement.UploadImprestDocuments(DMSDocuments."document type"::"Maintenance Requisition "Requisition No", 'Maintenance Requisition', RecordId, d,"Shortcut Dimension 1 Code");
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        updatecontrols
    end;

    trigger OnInit()
    begin
        PoCreated := false;
        if Rec."PO Created" = true then
            PoCreated := true;
        stat := false;
        if Rec.Status = Rec.Status::Approved then
            stat := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Maintenance;
        Rec."Request Date" := Today;
        //IF FltUserSetup.GET(USERID) THEN BEGIN
        //FltUserSetup.TESTFIELD("User Department");
        Rec."Prepared By" := UserId;
        Rec.Status := Rec.Status::Open;
        // Department:=FltUserSetup."User Department";
        //END ELSE
        //ERROR(Text0001);
    end;

    trigger OnOpenPage()
    begin
        PoCreated := false;
        if Rec."PO Created" = true then
            PoCreated := true;
        stat := false;
        if Rec.Status = Rec.Status::Approved then
            stat := true;
    end;
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
         Rec.Type := Rec.Type::Maintenance;
        Rec."Request Date" := Today;
        Rec.Status := Rec.Status::Open;
    end;
    

    var
        //ApprovalMgt: Codeunit "Approvals Mgmt.";
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
        Text004: label 'Do you want to proceed and perform the selected action on the Maintanance request?';
        GLSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        LineNo2: Code[20];
        gCuNoSeriesMngmnt: Codeunit NoSeriesManagement;
        PurchaseHeader: Record "Purchase Header";
        purchaseLine: Record "Purchase Line";
        RequsitionManager: Codeunit "Requisition Management";
        UserSetup: Record "User Setup";
        Text005: label 'Purchase Review process completed';
        DocAtt: Record "Document Attachment";
        Attachments: Integer;
        PoCreated: Boolean;
        stat: Boolean;
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";


    procedure updatecontrols()
    begin
        if Rec.Status = Rec.Status::Open then begin
            VehicleRegNoEditable := true;
            vendorEditable := true;
            RequestDateEditable := true;
            DateofMaintenanceEditable := true;
            typeofmaintenanceEditable := true;
            chequenoEditable := false;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := true;
            postedInvoiceEditable := true;
        end;
        if Rec.Status = Rec.Status::"Pending Approval" then begin
            VehicleRegNoEditable := false;
            vendorEditable := false;
            RequestDateEditable := false;
            DateofMaintenanceEditable := false;
            typeofmaintenanceEditable := false;
            chequenoEditable := false;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := false;
            postedInvoiceEditable := false;
        end;
        if Rec.Status = Rec.Status::Approved then begin
            VehicleRegNoEditable := false;
            vendorEditable := false;
            RequestDateEditable := false;
            DateofMaintenanceEditable := false;
            typeofmaintenanceEditable := false;
            chequenoEditable := true;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := true;
            postedInvoiceEditable := true;
        end;
        if Rec.Status = Rec.Status::Rejected then begin
            VehicleRegNoEditable := false;
            vendorEditable := false;
            RequestDateEditable := false;
            DateofMaintenanceEditable := false;
            typeofmaintenanceEditable := false;
            chequenoEditable := true;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := false;
            postedInvoiceEditable := false;
        end;
        if Rec.Status = Rec.Status::Closed then begin
            VehicleRegNoEditable := false;
            vendorEditable := false;
            RequestDateEditable := false;
            DateofMaintenanceEditable := false;
            typeofmaintenanceEditable := false;
            chequenoEditable := true;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := false;
            postedInvoiceEditable := false;
        end;
    end;
}



