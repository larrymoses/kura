#pragma implicitwith disablepa
page 99993 "Document Attachment Factbox1"
{
    Caption = 'Documents Attached Custom';
    PageType = CardPart;
    SourceTable = "Document Attachment";

    layout
    {
        area(content)
        {
            group(Control2)
            {
                ShowCaption = false;
                field(Documents; NumberOfRecords)
                {
                    ApplicationArea = All;
                    Caption = 'Documents';
                    StyleExpr = TRUE;
                    ToolTip = 'Specifies the number of attachments.';

                    trigger OnDrillDown()
                    var
                        Customer: Record Customer;
                        Vendor: Record Vendor;
                        Item: Record Item;
                        Monitoring: Record "Monitoring Card Header";
                        Employee: Record Employee;
                        FixedAsset: Record "Fixed Asset";
                        Resource: Record Resource;
                        SalesHeader: Record "Sales Header";
                        PurchaseHeader: Record "Purchase Header";
                        Job: Record Job;
                        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                        SalesInvoiceHeader: Record "Sales Invoice Header";
                        PurchInvHeader: Record "Purch. Inv. Header";
                        PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
                        VATReportHeader: Record "VAT Report Header";
                        DocumentAttachmentDetails: Page "Document Attachment Details1";
                        RecRef: RecordRef;
                        ProcLaw: record "Procurement Law & Regulation";
                        bidopen: record "Bid Opening Register";
                        bideval: record "Bid Evaluation Register";
                        Roadworkplan: Record "Road WorkPlan Document Attach";
                        ImMemo: record "Imprest Memo";
                        payments: record payments;
                        payments1: record payments;
                        Receipts: Record "Receipts Header1";
                        imemo: record "Imprest Memo";
                    begin
                        case Rec."Table ID" of
                            0:
                                exit;
                            DATABASE::Customer:
                                begin
                                    RecRef.Open(DATABASE::Customer);
                                    if Customer.Get(Rec."No.") then
                                        RecRef.GetTable(Customer);
                                end;
                            DATABASE::Vendor:
                                begin
                                    RecRef.Open(DATABASE::Vendor);
                                    if Vendor.Get(Rec."No.") then
                                        RecRef.GetTable(Vendor);
                                end;
                            DATABASE::"Monitoring Card Header":
                                begin
                                    RecRef.Open(DATABASE::"Monitoring Card Header");
                                    if Monitoring.Get(Rec."No.") then
                                        RecRef.GetTable(Monitoring);
                                end;
                            DATABASE::"Imprest Memo":
                                begin
                                    RecRef.Open(DATABASE::"Imprest Memo");
                                    if ImMemo.Get(Rec."No.") then
                                        RecRef.GetTable(ImMemo);
                                end;
                            DATABASE::Item:
                                begin
                                    RecRef.Open(DATABASE::Item);
                                    if Item.Get(Rec."No.") then
                                        RecRef.GetTable(Item);
                                end;
                            DATABASE::payments:
                                begin
                                    RecRef.Open(DATABASE::payments);
                                    if payments.Get(Rec."No.") then
                                        RecRef.GetTable(payments);
                                end;
                            DATABASE::"Receipts Header1":
                                begin
                                    RecRef.Open(DATABASE::"Receipts Header1");
                                    if Receipts.Get(Rec."No.") then
                                        RecRef.GetTable(Receipts);
                                end;

                            DATABASE::Employee:
                                begin
                                    RecRef.Open(DATABASE::Employee);
                                    if Employee.Get(Rec."No.") then
                                        RecRef.GetTable(Employee);
                                end;
                            DATABASE::"Fixed Asset":
                                begin
                                    RecRef.Open(DATABASE::"Fixed Asset");
                                    if FixedAsset.Get(Rec."No.") then
                                        RecRef.GetTable(FixedAsset);
                                end;
                            DATABASE::"Procurement Law & Regulation":
                                begin
                                    RecRef.Open(DATABASE::"Procurement Law & Regulation");
                                    if ProcLaw.Get(Rec."Document Type") then
                                        RecRef.GetTable(ProcLaw);
                                end;
                            DATABASE::"Bid Opening Register":
                                begin
                                    RecRef.Open(DATABASE::"Bid Opening Register");
                                    if bidopen.Get(Rec."Document Type") then
                                        RecRef.GetTable(bidopen);
                                end;
                            DATABASE::"Bid Evaluation Register":
                                begin
                                    RecRef.Open(DATABASE::"Bid Evaluation Register");
                                    if bideval.Get(Rec."Document Type") then
                                        RecRef.GetTable(bideval);
                                end;
                            DATABASE::"Road WorkPlan Document Attach":
                                begin
                                    RecRef.Open(DATABASE::"Road WorkPlan Document Attach");
                                    if bideval.Get(Rec."Document Type") then
                                        RecRef.GetTable(Roadworkplan);
                                end;

                            DATABASE::Resource:
                                begin
                                    RecRef.Open(DATABASE::Resource);
                                    if Resource.Get(Rec."No.") then
                                        RecRef.GetTable(Resource);
                                end;
                            DATABASE::Job:
                                begin
                                    RecRef.Open(DATABASE::Job);
                                    if Job.Get(Rec."No.") then
                                        RecRef.GetTable(Job);
                                end;
                            DATABASE::"Sales Header":
                                begin
                                    RecRef.Open(DATABASE::"Sales Header");
                                    if SalesHeader.Get(Rec."Document Type", Rec."No.") then
                                        RecRef.GetTable(SalesHeader);
                                end;
                            DATABASE::"Sales Invoice Header":
                                begin
                                    RecRef.Open(DATABASE::"Sales Invoice Header");
                                    if SalesInvoiceHeader.Get(Rec."No.") then
                                        RecRef.GetTable(SalesInvoiceHeader);
                                end;
                            DATABASE::"Sales Cr.Memo Header":
                                begin
                                    RecRef.Open(DATABASE::"Sales Cr.Memo Header");
                                    if SalesCrMemoHeader.Get(Rec."No.") then
                                        RecRef.GetTable(SalesCrMemoHeader);
                                end;
                            DATABASE::"Purchase Header":
                                begin
                                    RecRef.Open(DATABASE::"Purchase Header");
                                    if PurchaseHeader.Get(Rec."Document Type", Rec."No.") then
                                        RecRef.GetTable(PurchaseHeader);
                                end;
                            DATABASE::"Purch. Inv. Header":
                                begin
                                    RecRef.Open(DATABASE::"Purch. Inv. Header");
                                    if PurchInvHeader.Get(Rec."No.") then
                                        RecRef.GetTable(PurchInvHeader);
                                end;
                            DATABASE::"Purch. Cr. Memo Hdr.":
                                begin
                                    RecRef.Open(DATABASE::"Purch. Cr. Memo Hdr.");
                                    if PurchCrMemoHdr.Get(Rec."No.") then
                                        RecRef.GetTable(PurchCrMemoHdr);
                                end;
                            DATABASE::"VAT Report Header":
                                begin
                                    RecRef.Open(DATABASE::"VAT Report Header");
                                    if VATReportHeader.Get(Rec."VAT Report Config. Code", Rec."No.") then
                                        RecRef.GetTable(VATReportHeader);
                                end;
                            else
                                OnBeforeDrillDown(Rec, RecRef);
                        end;

                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
                }
            }
        }
    }

    actions
    {
    }

    [IntegrationEvent(false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    begin
    end;

    trigger OnAfterGetCurrRecord()
    var
        currentFilterGroup: Integer;
    begin
        currentFilterGroup := Rec.FilterGroup;
        Rec.FilterGroup := 4;

        NumberOfRecords := 0;
        if Rec.GetFilters() <> '' then
            NumberOfRecords := Rec.Count;
        Rec.FilterGroup := currentFilterGroup;
    end;

    var
        NumberOfRecords: Integer;
}

page 99466 "Document Attachment Details1"
{
    Caption = 'Attached Documents';
    DelayedInsert = true;
    Editable = true;
    PageType = List;
    SourceTable = "Document Attachment";
    SourceTableView = SORTING(ID, "Table ID");

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    applicationarea = all;
                    Editable = false;
                }
                field(Name; rec."File Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the filename of the attachment.';

                    trigger OnDrillDown()
                    var
                        Selection: Integer;
                    begin
                        if rec."Document Reference ID".HasValue then
                            rec.Export(true)
                        else
                            if not IsOfficeAddin or not EmailHasAttachments then
                                InitiateUploadFile()
                            else begin
                                Selection := StrMenu(MenuOptionsTxt, 1, SelectInstructionTxt);
                                case
                                    Selection of
                                    1:
                                        InitiateAttachFromEmail();
                                    2:
                                        InitiateUploadFile();
                                end;
                            end;
                    end;
                }
                field("File Extension"; rec."File Extension")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the file extension of the attachment.';
                }
                field("File Type"; rec."File Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the type of document that the attachment is.';
                }
                field(User; rec.User)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the user who attached the document.';
                }
                field("Attached Date"; rec."Attached Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the document was attached.';
                }
                field("Document Flow Purchase"; rec."Document Flow Purchase")
                {
                    ApplicationArea = All;
                    CaptionClass = GetCaptionClass(9);
                    Editable = FlowFieldsEditable;
                    ToolTip = 'Specifies if the attachment must flow to transactions.';
                    Visible = PurchaseDocumentFlow;
                }
                field("Document Flow Sales"; rec."Document Flow Sales")
                {
                    ApplicationArea = All;
                    CaptionClass = GetCaptionClass(11);
                    Editable = FlowFieldsEditable;
                    ToolTip = 'Specifies if the attachment must flow to transactions.';
                    Visible = SalesDocumentFlow;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(OpenInOneDrive)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Open in OneDrive';
                ToolTip = 'Copy the file to your Business Central folder in OneDrive and open it in a new window so you can manage or share the file.', Comment = 'OneDrive should not be translated';
                Image = Cloud;
                Enabled = ShareOptionsEnabled;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                Visible = ShareOptionsVisible;
                trigger OnAction()
                var
                    FileManagement: Codeunit "File Management";
                    DocumentServiceMgt: Codeunit "Document Service Management";
                    FileName: Text;
                    FileExtension: Text;
                begin
                    FileName := FileManagement.StripNotsupportChrInFileName(Rec."File Name");
                    FileExtension := StrSubstNo(FileExtensionLbl, Rec."File Extension");

                    DocumentServiceMgt.OpenInOneDriveFromMedia(FileName, FileExtension, rec."Document Reference ID".MediaId());
                end;
            }
            action(ShareWithOneDrive)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Share';
                ToolTip = 'Copy the file to your Business Central folder in OneDrive and share the file. You can also see who it''s already shared with.', Comment = 'OneDrive should not be translated';
                Image = Share;
                Enabled = ShareOptionsEnabled;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                Visible = ShareOptionsVisible;
                trigger OnAction()
                var
                    FileManagement: Codeunit "File Management";
                    DocumentServiceMgt: Codeunit "Document Service Management";
                    FileName: Text;
                    FileExtension: Text;
                begin
                    FileName := FileManagement.StripNotsupportChrInFileName(Rec."File Name");
                    FileExtension := StrSubstNo(FileExtensionLbl, Rec."File Extension");

                    DocumentServiceMgt.ShareWithOneDriveFromMedia(FileName, FileExtension, rec."Document Reference ID".MediaId());
                end;
            }
            action(Preview)
            {
                ApplicationArea = All;
                Caption = 'Download';
                Image = Download;
                Enabled = DowbloadEnabled;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                ToolTip = 'Download the file to your device. Depending on the file, you will need an app to view or edit the file.';

                trigger OnAction()
                begin
                    if rec."File Name" <> '' then
                        rec.Export(true);
                end;
            }
            action(AttachFromEmail)
            {
                ApplicationArea = All;
                Caption = 'Attach from email';
                Image = Email;
                Enabled = EmailHasAttachments;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Page;
                ToolTip = 'Attach files directly from email.';
                Visible = IsOfficeAddin;

                trigger OnAction()
                begin
                    InitiateAttachFromEmail();
                end;
            }
            action(UploadFile)
            {
                ApplicationArea = All;
                Caption = 'Upload file';
                Image = Document;
                Enabled = true;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Page;
                ToolTip = 'Upload file';
                Visible = IsOfficeAddin;

                trigger OnAction()
                begin
                    InitiateUploadFile();
                end;
            }
        }
    }

    trigger OnInit()
    begin
        FlowFieldsEditable := true;
        IsOfficeAddin := OfficeMgmt.IsAvailable();
        ShareOptionsVisible := false;

        if IsOfficeAddin then
            EmailHasAttachments := OfficeHostMgmt.EmailHasAttachments()
        else begin
            EmailHasAttachments := false;
            ShareOptionsVisible := NOT OfficeMgmt.IsPopOut();
        end;
    end;

    trigger OnAfterGetCurrRecord()
    var
        DocumentSharing: Codeunit "Document Sharing";
    begin
        ShareOptionsEnabled := (Rec."Document Reference ID".HasValue()) and (DocumentSharing.ShareEnabled());
        DowbloadEnabled := Rec."Document Reference ID".HasValue();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        payments: record "payments";
    begin
        rec."File Name" := SelectFileTxt;
    end;

    var
        OfficeMgmt: Codeunit "Office Management";
        OfficeHostMgmt: Codeunit "Office Host Management";
        SalesDocumentFlow: Boolean;
        FileExtensionLbl: Label '.%1', Locked = true;
        FileDialogTxt: Label 'Attachments (%1)|%1', Comment = '%1=file types, such as *.txt or *.docx';
        FilterTxt: Label '*.jpg;*.jpeg;*.bmp;*.png;*.gif;*.tiff;*.tif;*.pdf;*.docx;*.doc;*.xlsx;*.xls;*.pptx;*.ppt;*.msg;*.xml;*.*', Locked = true;
        ImportTxt: Label 'Attach a document.';
        SelectFileTxt: Label 'Attach File(s)...';
        PurchaseDocumentFlow: Boolean;
        ShareOptionsEnabled: Boolean;
        DowbloadEnabled: Boolean;
        FlowToPurchTxt: Label 'Flow to Purch. Trx';
        FlowToSalesTxt: Label 'Flow to Sales Trx';
        FlowFieldsEditable: Boolean;
        EmailHasAttachments: Boolean;
        IsOfficeAddin: Boolean;
        MenuOptionsTxt: Label 'Attach from email,Upload file', Comment = 'Comma seperated phrases must be translated seperately.';
        SelectInstructionTxt: Label 'Choose the files to attach.';
        ShareOptionsVisible: Boolean;

    protected var
        FromRecRef: RecordRef;

    local procedure InitiateAttachFromEmail()
    begin
        OfficeMgmt.InitiateSendToAttachments(FromRecRef);
        CurrPage.Update(true);
    end;

    local procedure InitiateUploadFile()
    var
        DocumentAttachment: Record "Document Attachment";
        TempBlob: Codeunit "Temp Blob";
        FileName: Text;
    begin
        ImportWithFilter(TempBlob, FileName);
        if FileName <> '' then
            DocumentAttachment.SaveAttachment(FromRecRef, FileName, TempBlob);
        CurrPage.Update(true);
    end;

    local procedure GetCaptionClass(FieldNo: Integer): Text
    begin
        if SalesDocumentFlow and PurchaseDocumentFlow then
            case FieldNo of
                9:
                    exit(FlowToPurchTxt);
                11:
                    exit(FlowToSalesTxt);
            end;
    end;

    procedure OpenForRecRef(RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Purchase Requisition";
        LineNo: Integer;
        VATRepConfigType: Enum "VAT Report Configuration";
    begin
        rec.Reset;

        FromRecRef := RecRef;

        rec.SetRange(rec."Table ID", RecRef.Number);

        if RecRef.Number = DATABASE::Item then begin
            SalesDocumentFlow := true;
            PurchaseDocumentFlow := true;
        end;

        case RecRef.Number of
            DATABASE::Customer,
          DATABASE::"Sales Header",
          DATABASE::"Sales Line",
          DATABASE::"Sales Invoice Header",
          DATABASE::"Sales Invoice Line",
          DATABASE::"Sales Cr.Memo Header",
          DATABASE::"Sales Cr.Memo Line":
                SalesDocumentFlow := true;
            DATABASE::Vendor,
          DATABASE::"Purchase Header",
          DATABASE::"Purchase Line",
          DATABASE::"Purch. Inv. Header",
          DATABASE::"Purch. Inv. Line",
          DATABASE::"Purch. Cr. Memo Hdr.",
          DATABASE::"Purch. Cr. Memo Line":
                PurchaseDocumentFlow := true;
        end;

        case RecRef.Number of
            DATABASE::Customer,
            DATABASE::Vendor,
            DATABASE::Item,
            DATABASE::Employee,
            DATABASE::"Fixed Asset",
            DATABASE::Job,
            DATABASE::Resource,
            DATABASE::"VAT Report Header"
            , database::"payments",
            database::"Imprest Memo",
             database::"Receipts Header1":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    rec.SetRange(rec."No.", RecNo);
                end;
            database::"Purchase header":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    rec.SetRange(rec."No.", RecNo);
                end;
            database::"Purchase Line":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    rec.SetRange(rec."No.", RecNo);
                end
        end;

        case RecRef.Number of
            DATABASE::"Sales Header",
            DATABASE::"Sales Line",
             DATABASE::"Purchase Header",
            DATABASE::"Purchase Line":
                begin
                    FieldRef := RecRef.Field(1);
                    DocType := FieldRef.Value;
                    rec.SetRange("Document Type", DocType);

                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    rec.SetRange("No.", RecNo);

                    FlowFieldsEditable := false;
                end;
        end;

        case RecRef.Number of
            DATABASE::"Sales Line",
            DATABASE::"Purchase Line":
                begin
                    FieldRef := RecRef.Field(4);
                    LineNo := FieldRef.Value;
                    rec.SetRange("Line No.", LineNo);
                end;
        end;

        case RecRef.Number of
            DATABASE::"Sales Invoice Header",
            DATABASE::"Sales Cr.Memo Header",
            DATABASE::"Purch. Inv. Header",
            DATABASE::"Purch. Cr. Memo Hdr.":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    rec.SetRange(rec."No.", RecNo);

                    FlowFieldsEditable := false;
                end;
        end;

        case RecRef.Number of
            DATABASE::"Sales Invoice Line",
            DATABASE::"Sales Cr.Memo Line",
            DATABASE::"Purch. Inv. Line",
            DATABASE::"Purch. Cr. Memo Line":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    rec.SetRange(rec."No.", RecNo);

                    FieldRef := RecRef.Field(4);
                    LineNo := FieldRef.Value;
                    rec.SetRange(rec."Line No.", LineNo);

                    FlowFieldsEditable := false;
                end;
        end;

        if RecRef.Number = Database::"VAT Report Header" then begin
            FieldRef := RecRef.Field(2);
            VATRepConfigType := FieldRef.Value;
            rec.SetRange(rec."VAT Report Config. Code", VATRepConfigType);
        end;

        OnAfterOpenForRecRef(Rec, RecRef, FlowFieldsEditable);
    end;

    local procedure ImportWithFilter(var TempBlob: Codeunit "Temp Blob"; var FileName: Text)
    var
        FileManagement: Codeunit "File Management";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeImportWithFilter(TempBlob, FileName, IsHandled, FromRecRef);
        if IsHandled then
            exit;

        FileName := FileManagement.BLOBImportWithFilter(
            TempBlob, ImportTxt, FileName, StrSubstNo(FileDialogTxt, FilterTxt), FilterTxt);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef; var FlowFieldsEditable: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeImportWithFilter(var TempBlob: Codeunit "Temp Blob"; var FileName: Text; var IsHandled: Boolean; RecRef: RecordRef)
    begin
    end;
}




// #pragma implicitwith restore

