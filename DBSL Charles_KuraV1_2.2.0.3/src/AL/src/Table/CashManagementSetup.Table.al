#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57004 "Cash Management Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; "Payment Voucher Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(3; "Imprest Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(4; "Imprest Surrender Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(5; "PCASH Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(6; "Receipt Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(7; "Post VAT"; Boolean)
        {
        }
        field(8; "Rounding Type"; Option)
        {
            OptionCaption = 'Up,Nearest,Down';
            OptionMembers = Up,Nearest,Down;
        }
        field(9; "Rounding Precision"; Decimal)
        {
        }
        field(10; "Imprest Limit"; Decimal)
        {
        }
        field(11; "Imprest Due Date"; DateFormula)
        {
        }
        field(12; "PV Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(13; "Petty Cash Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(14; "Imprest Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(15; "Current Budget"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(16; "Current Budget Start Date"; Date)
        {
        }
        field(17; "Current Budget End Date"; Date)
        {
        }
        field(18; "Imprest Posting Group"; Code[20])
        {
            TableRelation = "Customer Posting Group";
        }
        field(19; "General Bus. Posting Group"; Code[20])
        {
            TableRelation = "Gen. Business Posting Group";
        }
        field(20; "VAT Bus. Posting Group"; Code[20])
        {
            TableRelation = "VAT Business Posting Group";
        }
        field(21; "Check for Committment"; Boolean)
        {
        }
        field(22; "Imprest Memo Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(23; "Imprest Surrender Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(24; "Bank Transfer Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(25; "Receipt Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(26; "Petty Cash Surrender Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(27; "Receipt Batch Name"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Receipt Template"));
        }
        field(28; "AIE Nos."; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(29; "Cash Request Nos."; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(30; "Bill Discounting Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(56000; "PV Journal Template"; Code[10])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56001; "PV Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("PV Journal Template"));
        }
        field(56002; "PCASH Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("PCASH Journal Template"));
        }
        field(56003; "IMPREST Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Imprest Journal Template"));
        }
        field(56004; "IMPREST SUR Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Imprest Surrender Template"));
        }
        field(56005; "Bank TR Journal Template"; Code[10])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56006; "Bank TR Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("PV Journal Template"));
        }
        field(56007; "Fuel Market Price"; Decimal)
        {
        }
        field(56008; "Imprest Surr Memo Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(56009; "EFT Header Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(56010; "EFT Details Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(56011; "Staff Claim Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(56012; "Staff Claim Journal Batch Name"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Staff Claim Journal Template"));
        }
        field(56013; "Staff Claim Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56014; "Lock Imprest Application"; Boolean)
        {
        }
        field(56015; "Send Email Notification"; Boolean)
        {
        }
        field(56016; "Imprest Email"; Text[100])
        {
        }
        field(56017; "Standing Imprest Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(56018; "Standing Imp Journal Template"; Code[20])
        {
            
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56019; "StandingImp Journal Batch Name"; Code[20])
        {
            
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Standing Imp Journal Template"));
        }
        field(56020; "Salary Advance Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(56021; "Salary Adv Journal Template"; Code[20])
        {
            
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56022; "Salary Adv Journal Batch Name"; Code[20])
        {
            
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("PV Journal Template"));
        }
        field(56024; "Gen. Prod. Posting Group"; Code[20])
        {
            
            TableRelation = "Gen. Product Posting Group".Code;
        }
        field(56025; "VAT. Prod. Posting Group"; Code[20])
        {
            
            TableRelation = "VAT Product Posting Group";
        }
        field(57000; "PV Reversal Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(57001; "Petty Cash Reversal Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(57002; "Imprest Reversal Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(57003; "Bank Transfer Reversal Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(57004; "Receipt Reversal Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(57005; "Imprest Surrender Reversal Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(57006; "Imprest Surr Memo Reversal Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(57007; "Staff Claim Reversal Nos."; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(57008; "Standing Imprest Reversal Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(57009; "Salary Advance Reversal Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(57010; "Standing Imprest Surrender Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(57011; "AIE Requisition Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(57012; "Send AIE e-Notification"; Boolean)
        {
            
        }
        field(57013; "AIE Inter Fund Bank Account"; Code[20])
        {
            
            TableRelation = "Bank Account"."No.";
        }
        field(57014; "AIE Funds Transfer Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(57015; "Mpesa Settlement Account"; Code[20])
        {
            
            TableRelation = "G/L Account"."No.";
        }
        field(57016; "Advance Payment G/L Account"; Code[20])
        {
            
            TableRelation = "G/L Account"."No.";
        }
        field(57017; "Imprest Memo DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57018; "Imprest Requisition DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57019; "Imprest Surrender DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57020; "Payment Voucher DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57021; "Petty Cash Voucher DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57022; "Petty Cash Surrender DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57023; "Inter Bank Transfer DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57024; "Receipts DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57025; "Staff Claims DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57026; "Inter Fund Transfers DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57027; "Direct Income Voucher DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57028; "AIE EDMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57029; "SharePoint Site Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57030; "SharePoint Site UserName"; Text[100])
        {
            
        }
        field(57031; "SharePoint Site Password"; Text[100])
        {
            
            ExtendedDatatype = Masked;
        }
        field(57032; "SharePoint Site Domain Name"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57033; "SharePoint Site Main Library"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57034; "SharePoint Document Library"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57035; "Sharepoint Shared Folder"; Text[100])
        {
            
        }
        field(57036; "Retention Account"; Code[20])
        {
            
            TableRelation = Vendor."No.";
        }
        field(57037; "Petty Cash Surrender Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(57038; "ICT Helpdesk Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57041; "Agency Notice Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(57042; "Fleet Requisition DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57043; "Last Transaction No Used"; BigInteger)
        {
            
            MaxValue = 9999999;
            MinValue = 2322372;

            trigger OnValidate()
            begin
                if "Last Transaction No Used" <= 2322374 then
                    Error('Please enter a number greater than the last used number');
            end;
        }
        field(57044; "Vacancy Announcement  DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(57045; "Post PV with Taxes"; Boolean)
        {
            
        }
        field(57046; "Archive Requisitions"; Boolean)
        {
            
        }
        field(57047; "Days To Archive Requisition"; Integer)
        {
            
        }
        field(57048; "Retention Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
       
         field(57049; "Retention Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
         field(57050; "Retention Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Retention Journal Template"));
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
}

