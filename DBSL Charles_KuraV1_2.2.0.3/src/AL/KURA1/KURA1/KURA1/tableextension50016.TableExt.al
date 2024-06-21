#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50016 "tableextension50016" extends "Gen. Journal Line"
{
    fields
    {
        modify("Job Task No.")
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting), "Global Dimension 1 Code" = field("Shortcut Dimension 1 Code"),
                                                                     "Job No." = field("Job No."));
        }
        modify("Account No.")
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account" where("Account Type" = const(Posting),
                                                                                          Blocked = const(false))
            else
            if ("Account Type" = const(Customer)) Customer
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const("Bank Account")) "Bank Account"."No."
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const("IC Partner")) "IC Partner"
            else
            if ("Account Type" = const(Employee)) Employee;
        }

        //Unsupported feature: Property Modification (Data type) on ""Document No."(Field 7)".


        //Unsupported feature: Property Modification (Data type) on "Description(Field 8)".

        modify("Bal. Account No.")
        {
            TableRelation = if ("Bal. Account Type" = const("G/L Account")) "G/L Account" where("Account Type" = const(Posting),
                                                                                               Blocked = const(false))
            else
            if ("Bal. Account Type" = const(Customer)) Customer
            else
            if ("Bal. Account Type" = const(Vendor)) Vendor
            else
            if ("Bal. Account Type" = const("Bank Account")) "Bank Account"."No."
            else
            if ("Bal. Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Bal. Account Type" = const("IC Partner")) "IC Partner"

            else
            if ("Bal. Account Type" = const(Employee)) Employee;

        }

        //Unsupported feature: Property Modification (Data type) on ""Job No."(Field 42)".


        //Unsupported feature: Property Modification (Data type) on ""Job Task No."(Field 1001)".


        //Unsupported feature: Code Modification on ""Currency Code"(Field 12).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Bal. Account Type" = "Bal. Account Type"::"Bank Account" THEN BEGIN
          IF BankAcc.GET("Bal. Account No.") AND (BankAcc."Currency Code" <> '')THEN
            BankAcc.TESTFIELD("Currency Code","Currency Code");
        END;
        IF "Account Type" = "Account Type"::"Bank Account" THEN BEGIN
          IF BankAcc.GET("Account No.") AND (BankAcc."Currency Code" <> '') THEN
            BankAcc.TESTFIELD("Currency Code","Currency Code");
        END;
        IF ("Recurring Method" IN
            ["Recurring Method"::"B  Balance","Recurring Method"::"RB Reversing Balance"]) AND
        #11..31
        IF NOT CustVendAccountNosModified THEN
          IF ("Currency Code" <> xRec."Currency Code") AND (Amount <> 0) THEN
            PaymentToleranceMgt.PmtTolGenJnl(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..7
          //MESSAGE("Currency Code");
        #8..34
        */
        //end;
        field(50000; "JV Creator USER ID"; Code[20])
        {
            Editable = false;
        }
        field(50001; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50002; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50003; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50007; "Transaction Type"; Option)
        {
            OptionCaption = ',Contribution,Withdrawal,Interest,Transfer,Corporation Tax,Death Lumpsum';
            OptionMembers = ,Contribution,Withdrawal,Interest,Transfer,"Corporation Tax","Death Lumpsum";
        }
        field(50008; "Exemption Type"; Option)
        {
            OptionMembers = ,"Tax Exempt","Non Tax Exempt";
        }
        field(50009; "Investment Code"; Code[100])
        {
            TableRelation = "Investment Asset" where("Asset Type" = filter(<> " "));
        }
        field(50010; "No. Of Units"; Decimal)
        {
        }
        field(50011; "Investment Transcation Type"; Option)
        {
            OptionCaption = ' ,Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,Share-split,Premium,Discounts,Other Income,Expenses,Deposit,Withdrawal';
            OptionMembers = " ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,Deposit,Withdrawal;
        }
        field(50012; Payee; Code[20])
        {
        }
        field(50013; "GL Code"; Code[20])
        {
        }
        field(50014; "Expected Receipt date"; Date)
        {
        }
        field(50015; "Cheque Type"; Code[20])
        {
        }
        field(50016; "Drawer Bank Name"; Code[20])
        {
        }
        field(50017; "Books Closure Date"; Date)
        {
        }
        field(50018; "Payment Date"; Date)
        {
        }
        field(50019; "Broker/Agency Name"; Text[50])
        {
        }
        field(50020; "Sales Rep. No."; Code[20])
        {
        }
        field(50021; "Sales Rep. Name"; Text[50])
        {
        }
        field(50022; "Share Of Risk (%)"; Decimal)
        {
        }
        field(50023; "Endorsement No."; Code[100])
        {
        }
        field(50024; "Commission Rate"; Decimal)
        {
        }
        field(50025; "Commission Amount"; Decimal)
        {
        }
        field(50026; "Net Premium"; Decimal)
        {
        }
        field(50027; "Business Source"; Option)
        {
            OptionCaption = ' ,Direct,Facultative';
            OptionMembers = " ","1","2";
        }
        field(50028; "Business Line"; Option)
        {
            OptionCaption = ' ,COM,COM-MOU,PLS,PLS-MOU';
            OptionMembers = " ","1","2","3","4";
        }
        field(50029; "Business Class"; Code[10])
        {
        }
        field(50030; Department; Code[20])
        {
        }
        field(50032; "Type of Investment"; Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage;
        }
        field(50033; "Deposit No."; Code[20])
        {
        }
        field(50034; "Deposit Slip"; Boolean)
        {
        }
        field(50037; "Drawer Branch Name"; Text[20])
        {
        }
        field(50042; Invest; Boolean)
        {
        }
        field(50044; "UT Member No"; Code[20])
        {
        }
        field(50045; "unit Trust Type"; Option)
        {
            OptionCaption = ',Equity,Money Market,Growth';
            OptionMembers = ,Equity,"Money Market",Growth;
        }
        field(50048; "Payment Category"; Option)
        {
            Description = 'To tag all payments made to members who have exited the scheme';
            OptionMembers = " ",NormalPayment,"School Fees",Upkeep;
        }
        field(50049; "First Premium"; Decimal)
        {
        }
        field(50050; "PCF  Levy"; Decimal)
        {
        }
        field(50051; "Training Levy"; Decimal)
        {
        }
        field(50052; "Stamp Duty"; Decimal)
        {
        }
        field(50053; "Yellow Card"; Decimal)
        {
        }
        field(50054; "Period Start"; Date)
        {
        }
        field(50055; "Period End"; Date)
        {
        }
        field(50056; "Percentage Of Share"; Decimal)
        {
        }
        field(50057; "Total Renewable Premium"; Decimal)
        {
        }
        field(50058; "R/I Code"; Option)
        {
            OptionMembers = "1","2","3","4","5","6";
        }
        field(50059; "Fund Code"; Code[20])
        {
            TableRelation = "Fund Code".Code;
        }
        field(50060; "Custodian Code"; Code[20])
        {
            TableRelation = "Custodian Code".Code;
        }
        field(70000; "Procurement Plan"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Header".No;
        }
        field(70001; "Procurement Plan Item"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan1"."Plan Item No" where("Plan Year" = field("Procurement Plan"));

            trigger OnValidate()
            begin

                /* ProcurementPlan.RESET;
                ProcurementPlan.SETRANGE(ProcurementPlan."Plan Item No","Procurement Plan Item");
               IF ProcurementPlan.FIND('-') THEN BEGIN
               IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN BEGIN
                 Type:=Type::Item;
                 No:=ProcurementPlan."No.";
               END;
               IF ProcurementPlan."Procurement Type"<>ProcurementPlan."Procurement Type"::Service THEN BEGIN
                Type:=Type::"Non Stock";
                No:=ProcurementPlan."Source of Funds";
               END;
                 "Budget Line":=ProcurementPlan."Source of Funds";
                  Description:=ProcurementPlan."Item Description";
                 "Unit of Measure":=ProcurementPlan."Unit of Measure";
                 "Unit Price":=ProcurementPlan."Unit Price";
               END;
              */

            end;
        }
        field(70002; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(70003; "Project No"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(70004; "Contractor No"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
         field(70005;"Earning Code"; Code[20])
        {
          
        }
        field(70006; "Road Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GenJnlAlloc.LOCKTABLE;
    LOCKTABLE;

    #4..10

    ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
    ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..13


    IF UserSetup.GET(USERID) THEN BEGIN
      "Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
      END;
    */
    //end;

    //Unsupported feature: Parameter Insertion (Parameter: ProjectNo) (ParameterCollection) on "InitNewLine(PROCEDURE 94)".


    //Unsupported feature: Parameter Insertion (Parameter: ContractorNo) (ParameterCollection) on "InitNewLine(PROCEDURE 94)".



    //Unsupported feature: Code Modification on "InitNewLine(PROCEDURE 94)".

    //procedure InitNewLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    INIT;
    "Posting Date" := PostingDate;
    "Document Date" := DocumentDate;
    Description := PostingDescription;
    "Shortcut Dimension 1 Code" := ShortcutDim1Code;
    "Shortcut Dimension 2 Code" := ShortcutDim2Code;
    "Dimension Set ID" := DimSetID;
    "Reason Code" := ReasonCode;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    Description := PostingDescription;//Changed By Fred Advised by Liz
    #5..8
     //KERRA CERTIFICATE PAYMENT
    "Project No":=ProjectNo;
    "Contractor No":=ContractorNo;
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromInvoicePostBuffer(PROCEDURE 112)".

    //procedure CopyFromInvoicePostBuffer();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Account No." := InvoicePostBuffer."G/L Account";
    "System-Created Entry" := InvoicePostBuffer."System-Created Entry";
    "Gen. Bus. Posting Group" := InvoicePostBuffer."Gen. Bus. Posting Group";
    #4..23
    "VAT Difference" := InvoicePostBuffer."VAT Difference";
    "VAT Base Before Pmt. Disc." := InvoicePostBuffer."VAT Base Before Pmt. Disc.";

    OnAfterCopyGenJnlLineFromInvPostBuffer(InvoicePostBuffer,Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..26
    //added by daudi for procurement plan
    "Procurement Plan":=InvoicePostBuffer."Procurement Plan";
    "Procurement Plan Item":=InvoicePostBuffer."Procurement Plan Item";
    "Responsibility Center":=InvoicePostBuffer."Responsibility Center";

    OnAfterCopyGenJnlLineFromInvPostBuffer(InvoicePostBuffer,Rec);
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromPurchHeader(PROCEDURE 109)".

    //procedure CopyFromPurchHeader();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Source Currency Code" := PurchHeader."Currency Code";
    "Currency Factor" := PurchHeader."Currency Factor";
    Correction := PurchHeader.Correction;
    #4..13
    "Salespers./Purch. Code" := PurchHeader."Purchaser Code";
    "On Hold" := PurchHeader."On Hold";
    IF "Account Type" = "Account Type"::Vendor THEN
      "Posting Group" := PurchHeader."Vendor Posting Group";

    OnAfterCopyGenJnlLineFromPurchHeader(PurchHeader,Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..16
    "Posting Group" := PurchHeader."Vendor Posting Group";

    //Added By Fred FOr KERRA Payment Certificate


    OnAfterCopyGenJnlLineFromPurchHeader(PurchHeader,Rec);
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromPurchHeaderPayment(PROCEDURE 104)".

    //procedure CopyFromPurchHeaderPayment();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Due Date" := PurchHeader."Due Date";
    "Payment Terms Code" := PurchHeader."Payment Terms Code";
    "Pmt. Discount Date" := PurchHeader."Pmt. Discount Date";
    "Payment Discount %" := PurchHeader."Payment Discount %";
    "Creditor No." := PurchHeader."Creditor No.";
    "Payment Reference" := PurchHeader."Payment Reference";
    "Payment Method Code" := PurchHeader."Payment Method Code";

    OnAfterCopyGenJnlLineFromPurchHeaderPayment(PurchHeader,Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    "Payment Reference" := PurchHeader."Payment Reference(KSHS)";
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "GetVendorAccount(PROCEDURE 115)".

    //procedure GetVendorAccount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Vend.GET("Account No.");
    Vend.CheckBlockedVendOnJnls(Vend,"Document Type",FALSE);
    CheckICPartner(Vend."IC Partner Code","Account Type","Account No.");
    #4..6

    OnGenJnlLineGetVendorAccount(Vend);

    VALIDATE("Recipient Bank Account",Vend."Preferred Bank Account Code");
    "Posting Group" := Vend."Vendor Posting Group";
    SetSalespersonPurchaserCode(Vend."Purchaser Code","Salespers./Purch. Code");
    "Payment Terms Code" := Vend."Payment Terms Code";
    #14..28
    CheckPaymentTolerance;

    OnAfterAccountNoOnValidateGetVendorAccount(Rec,Vend,CurrFieldNo);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
    //VALIDATE("Recipient Bank Account",Vend."Preferred Bank Account Code");
    #11..31
    */
    //end;

    //Unsupported feature: Property Modification (Length) on "InitNewLine(PROCEDURE 94).PostingDescription(Parameter 1002)".


    //Unsupported feature: Property Modification (Length) on "InitNewLine(PROCEDURE 94).ShortcutDim1Code(Parameter 1003)".


    //Unsupported feature: Property Modification (Length) on "InitNewLine(PROCEDURE 94).ShortcutDim2Code(Parameter 1004)".


    //Unsupported feature: Property Modification (Length) on "CreateDim(PROCEDURE 13).No1(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "CreateDim(PROCEDURE 13).No2(Parameter 1003)".


    //Unsupported feature: Property Modification (Length) on "CreateDim(PROCEDURE 13).No3(Parameter 1005)".


    //Unsupported feature: Property Modification (Length) on "CreateDim(PROCEDURE 13).No4(Parameter 1007)".


    //Unsupported feature: Property Modification (Length) on "CreateDim(PROCEDURE 13).No5(Parameter 1009)".


    //Unsupported feature: Property Modification (Length) on "CreateDim(PROCEDURE 13).No(Variable 1011)".


    //Unsupported feature: Property Modification (Length) on "ValidateShortcutDimCode(PROCEDURE 14).ShortcutDimCode(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "LookupShortcutDimCode(PROCEDURE 18).ShortcutDimCode(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "ShowShortcutDimCode(PROCEDURE 15).ShortcutDimCode(Parameter 1000)".


    var
        UserSetup: Record "User Setup";
}

