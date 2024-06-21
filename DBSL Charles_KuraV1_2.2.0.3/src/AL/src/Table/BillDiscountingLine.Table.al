#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57031 "Bill Discounting Line"
{

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Project Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where("Contractor No." = field("Contractor No"));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange("No.", "Project Code");
                if Job.FindSet then
                    "Project Name" := Job.Description;
            end;
        }
        field(4; "Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange("No.", "Contractor No");
                if Vendor.FindSet then
                    "Contractor Name" := Vendor.Name;
            end;
        }
        field(5; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Pending Certificates"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Certificate value deductions"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Certificate Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                CalculateTax();
            end;
        }
        field(10; "Bank No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Bank Account".Code;
        }
        field(11; "Bank Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Bank Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Bank Account".Code where("Vendor No." = field("Contractor No"));

            trigger OnValidate()
            begin
                // EmployeeBankAccountX.RESET;
                // EmployeeBankAccountX.SETRANGE(Code,"Bank Code");
                // IF EmployeeBankAccountX.FINDSET THEN
                //  "Bank Account Name":=EmployeeBankAccountX."Bank Name";


                VendorBankAccount.Reset;
                VendorBankAccount.SetRange("Vendor No.", "Contractor No");
                VendorBankAccount.SetRange("Bank Code", "Bank Code");
                if VendorBankAccount.FindSet then begin
                    "Bank Name" := VendorBankAccount."Bank Account Name";
                    "Bank Account Name" := VendorBankAccount."Bank Account Name";
                    "Bank Branch No" := VendorBankAccount."Bank Branch No.";
                    "Bank Branch Name" := VendorBankAccount."Bank Branch Name";
                    "Bank Account Number" := VendorBankAccount."Bank Account No.";
                end;
            end;
        }
        field(13; "Bank Branch No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Bank Code"));

            trigger OnValidate()
            begin
                // EmployeeBankAccountX.RESET;
                // EmployeeBankAccountX.SETRANGE("Bank Branch No.","Bank Branch No");
                // IF EmployeeBankAccountX.FINDSET THEN
                //  "Bank Branch Name":=EmployeeBankAccountX."Branch Name";
            end;
        }
        field(14; "Bank Branch Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Bank Account Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Discounted Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Discounted Amount" > "Discountable Amount" then
                    Error('The discounted Amount %1 cannot be greater than Discountable Amount %2', "Discounted Amount", "Discountable Amount");
            end;
        }
        field(17; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Bank Account Number"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Discountable Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate("Discounted Amount");
            end;
        }
        field(20; "Pending Certificate No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purch. Inv. Header"."No." where("Buy-from Vendor No." = field("Contractor No"));

            trigger OnValidate()
            begin
                Pinvoice.Reset;
                Pinvoice.SetRange("No.", "Pending Certificate No.");
                if Pinvoice.FindSet then begin
                    Pinvoice.CalcFields(Amount, "Remaining Amount");
                    "Certificate Amount" := Pinvoice.Amount;
                    "Discountable Amount" := Pinvoice."Remaining Amount";
                end;


                "Certificate value deductions" := "Certificate Amount" - "Discountable Amount";
            end;
        }
        field(21; "VAT Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tariff Codes1".Code where(Type = const(VAT));

            trigger OnValidate()
            begin
                Validate("Discounted Amount");
                CalculateTax();
                TariffCodes1.Reset;
                TariffCodes1.SetRange(TariffCodes1.Code, "VAT Code");
                if TariffCodes1.FindSet then
                    "VAT Rate" := TariffCodes1.Percentage;
                Validate("Discounted Amount");
            end;
        }
        field(22; "W/Tax Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tariff Codes1".Code where(Type = filter("W/Tax"));

            trigger OnValidate()
            begin

                CalculateTax();
                TariffCodes1.Reset;
                TariffCodes1.SetRange(TariffCodes1.Code, "W/Tax Code");
                if TariffCodes1.FindSet then
                    "W/Tax Rate" := TariffCodes1.Percentage;
                Validate("Discounted Amount");
            end;
        }
        field(24; "VAT Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "W/Tax Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Net Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // /
            end;
        }
        field(28; "W/T VAT Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tariff Codes1".Code where(Type = const(VAT));

            trigger OnValidate()
            begin
                CalculateTax();
                TariffCodes1.Reset;
                TariffCodes1.SetRange(TariffCodes1.Code, "W/T VAT Code");
                if TariffCodes1.FindSet then
                    "VAT Six % Rate" := TariffCodes1.Percentage;
                Validate("Discounted Amount");
            end;
        }
        field(29; "W/T VAT Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "VAT Rate"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*"VAT Amount":=(Amount * 100);
                "VAT Amount":=Amount-("VAT Amount"/(100 + "VAT Rate"));*/

            end;
        }
        field(31; "Retention Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tariff Codes1".Code where(Type = const(Retention));

            trigger OnValidate()
            begin
                CalculateTax();
            end;
        }
        field(32; "Retention  Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Net Amount" := "Discounted Amount" - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery";
            end;
        }
        field(33; "Retention Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "W/Tax Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "VAT Withheld Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //"VAT Withheld Amount":="VAT Amount"*0.06;
            end;
        }
        field(36; "VAT Withheld Code"; Code[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tariff Codes1".Code where(Type = const(VAT));
        }
        field(37; "VAT Six % Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Shortcut Dimension 1 Code"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1),
                                                          Blocked = filter(false));
        }
        field(40; "Shortcut Dimension 2 Code"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2),
                                                          Blocked = filter(false));
        }
        field(41; "Advance Recovery"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Project Code", "Contractor No", "Pending Certificate No.", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //IF xRec."Pending Certificate No."=Rec."Pending Certificate No." THEN
        //ERROR('Blocked');
    end;

    var
        Job: Record Job;
        Vendor: Record Vendor;
        BankAccount: Record "Bank Account";
        EmployeeBankAccountX: Record "Employee Bank AccountX";
        VendorBankAccount: Record "Vendor Bank Account";
        Pinvoice: Record "Purch. Inv. Header";
        DimMgt: Codeunit DimensionManagement;
        TaxCalc: Codeunit "Tax Calculation";
        TariffCodes1: Record "Tariff Codes1";


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin


        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if "Document No" <> '' then
            Modify;

        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            //IF SalesLinesExist THEN
            //UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        end;
    end;


    procedure GetCurrency()
    begin
    end;


    procedure ShowDimensions()
    begin
        /*
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID",STRSUBSTNO('%1 %2 %3',"Payment Type","No.","Line No."));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */

    end;


    procedure CalculateTax()
    var
        CalculationType: Option VAT,"W/Tax",Retention,PAYE;
        TotalTax: Decimal;
        TaxCalc: Codeunit "Tax Calculation";
    begin
        "VAT Amount" := 0;
        "W/Tax Amount" := 0;
        "Retention  Amount" := 0;
        TotalTax := 0;
        "Net Amount" := 0;//"PAYE Amount":=0;
        if "Certificate Amount" <> 0 then begin
            if "VAT Rate" <> 0 then begin
                // "VAT Amount":=TaxCalc.CalculateTaxBillDiscounting(Rec,Calculationtype::VAT);
                TotalTax := TotalTax + "VAT Amount"
            end;

            if "W/Tax Rate" <> 0 then begin
                // "W/Tax Amount":=TaxCalc.CalculateTaxBillDiscounting(Rec,Calculationtype::"W/Tax");
                TotalTax := TotalTax + "W/Tax Amount"
            end;

            // IF "PAYE Rate" <>0 THEN BEGIN
            //    "PAYE Amount":=TaxCalc.CalculateTaxBillDiscounting(Rec,CalculationType::PAYE);
            //     TotalTax:=TotalTax+ "PAYE Amount";
            //    END;

            if "Retention Rate" <> 0 then begin
                // "Retention  Amount":=TaxCalc.CalculateTaxBillDiscounting(Rec,Calculationtype::Retention);
                TotalTax := TotalTax + "Retention  Amount"
            end;
        end;


        "VAT Withheld Amount" := 0;
        if "VAT Six % Rate" <> 0 then begin
            "VAT Withheld Amount" := ("Discounted Amount" - "VAT Amount") * ("VAT Six % Rate") / 100;

            /// "VAT Withheld Amount":=0;

            /*IF Amount <>0 THEN BEGIN
            IF "VAT Rate"<>0 THEN BEGIN
             "VAT Withheld Amount":=(Amount-"VAT Amount")*0.06;
            END;
            END;*/
        end;

        "Net Amount" := "Discounted Amount" - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery";
        Validate("Net Amount");

    end;
}

