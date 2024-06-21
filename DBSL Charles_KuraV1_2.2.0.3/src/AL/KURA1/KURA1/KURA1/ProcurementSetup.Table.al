#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70060 "Procurement Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[30])
        {
            
        }
        field(2; "Procurement Class"; Code[20])
        {
            
            TableRelation = "Procurement Classes".Code;
        }
        field(3; "Procument Plan Nos"; Code[10])
        {
            Caption = 'Procument Plan Nos';
            
            TableRelation = "No. Series";
        }
        field(4; "Request for Quotation Nos."; Code[20])
        {
            
            Description = 'RFQ No. Series';
            TableRelation = "No. Series";
        }
        field(5; "Request for Proposals Nos."; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(6; "ITT No. Series"; Code[10])
        {
            
            Description = 'ITT No. Series';
            TableRelation = "No. Series";
        }
        field(7; "EOI No. Series"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(8; "Direct Prcmnt Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(9; "Low Value Purchase No. Series"; Code[20])
        {
            
            Description = 'Low Value Purchase No. Series';
            TableRelation = "No. Series";
        }
        field(10; "Specially Permitted Prcmnt Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(11; "Purchase Req No"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(70111; "Store Req No"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(12; "Effective Procurement Plan"; Code[10])
        {
            
            TableRelation = "Procurement Plan".Code;
        }
        field(13; "Standing Proc Committee  No."; Code[10])
        {
            
            Description = 'Standing Proc Committee  No. Series';
            TableRelation = "No. Series";
        }
        field(14; "Contract Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(15; "Legal Dept Code"; Code[50])
        {
            Caption = 'Legal Department Code';
            
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(16; "Tender Documents Path"; Text[250])
        {
            
        }
        field(17; "RFP Documents Path"; Text[250])
        {
            
        }
        field(18; "RFQ Documents Path"; Text[250])
        {
            
        }
        field(19; "Direct Documents Path"; Text[250])
        {
            
        }
        field(20; "IFS Tender Committee No."; Code[20])
        {
            
            Description = 'IFS Tender Committee Appointment No. Series';
            TableRelation = "No. Series";
        }
        field(21; "Current Year"; Code[20])
        {
            
            TableRelation = "G/L Budget Name";
        }
        field(22; "Asset Disposal Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(23; "Special RFQ Prcmnt Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(24; "Default Proc Email Contact"; Code[100])
        {
            
        }
        field(50224; "SuppRegistrationEmailContact"; Code[100])
        {
            
            Caption = 'Supplier Registration Email Contact';
        }
        field(25; "IFT Nos"; Code[100])
        {
            
            TableRelation = "No. Series";
        }
        field(26; "IFP Nos."; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(27; "Bid Req Template No. Series"; Code[10])
        {
            
            Description = 'Bid Req Template No. Series';
            TableRelation = "No. Series";
        }
        field(28; "Default IFP Bid Charge Code"; Code[20])
        {
            
            Description = 'Linked to Bid Charge Code Table. The default charge code is defined here; when the user raises an IFP, the system shall pick the default charge code and insert the amount to be charged for each setup of bid';
            TableRelation = "Bid Charges Schedule";
        }
        field(29; "Local Vendor Country Code"; Code[20])
        {
            
            Description = 'Country code that the system shall use to determine Local or Foreign Suppliers';
            TableRelation = "Country/Region";
        }
        field(30; "Display Scoring Criteria"; Boolean)
        {
            
            Description = 'When this is enabled, all Solicitation documents such as IFP, RFQ, RFP etc that have an assigned Scoring Template shall support access/display of the scoring criteria within the vendor portal';
        }
        field(31; "Default Bid Security %"; Decimal)
        {
            
            Description = 'It shall be used to compute the Bid Security under IFS';
            MaxValue = 100;
            MinValue = 0;
        }
        field(32; "Default Performance Security %"; Decimal)
        {
            
            Description = 'Default % for Performance Security that shall be picked on IFS';
            MaxValue = 100;
            MinValue = 0;
        }
        field(33; "Default Advance Pay Security %"; Decimal)
        {
            Caption = 'Default Advance Payment Security %';
            
            Description = 'Default % for Advance Payment Security that shall be picked on IFS';
            MaxValue = 100;
            MinValue = 0;
        }
        field(34; "Special Grp Bid Waiver"; Boolean)
        {
            Caption = 'Special Group Bid Security Waiver';
            
            Description = 'It shall be inherited as the default setup on all IFSs';
        }
        field(35; "Special Grp Performance Waiver"; Boolean)
        {
            Caption = 'Special Group Performance Security Waiver';
            
            Description = 'Used to indicate Performance security waiver rules for valid Special Group Vendors (e.g. Women, Youth, PWDs etc). The default setup is inherited across all the IFSs but the user can amend on a case by case basis';
        }
        field(36; "Tender Validity Duration"; Code[20])
        {
            Caption = 'Default Tender Validity Duration';
            
            Description = 'Default Tender Validity Duration that shall be picked by the IFS';
        }
        field(37; "Bid Security Validity(After)"; Code[20])
        {
            Caption = 'Bid Security Validity (After Tender Validity)';
            
            Description = 'Default duration for the extra days that all bid securities should include beyond the Tender validity period';
        }
        field(38; "Goods Supply Insurance Type"; Code[30])
        {
            Caption = 'Default Goods Supply Insurance Type';
            
            Description = 'Linked to Insurance Types Table. It is used to define the default Insurance Type that shall be picked by the IFS in case insurance policy cover is a requireemnt for all biddders';
            TableRelation = "Insurance Type".Code;
        }
        field(39; "Works Supply Insurance Type"; Code[30])
        {
            Caption = 'Default Works Supply Insurance Type';
            
            Description = 'Linked to Insurance Types Table. It is used to define the default Insurance Type that shall be picked by the IFS in case insurance policy cover is a requireemnt for all biddders';
            TableRelation = "Insurance Type".Code;
        }
        field(40; "Service Supply Insurance Type"; Code[30])
        {
            Caption = 'Default Services Supply Insurance Type';
            
            Description = 'Linked to Insurance Types Table. It is used to define the default Insurance Type that shall be picked by the IFS in case insurance policy cover is a requireemnt for all biddders';
            TableRelation = "Insurance Type".Code;
        }
        field(41; "Default Arbitrator Appointer"; Text[50])
        {
            
            Description = 'Details of the default Arbitrator who shall be cited in the IFS and contracts (Amendments can be done for specific transactions)';
        }
        field(42; "Infinite Bid Value Limit"; Decimal)
        {
            
            Description = 'Limit used during capping of Max Bid Value field on the Bid Score Criteria Line Table';
        }
        field(43; "YES Bid Rating Response Value"; Code[30])
        {
            Caption = 'Default YES Bid Rating Response Value';
            
            Description = 'Default YES Text that is suggested by the system for YES/NO Response values in the bid scoring criteria table. When an evaluator selects this value during the scoring process, the system shall assign the Default Yes Rating Score %';
        }
        field(44; "Default YES Bid Rating Score %"; Decimal)
        {
            
            Description = 'Default YES Bid Rating Score %';
            MaxValue = 100;
            MinValue = 0;
        }
        field(45; "NO Bid Rating Response Value"; Code[30])
        {
            
            Description = 'Default NO Text that is suggested by the system for YES/NO Response values in the bid scoring criteria table. When an evaluator selects this value during the scoring process, the system shall assign the Default NO Rating Score %';
        }
        field(46; "Default NO Bid Rating Score %"; Decimal)
        {
            
            MaxValue = 100;
            MinValue = 0;
        }
        field(47; "1-POOR Option Text Bid Score %"; Decimal)
        {
            
            Description = 'Default Score % that shall be assigned when an evaluator selects the POOR Response value during bid scoring';
            MaxValue = 100;
            MinValue = 0;
        }
        field(48; "2-FAIR Option Text Bid Score %"; Decimal)
        {
            
            MaxValue = 100;
            MinValue = 0;
        }
        field(49; "3-GOOD Option Text Bid Score %"; Decimal)
        {
            
            MaxValue = 100;
            MinValue = 0;
        }
        field(50; "4-VERY GOOD  Text Bid Score %"; Decimal)
        {
            Caption = '4-VERY GOOD Option Text Bid Score %';
            
            MaxValue = 100;
            MinValue = 0;
        }
        field(51; "5-EXCELLENT Text Bid Score %"; Decimal)
        {
            Caption = '5-EXCELLENT Option Text Bid Score %';
            
            MaxValue = 100;
            MinValue = 0;
        }
        field(52; "Vendor Debarment No. series"; Code[10])
        {
            
            Description = 'r Debarment & Vendor Reinstatement Voucher No. Series';
            TableRelation = "No. Series";
        }
        field(53; "Vendor Reinstatement Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(54; "Project Key Staff Temp Nos"; Code[10])
        {
            
            Description = 'Project Key Staff Template No. Series i';
            TableRelation = "No. Series";
        }
        field(55; "IFS Prebid Register"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(56; "Supplier Appraisal Template No"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(57; "Request For Registration Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(58; "Default Procurement Template"; Code[20])
        {
            
            TableRelation = "Procurement Document Template"."Template ID";
        }
        field(59; "IFP Response Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(60; "EOI Response Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(61; "Prequalification Score Header"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(62; "Tender Addendum Notice"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(63; "Default Tender Addendum Type"; Code[50])
        {
            
            TableRelation = "Tender Addendum Type".Code;
        }
        field(64; "Default PRN Conversion Proc"; Option)
        {
            Caption = 'Default PRN Conversion Procedure';
            
            Description = 'Default PRN Conversion Procedure';
            OptionCaption = 'Invitation For Supply,Direct PO';
            OptionMembers = "Invitation For Supply","Direct PO";
        }
        field(65; "Default IFS Bid Charge Code"; Code[20])
        {
            
            Description = 'Linked to Bid Charge Code Table. The default charge code is defined here; when the user raises an IFP, the system shall pick the default charge code and insert the amount to be charged for each setup of bid';
            TableRelation = "Bid Charges Schedule";
        }
        field(66; "Default Single Stage Tender"; Code[20])
        {
            Caption = 'Default Single Stage Tender Validity Duration';
            
            Description = 'Default Single Stage Tender Validity Duration';
        }
        field(67; "Default Two Stage Tender valid"; Code[20])
        {
            Caption = 'Default Two Stage Tender Validity Duration';
            
            Description = 'Default Two Stage Tender Validity Duration';
        }
        field(68; "Default RFQ Validity Duration"; Code[20])
        {
            
        }
        field(69; "Default LVP Validity Duration"; Code[20])
        {
            
            Description = 'Default Low  Value Procurement Validity Duration';
        }
        field(70; "Award Acceptance Deadline"; Code[20])
        {
            Caption = 'Award Acceptance Deadline Duration';
            
            Description = 'Award Acceptance Deadline Duration';
        }
        field(71; "Min. Contract Holding Duration"; Code[20])
        {
            Caption = 'Min. Contract Holding/Standstill Duration';
            
            Description = 'Min. Contract Holding/Standstill Duration';
        }
        field(72; "Procurement Appeal Review"; Code[20])
        {
            Caption = 'Procurement Appeal Review Board No.';
            
            Description = 'Procurement Appeal Review Board No.';
            TableRelation = Contact."No.";
        }
        field(73; "Enforce Strict Proc Budget che"; Boolean)
        {
            Caption = 'Enforce Strict Procurement Budget Checks';
            
            Description = 'Enforce Strict Procurement Budget Checks';
        }
        field(74; "Back Alert on PRN Approval"; Boolean)
        {
            Caption = 'Back Alert on PRN Final Approval';
            
            Description = 'Back Alert on PRN Final Approval';
        }
        field(75; "Back Alert on IFS Creation"; Boolean)
        {
            
        }
        field(76; "Default Language Code"; Code[30])
        {
            
            TableRelation = Language;
        }
        field(77; "Tender Cancellation Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(78; "Default Tender Evaluation Peri"; Code[20])
        {
            Caption = 'Default Tender Evaluation Period';
            
        }
        field(79; "Bid Opening Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(80; "Notify Committe Members"; Boolean)
        {
            
        }
        field(81; "Final Evaluation Report Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(82; "Proffesional Opinion Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(83; "Notice of Award"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(84; "Bid Security Claim Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }

        field(85; "Bid Security Returned Nos"; Code[10])
        {
            
            TableRelation = "No. Series";
        }
        field(86; "Default General Product PG"; Code[10])
        {
            
            TableRelation = "Gen. Business Posting Group";
        }
        field(87; "Default Vendor PG"; Code[10])
        {
            
            TableRelation = "Vendor Posting Group";
        }
        field(88; "SharePoint Site Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(89; "SharePoint Site Domain Name"; Text[100])
        {
            
        }
        field(90; "SharePoint Site UserName"; Text[100])
        {
            
        }
        field(91; "SharePoint Site Password"; Text[100])
        {
            
            ExtendedDatatype = Masked;
        }
        field(92; "PRN(Goods & Services) DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(93; "PRN(Works) DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(94; "IFS DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(95; "RFQ DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(96; "IFS Tender Comm. DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(97; "Tender Addendum DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(98; "IFS Bid Response DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(99; "Evaluation Report DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(100; "Professional Opinion DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(101; "Notice of Award DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(102; "Standard Contract DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(103; "Inspection DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(104; "LPO/LSO DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(105; "Framework Contracts DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(106; "Vendor Card DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(107; "IFP(Prequalification) DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(108; "RFI Response DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(109; "Procurement Laws DMS Link"; Text[100])
        {
            
            ExtendedDatatype = URL;
        }
        field(110; "SharePoint Document Library"; Text[100])
        {
            
        }
        field(111; "SharePoint Site Main Library"; Text[100])
        {
            
        }
        field(112; "Tender Opening Reg DMS Link"; Text[100])
        {
            
        }
        field(113; "Direct Vendor Profile"; Boolean)
        {
            
        }
        field(114; "Procurement Manual DMS Link"; Text[100])
        {
            
        }
        field(115; "Procurement Circular DMS Link"; Text[100])
        {
            
        }
        field(116; "IFP Opening Register Nos"; Code[10])
        {
            
            TableRelation = "No. Series".Code;
        }
        field(117; "Vendor Registration Invite Nos"; Code[10])
        {
            
            TableRelation = "No. Series".Code;
        }
        field(118; "Order Conditions"; Blob)
        {
            
            SubType = Memo;
        }
        field(119; "Procurement Link"; Text[250])
        {
            
            ExtendedDatatype = URL;
        }
        field(120; "Terms and Conditions"; Text[430])
        {
            
        }
        field(121; "External Supplier Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(122; "Tender Clarification Nos"; Code[30])
        {
            
            TableRelation = "No. Series".Code;
        }
        field(123; "Disposal Plan Nos"; Code[30])
        {
            
            TableRelation = "No. Series".Code;
        }
        field(124; "Functional Disposal Plan Nos"; Code[30])
        {
            
            TableRelation = "No. Series".Code;
        }
        field(125; "Disposal Requisition Nos"; Code[30])
        {
            
            TableRelation = "No. Series".Code;
        }
        field(126; "RFQ Nos"; Code[30])
        {
            
            TableRelation = "No. Series".Code;
        }
        field(127; "Request for PCsumExpensing Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(128; "PC Evaluation Report Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(129; "Vendor Appraisal Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
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

