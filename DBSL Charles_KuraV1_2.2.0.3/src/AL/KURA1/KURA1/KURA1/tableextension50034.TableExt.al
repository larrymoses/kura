#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50034 "tableextension50034" extends "Standard Vendor Purchase Code"
{
    fields
    {
        modify("Vendor No.")
        {
            TableRelation = if ("Supplier Type" = const("Prequalified Supplier")) "Vendor Prequalification Entry"."Vendor No." where("Procurement Category Code" = field("Procurement Category"))
            else
            if ("Supplier Type" = const("Registered Supplier")) "Vendor Registration Entry"."Vendor No." where("Procurement Category Code" = field("Procurement Category"))
            else
            if ("Supplier Type" = const("External Supplier")) "Vendor External  Entry"."Vendor No." where("Procurement Category Code" = field("Procurement Category"));


            trigger OnAfterValidate()
            begin

                Vend.RESET;
                Vend.SETRANGE("No.", "Vendor No.");
                IF Vend.FINDfirst() THEN BEGIN
                    Vend.TESTFIELD("E-Mail");
                    "Vendor Name" := Vend.Name;
                    "Primary Email" := Vend."E-Mail";
                END;

                IF "Code" = '' THEN
                    //      EXIT;
                    //   StdPurchCode.GET(Code);
                    //  Description := StdPurchCode.Description;
                    "IFS Code" := Code;

            end;

        }
        modify(Code)
        {
            trigger OnAfterValidate()
            var
            StandardPurchaseCode: Record "Standard Purchase Code";
            begin
                StandardPurchaseCode.Reset();
                StandardPurchaseCode.SetRange(Code,Rec.Code);
                if StandardPurchaseCode.FindFirst() then begin
                    Rec.Validate("Supplier Type", StandardPurchaseCode."Supplier Type");
                Rec.Validate("Procurement Category",StandardPurchaseCode."Procurement Category ID");
                end;
            end;
        }

        field(19; "IFS Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(20; "Bid No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Vendor Name"; Text[100])
        {
        }
        field(22; "Primary Email"; Text[80])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Vendor.Primary Email (It shall be used for vendor communications during the bidding process)';
        }
        field(23; "Positive Intent To Bid"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'This field is updated based on the invited bidder''s acknowledgement of their intent to participate in the IFS';
        }
        field(24; "Invitation Email Sent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Date/Time Notified"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "No. of Posted Addendum Notices"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; "Posted Addendum Notice No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Last Posted Addendum Notice No.';
        }
        field(28; "Bid Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(29; "Sealed Bids (Technical)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Sealed Bids (Financial)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Prebid Register No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Prebid Register".Code;
        }
        field(32; "Prebid Meeting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Bid Opening Register No."; Code[10])
        {
            Caption = 'Bid Opening Register No.  (Technical)';
            DataClassification = ToBeClassified;
            Description = 'Bid Opening Register No.  (Technical)';
            TableRelation = "Bid Opening Register".Code;
        }
        field(34; "Bid Opening Date (Technical)"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Late Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Withdrawn Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Bid Withdrawal Notice No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Modified Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Bid Opening Result"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Bid Opening Committee Remarks"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Preliminary Evaluation Reg"; Code[20])
        {
            Caption = 'Preliminary Evaluation Register No.';
            DataClassification = ToBeClassified;
            Description = 'Preliminary Evaluation Register No.';
        }
        field(42; "Preliminary Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Preliminary Evaluation Outcome"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Preminary Evaluation Committee"; Text[100])
        {
            Caption = 'Evaluation Committee Remarks (Preminary Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Preminary Evaluation)';
        }
        field(45; "Technical Evaluation Reg"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Technical Evaluation Register No.';
        }
        field(46; "Technical Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Min Weighted Tech Pass Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Minimum Weighted Tech Pass Score %';
        }
        field(48; "Weighted Technical  Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Technical Evaluation  Outcome"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Evaluation Committee Rem"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Technical Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Technical Evaluation)';
        }
        field(51; "Technical Evaluation Committee"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(52; "Bid Opening Finance Register"; Code[20])
        {
            Caption = 'Bid Opening Register No.  (Financial)';
            DataClassification = ToBeClassified;
            Description = 'Bid Opening Register No.  (Financial)';
        }
        field(53; "Bid Opening Date (Financial)"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(54; "Financial Eval Register No"; Code[20])
        {
            Caption = 'Financial Evaluation Register No';
            DataClassification = ToBeClassified;
            Description = 'Financial Evaluation Register No';
        }
        field(55; "Financial Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(56; "Read-out Bid Price (A)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(57; "Arithmetic Corrections (B)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Corrected Bid Price (C=A+B)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59; "Unconditional Discount % (D)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Unconditional Disc Amount (E)"; Decimal)
        {
            Caption = 'Unconditional Discount Amount (E)';
            DataClassification = ToBeClassified;
            Description = 'Unconditional Discount Amount (E)';
        }
        field(61; "Corrected & Disc Bid Price"; Decimal)
        {
            Caption = 'Corrected & Discounted Bid Price (F=C-E)';
            DataClassification = ToBeClassified;
            Description = 'Corrected & Discounted Bid Price (F=C-E)';
        }
        field(62; "Any Additional Adjustments (G)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(63; "Any Priced Deviations (H))"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Final Evaluated Bid Price"; Decimal)
        {
            Caption = 'Final Evaluated Bid Price (I=F+G+H)';
            DataClassification = ToBeClassified;
            Description = 'Final Evaluated Bid Price (I=F+G+H)';
        }
        field(66; "Weighted Financial Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(67; "Financial Evaluation Ranking"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(68; "Financial Evaluation Comm Rem"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Financial Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Financial Evaluation)';
        }
        field(69; "Aggregate Weighted Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70; "Evaluation Committee Recomm"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Recommendation';
            OptionCaption = ',Award,Unsuccesful';
            OptionMembers = ,Award,Unsuccesful;
        }
        field(71; "Final Evaluation Report"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(72; "Final Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(73; "Professional Opion ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Tabulation Header".Code;
        }
        field(74; "Professional Opion Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(75; "Due Dilgence Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(76; "Due Diligence Rating"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Due Diligence Assessment Rating';
        }
        field(77; "Due Diligence Report ID"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(78; "Due Diligence Voucher"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(79; "Supplier Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Prequalified Supplier,Registered Supplier,External Supplier';
            OptionMembers = " ","Prequalified Supplier","Registered Supplier","External Supplier";
        }
        field(80; "Procurement Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code where(Blocked = const(false));
            trigger OnValidate()
            var
                ProcurementCategory: Record "Procurement Category";
            begin
                if ProcurementCategory.Get("Procurement Category") then
                    Description := ProcurementCategory.Description;
            end;
        }
        field(81; "Passed Tech Evaluation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(82; "Passed Preliminary  Evaluation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(83; "Responsive Bid"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(84; "Tech Evaluation Ranking"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(85; "Valid Bid Security Provided"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Entries suggested from Bid Tender Security Table';
        }
        field(86; "Bid Security Issuer"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Entries suggested from Bid Tender Security Table';
        }
        field(87; "Bid Security Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Entries suggested from Bid Tender Security Table';
        }
        field(88; "Bid Security Amount Pass"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Uneditable field where the system checks whether the submitted bid meets the Bid amount requirements. If bid amount submitted is less than the expected amount, the system shall mark this entry as Fail';
        }
        field(89; "Complete Bid Doc Submitted"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Completenesss is checked in terms of No. of copies submitted, Separation of proposals etc';
        }
        field(90; "Late Bid Submission Time"; Time)
        {
            DataClassification = ToBeClassified;
            Description = 'This field is only completed for bids marked as LATE.';
        }
        field(91; "Bid Opening Ranking"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(92; "Assigned Bid No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(93; "Bid Sum 1(LCY)"; Decimal)
        {
        }
        field(94; "Bid Sum 2(LCY)"; Decimal)
        {
        }
        field(95; Responded; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(96; "Supplier No."; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Supplier Type" = const("Prequalified Supplier")) "Vendor Prequalification Entry"."Vendor No." where("Procurement Category Code" = field("Procurement Category"))
            else
            if ("Supplier Type" = const("Registered Supplier")) "Vendor Registration Entry"."Vendor No." where("Procurement Category Code" = field("Procurement Category"))
            else
            if ("Supplier Type" = const("External Supplier")) "Vendor External  Entry"."Vendor No." where("Procurement Category Code" = field("Procurement Category"));

            trigger OnLookup()
            var
                IFSVendorCategory: Record "IFS Restricted Vendor Category";
                PrequalifiedSupplier: Record "Vendor Prequalification Entry";
                RegisteredSupplier: Record "Vendor Registration Entry";
                ExternalSupplier: Record "Vendor External  Entry";
                StandardPurchaseCode: Record "Standard Purchase Code";
            begin
                IFSVendorCategory.Reset();
                IFSVendorCategory.SetRange("Document No", Rec.Code);
                if IFSVendorCategory.FindSet() then begin
                    case "Supplier Type" OF
                        "Supplier Type"::"External Supplier":
                            begin
                                ExternalSupplier.Reset();
                                ExternalSupplier.SetRange("Procurement Category Code", "Procurement Category");
                                ExternalSupplier.SetRange("Special Vendor Category", IFSVendorCategory."Restricted Vendor Category ID");
                                StandardPurchaseCode.Reset();
                                StandardPurchaseCode.SetRange(Code, Rec.Code);
                                if StandardPurchaseCode.FindFirst() then
                                    ExternalSupplier.SetRange(Region, StandardPurchaseCode."Requesting Region");
                                if Page.RunModal(Page::"Vendor External  Entries", ExternalSupplier) = Action::LookupOK then begin
                                    Validate("Supplier No.", ExternalSupplier."Vendor No.");
                                end;
                            end;
                        "Supplier Type"::"Prequalified Supplier":
                            begin
                                PrequalifiedSupplier.Reset();
                                PrequalifiedSupplier.SetRange("Procurement Category Code", "Procurement Category");
                                PrequalifiedSupplier.SetRange("Special Vendor Category", IFSVendorCategory."Restricted Vendor Category ID");
                                StandardPurchaseCode.Reset();
                                StandardPurchaseCode.SetRange(Code, Rec.Code);
                                if StandardPurchaseCode.FindFirst() then
                                    PrequalifiedSupplier.SetRange(Region, StandardPurchaseCode."Requesting Region");
                                if Page.RunModal(Page::"Vendor Prequalification Entry", PrequalifiedSupplier) = Action::LookupOK then begin
                                    Validate("Supplier No.", PrequalifiedSupplier."Vendor No.");
                                end;
                            end;
                        "Supplier Type"::"Registered Supplier":
                            begin
                                RegisteredSupplier.Reset();
                                RegisteredSupplier.SetRange("Procurement Category Code", "Procurement Category");
                                RegisteredSupplier.SetRange("Special Vendor Category", IFSVendorCategory."Restricted Vendor Category ID");
                                StandardPurchaseCode.Reset();
                                StandardPurchaseCode.SetRange(Code, Rec.Code);
                                if StandardPurchaseCode.FindFirst() then
                                    RegisteredSupplier.SetRange(Region, StandardPurchaseCode."Requesting Region");
                                if Page.RunModal(Page::"Vendor Registration Entries", RegisteredSupplier) = Action::LookupOK then begin
                                    Validate("Supplier No.", RegisteredSupplier."Vendor No.");
                                end;
                            end;

                    end;
                end else begin
                    case "Supplier Type" OF
                        "Supplier Type"::"External Supplier":
                            begin
                                ExternalSupplier.Reset();
                                ExternalSupplier.SetRange("Procurement Category Code", "Procurement Category");
                                StandardPurchaseCode.Reset();
                                StandardPurchaseCode.SetRange(Code, Rec.Code);
                                if StandardPurchaseCode.FindFirst() then
                                    ExternalSupplier.SetRange(Region, StandardPurchaseCode."Requesting Region");
                                if Page.RunModal(Page::"Vendor External  Entries", ExternalSupplier) = Action::LookupOK then begin
                                    Validate("Supplier No.", ExternalSupplier."Vendor No.");
                                end;
                            end;
                        "Supplier Type"::"Prequalified Supplier":
                            begin
                                PrequalifiedSupplier.Reset();
                                PrequalifiedSupplier.SetRange("Procurement Category Code", "Procurement Category");
                                StandardPurchaseCode.Reset();
                                StandardPurchaseCode.SetRange(Code, Rec.Code);
                                if StandardPurchaseCode.FindFirst() then
                                    PrequalifiedSupplier.SetRange(Region, StandardPurchaseCode."Requesting Region");
                                if Page.RunModal(Page::"Vendor Prequalification Entry", PrequalifiedSupplier) = Action::LookupOK then begin
                                    Validate("Supplier No.", PrequalifiedSupplier."Vendor No.");
                                end;
                            end;
                        "Supplier Type"::"Registered Supplier":
                            begin
                                RegisteredSupplier.Reset();
                                RegisteredSupplier.SetRange("Procurement Category Code", "Procurement Category");
                                StandardPurchaseCode.Reset();
                                StandardPurchaseCode.SetRange(Code, Rec.Code);
                                if StandardPurchaseCode.FindFirst() then
                                    RegisteredSupplier.SetRange(Region, StandardPurchaseCode."Requesting Region");
                                if Page.RunModal(Page::"Vendor Registration Entries", RegisteredSupplier) = Action::LookupOK then begin
                                    Validate("Supplier No.", RegisteredSupplier."Vendor No.");
                                end;
                            end;

                    end;
                end;
            end;
            trigger OnValidate()
            begin

                Vend.RESET;
                Vend.SETRANGE("No.", "Supplier No.");
                IF Vend.FindFirst() THEN BEGIN
                    Vend.TESTFIELD("E-Mail");
                    Rec.Validate("Vendor No.", "Supplier No.");
                    "Vendor Name" := Vend.Name;
                    "Primary Email" := Vend."E-Mail";

                END;

                IF rec."Code" = '' THEN
                    //   CC  //     EXIT;
                    // StdPurchCode.GET(Code);
                    //   Description := StdPurchCode.Description;
                    "IFS Code" := rec.Code;

            end;

        }
    }

    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Vendor No.",Code(Key)".
        // 
        // key(Key1;"Vendor No.","Code","Procurement Category","Supplier Type")
        // {
        // Clustered = true;
        // }
    }
    trigger OnInsert()
    var
        StandardPurchaseCode: Record "Standard Purchase Code";
    begin
        StandardPurchaseCode.Reset();
        StandardPurchaseCode.SetRange(Code, Rec.Code);
        if StandardPurchaseCode.FindFirst() then begin
            Rec.Validate("Supplier Type", StandardPurchaseCode."Supplier Type");
            Rec.Validate("Procurement Category", StandardPurchaseCode."Procurement Category ID");
        end;

    end;

    var
        Vend: Record Vendor;
        StdPurchCode: Record 175;
}

