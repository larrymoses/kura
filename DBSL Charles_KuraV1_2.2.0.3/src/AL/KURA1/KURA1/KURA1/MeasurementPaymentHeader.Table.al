#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72188 "Measurement &  Payment Header"
{
    DrillDownPageID = "Measurement &  Payment Headers";
    LookupPageID = "Measurement &  Payment Headers";

    fields
    {
        field(1; "Document Type"; Option)
        {

            Description = ' Measurement Sheet,Contractor Notice of Works,Works Inspection,Payment Certificate,Contractor Payment Request,New Job Voucher,Contractor Request for Close-Out,Contractor Request for Post DLP Inspection';
            OptionCaption = ' ,Measurement Sheet,Contractor Notice of Works,Works Inspection,Payment Certificate,Contractor Payment Request,New Job Voucher,Contractor Request for Taking Over,Contractor Request for End of DLP Inspection,Fee Note,PC Sum Request';
            OptionMembers = " ","Measurement Sheet","Contractor Notice of Works","Works Inspection","Payment Certificate","Contractor Payment Request","New Job Voucher","Contractor Request for Taking Over","Contractor Request for End of DLP Inspection","Fee Note","PC Sum Request";
        }
        field(2; "Document No."; Code[20])
        {

            Editable = false;
        }
        field(3; "Payment Certificate Type"; Option)
        {

            Description = 'Applies only when the Doc type::Payment Certificate';
            Editable = false;
            OptionCaption = ' ,Advance Payment,Interim Payment,Final Payment,Retention Payment,Interest';
            OptionMembers = " ","Advance Payment","Interim Payment","Final Payment","Retention Payment",Interest;
        }
        field(4; "Document Date"; Date)
        {

        }
        field(5; "Project ID"; Code[20])
        {

            Description = 'Job.No. WHERE (Status=FILTER(Open))';
            TableRelation = Job."No." where(Status = filter(Open | Ongoing | "Completed/Under DLP" | "Under PBRM"));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindFirst() then begin
                    "Project Name" := Job.Description;
                    "Project End Date" := Job."Ending Date";
                    "Project Start Date" := Job."Starting Date";
                    "Road Code" := Job."Road Code";
                    "Contract ID" := Job."Purchase Contract ID";
                    VALIDATE("Road Code");
                    "Road Section No." := Job."Road Section No";
                    VALIDATE("Road Section No.");
                    "Project Manager" := Job."Project Manager";
                    "KeRRA Budget Code" := Job."KeRRA Budget Code";
                    "Region ID" := Job."Region ID";
                    "Directorate ID" := Job."Directorate Code";
                    "Department ID" := Job."Department ID";
                    "Constituency ID" := Job."Constituency ID";
                    "Funding Source ID" := Job."Funding Source";
                    Validate("Funding Source ID");
                    "County ID" := Job."County ID";
                    "Contractor No" := Job."Contractor No.";
                    Validate("Contractor No");
                    "Contractor Name" := Job."Contractor Name";
                    "Contract ID" := Job."Purchase Contract ID";
                    Validate("Contract ID");
                    "Works Start Chainage" := Job."Section Start Chainage(Km)";
                    "Works End Chainage" := Job."Section End Chainage(KM)";
                    "Work Execution Plan 1D" := Job."Work Execution Plan ID";
                    Validate("Work Execution Plan 1D");
                    Job.CalcFields("Project Budget");
                    "Contract Sum" := Job."Project Budget";
                    "Workplanned Length (KM)" := Job."Workplanned Length";
                    Rec.Validate("Global Dimension 1 Code", Job."Global Dimension 1 Code");
                    Rec.Validate("Global Dimension 2 Code", Job."Global Dimension 2 Code");

                end;

                if "Document Type" <> "document type"::"New Job Voucher" then
                    Description := Format("Document Type") + ' - ' + "Project ID" + ' ' + "Contract ID";

                if "Document Type" = "document type"::"Contractor Payment Request" then begin
                    "IPC Number" := Job."Last IPC Number" + 1;
                end;

                if "Document Type" = "document type"::"Contractor Request for Taking Over" then begin
                    MeasurementPaymentEntry.Reset;
                    MeasurementPaymentEntry.SetRange(MeasurementPaymentEntry."Job No.", "Project ID");
                    if MeasurementPaymentEntry.FindSet then
                        repeat
                            ObjMeasurementPaymentEntry.Init;
                            ObjMeasurementPaymentEntry.TransferFields(MeasurementPaymentEntry);
                            ObjMeasurementPaymentEntry."Document No" := "Document No.";
                            ObjMeasurementPaymentEntry."Document Type" := "Document Type";
                            if not ObjMeasurementPaymentEntry.Insert(true) then
                                ObjMeasurementPaymentEntry.Modify(true);
                        until MeasurementPaymentEntry.Next = 0;
                end;

                if "Document Type" = "document type"::"Contractor Request for End of DLP Inspection" then begin
                    MeasurementPaymentEntry.Reset;
                    MeasurementPaymentEntry.SetRange(MeasurementPaymentEntry."Job No.", "Project ID");
                    if MeasurementPaymentEntry.FindSet then
                        repeat
                            ObjMeasurementPaymentEntry.Init;
                            ObjMeasurementPaymentEntry.TransferFields(MeasurementPaymentEntry);
                            ObjMeasurementPaymentEntry."Document No" := "Document No.";
                            ObjMeasurementPaymentEntry."Document Type" := "Document Type";
                            if not ObjMeasurementPaymentEntry.Insert(true) then
                                ObjMeasurementPaymentEntry.Modify(true);
                        until MeasurementPaymentEntry.Next = 0;
                end;

                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindSet then begin
                    "Taking Over Request No." := Job."Last Taking Over Request No." + 1;
                end;

                ProjectRoadLink.Reset;
                ProjectRoadLink.SetRange(ProjectRoadLink."Global Budget Book Code", "Project ID");
                ProjectRoadLink.SetRange(ProjectRoadLink."KeRRA Budget Code", Rec."KeRRA Budget Code");
                //ProjectRoadLink.SETRANGE(ProjectRoadLink."Global Budget Book Code",Rec."Global Budget Book Code");
                if ProjectRoadLink.FindSet then begin
                    repeat
                        TakingOverSection.Init;
                        TakingOverSection."Inspection No" := "Document No.";
                        TakingOverSection."Document Type" := "Document Type";
                        TakingOverSection."Line No" := TakingOverSection.Count + 10;
                        TakingOverSection."Project ID" := "Project ID";
                        TakingOverSection."Road Code" := ProjectRoadLink."Road Code";
                        TakingOverSection."Road Section No" := ProjectRoadLink."Road Section No";
                        TakingOverSection."Link Name" := ProjectRoadLink."Link Name";
                        TakingOverSection."Section Name" := ProjectRoadLink."Section Name";
                        TakingOverSection."Start Chainage" := ProjectRoadLink."Start Chainage(KM)";
                        TakingOverSection."End Chainage" := ProjectRoadLink."End Chainage(KM)";
                        TakingOverSection."Workplannned Length" := ProjectRoadLink."Workplanned Length(KM)";
                        if not TakingOverSection.Get(TakingOverSection."Inspection No", TakingOverSection."Document Type", TakingOverSection."Line No") then
                            TakingOverSection.Insert(true);
                    until ProjectRoadLink.Next = 0;
                end;
            end;
        }
        field(6; Description; Text[250])
        {

        }
        field(7; "Works Start Chainage"; Decimal)
        {

            DecimalPlaces = 5 : 5;

            trigger OnValidate()
            begin
                if (("Works Start Chainage" < "Section Start Chainage") or ("Works Start Chainage" >= "Section End Chainage")) then
                    Error('The value should be between %1 and  %2', "Section Start Chainage", "Section End Chainage");
            end;
        }
        field(8; "Works End Chainage"; Decimal)
        {

            DecimalPlaces = 5 : 5;

            trigger OnValidate()
            begin
                if (("Works End Chainage" < "Section Start Chainage") or ("Works End Chainage" > "Section End Chainage")) then
                    Error('The value should be between %1 and  %2', "Section Start Chainage", "Section End Chainage");
            end;
        }
        field(9; "Contractor Name"; Text[250])
        {

        }
        field(10; Status; Option)
        {

            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released,Rejected';
            OptionMembers = " ",Open,"Pending Approval",Released,Rejected;

            trigger OnValidate()
            begin
                if Status = Status::Released then begin
                    "Date Approved" := Today;
                    Modify(true);
                end;
            end;
        }
        field(11; Posted; Boolean)
        {

            Editable = false;

            trigger OnValidate()
            begin
                if Posted = true then begin
                    ObjMPLine.Reset;
                    ObjMPLine.SetRange(ObjMPLine."Document Type", "Document Type");
                    ObjMPLine.SetRange(ObjMPLine."Document No", "Document No.");
                    if ObjMPLine.FindSet then
                        repeat
                            ObjMPLine.Posted := true;
                            ObjMPLine.Modify(true);
                        until ObjMPLine.Next = 0;
                end;
            end;
        }
        field(12; "Posted By"; Code[100])
        {

            Editable = false;
        }
        field(13; Reversed; Boolean)
        {

            Editable = false;
        }
        field(14; "Reason For Reversal"; Text[250])
        {

        }
        field(15; "Reversed By"; Code[100])
        {

            Editable = false;
        }
        field(16; "Created By"; Code[100])
        {

            Editable = false;
        }
        field(17; "Created DateTime"; DateTime)
        {

            Editable = false;
        }
        field(18; "Project Name"; Text[250])
        {

        }
        field(19; "Project Start Date"; Date)
        {

        }
        field(20; "Project End Date"; Date)
        {

        }
        field(21; "Project Engineer No."; Code[20])
        {

            Description = '"Internal Project Resource"."Resource No."';
            TableRelation = "Internal Project Resource"."Resource No.";

            trigger OnValidate()
            begin
                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Resource No.", "Project Engineer No.");
                if InternalProjectResource.FindSet then begin
                    "Project Engineer Name" := InternalProjectResource.Name;
                end;
            end;
        }
        field(22; "Project Manager"; Code[100])
        {

        }
        field(23; "Project Engineer Name"; Text[250])
        {

        }
        field(24; "Engineer Representative No."; Code[20])
        {

            Description = '"Internal Project Resource"."Resource No." WHERE (Status=FILTER(Active),Project ID=FIELD(Project ID))';
            TableRelation = "Internal Project Resource"."Resource No." where(Status = filter(Active),
                                                                              "Project ID" = field("Project ID"));
        }
        field(25; "Engineer Representative Name"; Text[250])
        {

        }
        field(26; "Region ID"; Code[50])
        {

            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(27; "Directorate ID"; Code[50])
        {

            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Directorate))';
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(28; "Department ID"; Code[50])
        {

            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Department/Center))';
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(29; "Constituency ID"; Code[50])
        {

            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Constituency))';
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Constituency));
        }
        field(30; "County ID"; Code[50])
        {

            Description = 'County.Code';
            TableRelation = County1.Code;
        }
        field(31; "Funding Agency ID"; Code[20])
        {

            Description = '"Funding Agency".Code';
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                Customer.Reset;
                Customer.SetRange(Customer."No.", "Funding Agency ID");
                if Customer.FindSet then begin
                    "Funder Name" := Customer.Name;
                end;
            end;
        }
        field(32; "Funder Name"; Text[250])
        {

        }
        field(33; "Road Code"; Code[20])
        {

            Description = '"Road Inventory"."Road Code"';
            TableRelation = "Road Inventory"."Road Code";

            trigger OnValidate()
            begin
                RoadInventory.Reset;
                RoadInventory.SetRange(RoadInventory."Road Code", "Road Code");
                if RoadInventory.FindSet then begin

                end;
            end;
        }
        field(34; "Road Section No."; Code[20])
        {

            Description = '"Road Section"."Road Section No." WHERE (Road Code=FIELD(Road Code))';
            TableRelation = "Road Section"."Road Section No." where("Road Code" = field("Road Code"));

            trigger OnValidate()
            begin
                RoadSection.Reset;
                RoadSection.SetRange(RoadSection."Road Code", "Road Code");
                RoadSection.SetRange(RoadSection."Road Section No.", "Road Section No.");
                if RoadSection.FindSet then begin
                    "Section Name" := RoadSection."Section Name";
                    "Section End Chainage" := RoadSection."End Chainage(KM)";
                    "Section Start Chainage" := RoadSection."Start Chainage(KM)";
                    "Total  Section Length (KMs)" := RoadSection."Total Road Length (KMs)";
                    "Works Start Chainage" := RoadSection."Start Chainage(KM)";
                    "Works End Chainage" := RoadSection."End Chainage(KM)";
                end
            end;
        }
        field(35; "Section Name"; Text[250])
        {

        }
        field(36; "Section Start Chainage"; Decimal)
        {

            DecimalPlaces = 0 : 5;
        }
        field(37; "Section End Chainage"; Decimal)
        {

            DecimalPlaces = 0 : 5;
        }
        field(38; "Total  Section Length (KMs)"; Decimal)
        {

            DecimalPlaces = 0 : 5;
        }
        field(39; "No Series"; Code[20])
        {

        }
        field(40; "Contractor No"; Code[20])
        {
            DateFormula = true;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.", "Contractor No");
                if Vendor.FindSet then begin
                    "Contractor Name" := Vendor.Name;
                    "Advance Customer No" := Vendor."Advance Customer No";
                    Validate("Advance Customer No");
                    if vendor."VAT Registration No." = '' then
                        Error('Tax Registration No. is mandatory for Vendor %1 %2', vendor."No.", Vendor.Name);
                end;
            end;
        }
        field(41; "Portal Status"; Option)
        {

            OptionCaption = ',Draft,Submitted,Approved';
            OptionMembers = ,Draft,Submitted,Approved;

            trigger OnValidate()
            begin
                if "Portal Status" = "portal status"::Submitted then begin
                    "Submission Date" := Today;


                end;
            end;
        }
        field(42; "From Date"; Date)
        {

        }
        field(43; "To Date"; Date)
        {

        }
        field(44; "Contract ID"; Code[20])
        {

            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Contract ID");
                if PurchaseHeader.FindSet then begin
                    "Total Contract Sum" := PurchaseHeader."Award Tender Sum Inc Taxes";
                    "Defects Liability Period" := PurchaseHeader."Defects Liability Period";
                end;
                PurchaseContractSignatory.Reset;
                PurchaseContractSignatory.SetRange(PurchaseContractSignatory.No, "Contract ID");
                if PurchaseContractSignatory.FindSet then begin
                    "Primary Contractor Rep." := PurchaseContractSignatory."Representative Name";
                    "Contractor Representative Role" := PurchaseContractSignatory."Contract Signing Role";
                    "Contractor Rep. Email" := PurchaseContractSignatory.Email;
                    "Advance Payment Amount(LCY)" := (PurchaseHeader."Advance Payment Rate" / 100) * (PurchaseHeader."Award Tender Sum Inc Taxes");
                end;
            end;
        }
        field(45; "Contract Payment Plan"; Code[50])
        {

        }
        field(46; "Total Contract Sum"; Decimal)
        {

        }
        field(47; "Advance Payment Security ID"; Integer)
        {

            TableRelation = "Bid_Contract Security Register"."Security ID" where("No." = field("Contract ID"),
                                                                                  "Vendor No." = field("Contractor No")
                                                                                  //"Security Type" = filter("Advance Payment Security"),
                                                                                  //  Blocked = filter(false)
                                                                                  );

            trigger OnValidate()
            begin
                CashManagementSetup.Get;
                Bid_ContractSecurityRegister.Reset;
                Bid_ContractSecurityRegister.SetRange("Security ID", "Advance Payment Security ID");
                Bid_ContractSecurityRegister.SetRange("No.", "Contract ID");
                Bid_ContractSecurityRegister.SetRange("Vendor No.", "Contractor No");
                Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister."Security Type", Bid_ContractSecurityRegister."security type"::"Advance Payment Security");
                if Bid_ContractSecurityRegister.FindSet then begin
                    "Advance Pmt Gua. Expiry Date" := Bid_ContractSecurityRegister."Bid Security Validity Expiry";

                    //"Advance Payment Amount(LCY)":=Bid_ContractSecurityRegister."Security Amount (LCY)";
                    //"Requested Advance Payment(LCY)":=Bid_ContractSecurityRegister."Security Amount (LCY)";
                    //VALIDATE("Requested Advance Payment(LCY)");
                    "Advance Payment G/L Account" := CashManagementSetup."Advance Payment G/L Account";
                end;

                PaymentCertificateLine.Reset;
                PaymentCertificateLine.SetRange(PaymentCertificateLine."Document No", "Document No.");
                PaymentCertificateLine.SetRange(PaymentCertificateLine."Document Type", "Document Type");
                PaymentCertificateLine.SetRange(PaymentCertificateLine."No.", "Advance Payment G/L Account");
                PaymentCertificateLine.DeleteAll;


                PaymentCertificateLine.Init;
                PaymentCertificateLine."Document Type" := "Document Type";
                PaymentCertificateLine."Document No" := "Document No.";
                PaymentCertificateLine."Line No." := 100;
                PaymentCertificateLine.Type := PaymentCertificateLine.Type::Customer;
                //PaymentCertificateLine."Job No.":="Project ID";
                PaymentCertificateLine."No." := "Advance Customer No";
                PaymentCertificateLine.Description := 'Advance Payment Request' + ' ' + "Project ID" + ' ' + "Advance Customer Name";
                PaymentCertificateLine."Unit of Measure Code" := 'NO';
                PaymentCertificateLine.Qunatity := 1;
                PaymentCertificateLine.Validate(Qunatity);
                PaymentCertificateLine."Direct Unit Cost Excl. VAT" := "Advance Payment Amount(LCY)";
                PaymentCertificateLine.Validate("Direct Unit Cost Excl. VAT");
                PaymentCertificateLine."Direct Unit Cost (LCY)" := "Advance Payment Amount(LCY)";
                PaymentCertificateLine."Line Amount Excl. VAT" := "Advance Payment Amount(LCY)";
                if not PaymentCertificateLine.Insert then
                    PaymentCertificateLine.Modify;
            end;
        }
        field(48; "Advance Pmt Gua. Expiry Date"; Date)
        {

        }
        field(49; "Performance Security ID"; Integer)
        {

            TableRelation = "Bid_Contract Security Register"."Security ID" where("No." = field("Contract ID"),
                                                                                  "Vendor No." = field("Contractor No"),
                                                                                  "Security Type" = filter("Performance/Contract Security"),
                                                                                  Blocked = filter(false));

            trigger OnValidate()
            begin
                Bid_ContractSecurityRegister.Reset;
                Bid_ContractSecurityRegister.SetRange("Security ID", "Performance Security ID");
                Bid_ContractSecurityRegister.SetRange("No.", "Contract ID");
                Bid_ContractSecurityRegister.SetRange("Vendor No.", "Contractor No");
                Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister."Security Type", Bid_ContractSecurityRegister."security type"::"Performance/Contract Security");
                if Bid_ContractSecurityRegister.FindSet then begin
                    "Performance Sec. Expiry Date" := Bid_ContractSecurityRegister."Bid Security Validity Expiry";
                end;
            end;
        }
        field(50; "Performance Sec. Expiry Date"; Date)
        {

        }
        field(51; "Advance Payment Amount(LCY)"; Decimal)
        {

            Description = 'Advance Paymant AMount (Contract)';
        }
        field(52; "Advance Payment Settled(LCY)"; Decimal)
        {
            CalcFormula = sum("PV Lines".Amount where("Account No" = field("Contractor No"),
                                                       "Advance Request No" = field("Document No."),
                                                       Posted = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(53; "Requested Advance Payment(LCY)"; Decimal)
        {


            trigger OnValidate()
            begin
                PaymentCertificateLine.Reset;
                PaymentCertificateLine.SetRange(PaymentCertificateLine."Document No", "Document No.");
                if PaymentCertificateLine.FindSet then
                    repeat
                        PaymentCertificateLine.Init;
                        PaymentCertificateLine."Document Type" := "Document Type";
                        PaymentCertificateLine."Document No" := "Document No.";
                        PaymentCertificateLine."Line No." := PaymentCertificateLine.Count + 100;
                        PaymentCertificateLine.Qunatity := 1;
                        PaymentCertificateLine.Type := PaymentCertificateLine.Type::Customer;
                        PaymentCertificateLine."No." := "Advance Customer No";
                        PaymentCertificateLine.Validate("No.");
                        PaymentCertificateLine.Validate(Qunatity);
                        PaymentCertificateLine.Description := 'Advance Payment Request' + ' ' + "Project ID" + ' ' + "Advance Customer Name";
                        PaymentCertificateLine."Direct Unit Cost Excl. VAT" := "Requested Advance Payment(LCY)";
                        PaymentCertificateLine.Validate("Direct Unit Cost Excl. VAT");
                        PaymentCertificateLine."Line Discount %" := 0;
                        PaymentCertificateLine.Validate("Line Discount %");
                        if not PaymentCertificateLine.Get(PaymentCertificateLine."Document Type", PaymentCertificateLine."Document No", PaymentCertificateLine."Line No.") then
                            PaymentCertificateLine.Insert(true);
                    until PaymentCertificateLine.Next = 0;

                if "Requested Advance Payment(LCY)" > "Advance Payment Amount(LCY)" then
                    //IF "Requested Advance Payment(LCY)"> (0.1* (MeasurementPaymentHeader."Advance Payment Amount(LCY)")) THEN
                    Error('The Requested Advance Payment(LCY) %1 should not exceed the Advance Payment Amount(LCY) %2', "Requested Advance Payment(LCY)", "Advance Payment Amount(LCY)");

                "Approved Advance Amount" := "Requested Advance Payment(LCY)";
            end;
        }
        field(54; "Advance Payment G/L Account"; Code[20])
        {

            TableRelation = "G/L Account"."No.";
        }
        field(55; "Gross Works Valuation"; Decimal)
        {

        }
        field(56; "Retention %"; Decimal)
        {

        }
        field(57; "Less Retention Amount"; Decimal)
        {

        }
        field(58; "Less Advance Payment"; Decimal)
        {

        }
        field(59; "Contract Sum"; Decimal)
        {

            Editable = false;
        }
        field(60; "This Certificate Amount"; Decimal)
        {
            CalcFormula = sum("Measurement & Payment Line"."Total Cost (LCY)" where("Document No" = field("Document No."),
                                                                                     "Document Type" = field("Document Type")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(61; "Previous Certificate Amount"; Decimal)
        {
            CalcFormula = sum("Measurement & Payment Entry"."Total Cost (LCY)" where("Job No." = field("Project ID"),
                                                                                      Posted = filter(true),
                                                                                      Reversed = filter(false),
                                                                                      "Measured Quantity" = filter(<> 0)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(62; "Advance Customer No"; Code[20])
        {

            TableRelation = Vendor."Advance Customer No" where("No." = field("Contractor No"));

            trigger OnValidate()
            begin
                Customer.Reset;
                Customer.SetRange(Customer."No.", "Advance Customer No");
                if Customer.FindSet then
                    "Advance Customer Name" := Customer.Name;
            end;
        }
        field(63; "Advance Customer Name"; Text[250])
        {

        }
        field(64; "Project No"; Code[20])
        {

        }
        field(65; "Funding Source ID"; Code[20])
        {

            TableRelation = "Funding Source".Code where(Blocked = filter(false));

            trigger OnValidate()
            begin
                if FundingSource.Get("Funding Source ID") then
                    "Funding Agency ID" := FundingSource."Funding Agency";
                Validate("Funding Agency ID");
            end;
        }
        field(66; "Contractor Request Cert Amount"; Decimal)
        {
            CalcFormula = sum("Contractor Request Plan Line"."Total Cost Excl. VAT" where("Job No." = field("Project ID"),
                                                                                           "Document No" = field("Document No."),
                                                                                           Type = filter(Item)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(67; "Project Location"; Code[20])
        {

            TableRelation = Location.Code;
        }
        field(68; "Close-Out Justification"; Text[2048])
        {

        }
        field(69; "Primary Contractor Rep."; Text[2048])
        {

            Description = 'Primary Contractor Representative';
        }
        field(70; "Contractor Representative Role"; Code[20])
        {

        }
        field(71; "Contractor Rep. Email"; Text[100])
        {

            Description = 'Contractor Rep. Email';
        }
        field(72; "Work Execution Plan 1D"; Code[20])
        {

            TableRelation = "Project Mobilization Header"."Document No." where("Document Type" = filter("Work Execution Programme"));

            trigger OnValidate()
            begin
                ProjectMobilizationHeader.Reset;
                ProjectMobilizationHeader.SetRange(ProjectMobilizationHeader."Document No.", "Work Execution Plan 1D");
                if ProjectMobilizationHeader.FindSet then begin
                    "Commencement Order No." := ProjectMobilizationHeader."Commencement Order ID";
                end;
            end;
        }
        field(73; "Commencement Order No."; Code[20])
        {

            TableRelation = "Project Mobilization Header"."Document No." where("Document Type" = filter("Order-To-Commence"));
        }
        field(74; "Take Over Inspection No."; Code[20])
        {

        }
        field(75; "Take Over Inspection Date"; Date)
        {

        }
        field(76; "Defects Liability Start Date"; Date)
        {

        }
        field(77; "Defects Liability Period"; DateFormula)
        {

        }
        field(78; "Defects Liability End Date"; Date)
        {

        }
        field(79; "Payments To Date"; Decimal)
        {

        }
        field(80; "Global Dimension 1 Code"; Code[20])
        {

            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(81; "Global Dimension 2 Code"; Code[20])
        {

            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(82; "Dimension Set ID"; Integer)
        {

        }
        field(83; "Approved Advance Amount"; Decimal)
        {


            trigger OnValidate()
            begin
                CalcFields("Advance Payment Settled(LCY)");
                "Outstanding Balance to Date" := "Requested Advance Payment(LCY)" - "Approved Advance Amount" - "Advance Payment Settled(LCY)";
                if "Approved Advance Amount" > ("Requested Advance Payment(LCY)" - "Advance Payment Settled(LCY)") then
                    Error('You cannot exceed requested amount');
            end;
        }
        field(84; "Advance Request No"; Code[20])
        {

        }
        field(85; "Outstanding Balance to Date"; Decimal)
        {

            Editable = false;
        }
        field(86; "Rejection Remarks"; Text[2048])
        {

        }
        field(87; "Submission Date"; Date)
        {

        }
        field(88; "Opening Date"; Date)
        {

        }
        field(89; "Date Sent for Approval"; Date)
        {

        }
        field(90; "Taking Over Request No."; Integer)
        {

            Editable = false;
        }
        field(91; "IPC Number"; Integer)
        {

            Editable = false;
        }
        field(92; "Advance Payment Justification"; Text[2048])
        {

        }
        field(93; "Resident Engineer Mail"; Text[250])
        {

        }
        field(94; "Resident Engineer No."; Code[20])
        {

            TableRelation = "Internal Project Resource"."Resource No." where("Project ID" = field("Project ID"));

            trigger OnValidate()
            begin
                TestField("Project ID");
                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Resource No.", "Resident Engineer No.");
                InternalProjectResource.SetRange(InternalProjectResource."Project ID", "Project ID");
                if InternalProjectResource.FindSet then begin
                    InternalProjectResource.TestField(Email);
                    "Resident Engineer Name" := InternalProjectResource.Name;
                    "Resident Engineer Mail" := InternalProjectResource.Email;
                end;
            end;
        }
        field(95; "Resident Engineer Name"; Text[100])
        {

        }
        field(96; "Invoice No"; Code[50])
        {
            CalcFormula = lookup("Purch. Inv. Header"."No." where("Buy-from Vendor No." = field("Contractor No"),
                                                                   "Project ID" = field("Project ID"),
                                                                   "Contractor Request No" = field("Document No.")));
            FieldClass = FlowField;
        }
        field(97; "PV Number"; Code[50])
        {
            CalcFormula = lookup("PV Lines".No where("Account No" = field("Contractor No"),
                                                      "Applies to Doc. No" = field("Invoice No")));
            FieldClass = FlowField;
        }
        field(98; "Certified Amount"; Decimal)
        {
            CalcFormula = lookup("Purch. Inv. Header".Amount where("No." = field("Invoice No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(99; "Settled Amount"; Decimal)
        {
            CalcFormula = lookup("PV Lines".Amount where(No = field("PV Number"),
                                                          Posted = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(100; "Date Approved"; Date)
        {

        }
        field(101; "Taking Over Length (KM)"; Decimal)
        {
            CalcFormula = sum("Taking Over Section Line"."Taking Over Length" where("Document No" = field("Document No."),
                                                                                     "Document Type" = field("Document Type")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(102; "KeRRA Budget Code"; Code[50])
        {

        }
        field(103; "Workplanned Length (KM)"; Decimal)
        {

            Editable = false;
        }
        field(104; "Taking Over Inspection No."; Code[20])
        {

            TableRelation = "Inspection Headersss"."Inspection No" where("Inspection Type" = filter("Taking Over Inspection"));

            trigger OnValidate()
            begin
                InspectionSnagList.Reset;
                InspectionSnagList.SetRange(InspectionSnagList."Inspection No", "Taking Over Inspection No.");
                InspectionSnagList.SetRange(InspectionSnagList."Inspection Type", InspectionSnagList."inspection type"::"Taking Over Inspection");
                if InspectionSnagList.FindSet then begin
                    repeat
                        ObjInspectionSnagList.Init;
                        ObjInspectionSnagList.TransferFields(InspectionSnagList);
                        ObjInspectionSnagList."Inspection No" := "Document No.";
                        ObjInspectionSnagList."Inspection Type" := ObjInspectionSnagList."inspection type"::"End of DLP Inspection";
                        if not ObjInspectionSnagList.Insert(true) then
                            ObjInspectionSnagList.Modify(true);
                    until InspectionSnagList.Next = 0;
                end;
                Message('Snag list populated successfully.');
            end;
        }
        field(105; "Assigned To"; Code[100])
        {

            TableRelation = "User Setup"."User ID";
        }
        field(106; Generate; Boolean)
        {

        }
        field(107; "Milestone Code"; Code[50])
        {

            TableRelation = "Purchase Contract Milestone"."Milestone Code" where("No." = field("Contract ID"));
        }
        field(108; Import; Boolean)
        {

        }
        field(109; "Total Cost Including VAT"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Contractor Request Plan Line"."Total Cost Including VAT" where("Job No." = field("Project ID"),
                                                                                           "Document No" = field("Document No."),
                                                                                           Type = filter(Item)));
            Editable = false;
        }
        field(110; "Usage (Total Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Job No." = field("Project ID"),
                                                                           "Entry Type" = const(Usage)));
            Caption = 'Usage (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(111; "C.I.T"; Code[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Tender Committee"."Document No.";
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
            if "Document Type" = "document type"::"Measurement Sheet" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Measurement Sheet Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Measurement Sheet Nos", xRec."No Series", Today, "Document No.", "No Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Contractor Payment Request" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Contractor Payment Request Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Contractor Payment Request Nos", xRec."No Series", Today, "Document No.", "No Series");
            end;
        end;

        if "Document No." = '' then begin
            if (("Document Type" = "document type"::"Contractor Payment Request") and
              ("Payment Certificate Type" = "payment certificate type"::"Advance Payment")) then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Contractor Payment Request Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Contractor Payment Request Nos", xRec."No Series", Today, "Document No.", "No Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Contractor Notice of Works" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Notice Of Completed Works Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Notice Of Completed Works Nos", xRec."No Series", Today, "Document No.", "No Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Works Inspection" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Inspection Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Inspection Nos", xRec."No Series", Today, "Document No.", "No Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Payment Certificate" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Commencement Order Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Commencement Order Nos", xRec."No Series", Today, "Document No.", "No Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"New Job Voucher" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("New Job Vouche Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."New Job Vouche Nos", xRec."No Series", Today, "Document No.", "No Series");
            end;
        end;
        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Contractor Request for Taking Over" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Request for Close-Out Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Request for Close-Out Nos", xRec."No Series", Today, "Document No.", "No Series");
            end;
        end;
        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Contractor Request for End of DLP Inspection" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Request for Post DLP Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Request for Post DLP Nos", xRec."No Series", Today, "Document No.", "No Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Fee Note" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("Fee Note Nos");
                NoSeriesManagement.InitSeries(RoadManagementSetup."Fee Note Nos", xRec."No Series", Today, "Document No.", "No Series");
            end;
        END;
        if "Document No." = '' then begin
            if "Document Type" = "document type"::"PC Sum Request" then begin
                RoadManagementSetup.Get;
                RoadManagementSetup.TestField("PC Sum Request");
                NoSeriesManagement.InitSeries(RoadManagementSetup."PC Sum Request", xRec."No Series", Today, "Document No.", "No Series");
            end;
        end;
        "Document Date" := Today;
        "Created By" := UpperCase(UserId);
        "Created DateTime" := CreateDatetime(Today, Time);
        Status := Status::Open;
        "Portal Status" := "portal status"::Draft;
    end;

    trigger OnModify()
    begin
        if xRec.Posted then
            Error('You cannot edit a posted document.');
    end;

    var
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Job: Record Job;
        RoadInventory: Record "Road Inventory";
        RoadSection: Record "Road Section";
        InternalProjectResource: Record "Internal Project Resource";
        FundingAgency: Record "Funding Agency";
        ObjMPLine: Record "Measurement & Payment Line";
        Vendor: Record Vendor;
        PurchaseHeader: Record "Purchase Header";
        PaymentCertificateLine: Record "Payment Certificate Line";
        Bid_ContractSecurityRegister: Record "Bid_Contract Security Register";
        CashManagementSetup: Record "Cash Management Setup";
        Customer: Record Customer;
        FundingSource: Record "Funding Source";
        DimMgt: Codeunit DimensionManagement;
        MeasurementPaymentHeader: Record "Measurement &  Payment Header";
        PurchaseContractSignatory: Record "Purchase Contract Signatory";
        ProjectMobilizationHeader: Record "Project Mobilization Header";
        MeasurementPaymentEntry: Record "Measurement & Payment Entry";
        ObjMeasurementPaymentEntry: Record "Measurement & Payment Entry";
        TakingOverSection: Record "Taking Over Section";
        ProjectRoadLink: Record "Project Road Link";
        PurchInvHeader: Record "Purch. Inv. Header";
        InspectionSnagList: Record "Inspection Snag List";
        ObjInspectionSnagList: Record "Inspection Snag List";

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', "Document Type", "Document No."),
            "Global Dimension 1 Code", "Global Dimension 2 Code");

        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            //IF PurchLinesExist THEN
            //UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        end;
    end;

    procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        ConfirmManagement: Codeunit "Confirm Management";
        NewDimSetID: Integer;
        ReceivedShippedItemLineDimChangeConfirmed: Boolean;
    begin
        // Update all lines with changed dimensions.

        /*IF NewParentDimSetID = OldParentDimSetID THEN
          EXIT;
        IF NOT ConfirmManagement.ConfirmProcess(Text051,TRUE) THEN
          EXIT;
        
        ExtensionofTimeLine.RESET;
        ExtensionofTimeLine.SETRANGE("Document Type","Document Type");
        ExtensionofTimeLine.SETRANGE("Document No.","Document No.");
        ExtensionofTimeLine.LOCKTABLE;
        IF ExtensionofTimeLine.FIND('-') THEN
          REPEAT
            NewDimSetID := DimMgt.GetDeltaDimSetID(ExtensionofTimeLine."Dimension Set ID",NewParentDimSetID,OldParentDimSetID);
            IF ExtensionofTimeLine."Dimension Set ID" <> NewDimSetID THEN BEGIN
              ExtensionofTimeLine."Dimension Set ID" := NewDimSetID;
        
        
              DimMgt.UpdateGlobalDimFromDimSetID(
                ExtensionofTimeLine."Dimension Set ID",ExtensionofTimeLine."Shortcut Dimension 1 Code",ExtensionofTimeLine."Shortcut Dimension 2 Code");
              ExtensionofTimeLine.MODIFY;
            END;
          UNTIL ExtensionofTimeLine.NEXT = 0;
        */

    end;

    procedure PurchLinesExist(): Boolean
    begin
        /*ExtensionofTimeLine.RESET;
        ExtensionofTimeLine.SETRANGE("Document Type","Document Type");
        ExtensionofTimeLine.SETRANGE("Document No.","Document No.");
        EXIT(NOT ExtensionofTimeLine.ISEMPTY);*/

    end;
}

