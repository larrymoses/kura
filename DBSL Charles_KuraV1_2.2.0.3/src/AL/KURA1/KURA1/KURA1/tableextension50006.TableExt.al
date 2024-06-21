#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50006 "tableextension50006" extends Vendor
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Name(Field 2)".


        //Unsupported feature: Property Modification (Data type) on ""Search Name"(Field 3)".


        //Unsupported feature: Property Modification (Data type) on ""Name 2"(Field 4)".


        //Unsupported feature: Property Modification (Data type) on "Address(Field 5)".


        //Unsupported feature: Property Modification (Data type) on ""Address 2"(Field 6)".


        //Unsupported feature: Property Modification (Data type) on "City(Field 7)".


        //Unsupported feature: Property Modification (Data type) on "Contact(Field 8)".


        //Unsupported feature: Property Modification (Data type) on ""Phone No."(Field 9)".


        //Unsupported feature: Property Modification (Data type) on ""Pay-to Vendor No."(Field 45)".


        //Unsupported feature: Property Modification (Data type) on ""Payment Method Code"(Field 47)".


        //Unsupported feature: Code Modification on ""VAT Registration No."(Field 86).OnValidate".

        //trigger "(Field 86)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        "VAT Registration No." := UPPERCASE("VAT Registration No.");
        IF "VAT Registration No." <> xRec."VAT Registration No." THEN
          VATRegistrationValidation;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF UserSetup.GET(USERID) THEN BEGIN
          IF NOT UserSetup."DD HR" = TRUE THEN BEGIN
            ERROR('You do not have permission to amend PIN!.Please contact your system administrator');
            END;
          END;
          }
        #1..3
        */
        //end;
        field(50000; "Vendor Type"; Option)
        {
            OptionCaption = 'Trade,Director,Casual';
            OptionMembers = Trade,Director,Casual;
        }
        field(50001; "Total Allowances"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where(Type = const(Payment),
                                                                    "Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    "Non-Cash Benefit" = const(false),
                                                                    "Pay Mode" = field("Pay Mode Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Total Deductions"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where(Type = filter(Deduction),
                                                                    "Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "PIN Number"; Code[20])
        {
        }
        field(50004; "Cumm. PAYE"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where("Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    Paye = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005; "Taxable Income"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where("Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    Taxable = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50006; "Payroll Pay Mode"; Code[20])
        {
            TableRelation = "Payroll Pay Mode";
        }
        field(50007; "Pay Mode Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll Pay Mode";
        }
        field(50008; "Pays tax"; Boolean)
        {
        }
        field(50009; "Non Cash Benefit"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where(Type = const(Payment),
                                                                    "Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    "Non-Cash Benefit" = const(true)));
            FieldClass = FlowField;
        }
        field(50010; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Director Payroll Period"."Starting Date";
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50050; Vendorname; Code[50])
        {
        }
        field(50145; "Vendor Credit Limit(LCY)"; Decimal)
        {
        }
        field(50146; "Requisition Default Vendor"; Boolean)
        {
        }
        field(50147; "Vendor Retention Account"; Code[20])
        {
            TableRelation = Vendor."No." where(Retention = const(true));
        }
        field(50148; Retention; Boolean)
        {
        }
        field(50149; Tel; Code[20])
        {
        }
        field(50150; Email; Text[200])
        {
        }
        field(50151; "Bank Account Number"; Code[200])
        {
        }
        field(50152; "Bank Branch"; Code[200])
        {
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Vendor's Bank"));
        }
        field(50153; "Vendor's Bank"; Code[200])
        {
            TableRelation = "Employee Bank AccountX";
        }
        field(50154; "Bank Name"; Text[200])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Bank Name" where(Code = field("Vendor's Bank"),
                                                                             "Bank Branch No." = field("Bank Branch")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50155; "Bank Branch Name"; Text[200])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Branch Name" where("Bank Branch No." = field("Bank Branch"),
                                                                               Code = field("Vendor's Bank")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50156; Status1; Option)
        {
            OptionCaption = ' ,Active,Inactive,Exited';
            OptionMembers = " ",Active,Inactive,Exited;
        }
        field(50157; "Appointment Date"; Date)
        {
        }
        field(50158; "Termination Date"; Date)
        {
        }
        field(50159; "Yagpo Cert. No."; Code[50])
        {
        }
        field(50160; Category; Code[200])
        {
        }
        field(50161; "Incorporation Certificate No."; Code[200])
        {
        }
        field(50162; Disability; Boolean)
        {
        }
        field(50163; "Tax Compliance"; Code[250])
        {
        }
        field(50164; "Certificate of Registration"; Code[200])
        {
        }
        field(50165; "Type of Work Done"; Text[250])
        {
        }
        field(50166; "Supplier Category"; Text[200])
        {
            
            TableRelation = "Supplier Category1";
        }
        field(50167; "Special Category"; Text[200])
        {
            
            TableRelation = "Vendor Target Groups";
        }
        field(54004; Broker; Boolean)
        {
            
        }
        field(54006; "Vendor Type1"; Option)
        {
            
            OptionCaption = ',Unit Trust,Broker,Agent,Control';
            OptionMembers = ,"Unit Trust",Broker,Agent," Control";
        }
        field(70000; "KBA Code"; Code[10])
        {
            
            TableRelation = "Employee Bank AccountX".Code;
        }
        field(70001; "KBA Branch Code"; Code[10])
        {
            
            TableRelation = "Employee Bank AccountX"."Bank Branch No.";
        }
        field(70002; "Withholding Tax Code"; Code[10])
        {
            
            TableRelation = "Tariff Codes1";
        }
        field(70004; "Working Hours"; Code[10])
        {
            
        }
        field(70005; Prequalification; Integer)
        {
            CalcFormula = count("Prequalified Suppliers1" where("Vendor No" = field("No.")));
            FieldClass = FlowField;
        }
        field(70006; "Special Groups Type"; Code[50])
        {
            
            TableRelation = "Vendor Target Groups".Code;
        }
        field(70007; "Secondary Contact No."; Code[50])
        {
            Caption = 'Secondary Contact No.';
            
            TableRelation = Contact;

            trigger OnLookup()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
            begin

                ContBusRel.SetCurrentkey("Link to Table", "No.");
                ContBusRel.SetRange("Link to Table", ContBusRel."link to table"::Vendor);
                ContBusRel.SetRange("No.", "No.");
                if ContBusRel.FindFirst then
                    Cont.SetRange("Company No.", ContBusRel."Contact No.")
                else
                    Cont.SetRange("No.", '');

                if "Secondary Contact No." <> '' then
                    if Cont.Get("Secondary Contact No.") then;
                if Page.RunModal(0, Cont) = Action::LookupOK then
                    Validate("Secondary Contact No.", Cont."No.");
            end;

            trigger OnValidate()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
            begin

                "Secondary Contact" := '';
                if "Secondary Contact No." <> '' then begin
                    Cont.Get("Secondary Contact No.");

                    ContBusRel.SetCurrentkey("Link to Table", "No.");
                    ContBusRel.SetRange("Link to Table", ContBusRel."link to table"::Vendor);
                    ContBusRel.SetRange("No.", "No.");
                    ContBusRel.FindFirst;

                    if Cont."Company No." <> ContBusRel."Contact No." then
                    //  Error(Text004,Cont."No.",Cont.Name,"No.",Name)
                    ;

                    if Cont.Type = Cont.Type::Person then
                        "Secondary Contact" := Cont.Name
                end;
            end;
        }
        field(70008; "Secondary Contact"; Text[50])
        {
            Caption = 'Secondary Contact';
            

            trigger OnValidate()
            begin
                /*            if RMSetup.Get then
                               if RMSetup."Bus. Rel. Code for Vendors" <> '' then
                                   if (xRec."Secondary Contact" = '') and (xRec."Secondary Contact No." = '') then begin
                                       Modify;
                                       UpdateContFromVend.OnModify(Rec);
                                       UpdateContFromVend.InsertNewContactPerson(Rec, false);
                                       Modify(true);
                                   end */
            end;
        }
        field(70009; "Maximum Order Amount"; Decimal)
        {
            
        }
        field(70010; "Minimum Order Amount"; Decimal)
        {
            
        }
        field(70011; "Supplier Registration No."; Code[50])
        {
            
        }
        field(70012; "Registration Date"; Date)
        {
            
        }
        field(70013; "Registration Expiry Date"; Date)
        {
            
        }
        field(70014; "Maximum Order Quantity"; Decimal)
        {
            
        }
        field(70015; "Minimum Order Quantity"; Decimal)
        {
            
        }
        field(70016; ReviewerID; Code[10])
        {
            
        }
        field(70017; "Vendor Bank"; Text[30])
        {
            
        }
        field(70018; "Bank Branch Code"; Text[30])
        {
            
        }
        field(70019; "SWIFT Code"; Text[30])
        {
            
        }
        field(70020; "IBAN Code"; Text[30])
        {
            
        }
        field(70021; "Procurement status"; Option)
        {
            
            OptionMembers = Open,Awarded;
        }
        field(70022; Paye; Boolean)
        {
            
        }
        field(70023; "Net Pay"; Boolean)
        {
            
        }
        field(70050; "Business Type"; Code[30])
        {
            
            Description = 'Used to record the different Business Types based on Ownership categories such as Companies, Partnerships, Sole Ownership etc. Linked to Business Type Table';
            TableRelation = "Business Types".Code;
        }
        field(70051; "Country of Incorporation"; Code[10])
        {
            Caption = 'Country/Region Code';
            Description = 'Country of Incorporation/Registration';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                //  PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");

                if "Country/Region Code" <> xRec."Country/Region Code" then
                    VATRegistrationValidation;
            end;
        }
        field(70052; "Country of Tax Registration"; Code[10])
        {
            Caption = 'Country/Region Code';
            Description = 'Country of Tax Registration';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                //   PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");

                if "Country/Region Code" <> xRec."Country/Region Code" then
                    VATRegistrationValidation;
            end;
        }
        field(70053; Debarred; Boolean)
        {
            
        }
        field(70054; "Debarment Voucher No"; Code[20])
        {
            
            TableRelation = "Vendor Debarment Voucher"."Document No";
        }
        field(70055; "Debarment Expiry Date"; Date)
        {
            
        }
        field(70060; "Ownership Type"; Option)
        {
            
            OptionCaption = ',Sole Ownership.Partnership,Registered Company';
            OptionMembers = ,"Sole Ownership.Partnership","Registered Company";
        }
        field(70061; "Registration/Incorporation No."; Code[50])
        {
            
        }
        field(70062; "Reg/Incorporation Date"; Date)
        {
            
        }
        field(70063; "Operations Start Date"; Date)
        {
            
        }
        field(70064; "Tax PIN No."; Code[20])
        {
            
            Enabled = false;
        }
        field(70065; "NSSF No."; Code[20])
        {
            
        }
        field(70066; "NHIF No."; Code[20])
        {
            
        }
        field(70067; "Current Vendor Class"; Code[20])
        {
            CalcFormula = lookup("Vendor Classification"."Vendor Category" where(Blocked = filter(false)));
            Description = 'Lookup field mapped to the Vendor Classification Table (For most recent entries that are Open i.e. Blocked=False';
            FieldClass = FlowField;
        }
        field(70068; "Vendor Group"; Option)
        {
            Description = 'Look-up field that is auto-populated when the Vendor Class field is defined';
            OptionCaption = 'General,Special';
            OptionMembers = General,Special;
        }
        field(70069; "Supplier Type"; Option)
        {
            
            Description = 'Look-up field that is auto-populated when the Vendor Class field is defined';
            OptionCaption = ' Local,Foreign';
            OptionMembers = " Local",Foreign;
        }
        field(70070; "Nominal Capital LCY"; Decimal)
        {
            
        }
        field(70071; "Issued Capital LCY"; Decimal)
        {
            
        }
        field(70072; "Dealer Type"; Option)
        {
            
            OptionCaption = 'Manufacturer,Distributor,Partner,Reseller,Other';
            OptionMembers = Manufacturer,Distributor,Partner,Reseller,Other;
        }
        field(70073; "Max Value of Business"; Decimal)
        {
            
        }
        field(70074; "Nature of Business"; Text[250])
        {
            
        }
        field(70075; "Fixed Line Tel No"; Code[30])
        {
            
        }
        field(70076; "Building/House No"; Text[50])
        {
            
        }
        field(70077; Floor; Text[30])
        {
            
        }
        field(70078; "Plot No"; Code[50])
        {
            
        }
        field(70079; Street; Text[50])
        {
            
        }
        field(70080; "Authorized Signatory Name"; Text[50])
        {
            
        }
        field(70081; "Signatory Designation"; Text[50])
        {
            
        }
        field(70082; "Vision Statement"; Text[250])
        {
            
        }
        field(70083; "Mission Statement"; Text[250])
        {
            
        }
        field(70084; "Total Number of Employees"; Decimal)
        {
            
        }
        field(70085; "Registrn Submitted onPortal"; Boolean)
        {
            
        }
        field(70086; "Industry Group"; Code[20])
        {
            
            TableRelation = "Industry Group".Code;
        }
        field(70087; "Website Url"; Text[100])
        {
            
        }
        field(70088; "Company Size"; Code[20])
        {
            
            TableRelation = "Company Size Code".Code;
        }
        field(70089; Trainer; Boolean)
        {
            
        }
        field(70090; "KNTC Agent"; Boolean)
        {
            
        }
        field(70091; "Current Trade Licence No"; Code[50])
        {
            
        }
        field(70092; "Trade Licence Expiry Date"; Date)
        {
            
        }
        field(70093; Registered; Option)
        {
            
            OptionCaption = 'No,Yes';
            OptionMembers = No,Yes;
        }
        field(70094; Status; Option)
        {
            Caption = 'Status';
            
            Editable = false;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,In Progress';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment","In Progress";

            trigger OnValidate()
            begin
                if Status = Status::Released then begin
                    Registered := Registered::Yes;
                    Modify;

                end;
            end;
        }
        field(70095; "Advance Customer No"; Code[20])
        {
            
            Description = '//Custom For KERRA(Advance Payment Request)';
            TableRelation = Customer."No.";
        }
        field(70096; Garage; Boolean)
        {
            
        }
        field(70097; "Vendor Profile"; Boolean)
        {
            
        }
        field(70098; "Vendor Communication Profile"; Boolean)
        {
            
        }
        field(70099; "Business Profile"; Boolean)
        {
            
        }
        field(70100; "Shareholders Profile"; Boolean)
        {
            
        }
        field(70101; "Litigation Profile"; Boolean)
        {
            
        }
        field(70102; "Past Experience Profile"; Boolean)
        {
            
        }
        field(70103; "Audited Income Statement"; Boolean)
        {
            
        }
        field(70104; "Audit Balance Sheet"; Boolean)
        {
            
        }
        field(70105; "Key Personel"; Boolean)
        {
            
        }
        field(70106; "Send Payslip By E-mail?"; Boolean)
        {
            
        }
        field(70107; "Profile Complete"; Boolean)
        {
            
        }
        field(70108; "No Contract"; Boolean)
        {
            
        }
        field(70109; "HaveAgpo?"; Boolean)
        {
            
        }
        field(70110; "Residential Status"; Enum "Residential Status")
        {
            
        }
       
    }

    trigger OnInsert()
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement officer" = false then
                error('You Do Not Have Permissions For This Action,Consult ICT or Supply Chain Office');
        end;
    end;


    trigger OnModify()
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement officer" = false then
                error('You Do Not Have Permissions For This Action,Consult ICT or Supply Chain Office');
        end;
    end;

    trigger OnDelete()
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement officer" = false then
                error('You Do Not Have Permissions For This Action,Consult ICT or Supply Chain Office');
        end;
    end;


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ApprovalsMgmt.OnCancelVendorApprovalRequest(Rec);

    MoveEntries.MoveVendorEntries(Rec);

    CommentLine.SETRANGE("Table Name",CommentLine."Table Name"::Vendor);
    CommentLine.SETRANGE("No.","No.");
    CommentLine.DELETEALL;

    VendBankAcc.SETRANGE("Vendor No.","No.");
    VendBankAcc.DELETEALL;

    OrderAddr.SETRANGE("Vendor No.","No.");
    OrderAddr.DELETEALL;

    ItemCrossReference.SETCURRENTKEY("Cross-Reference Type","Cross-Reference Type No.");
    ItemCrossReference.SETRANGE("Cross-Reference Type",ItemCrossReference."Cross-Reference Type"::Vendor);
    ItemCrossReference.SETRANGE("Cross-Reference Type No.","No.");
    ItemCrossReference.DELETEALL;

    PurchOrderLine.SETCURRENTKEY("Document Type","Pay-to Vendor No.");
    PurchOrderLine.SETRANGE("Pay-to Vendor No.","No.");
    IF PurchOrderLine.FINDFIRST THEN
      ERROR(
        Text000,
        TABLECAPTION,"No.",
        PurchOrderLine."Document Type");

    PurchOrderLine.SETRANGE("Pay-to Vendor No.");
    PurchOrderLine.SETRANGE("Buy-from Vendor No.","No.");
    IF NOT PurchOrderLine.ISEMPTY THEN
      ERROR(
        Text000,
        TABLECAPTION,"No.");

    UpdateContFromVend.OnDelete(Rec);

    DimMgt.DeleteDefaultDim(DATABASE::Vendor,"No.");

    ServiceItem.SETRANGE("Vendor No.","No.");
    ServiceItem.MODIFYALL("Vendor No.",'');

    ItemVendor.SETRANGE("Vendor No.","No.");
    ItemVendor.DELETEALL(TRUE);

    IF NOT SocialListeningSearchTopic.ISEMPTY THEN BEGIN
      SocialListeningSearchTopic.FindSearchTopic(SocialListeningSearchTopic."Source Type"::Vendor,"No.");
      SocialListeningSearchTopic.DELETEALL;
    END;

    PurchPrice.SETCURRENTKEY("Vendor No.");
    PurchPrice.SETRANGE("Vendor No.","No.");
    PurchPrice.DELETEALL(TRUE);

    PurchLineDiscount.SETCURRENTKEY("Vendor No.");
    PurchLineDiscount.SETRANGE("Vendor No.","No.");
    PurchLineDiscount.DELETEALL(TRUE);

    CustomReportSelection.SETRANGE("Source Type",DATABASE::Vendor);
    CustomReportSelection.SETRANGE("Source No.","No.");
    CustomReportSelection.DELETEALL;

    PurchPrepmtPct.SETCURRENTKEY("Vendor No.");
    PurchPrepmtPct.SETRANGE("Vendor No.","No.");
    PurchPrepmtPct.DELETEALL(TRUE);

    VATRegistrationLogMgt.DeleteVendorLog(Rec);

    IntrastatSetup.CheckDeleteIntrastatContact(IntrastatSetup."Intrastat Contact Type"::Vendor,"No.");

    CalendarManagement.DeleteCustomizedBaseCalendarData(CustomizedCalendarChange."Source Type"::Vendor,"No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
     ApprovalsMgmt.OnCancelVendorApprovalRequest(Rec);

     MoveEntries.MoveVendorEntries(Rec);

     CommentLine.SETRANGE("Table Name",CommentLine."Table Name"::Vendor);
     CommentLine.SETRANGE("No.","No.");
     CommentLine.DELETEALL;

     VendBankAcc.SETRANGE("Vendor No.","No.");
     VendBankAcc.DELETEALL;

     OrderAddr.SETRANGE("Vendor No.","No.");
     OrderAddr.DELETEALL;

     ItemCrossReference.SETCURRENTKEY("Cross-Reference Type","Cross-Reference Type No.");
     ItemCrossReference.SETRANGE("Cross-Reference Type",ItemCrossReference."Cross-Reference Type"::Vendor);
     ItemCrossReference.SETRANGE("Cross-Reference Type No.","No.");
     ItemCrossReference.DELETEALL;

     PurchOrderLine.SETCURRENTKEY("Document Type","Pay-to Vendor No.");
     PurchOrderLine.SETRANGE("Pay-to Vendor No.","No.");
     IF PurchOrderLine.FINDFIRST THEN
    #23..27
     PurchOrderLine.SETRANGE("Pay-to Vendor No.");
     PurchOrderLine.SETRANGE("Buy-from Vendor No.","No.");
     IF NOT PurchOrderLine.ISEMPTY THEN
    #31..34
     UpdateContFromVend.OnDelete(Rec);

     DimMgt.DeleteDefaultDim(DATABASE::Vendor,"No.");

     ServiceItem.SETRANGE("Vendor No.","No.");
     ServiceItem.MODIFYALL("Vendor No.",'');

     ItemVendor.SETRANGE("Vendor No.","No.");
     ItemVendor.DELETEALL(TRUE);

     IF NOT SocialListeningSearchTopic.ISEMPTY THEN BEGIN
      SocialListeningSearchTopic.FindSearchTopic(SocialListeningSearchTopic."Source Type"::Vendor,"No.");
      SocialListeningSearchTopic.DELETEALL;
     END;

     PurchPrice.SETCURRENTKEY("Vendor No.");
     PurchPrice.SETRANGE("Vendor No.","No.");
     PurchPrice.DELETEALL(TRUE);

     PurchLineDiscount.SETCURRENTKEY("Vendor No.");
     PurchLineDiscount.SETRANGE("Vendor No.","No.");
     PurchLineDiscount.DELETEALL(TRUE);

     CustomReportSelection.SETRANGE("Source Type",DATABASE::Vendor);
     CustomReportSelection.SETRANGE("Source No.","No.");
     CustomReportSelection.DELETEALL;

     PurchPrepmtPct.SETCURRENTKEY("Vendor No.");
     PurchPrepmtPct.SETRANGE("Vendor No.","No.");
     PurchPrepmtPct.DELETEALL(TRUE);

     VATRegistrationLogMgt.DeleteVendorLog(Rec);

     IntrastatSetup.CheckDeleteIntrastatContact(IntrastatSetup."Intrastat Contact Type"::Vendor,"No.");

     CalendarManagement.DeleteCustomizedBaseCalendarData(CustomizedCalendarChange."Source Type"::Vendor,"No.");
    */
    //end;

    var
        UserSetup: Record "User Setup";
}

