#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72026 "Roads Management Setups"
{
    Caption = 'Roads Management Setup';
    DrillDownPageID = "Purchases & Payables Setup";
    LookupPageID = "Purchases & Payables Setup";

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Discount Posting"; Option)
        {
            Caption = 'Discount Posting';
            OptionCaption = 'No Discounts,Invoice Discounts,Line Discounts,All Discounts';
            OptionMembers = "No Discounts","Invoice Discounts","Line Discounts","All Discounts";
        }
        field(6; "Receipt on Invoice"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Receipt on Invoice';
        }
        field(7; "Invoice Rounding"; Boolean)
        {
            Caption = 'Invoice Rounding';
        }
        field(8; "Ext. Doc. No. Mandatory"; Boolean)
        {
            Caption = 'Ext. Doc. No. Mandatory';
            InitValue = true;
        }
        field(9; "Vendor Nos."; Code[20])
        {
            Caption = 'Vendor Nos.';
            TableRelation = "No. Series";
        }
        field(10; "Quote Nos."; Code[20])
        {
            Caption = 'Quote Nos.';
            TableRelation = "No. Series";
        }
        field(11; "Order Nos."; Code[20])
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Order Nos.';
            TableRelation = "No. Series";
        }
        field(12; "Invoice Nos."; Code[20])
        {
            Caption = 'Invoice Nos.';
            TableRelation = "No. Series";
        }
        field(13; "Posted Invoice Nos."; Code[20])
        {
            Caption = 'Posted Invoice Nos.';
            TableRelation = "No. Series";
        }
        field(14; "Credit Memo Nos."; Code[20])
        {
            Caption = 'Credit Memo Nos.';
            TableRelation = "No. Series";
        }
        field(15; "Posted Credit Memo Nos."; Code[20])
        {
            Caption = 'Posted Credit Memo Nos.';
            TableRelation = "No. Series";
        }
        field(16; "Posted Receipt Nos."; Code[20])
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Posted Receipt Nos.';
            TableRelation = "No. Series";
        }
        field(19; "Blanket Order Nos."; Code[20])
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Blanket Order Nos.';
            TableRelation = "No. Series";
        }
        field(20; "Calc. Inv. Discount"; Boolean)
        {
            AccessByPermission = TableData "Vendor Invoice Disc." = R;
            Caption = 'Calc. Inv. Discount';
        }
        field(21; "Appln. between Currencies"; Option)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Appln. between Currencies';
            OptionCaption = 'None,EMU,All';
            OptionMembers = "None",EMU,All;
        }
        field(22; "Copy Comments Blanket to Order"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Copy Comments Blanket to Order';
            InitValue = true;
        }
        field(23; "Copy Comments Order to Invoice"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Copy Comments Order to Invoice';
            InitValue = true;
        }
        field(24; "Copy Comments Order to Receipt"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Copy Comments Order to Receipt';
            InitValue = true;
        }
        field(25; "Allow VAT Difference"; Boolean)
        {
            Caption = 'Allow VAT Difference';
        }
        field(26; "Calc. Inv. Disc. per VAT ID"; Boolean)
        {
            Caption = 'Calc. Inv. Disc. per VAT ID';
        }
        field(27; "Posted Prepmt. Inv. Nos."; Code[20])
        {
            Caption = 'Posted Prepmt. Inv. Nos.';
            TableRelation = "No. Series";
        }
        field(28; "Posted Prepmt. Cr. Memo Nos."; Code[20])
        {
            Caption = 'Posted Prepmt. Cr. Memo Nos.';
            TableRelation = "No. Series";
        }
        field(29; "Check Prepmt. when Posting"; Boolean)
        {
            Caption = 'Check Prepmt. when Posting';
        }
        field(33; "Prepmt. Auto Update Frequency"; Option)
        {
            Caption = 'Prepmt. Auto Update Frequency';
            DataClassification = SystemMetadata;
            OptionCaption = 'Never,Daily,Weekly';
            OptionMembers = Never,Daily,Weekly;

            trigger OnValidate()
            var
                PrepaymentMgt: Codeunit "Prepayment Mgt.";
            begin
                if "Prepmt. Auto Update Frequency" = xRec."Prepmt. Auto Update Frequency" then
                    exit;

                PrepaymentMgt.CreateAndStartJobQueueEntryPurchase("Prepmt. Auto Update Frequency");
            end;
        }
        field(35; "Default Posting Date"; Option)
        {
            Caption = 'Default Posting Date';
            OptionCaption = 'Work Date,No Date';
            OptionMembers = "Work Date","No Date";
        }
        field(36; "Default Qty. to Receive"; Option)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Default Qty. to Receive';
            OptionCaption = 'Remainder,Blank';
            OptionMembers = Remainder,Blank;
        }
        field(37; "Archive Quotes and Orders"; Boolean)
        {
            Caption = 'Archive Quotes and Orders';
            ObsoleteReason = 'Replaced by new fields Archive Quotes and Archive Orders';
            ObsoleteState = Pending;
        }
        field(38; "Post with Job Queue"; Boolean)
        {
            Caption = 'Post with Job Queue';
        }
        field(39; "Job Queue Category Code"; Code[10])
        {
            Caption = 'Job Queue Category Code';
            TableRelation = "Job Queue Category";
        }
        field(40; "Job Queue Priority for Post"; Integer)
        {
            Caption = 'Job Queue Priority for Post';
            InitValue = 1000;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Job Queue Priority for Post" < 0 then
                    Error(Text001);
            end;
        }
        field(41; "Post & Print with Job Queue"; Boolean)
        {
            Caption = 'Post & Print with Job Queue';
        }
        field(42; "Job Q. Prio. for Post & Print"; Integer)
        {
            Caption = 'Job Q. Prio. for Post & Print';
            InitValue = 1000;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Job Queue Priority for Post" < 0 then
                    Error(Text001);
            end;
        }
        field(43; "Notify On Success"; Boolean)
        {
            Caption = 'Notify On Success';
        }
        field(46; "Allow Document Deletion Before"; Date)
        {
            Caption = 'Allow Document Deletion Before';
        }
        field(52; "Archive Quotes"; Option)
        {
            Caption = 'Archive Quotes';
            OptionCaption = 'Never,Question,Always';
            OptionMembers = Never,Question,Always;
        }
        field(53; "Archive Orders"; Boolean)
        {
            Caption = 'Archive Orders';
        }
        field(54; "Archive Blanket Orders"; Boolean)
        {
            Caption = 'Archive Blanket Orders';
        }
        field(55; "Archive Return Orders"; Boolean)
        {
            Caption = 'Archive Return Orders';
        }
        field(56; "Ignore Updated Addresses"; Boolean)
        {
            Caption = 'Ignore Updated Addresses';
        }
        field(57; "Create Item from Item No."; Boolean)
        {
            Caption = 'Create Item from Item No.';
        }
        field(58; "Copy Vendor Name to Entries"; Boolean)
        {
            // Caption = 'Copy Vendor Name to Entries';

            // trigger OnValidate()
            // var
            //     VendEntryEdit: Codeunit "Vend. Entry-Edit";
            // begin
            //     if "Copy Vendor Name to Entries" then
            //         //        VendEntryEdit.UpdateVendorNamesInLedgerEntries;
            //
            //     end;
            // }
            // field(170;
            //         "Insert Std. Purch. Lines Mode";
            //         Option)
            // {
            //     Caption = 'Insert Std. Purch. Lines Mode';
            //         DataClassification = SystemMetadata;
            //         ObsoleteReason = 'Not needed after refactoring';
            //         ObsoleteState = Pending;
            //         OptionCaption = 'Manual,Automatic,Always Ask';
            //         OptionMembers = Manual,Automatic,"Always Ask";
            // }
            //             field(171;
            //         "Insert Std. Lines on Quotes";
            //         Boolean)
            // {
            //     Caption = 'Insert Std. Lines on Quotes';
            //         DataClassification = SystemMetadata;
            //         ObsoleteReason = 'Not needed after refactoring';
            //         ObsoleteState = Pending;
            // }
            //             field(172;
            //         "Insert Std. Lines on Orders";
            //         Boolean)
            // {
            //     Caption = 'Insert Std. Lines on Orders';
            //         DataClassification = SystemMetadata;
            //         ObsoleteReason = 'Not needed after refactoring';
            //         ObsoleteState = Pending;
        }
        field(173; "Insert Std. Lines on Invoices"; Boolean)
        {
            Caption = 'Insert Std. Lines on Invoices';
            DataClassification = SystemMetadata;
            ObsoleteReason = 'Not needed after refactoring';
            ObsoleteState = Pending;
        }
        field(174; "Insert Std. Lines on Cr. Memos"; Boolean)
        {
            Caption = 'Insert Std. Lines on Cr. Memos';
            DataClassification = SystemMetadata;
            ObsoleteReason = 'Not needed after refactoring';
            ObsoleteState = Pending;
        }
        field(1217; "Debit Acc. for Non-Item Lines"; Code[20])
        {
            Caption = 'Debit Acc. for Non-Item Lines';
            TableRelation = "G/L Account" where("Direct Posting" = const(true),
                                                 "Account Type" = const(Posting),
                                                 Blocked = const(false));
        }
        field(1218; "Credit Acc. for Non-Item Lines"; Code[20])
        {
            Caption = 'Credit Acc. for Non-Item Lines';
            TableRelation = "G/L Account" where("Direct Posting" = const(true),
                                                 "Account Type" = const(Posting),
                                                 Blocked = const(false));
        }
        field(5800; "Posted Return Shpt. Nos."; Code[20])
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Posted Return Shpt. Nos.';
            TableRelation = "No. Series";
        }
        field(5801; "Copy Cmts Ret.Ord. to Ret.Shpt"; Boolean)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Copy Cmts Ret.Ord. to Ret.Shpt';
            InitValue = true;
        }
        field(5802; "Copy Cmts Ret.Ord. to Cr. Memo"; Boolean)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Copy Cmts Ret.Ord. to Cr. Memo';
            InitValue = true;
        }
        field(6600; "Return Order Nos."; Code[20])
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Return Order Nos.';
            TableRelation = "No. Series";
        }
        field(6601; "Return Shipment on Credit Memo"; Boolean)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Return Shipment on Credit Memo';
        }
        field(6602; "Exact Cost Reversing Mandatory"; Boolean)
        {
            Caption = 'Exact Cost Reversing Mandatory';
        }
        field(50001; "Requisition No"; Code[10])
        {
            Caption = 'Requisition No';
            TableRelation = "No. Series";
        }
        field(50002; "Quatation Request No"; Code[10])
        {
            Caption = 'Quatation Request No';
            TableRelation = "No. Series";
        }
        field(50003; "Stores Requisition No"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50004; "Max. Purchase Requisition"; Decimal)
        {
        }
        field(50005; "Tender Request No"; Code[10])
        {
            Caption = 'Tender Request No';
            TableRelation = "No. Series";
        }
        field(50006; "Stores Issue No"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50007; "Requisition Default Vendor"; Code[10])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                /*     Vendor.RESET;
                     IF Vendor.GET(xRec."Requisition Default Vendor") THEN BEGIN
                       Vendor."Requisition Default Vendor":=FALSE;
                       Vendor.MODIFY;
                     END;

                      Vendor.RESET;
                      IF Vendor.GET("Requisition Default Vendor") THEN BEGIN
                       Vendor."Requisition Default Vendor":=TRUE;
                       Vendor.MODIFY;
                     END;
                     */

            end;
        }
        field(50008; "Use Procurement Limits"; Boolean)
        {
        }
        field(50010; "Purchase Requisition Nos."; Code[10])
        {
            Caption = 'Purchase Requisition Nos.';
            TableRelation = "No. Series";
        }
        field(50011; "Archive Requisition on Quote"; Boolean)
        {
            Caption = 'Archive Requisition on Quote';
        }
        field(50012; "Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50013; "Store Req Item Jnl Template"; Code[10])
        {
            TableRelation = "Item Journal Template";
        }
        field(50014; "Store Req Item Jnl Batch"; Code[10])
        {
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("Store Req Item Jnl Template"));
        }
        field(50015; "Posted Inv. Revaln Template"; Code[10])
        {
            TableRelation = "Item Journal Template".Name where(Type = const(Revaluation));
        }
        field(50016; "Posted Inv. Revaln Batch"; Code[10])
        {
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("Posted Inv. Revaln Template"));
        }
        field(51000; "Inspection Before Posting?"; Boolean)
        {
        }
        field(56003; "PV Nos."; Code[10])
        {
            Caption = 'PV Nos.';
            TableRelation = "No. Series";
        }
        field(59001; "Procurement/Stores E-mail"; Text[100])
        {
        }
        field(59002; "PM E-mail"; Text[100])
        {
        }
        field(59003; "LPO Validity Period"; DateFormula)
        {
        }
        field(59004; "Quote Validity Period"; DateFormula)
        {
        }
        field(59005; "Store Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(59006; "Archive Store Requisition"; Boolean)
        {
        }
        field(59007; "Copy Remitance E-mail"; Boolean)
        {
        }
        field(59008; "Copy e-mail to User"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(59009; "EFT Mail Folder"; Text[250])
        {
        }
        field(59010; "Order Conditions"; Blob)
        {
            SubType = Memo;
        }
        field(59011; "LSO Nos."; Code[10])
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'LSO Nos.';
            TableRelation = "No. Series";
        }
        field(59012; "Transport Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(70000; "Procurement Class"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Procurement Classes".Code;
        }
        field(70001; "Procument Plan Nos"; Code[10])
        {
            Caption = 'Requisition No';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70002; "Request for Quotation Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70003; "Request for Proposals Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70004; "Tenders Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70005; "Expression of Interest Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70006; "Direct Prcmnt Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70007; "Low Value Prcmnt Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70008; "Specially Permitted Prcmnt Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70009; "Purchase Req No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70010; "Effective Procurement Plan"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(70011; "Appointment Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70012; "Contract Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70013; "Legal Dept Code"; Code[50])
        {
            Caption = 'Legal Department Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(70014; "Tender Documents Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70015; "RFP Documents Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70016; "RFQ Documents Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70018; "Direct Documents Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70019; "Inspection Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70020; "Current Year"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(70021; "Asset Disposal Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70022; "Special RFQ Prcmnt Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70023; "Road Feasibility Study  Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70024; "Environmental Studies Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70025; "Topographic Surveys Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70026; "Road Safety Audit Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70027; "Traffic Census Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Text001: label 'Job Queue Priority must be zero or positive.';
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Get;
        RecordHasBeenRead := true;
    end;

    procedure JobQueueActive(): Boolean
    begin
        Get;
        exit("Post with Job Queue" or "Post & Print with Job Queue");
    end;
}

