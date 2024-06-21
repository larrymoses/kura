#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72371 "Posted Interim Payment Cert"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Measurement &  Payment Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Certificate Type"; Rec."Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.Description := 'Interim Payment Request' + ' ' + Rec."Project ID";
                    end;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Reversed; Rec.Reversed)
                {
                    ApplicationArea = Basic;
                }
                field("Reason For Reversal"; Rec."Reason For Reversal")
                {
                    ApplicationArea = Basic;
                }
                field("Reversed By"; Rec."Reversed By")
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
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                }
                field("Retention %"; Rec."Retention %")
                {
                    ApplicationArea = Basic;
                }
                field("Less Advance Payment"; Rec."Less Advance Payment")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control44; "Contractor Payment Line Entry")
            {
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No.");
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer No."; Rec."Project Engineer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer Name"; Rec."Project Engineer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Representative No."; Rec."Engineer Representative No.")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Representative Name"; Rec."Engineer Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency ID"; Rec."Funding Agency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funder Name"; Rec."Funder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Section Start Chainage"; Rec."Section Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Section End Chainage"; Rec."Section End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Total  Section Length (KMs)"; Rec."Total  Section Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = Basic;
                }
                field("Portal Status"; Rec."Portal Status")
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
            action("Suggest Lines")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Suggest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.TestField("From Date");//Check if these fields have been populated
                    Rec.TestField("To Date");//Check if these fields have been populated

                    //Populate the Lines
                    MeasurementPaymentEntry.Reset;
                    MeasurementPaymentEntry.SetRange(MeasurementPaymentEntry."Posting Date", Rec."From Date", Rec."To Date");
                    MeasurementPaymentEntry.SetRange(MeasurementPaymentEntry.Reversed, false);
                    MeasurementPaymentEntry.SetRange(MeasurementPaymentEntry.Posted, true);
                    MeasurementPaymentEntry.SetFilter(MeasurementPaymentEntry."Measured Quantity", '>%1', 0);
                    if MeasurementPaymentEntry.FindSet then begin
                        //Delete The existing Lines
                        MeasurementPaymentLine.Reset;
                        MeasurementPaymentLine.SetRange(MeasurementPaymentLine."Document No", Rec."Document No.");
                        if MeasurementPaymentLine.FindSet then
                            MeasurementPaymentLine.DeleteAll;
                        repeat
                            MeasurementPaymentLine.Init;
                            MeasurementPaymentLine."Document No" := Rec."Document No.";
                            MeasurementPaymentLine."Document Type" := Rec."Document Type";
                            MeasurementPaymentLine."Line No." := MeasurementPaymentLine.Count + 100;
                            MeasurementPaymentLine."Job No." := MeasurementPaymentEntry."Job No.";
                            MeasurementPaymentLine."Job Task No." := MeasurementPaymentEntry."Job Task No.";
                            MeasurementPaymentLine.Type := MeasurementPaymentLine.Type::Item;
                            MeasurementPaymentLine."No." := MeasurementPaymentEntry."No.";
                            MeasurementPaymentLine.Description := MeasurementPaymentEntry.Description;
                            MeasurementPaymentLine."Unit of Measure Code" := MeasurementPaymentEntry."Unit of Measure Code";
                            MeasurementPaymentLine."Measurement Type" := MeasurementPaymentEntry."Measurement Type";
                            MeasurementPaymentLine."Measured Quantity" := MeasurementPaymentEntry."Measured Quantity";
                            MeasurementPaymentLine."Contract Quantity" := MeasurementPaymentEntry."Contract Quantity";
                            MeasurementPaymentLine."Direct Unit Cost (LCY)" := MeasurementPaymentEntry."Direct Unit Cost (LCY)";
                            MeasurementPaymentLine."Unit Cost (LCY)" := MeasurementPaymentEntry."Unit Cost (LCY)";
                            MeasurementPaymentLine."Technology Type" := MeasurementPaymentEntry."Technology Type";
                            MeasurementPaymentLine."Gen. Prod. Posting Group" := MeasurementPaymentEntry."Gen. Prod. Posting Group";
                            MeasurementPaymentLine."Bill Item Category Code" := MeasurementPaymentEntry."Bill Item Category Code";
                            MeasurementPaymentLine."Total Cost (LCY)" := MeasurementPaymentEntry."Total Cost (LCY)";
                            MeasurementPaymentLine."Works Start Chainage" := MeasurementPaymentEntry."Works Start Chainage";
                            MeasurementPaymentLine."Works End Chainage" := MeasurementPaymentEntry."Works End Chainage";
                            if MeasurementPaymentLine."Measured Quantity" <> 0 then
                                MeasurementPaymentLine.Insert(true);
                        until MeasurementPaymentEntry.Next = 0;
                        Message('Lines created successfully');
                    end
                    else
                        Message('No measured quantity exist for the dates entered');

                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = SuggestElectronicDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = Approve;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Great');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Great');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Great');
                end;
            }
            action("Generate Payment Certificate")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    //Create Invoice Header
                    PurchasesPayablesSetup.Get;
                    PurchaseHeader.Init;
                    PurchaseHeader."Document Type" := PurchaseHeader."document type"::Invoice;
                    PurchaseHeader."No." := NoSeriesManagement.GetNextNo(PurchasesPayablesSetup."Invoice Nos.", Today, true);

                    PurchaseHeader."Buy-from Vendor No." := Rec."Contractor No";
                    PurchaseHeader.Validate("Buy-from Vendor No.");
                    PurchaseHeader."Posting Description" := Rec.Description;
                    PurchaseHeader."Certificate Number" := Rec."Document No.";
                    PurchaseHeader."Advance Recovery %" := Rec."Less Advance Payment";
                    PurchaseHeader."Retention %" := Rec."Retention %";

                    PurchaseHeader.Insert;
                    PurchNo := PurchaseHeader."No.";
                    //MESSAGE(PurchNo);

                    //Create the lines
                    MeasurementPaymentLine.Reset;
                    MeasurementPaymentLine.SetRange(MeasurementPaymentLine."Document No", Rec."Document No.");
                    MeasurementPaymentLine.SetRange(MeasurementPaymentLine."Document Type", Rec."Document Type");
                    if MeasurementPaymentLine.FindSet(true) then begin
                        repeat
                            PurchaseLine.Init;
                            PurchaseLine."Document Type" := PurchaseLine."document type"::Invoice;
                            PurchaseLine."Document No." := PurchNo;
                            //    PurchaseLine.RESET;
                            //    PurchaseLine.SETRANGE(PurchaseLine."Document No.","Document No.");
                            //    PurchaseLine.SETRANGE(PurchaseLine."Document Type",PurchaseLine."Document Type"::Invoice);
                            //    IF PurchaseLine.FINDLAST THEN
                            PurchaseLine."Line No." := PurchaseLine.Count + 1;
                            PurchaseLine.Type := MeasurementPaymentLine.Type;
                            PurchaseLine."No." := MeasurementPaymentLine."No.";
                            PurchaseLine.Validate("No.");
                            PurchaseLine.Description := MeasurementPaymentLine.Description;
                            PurchaseLine.Quantity := MeasurementPaymentLine."Contract Quantity";
                            PurchaseLine.Validate(Quantity);
                            PurchaseLine."Direct Unit Cost" := MeasurementPaymentLine."Direct Unit Cost (LCY)";
                            PurchaseLine.Validate("Direct Unit Cost");
                            PurchaseLine."Unit Cost" := MeasurementPaymentLine."Direct Unit Cost (LCY)";
                            PurchaseLine."Job No." := Rec."Project ID";
                            //PurchaseLine.VALIDATE("Job No.");
                            JobTask.Reset;
                            JobTask.SetRange(JobTask."Job No.", Rec."Project ID");
                            if JobTask.FindLast then begin
                                PurchaseLine."Job Task No." := JobTask."Job Task No.";
                                //PurchaseLine.VALIDATE("Job Task No.");
                            end;

                            if not PurchaseLine.Get(PurchaseLine."Document Type", PurchaseLine."Document No.", PurchaseLine."Line No.") then
                                PurchaseLine.Insert(true)
                            else
                                PurchaseLine.Modify(true);
                        until MeasurementPaymentLine.Next = 0;
                    end;

                    //Open the created invoice
                    PurchaseHeader.Reset;
                    PurchaseHeader.SetRange(PurchaseHeader."No.", PurchNo);
                    PurchaseHeader.SetRange(PurchaseHeader."Document Type", PurchaseHeader."document type"::Invoice);
                    if PurchaseHeader.FindSet then begin
                        PurchaseInvoice.SetTableview(PurchaseHeader);
                        PurchaseInvoice.Run;
                    end;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Printed');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Contractor Payment Request";
        Rec."Payment Certificate Type" := Rec."payment certificate type"::"Interim Payment";
    end;

    var
        PurchaseHeader: Record "Purchase Header";
        PaymentCertificateLine: Record "Payment Certificate Line";
        PurchaseLine: Record "Purchase Line";
        PurchaseInvoice: Page "Purchase Invoice";
        PurchNo: Code[20];
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        MeasurementPaymentEntry: Record "Measurement & Payment Entry";
        MeasurementPaymentLine: Record "Measurement & Payment Line";
        JobTask: Record "Job Task";
}

#pragma implicitwith restore

