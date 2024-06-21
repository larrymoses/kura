
Page 59026 "Fuel Requisition Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fuel & Maintenance Requisition";
    SourceTableView = where(Type = filter(Fuel));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Code';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                }
                field("Vehicle Reg No"; Rec."Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Card No."; Rec."Fuel Card No.")
                {
                    ApplicationArea = basic;
                    Editable = false;
                    Caption = 'Fuel Card No.';
                }
                field("Type of Fuel"; Rec."Type of Fuel")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Caption = 'Odometer Reading (KM)';
                    Editable = true;
                }
                field("Previous Odometer Reading"; Rec."Previous Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vendor(Dealer)"; Rec."Vendor(Dealer)")
                {
                    ApplicationArea = Basic;
                    Editable = VendorEditable;
                    LookupPageID = "Vendor List";
                    TableRelation = Vendor;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Litres of Oil"; Rec."Litres of Oil")
                {
                    ApplicationArea = Basic;
                    Caption = 'Litres';

                    trigger OnValidate()
                    begin
                        if Rec."Price/Litre" <> 0 then
                            Rec."Total Price of Fuel" := Rec."Litres of Oil" * Rec."Price/Litre";
                    end;
                }
                field("Price/Litre"; Rec."Price/Litre")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if Rec."Price/Litre" <> 0 then
                            Rec."Total Price of Fuel" := Rec."Litres of Oil" * Rec."Price/Litre";
                    end;
                }
                field("Total Price of Fuel"; Rec."Total Price of Fuel")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Amount Requested';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        if Rec."Price/Litre" <> 0 then
                            Rec."Litres of Oil" := Rec."Total Price of Fuel" / Rec."Price/Litre";
                    end;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = RequestDateEditable;
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
                field("Posted Invoice No"; Rec."Posted Invoice No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Petty Cash Number';
                    Editable = chequeEditable;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
             action(SendApprovalRequest)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = true;

                trigger OnAction()
                var
                CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                  
                   VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);
            ;
                end;
            }
            action(CancelApprovalRequest)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = true;

                trigger OnAction()
                var
                 CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                      Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);                    
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RECORDID);
                end;
            }  
            action("Close Fuel Request")
            {
                ApplicationArea = Basic;
                Image = RegisteredDocs;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //TESTFIELD("Posted Invoice No");

                    if Confirm('Are you sure you want to close this Fuel Request?', true) = false then begin
                        exit
                    end else
                        Rec.Status := Rec.Status::Closed;
                    Rec."Closed By" := UserId;
                    Rec."Date Closed" := Today;
                    Rec.Modify;
                end;
            }
            action("Generate Petty Cash Voucher")
            {
                ApplicationArea = Basic;
                Image = Currencies;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Approved);
                    if Rec."PO Created" then begin
                        if Confirm('PV already created, Would you like to open it?', true) then begin
                            Payments.Reset;
                            Payments.SetRange(Payments."No.", Rec."Posted Invoice No");
                            Page.Run(57017, Payments);
                        end;
                    end else
                        if Confirm('Are you sure you want to generate a PV?', true) then begin
                            Payments.Init;
                            Payments."Payment Type" := Payments."payment type"::"Petty Cash";
                            Payments."Payment Narration" := Rec."Requisition No" + ' Fuel Requisition for ' + Rec."Vehicle Reg No";
                            Payments."Account Type" := Payments."account type"::Employee;
                            Payments."Account No." := Rec.Driver;
                            Payments."Account Name" := Rec."Driver Name";
                            Payments."Pre-Assigned No." := Rec."Requisition No";
                            Payments.Validate("Account No.");
                            UserSetup.Get(UserId);
                            //Payments.
                            Payments.Date := Today;
                            if Payments.Insert(true) then begin
                                PVLines.Init;
                                PVLines."Document Type" := Payments."Document Type";
                                PVLines.No := Payments."No.";
                                PVLines."Account Type" := PVLines."account type"::Vendor;

                                PVLines."Account No" := Rec."Vendor(Dealer)";
                                PVLines.Validate("Account No");
                                PVLines.Amount := Rec."Total Price of Fuel";
                                PVLines.Validate(Amount);
                                PVLines.Insert(true);
                                //MESSAGE('%1 Created Successfully', );

                                Rec."PO Created" := true;
                                Rec."PO Created By" := UserId;
                                Rec."Posted Invoice No" := Payments."No.";
                                if Confirm('%1 Created Successfully, Would you like to open it?', true, Payments."No.") then begin
                                    Payments.Reset;
                                    Payments.SetRange(Payments."No.", Payments."No.");
                                    Page.Run(57017, Payments);
                                end;
                            end;
                        end;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;
                Promoted = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."Requisition No", Rec."Requisition No");
                    Report.Run(59019, true, true, Rec);
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
                    DMSManagement.UploadImprestDocuments(DMSDocuments."document type"::"Fuel Requisition", Rec."Requisition No", 'Fuel Requisition', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        updatecontrols
    end;
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
         Rec.Type := Rec.Type::Fuel;
        Rec."Request Date" := WorkDate();
        Rec.Status := Rec.Status::Open;
    end;
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec.Type := Rec.Type::Fuel;
        Rec."Request Date" := Today;
        Rec.Status := Rec.Status::Open;
        //IF FltUserSetup.GET(USERID) THEN BEGIN
        //FltUserSetup.TESTFIELD("User Department");
        Rec."Prepared By" := UserId;
        //Department:=FltUserSetup."User Department";
        //END ELSE
        //ERROR(Text0001);
    end;

    var
        VendorEditable: Boolean;
        TotalAmountEditable: Boolean;
        RequestDateEditable: Boolean;
        chequeEditable: Boolean;
        Payments: Record payments;
        PVLines: Record "PV Lines";
        Fuel: Record "Fuel & Maintenance Requisition";
        UserSetup: Record "User Setup";
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";
         ApprovalsMgmt: Codeunit "Approvals Mgmt.";


    procedure updatecontrols()
    begin
        if Rec.Status = Rec.Status::Open then begin
            VendorEditable := true;
            TotalAmountEditable := true;
            RequestDateEditable := false;
            chequeEditable := false;
        end else
            if Rec.Status = Rec.Status::"Pending Approval" then begin
                VendorEditable := false;
                TotalAmountEditable := false;
                RequestDateEditable := false;
                chequeEditable := false;

            end else
                if Rec.Status = Rec.Status::Approved then begin
                    VendorEditable := false;
                    TotalAmountEditable := false;
                    RequestDateEditable := false;
                    chequeEditable := true;
                end else

                    if Rec.Status = Rec.Status::Rejected then begin
                        VendorEditable := false;
                        TotalAmountEditable := false;
                        RequestDateEditable := false;
                        chequeEditable := false;

                    end
    end;
}



