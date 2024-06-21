#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72311 "Insurance/Guarantee Header"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            
            Editable = false;
        }
        field(2; "Document Type"; Option)
        {
            
            Editable = false;
            OptionCaption = ' ,Insurance Of Works,Advance Payment Guarantee,Performance Guarantee,Professional Indemnity';
            OptionMembers = " ","Insurance Of Works","Advance Payment Guarantee","Performance Guarantee","Professional Indemnity";

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::"Advance Payment Guarantee" then
                    "Security Type" := "security type"::"Advance Payment Security"
                else

                    if "Document Type" = "document type"::"Performance Guarantee" then
                        "Security Type" := "security type"::"Performance/Contract Security"
                    else

                        if "Document Type" = "document type"::"Insurance Of Works" then
                            "Security Type" := "security type"::" ";
            end;
        }
        field(3; "Document Date"; Date)
        {
            
            Editable = false;
        }
        field(4; "Contractor ID"; Code[20])
        {
            
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if Vendor.Get("Contractor ID") then
                    "Contractor Name" := Vendor.Name;
            end;
        }
        field(5; "Contractor Name"; Text[250])
        {
            
            Editable = false;
        }
        field(6; "Project ID"; Code[20])
        {
            
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                if Job.Get("Project ID") then begin
                    "Project Name" := Job.Description;
                    "Contractor ID" := Job."Contractor No.";
                    Validate("Contractor ID");
                end;

                Description := Format("Document Type") + ' - ' + "Project Name";
            end;
        }
        field(7; "Project Name"; Text[250])
        {
            
            Editable = false;
        }
        field(8; Status; Enum "App Status")
        {
            
            Editable = false;
            // OptionCaption = Open,Pending Approval,Approved';
            // OptionMembers = Open,"Pending Approval",Approved;
        }
        field(9; "Insurer/Guarantor Name"; Text[250])
        {
            
        }
        field(10; "Policy/Guarantee No"; Code[100])
        {
            
        }
        field(11; "Expiry Date"; Date)
        {
            

            trigger OnValidate()
            begin
                "Expiry Notification Date" := CalcDate('-3M', "Expiry Date");
                "Second Expiry Notification Dat" := CalcDate('-1M', "Expiry Date");
            end;
        }
        field(12; "Effective Date"; Date)
        {
            
        }
        field(13; "Expiry Notification Date"; Date)
        {
            
            Editable = false;
        }
        field(14; Description; Text[2048])
        {
            
        }
        field(15; "Amount Insured/Guaranteed"; Decimal)
        {
            

            trigger OnValidate()
            begin
                if "Revision Type" = "revision type"::Revision then
                    Error('Please ammend the %1 instead.', FieldCaption("Revised Guaranteed Amount"));
            end;
        }
        field(16; Blocked; Boolean)
        {
            
            Editable = false;
        }
        field(17; Expired; Boolean)
        {
            
            Editable = false;
        }
        field(18; "No. Series"; Code[20])
        {
            
        }
        field(19; "Created By"; Code[100])
        {
            
            Editable = false;
        }
        field(20; "Created DateTime"; DateTime)
        {
            
            Editable = false;
        }
        field(21; "Purchase Contract ID"; Code[20])
        {
            
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Purchase Contract ID");
                if PurchaseHeader.FindSet then begin
                    "PRN No" := PurchaseHeader."Requisition No";
                    "IFS Code" := PurchaseHeader."IFS Code";
                    ProcurementSetup.Get;
                    DocTemplateLine.Reset;
                    DocTemplateLine.SetRange("Template ID", ProcurementSetup."Default Procurement Template");
                    DocTemplateLine.SetRange("Procurement Process", DocTemplateLine."procurement process"::"Contract Issuance");
                    if DocTemplateLine.FindSet then begin
                        repeat
                            ContractIssuanceDocs.Init;
                            ContractIssuanceDocs."Document ID" := "Document No.";
                            ContractIssuanceDocs."Process Area" := ContractIssuanceDocs."process area"::"Contract Issuance";
                            ContractIssuanceDocs."Procurement Document Type" := DocTemplateLine."Procurement Document Type";
                            ContractIssuanceDocs.Description := DocTemplateLine.Description;
                            ContractIssuanceDocs."Requirement Type" := DocTemplateLine."Requirement Type";
                            ContractIssuanceDocs."Track Certificate Expiry" := DocTemplateLine."Track Certificate Expiry";
                            ContractIssuanceDocs."Guidelines/Instruction" := DocTemplateLine."Guidelines/Instruction";
                            ContractIssuanceDocs."Contract ID" := "Purchase Contract ID";
                            ContractIssuanceDocs."Contract Index" := DocTemplateLine."Contract Index";
                            ContractIssuanceDocs."PRN No" := "PRN No";
                            ContractIssuanceDocs."IFS Code" := "IFS Code";
                            ContractIssuanceDocs.Insert(true);
                        until DocTemplateLine.Next = 0;
                    end;
                    "Project ID" := PurchaseHeader.Job;
                    Validate("Project ID");
                    "Contractor ID" := PurchaseHeader."Buy-from Vendor No.";
                    Validate("Contractor ID");
                end;
            end;
        }
        field(22; "Form of Security"; Code[100])
        {
            Caption = 'Form of Security';
            
            Description = 'Submitted Bid Security Form/Type';
            TableRelation = if ("Document Type" = filter("Advance Payment Guarantee")) "Tender Security Types".Code where("Security Type" = filter("Advance Payment Security"))
            else
            if ("Document Type" = filter("Performance Guarantee")) "Tender Security Types".Code where("Security Type" = filter("Performance/Contract Security"));

            trigger OnValidate()
            var
                IFSSECURITY: RECORD "IFS Securities";
            begin
                IfsSecurity.RESET;
                IfsSecurity.SETRANGE("Form of Security", "Form of Security");
                IF IfsSecurity.FINDSET THEN BEGIN
                    "Security Type" := IfsSecurity."Security Type";
                    Description := IfsSecurity.Description;

                END;
            end;
        }
        field(23; "Security Type"; Option)
        {
            
            Editable = false;
            OptionCaption = ' ,Bid/Tender Security,Performance/Contract Security,Advance Payment Security';
            OptionMembers = " ","Bid/Tender Security","Performance/Contract Security","Advance Payment Security";
        }
        field(24; "Issuer Institution Type"; Option)
        {
            
            OptionCaption = 'Bank,Insurance,Other Guarantor';
            OptionMembers = Bank,Insurance,"Other Guarantor";
        }
        field(25; "Issuer Registered Offices"; Text[50])
        {
            
        }
        field(26; "Insurance Type"; Code[50])
        {
            
            TableRelation = "Insurance Type".Code;

            trigger OnValidate()
            begin
                // InsuranceType.RESET;
                // InsuranceType.SETRANGE(Code,"Insurance Type");
                // IF InsuranceType.FINDSET THEN BEGIN
                //  Description:=InsuranceType.Description;
                //  END;
            end;
        }
        field(27; "Policy Cover Type"; Enum "Policy Types")
        {
            
            // OptionCaption = ',Contractor All Risk Insurance,Professional Indemnity Cover,WIBA,Third Party,All Combined';
            //  OptionMembers = " ","Contractor All Risk Insurance","Professional Indemnity Cover",WIBA,"Third Party","All Combined";
        }
        field(28; "Second Expiry Notification Dat"; Date)
        {
            
            Editable = false;
        }
        field(29; "Verified Insurer Email Address"; Text[250])
        {
            
        }
        field(30; "Email Notification"; Boolean)
        {
            
        }
        field(31; "Revision Type"; Option)
        {
            Editable =false;
            
            InitValue = Original;
            OptionCaption = ' ,Original,Revision';
            OptionMembers = " ",Original,Revision;
        }
        field(32; "Advance Document No To Revise"; Code[50])
        {
            
            TableRelation = if ("Revision Type" = filter(Revision)) "Bid_Contract Security Register"."Reference No" where("Document Type" = filter(Quote),
                                                                                                                         "No." = field("Purchase Contract ID"),
                                                                                                                         "Security Type" = filter("Advance Payment Security"));

            trigger OnValidate()
            begin
                Bid_ContractSecurityRegister.Reset;
                Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister."Reference No", "Advance Document No To Revise");
                Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister."Security Type", Bid_ContractSecurityRegister."security type"::"Advance Payment Security");
                if Bid_ContractSecurityRegister.FindSet then
                    repeat
                        "Insurer/Guarantor Name" := Bid_ContractSecurityRegister."Issuer/Guarantor Name";
                        "Policy/Guarantee No" := Bid_ContractSecurityRegister."Reference No";
                        "Expiry Notification Date" := Bid_ContractSecurityRegister."Guarantee Expiry Notification";
                        "Form of Security" := Bid_ContractSecurityRegister."Form of Security";
                        "Security Type" := Bid_ContractSecurityRegister."Security Type";
                        Description := Bid_ContractSecurityRegister.Description;
                        "Issuer Institution Type" := Bid_ContractSecurityRegister."Issuer Institution Type";
                        "Issuer Registered Offices" := Bid_ContractSecurityRegister."Issuer Registered Offices";
                        "Second Expiry Notification Dat" := Bid_ContractSecurityRegister."Second Expiry Notification Dat";
                        "Verified Insurer Email Address" := Bid_ContractSecurityRegister."Issuer Registered Offices";
                        "Amount Insured/Guaranteed" := Bid_ContractSecurityRegister."Security Amount (LCY)";
                        "Purchase Contract ID" := Bid_ContractSecurityRegister."No.";
                        "Expiry Date" := Bid_ContractSecurityRegister."Bid Security Validity Expiry";
                        "Effective Date" := Bid_ContractSecurityRegister."Bid Security Effective Date";
                        Validate("Purchase Contract ID");
                        Blocked := Bid_ContractSecurityRegister.Blocked;
                        Modify();
                    until Bid_ContractSecurityRegister.Next = 0;
            end;
        }
        field(33; "Revised Guaranteed Amount"; Decimal)
        {
            
        }
        field(34; "Assigned To:"; Code[100])
        {
            
            TableRelation = "User Setup"."User ID";
        }
        field(35; "Rejection Remarks"; Text[2048])
        {
            
        }
        field(36; "Rejected By"; Code[100])
        {
            
        }
        field(37; Rejected; Boolean)
        {
            
        }
        field(38; "PRN No"; Code[50])
        {
            
        }
        field(39; "IFS Code"; Code[50])
        {
            
        }
        field(40; "Shortcut Dimension 1 Code"; Code[50])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(41; "Shortcut Dimension 2 Code"; Code[50])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(42; Revised; Boolean)
        {
            
        }
        field(43; "Original Guarantee No."; Code[20])
        {
            
        }
        field(44; "Original Guarantee Amount"; Decimal)
        {
            
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
            end;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Insurance Of Works" then begin
                RoadManagementSetup.Get();
                RoadManagementSetup.TestField("Insurance Of Works Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Insurance Of Works Nos", xRec."No. Series", Today, "Document No.", "No. Series");

            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Advance Payment Guarantee" then begin
                RoadManagementSetup.Get();
                RoadManagementSetup.TestField("Advance Guarantee Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Advance Guarantee Nos", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Performance Guarantee" then begin
                RoadManagementSetup.Get();
                RoadManagementSetup.TestField("Performance Guarantee Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Performance Guarantee Nos", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Professional Indemnity" then begin
                RoadManagementSetup.Get();
                RoadManagementSetup.TestField("Professional Indemnity Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Professional Indemnity Nos", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;


        Status := Status::Open;
        "Document Date" := Today;
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
    end;

    var
        Vendor: Record Vendor;
        Job: Record Job;
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PurchaseHeader: Record "Purchase Header";
        InsuranceGuaranteeHeader: Record "Insurance/Guarantee Header";
        ObjInsuranceGuaranteeHeader: Record "Insurance/Guarantee Header";
        Bid_ContractSecurityRegister: Record "Bid_Contract Security Register";
        DocTemplateLine: Record "Procurement Doc Template Line";
        ContractIssuanceDocs: Record "Contract Issuance Requirements";
        ProcurementSetup: Record "Procurement Setup";
        DimMgt: Codeunit DimensionManagement;


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
  DimMgt.EditDimensionSet(
    "Dimension Set ID", STRSUBSTNO('%1 %2', "Document Type", "Document No."),
    "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
            MODIFY;
        END;

    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        IF "Document No." <> '' THEN
            //MODIFY;

        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
                MODIFY;

            END;

    end;

}

