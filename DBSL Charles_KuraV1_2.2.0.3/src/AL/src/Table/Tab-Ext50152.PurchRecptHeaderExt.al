/// <summary>
/// TableExtension Purch Recpt Header Ext (ID 50152) extends Record Purch. Rcpt. Header.
/// </summary>
tableextension 50152 "Purch Recpt Header Ext" extends "Purch. Rcpt. Header"
{
    fields
    {

        field(50000; Copied; Boolean)
        {

        }
        field(50001; "Debit Note"; Boolean)
        {

        }
        field(50002; "Fully Issued"; Boolean)
        {

        }
        field(50003; "Partially Issued"; Boolean)
        {

        }
        field(50004; "Cancelled?"; Boolean)
        {

        }
        field(50005; "Project?"; Boolean)
        {

        }
        field(50006; "Send To PM"; Boolean)
        {

        }
        field(50007; "Sent By"; Code[50])
        {

            TableRelation = User;
        }
        field(50008; "Sending Date"; Date)
        {

        }
        field(50009; "Store No"; Code[20])
        {



        }
        field(50010; Replenishment; Boolean)
        {

        }
        field(50011; Description; Text[250])
        {

        }
        field(50012; "Requisition Type"; Option)
        {

            OptionCaption = ' ,Internal Use,Project,Stock Replenishment,Technical Installation,Technical Maintenance,Stock Return';
            OptionMembers = " ","Internal Use",Project,"Stock Replenishment","Technical Installation","Technical Maintenance","Stock Return";

        }
        field(50013; "Taken By"; Code[60])
        {

        }
        field(50014; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50015; "Project Name"; Code[600])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Valid to Date"; Date)
        {


            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
            begin
                /*
               //CMM 271008 CHECK RIGHTS TO CHANGE VALIDITY DATE
                  IF ("Valid to Date" <> xRec."Valid to Date") AND (xRec."Valid to Date"<>0D) THEN BEGIN
                     IF UserSetup.GET(USERID)  THEN
                         IF UserSetup."Extend Purch. Quote/LPO Period" <> TRUE THEN
                           ERROR('You do not have suuficient rights to change the validity date');
                  END;
               //END CMM
                 */

            end;
        }
        field(50017; "Request-By No."; Code[10])
        {


        }
        field(50018; "Request-By Name"; Text[50])
        {
            Editable = false;
        }
        field(50019; "Requester ID"; Code[50])
        {



        }
        field(50020; "Purchase Requisition No."; Code[20])
        {

            Enabled = true;
        }
        field(50021; "Created Quotes"; Integer)
        {

        }
        field(50022; "Store Requisition No."; Code[20])
        {

        }
        field(50023; "Budgeted  Name"; Code[10])
        {

            TableRelation = "G/L Budget Name";
        }
        field(50024; "Requisition Expense Group"; Code[10])
        {
            Caption = 'Requisition Expense Group';

            Description = '//Track IR Expense A/C---Used to map to Inv Adj A/c...Ushindi';
            TableRelation = "Gen. Business Posting Group" where("Auto Link Internal Requisition" = const(true));

        }
        field(50025; "ChargeToWork?"; Boolean)
        {

            Description = '//Track CTW IRs....Ushindi';

        }
        field(50027; "Beneficiary Name"; Text[30])
        {

        }
        field(50028; "Beneficiary Address"; Text[30])
        {

        }
        field(50029; "Beneficiary Address 2"; Text[20])
        {

        }
        field(50030; "Beneficiary City"; Text[30])
        {

        }
        field(50031; "IR External Document No"; Code[35])
        {

            Description = 'Track External Doc No';
        }
        field(50061; "PO Type"; Option)
        {

            OptionCaption = ' ,LSO,LPO';
            OptionMembers = " ",LSO,LPO;
        }
        field(50069; "Vote Item"; Code[20])
        {

            Editable = false;
            TableRelation = "G/L Account";
        }
        field(50070; "Vote Amount"; Decimal)
        {
            CalcFormula = lookup("G/L Budget Entry".Amount where("G/L Account No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50072; "Budget Commitments"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Budget Commitments" where("Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(51001; "Inspection Team Setup?"; Boolean)
        {
            CalcFormula = exist("Goods & Services Inspection" where("No." = field("No."),
                                                                     "Vendor Shipment No." = field("Vendor Shipment No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(51002; "Inspection Completed?"; Boolean)
        {
            CalcFormula = - exist("Goods & Services Inspection" where("No." = field("No."),
                                                                      "Vendor Shipment No." = field("Vendor Shipment No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59000; "Contract No."; Code[25])
        {

        }
        field(59001; "Contract Name"; Text[250])
        {

        }
        field(59009; "Sending Time"; Time)
        {

        }
        field(59021; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';

            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job));
        }
        field(59024; "Budget Item"; Code[20])
        {
            CalcFormula = lookup("Purchase Line"."Vote Item" where("Document No." = field("No.")));
            Caption = 'Job No.';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = Job;

            trigger OnValidate()
            var
                Job: Record Job;
            begin
                /*TESTFIELD("Drop Shipment",FALSE);
                TESTFIELD("Special Order",FALSE);
                TESTFIELD("Receipt No.",'');
                IF "Document Type" = "Document Type"::Order THEN
                  TESTFIELD("Quantity Received",0);
                
                IF ReservEntryExist THEN
                  TESTFIELD("Job No.",'');
                
                IF "Job No." <> xRec."Job No." THEN BEGIN
                  VALIDATE("Job Task No.",'');
                  VALIDATE("Job Planning Line No.",0);
                END;
                
                IF "Job No." = '' THEN BEGIN
                  CreateDim(
                    DATABASE::Job,"Job No.",
                    DimMgt.TypeToTableID3(Type),"No.",
                    DATABASE::"Responsibility Center","Responsibility Center",
                    DATABASE::"Work Center","Work Center No.");
                  EXIT;
                END;
                
                IF NOT (Type IN [Type::Item,Type::"G/L Account"]) THEN
                  FIELDERROR("Job No.",STRSUBSTNO(Text012,FIELDCAPTION(Type),Type));
                Job.GET("Job No.");
                Job.TestBlocked;
                "Job Currency Code" := Job."Currency Code";
                
                CreateDim(
                  DATABASE::Job,"Job No.",
                  DimMgt.TypeToTableID3(Type),"No.",
                  DATABASE::"Responsibility Center","Responsibility Center",
                  DATABASE::"Work Center","Work Center No.");
                
                */


                /*
                IF Jobs.GET("Budget Item") THEN BEGIN
                Jobs.CALCFIELDS(Jobs."Recog. Costs G/L Amount",Jobs."Actual Project Costs");
                
                IF Harvest=TRUE THEN
                "Total Project Cost":=Jobs."Actual Project Costs";
                END;
                */

            end;
        }
        field(59025; "Buget Desc"; Text[100])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("Budget Item")));
            FieldClass = FlowField;
        }
        field(59030; "Budgeted Amount"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Vote Amount" where("Document No." = field("No.")));
            Description = '//daudi changed for schedule to Budget as per the new structure';
            Editable = false;
            FieldClass = FlowField;
        }
        field(59031; "Actual Budget Costs"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Actual To Date" where("Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59033; "Available Funds"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Available Funds" where("Document No." = field("No.")));
            FieldClass = FlowField;
        }
        field(59034; "Requisition Amount"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document Type" = const(Invoice),
                                                                   "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59035; "Remaining Budget"; Decimal)
        {

            Editable = false;
        }
        field(59036; "Required Date"; Date)
        {

        }
        field(59037; "Function Name"; Text[50])
        {

            Description = 'Stores the name of the function in the database';
        }
        field(59038; "Budget Center Name"; Text[45])
        {

            Description = 'Stores the name of the budget center in the database';
        }
        field(59039; "Store Requisition Type"; Option)
        {

            OptionMembers = " ",Item,"Minor Asset";
        }
        field(59040; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';

            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(59041; "Unit  Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 3 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59042; "Total Project Cost"; Decimal)
        {

        }
        field(59043; Harvest; Boolean)
        {


            trigger OnValidate()
            begin
                //VALIDATE("Budget Item");
            end;
        }
        field(59044; "Procurement Type"; Code[20])
        {

            TableRelation = "Procurement Types".Code;
        }
        field(59045; "Contract Number"; Code[25])
        {

        }
        field(59046; "Date received"; Date)
        {

        }
        field(59047; "Approved Requisition Amount"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69013; "Order types"; Option)
        {

            OptionCaption = 'LPO,LSO';
            OptionMembers = LPO,LSO;
        }
        field(69020; "Reason to reopen"; Text[20])
        {

        }
        field(69021; "Reason to Cancel"; Text[20])
        {

        }
        field(69022; "Order Number"; Code[20])
        {

        }
        field(70000; Committed; Boolean)
        {

        }
        field(70001; CommittedBy; Code[30])
        {

        }
        field(70002; "Procurement Plan"; Code[10])
        {

            TableRelation = "Procurement Header".No;
        }
        field(70003; "Procurement Plan Item"; Code[10])
        {

            TableRelation = "Procurement Plan1"."Plan Item No" where("Plan Year" = field("Procurement Plan"));


        }
        field(70004; "Request Ref No"; Code[10])
        {

        }
        field(70005; "Supplier Type"; Code[30])
        {

        }
        field(70006; "Process Type"; Code[20])
        {

            TableRelation = "Procurement Method".Code;


        }
        field(70007; "Purchase Type"; Code[30])
        {

            TableRelation = "Purchases Types";
        }
        field(70008; "Requisition No"; Code[20])
        {

            TableRelation = "Purchase Header"."No." where("Document Type" = const("Purchase Requisition"),
                                                           Status = const(Released));

        }
        field(70009; Ordered; Boolean)
        {

            Editable = false;
        }
        field(70010; HOD; Boolean)
        {

            Editable = false;
        }
        field(70014; "Department Code"; Code[100]) // Amos --> Increased the field length from 30 to 100 (25/07/2023)
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
            trigger OnValidate()
            var
                resp: record "Responsibility Center";
            begin
                if resp.get(rec."Department Code") then
                    REC."Department Name2" := RESP.Name;

            end;
        }
        field(70018; "Directorate Code"; Code[100])// Amos --> Increased the field length from 50 to 100 (25/07/2023)
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
            trigger OnValidate()
            var
                resp: record "Responsibility Center";
            begin
                if resp.get(rec."DIRECTORATE CODE") then
                    REC."Directorate Name" := RESP.Name;

            end;
        }
        field(70019; Division; Code[50])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));

        }
        field(70020; Job; Code[50])
        {

            TableRelation = Job;

            trigger OnValidate()
            var
                JobRec: Record Job;
            begin
                if JobRec.Get(Job) then begin
                    "Job Name" := JobRec.Description;
                    Approver := JobRec."Project Manager";

                end;
            end;
        }
        field(70021; "Job Name"; Text[250])
        {

        }
        field(70022; Approver; Code[30])
        {

            TableRelation = "User Setup";
        }
        field(70023; "Supplier Code"; Code[20])
        {

            TableRelation = Vendor;

            trigger OnValidate()
            var
                vend: Record vendor;
            begin
                if Vend.Get("Supplier Code") then
                    Supplier := Vend.Name;
            end;
        }
        field(70024; Supplier; Text[100])
        {

        }
        field(70025; Specifications; Text[250])
        {

        }
        field(70026; "Item Category"; Code[20])
        {

            TableRelation = "Item Category".Code where(Indentation = const(0));

            trigger OnValidate()
            begin
                /*ItemCategory.RESET;
                ItemCategory.SETRANGE("Item No","Item Category Description");
                IF ItemCategory.FIND('-') THEN
                  "Item Category Description":=ItemCategory.Description;*/

            end;
        }
        field(70027; "General Item Category"; Code[20])
        {

            TableRelation = "General Item Categories".Code;
        }
        field(70028; "Archive Requisitions"; Boolean)
        {

        }
        field(70029; Consitituency; Code[30])
        {

            TableRelation = Constituency;
        }
        field(70030; "Priority Level"; Option)
        {

            OptionCaption = ',Low,Normal,High,Critical';
            OptionMembers = ,Low,Normal,High,Critical;
        }
        field(70031; "Planned Commencement Date"; Date)
        {

        }
        field(70032; "Road Code"; Code[20])
        {

            //    TableRelation = "Road Inventory";

            trigger OnValidate()
            begin
                // Roadinve.Reset;
                // if Roadinve.Get("Road Code")then begin
                //   "Link Name":=Roadinve."Link Name";
                //   Modify(true);
                //  end;
            end;
        }
        field(70033; "Link Name"; Text[200])
        {

        }
        field(70034; "Works Length (Km)"; Decimal)
        {

        }
        field(70035; Region; Code[50])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(70036; "Funding Agency"; Code[20])
        {

            TableRelation = "Funding Agency";
        }
        field(70037; "Funding Source"; Code[20])
        {

            TableRelation = "Funding Source";
        }
        field(70038; "Solicitation Type"; Code[30])
        {

        }
        field(70040; "Requisition Product Group"; Option)
        {

            Description = 'New field used to categorize the Items further into Goods, Works, Services and Assets. NB: In most organizations, the Works, Services and Assets shall be setup under TYPE:SERVICE';
            OptionCaption = 'Goods,Services,Works,Assets';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(70041; "IFS Linked"; Boolean)
        {

        }
        field(70042; "Requisition Template ID"; Code[30])
        {

            TableRelation = if ("PRN Type" = const(Standard)) "Purchase Requisition Template".Code where("Template Type" = const(Standard))
            else
            if ("PRN Type" = const("Project Works")) "Purchase Requisition Template".Code where("Template Type" = const(BoQ));
        }
        field(70043; "PRN Type"; Option)
        {

            OptionCaption = 'Standard,Project Works';
            OptionMembers = Standard,"Project Works";
        }
        field(70044; "Project Staffing Template ID"; Code[30])
        {

            TableRelation = "Project Key Staff Template".Code where(Blocked = filter(false));
        }
        field(70045; "Works Equipment Template ID"; Code[30])
        {

            TableRelation = "Works Equipment Template".Code;
        }
        field(70046; "Procurement Plan ID"; Code[10])
        {

            TableRelation = "Procurement Plan".Code;
        }
        field(70047; "Procurement Plan Entry No"; Integer)
        {

            TableRelation = if ("PRN Type" = const(Standard)) "Procurement Plan Entry"."Entry No." where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                                                        "Requisition Product Group" = field("Requisition Product Group"),
                                                                                                        Region = field(Region),
                                                                                                        Directorate = field("Directorate Code"),
                                                                                                        Department = field("Department Code"),
                                                                                                        "Procurement Use" = const("Standard (Internal Use)"))
            else
            if ("PRN Type" = const("Project Works")) "Procurement Plan Entry"."Entry No." where("Procurement Plan ID" =
            field("Procurement Plan ID"),
                                            "Requisition Product Group" = const(Works),
                                             Region = FIELD("Shortcut Dimension 1 Code"),
"Entry Used" = const(false),
                                            "Directorate" = field("Directorate Code"),

                                             "Department" = field("Department Code"),
            "Procurement Use" = const("Project-Specific Use"));


        }
        field(70048; "PP Planning Category"; Code[20])
        {

            TableRelation = "Procurement Plan Entry"."Planning Category";


        }
        field(70049; "PP Funding Source ID"; Code[20])
        {

            TableRelation = "Procurement Plan Entry"."Funding Source ID";
        }
        field(70050; "PP Total Budget"; Decimal)
        {

            Editable = false;
        }
        field(70051; "PP Total Actual Costs"; Decimal)
        {

            Editable = false;
        }
        field(70052; "PP Total Commitments"; Decimal)
        {

            Editable = false;
            trigger OnValidate()
            begin

            end;
        }
        field(70053; "PP Total Available Budget"; Decimal)
        {

            Editable = false;
        }
        field(70054; "PP Solicitation Type"; Code[30])
        {

            TableRelation = "Solicitation Type".Code;



        }
        field(70055; "PP Procurement Method"; Option)
        {

            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(70056; "PP Preference/Reservation Code"; Code[10])
        {

            TableRelation = "Special Vendor Category".Code;
        }
        field(70057; "PRN Conversion Procedure"; Option)
        {

            OptionCaption = 'Invitation For Bids,Direct PO';
            OptionMembers = "Invitation For Supply","Direct PO";
        }
        field(70058; "Ordered PRN"; Boolean)
        {

        }
        field(70059; "Linked IFS No."; Code[30])
        {

        }
        field(70060; "Linked LPO No."; Code[30])
        {

        }
        field(70061; "Works Category"; Code[30])
        {

            TableRelation = "Works Category".Code;


        }
        field(70062; "Works Description"; Text[100])
        {

            Editable = false;
        }
        field(70063; "Total PRN Amount"; Decimal)
        {
            //from amount including vat
            CalcFormula = sum("Purchase Line"."Amount" where("Document Type" = const(Invoice),
                                                                            "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70064; "Total PRN Amount (LCY)"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Amount Including VAT" where("Document Type" = const(Invoice),
                                                                            "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70065; "PP  Invitation Notice Type"; Option)
        {

            OptionCaption = ',Single  Stage Tender,Two Stage Tender,RFQ,Low Value Procurement,Direct Procurement';
            OptionMembers = ,"Single  Stage Tender","Two Stage Tender",RFQ,"Low Value Procurement","Direct Procurement";
        }
        field(70066; "PP Bid Selection Method"; Code[20])
        {

        }
        field(70067; "PRN Order Date/Time"; DateTime)
        {

        }
        field(70068; "Document Status"; Option)
        {

            OptionCaption = 'Draft,Submitted,Withdrawn,Opened,Evaluation,Awarded,Lost,Cancelled,Pending Submission';
            OptionMembers = Draft,Submitted,Withdrawn,Opened,Evaluation,Awarded,Lost,Cancelled,"Pending Submission";
        }
        field(70069; "Bidder Type"; Option)
        {

            Description = 'Bid Response';
            OptionCaption = 'Single Entity,Joint Venture';
            OptionMembers = "Single Entity","Joint Venture";
        }
        field(70070; "Joint Venture Partner"; Text[50])
        {

        }
        field(70071; "Invitation For Supply No"; Code[20])
        {

            TableRelation = "Standard Purchase Code".Code;






        }
        field(70072; "Invitation Notice Type"; Option)
        {

            OptionCaption = ',Single  Stage Tender,Two Stage Tender,RFQ,Low Value Procurement';
            OptionMembers = ,"Single  Stage Tender","Two Stage Tender",RFQ,"Low Value Procurement";
        }
        field(70073; "Bid Envelope Type"; Option)
        {

            OptionCaption = '1-Envelope,2-Envelope';
            OptionMembers = "1-Envelope","2-Envelope";
        }
        field(70074; "Bid Seal Type"; Option)
        {

            OptionCaption = 'Sealed,Unsealed';
            OptionMembers = Sealed,Unsealed;
        }
        field(70075; "Tender Description"; Text[300])
        {

        }
        field(70076; "Bidder Representative Name"; Text[300])
        {

        }
        field(70077; "Bidder Representative Desgn"; Code[50])
        {
            Caption = 'Bidder Representative Designation';

            Description = 'Bidder Representative Designation';
        }
        field(70078; "Bidder Representative Address"; Text[100])
        {

        }
        field(70079; "Bidder Witness Name"; Text[80])
        {

        }
        field(70080; "Bidder Witness Designation"; Code[50])
        {

        }
        field(70081; "Bidder Witness Address"; Text[100])
        {

        }
        field(70082; "Tender Document Source"; Code[50])
        {

            TableRelation = "Tender Document Source".Code;
        }
        field(70083; "Bid Charge Code"; Code[30])
        {

            TableRelation = "Bid Charges Schedule".Code;

        }
        field(70084; "Bid Charge (LCY)"; Decimal)
        {

            Editable = false;
        }
        field(70085; "Payment Reference No."; Code[30])
        {

        }
        field(70086; "Posted Direct Income Voucher"; Code[30])
        {

        }
        field(70087; "Primary Region"; Code[30])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(70088; "Primary Directorate"; Code[30])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70089; "Primary Department"; Code[30])
        {

            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"),
                                                                "Direct Reports To" = field("Primary Directorate"));
        }
        field(70090; "Primary Branch/Centre"; Code[30])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Branch));
        }
        field(70091; "Building/House No"; Text[50])
        {

        }
        field(70092; "Plot No"; Code[50])
        {

        }
        field(70093; Street; Text[50])
        {

        }
        field(70094; "Nature of Business"; Text[250])
        {

        }
        field(70095; "Current Trade Licence No"; Code[50])
        {

        }
        field(70096; "Trade Licence Expiry Date"; Date)
        {

        }
        field(70097; "Max Value of Business"; Decimal)
        {

        }
        field(70098; "Preferred Bank Account Code"; Code[20])
        {
            Caption = 'Preferred Bank Account Code';

            TableRelation = "Vendor Bank Account".Code where("Vendor No." = field("Vendor No."));
        }
        field(70099; "Bankers Name"; Text[100])
        {
            Editable = false;
        }
        field(70100; "Bankers Branch"; Text[100])
        {
            Editable = false;
        }
        field(70101; "KNTC Agent"; Boolean)
        {

        }
        field(70102; "Business Type"; Code[30])
        {

            Description = 'Used to record the different Business Types based on Ownership categories such as Companies, Partnerships, Sole Ownership etc. Linked to Business Type Table';
            TableRelation = "Business Types".Code;
        }
        field(70103; "Nominal Capital LCY"; Decimal)
        {

        }
        field(70104; "Issued Capital LCY"; Decimal)
        {

        }
        field(70105; "Response is restricted"; Boolean)
        {
            Caption = 'Response is restricted to invited suppliers';

            Description = 'Response is restricted to invited suppliers';
        }
        field(70106; "Supplier to respond"; Boolean)
        {
            Caption = 'Supplier to respond with full quantity on each line';

            Description = 'Supplier to respond with full quantity on each line';
        }
        field(70107; "Procuring Entity can extend"; Boolean)
        {
            Caption = 'Procuring Entity can extend submission deadline through Addendum';

            Description = 'Procuring Entity can extend submission deadline through Addendum';
        }
        field(70108; "Procuring Entity can Cancel"; Boolean)
        {
            Caption = 'Procuring Entity can Cancel Invitation Notice at any stage';

            Description = 'Procuring Entity can Cancel Invitation Notice at any stage';
        }
        field(70109; "No. of Addendum Notices issued"; Integer)
        {
            Editable = false;
        }
        field(70110; "Last Addendum Notice No."; Code[20])
        {
            CalcFormula = lookup("Tender Addendum Notice"."Addendum Notice No." where("Invitation Notice No." = field("Invitation For Supply No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70111; "Read-out Bid Price (A)"; Decimal)
        {

        }
        field(70112; "Arithmetic Corrections (B)"; Decimal)
        {

        }
        field(70113; "Corrected Bid Price (C=A+B)"; Decimal)
        {

        }
        field(70114; "Unconditional Discount % (D)"; Decimal)
        {

        }
        field(70115; "Unconditional Disc Amount (E)"; Decimal)
        {
            Caption = 'Unconditional Discount Amount (E)';

            Description = 'Unconditional Discount Amount (E)';
        }
        field(70116; "Corrected & Disc Bid Price"; Decimal)
        {
            Caption = 'Corrected & Discounted Bid Price (F=C-E)';

            Description = 'Corrected & Discounted Bid Price (F=C-E)';
        }
        field(70117; "Any Additional Adjustments (G)"; Decimal)
        {

        }
        field(70118; "Any Priced Deviations (H))"; Decimal)
        {

        }
        field(70119; "Final Evaluated Bid Price"; Decimal)
        {
            Caption = 'Final Evaluated Bid Price (I=F+G+H)';

            Description = 'Final Evaluated Bid Price (I=F+G+H)';
        }
        field(70120; "Financial Evaluation Date"; Date)
        {

        }
        field(70121; "Weighted Financial Score %"; Decimal)
        {

        }
        field(70122; "Financial Evaluation Ranking"; Code[30])
        {

        }
        field(70123; "Pre-bid Register No."; Code[20])
        {

            TableRelation = "IFS Prebid Register".Code;
        }
        field(70124; "Attended Pre-bid Conference"; Boolean)
        {

        }
        field(70125; "Prebid Conference Date"; Date)
        {

        }
        field(70126; "Bid Opening Register No."; Code[20])
        {

        }
        field(70127; "Bid Opening Date"; Date)
        {

        }
        field(70128; "Late Bid (Opening Stage)"; Boolean)
        {

        }
        field(70129; "Withdrawn Bid (Opening Stage)"; Code[20])
        {

        }
        field(70130; "Withdrawal Notice No"; Code[20])
        {

        }
        field(70131; "Modified Bid (Opening Stage)"; Code[20])
        {

        }
        field(70132; "Succesful Bid (Opening Stage)"; Boolean)
        {

        }
        field(70133; "Preliminary Evaluation Date"; Date)
        {

        }
        field(70134; "Responsive Bid (Evaluation)"; Boolean)
        {
            Caption = 'Responsive Bid (Preliminary Evaluation)';

            Description = 'Responsive Bid (Preliminary Evaluation)';
        }
        field(70135; "Technical Evaluation Date"; Date)
        {

        }
        field(70136; "Weighted Tech Score %"; Decimal)
        {

        }
        field(70137; "Passed Tech Evaluation"; Boolean)
        {

        }
        field(70138; "Tech Evaluation Ranking"; Code[20])
        {

        }
        field(70139; "Aggregate Weighted Score %"; Decimal)
        {

        }
        field(70140; "Aggregate Ranking"; Code[20])
        {

        }
        field(70141; "Final Tender Outcome"; Option)
        {

            OptionCaption = ',Awarded,Unsuccesful,Canceled';
            OptionMembers = ,Awarded,Unsuccesful,Canceled;
        }
        field(70142; "Engineer Estimate (LCY)"; Decimal)
        {

            Description = 'This field is based on estimates for Works that usuallly guide bidders/contarctors in specialized industries such as Road construction';
        }
        field(70143; "Max Works Kickoff Duration"; Code[10])
        {
            Caption = 'Max Works Kickoff Duration (After Contract/Order)';

            Description = 'Max Works Kickoff Duration (After Contract/Order)';
        }
        field(70144; "Max Works Charter Duration"; Code[10])
        {
            Caption = 'Max Works Charter/Program Duration (After Contract/Order)';

            Description = 'Max Works Charter/Program Duration (After Contract/Order)';
        }
        field(70145; "Max Works Completion Duration"; DateFormula)
        {
            Caption = 'Max Works Completion Duration (After Contract/Order';

            Description = 'Max Works Completion Duration (After Contract/Order';

            trigger OnValidate()
            begin
                "Time Of Completion" := CalcDate("Max Works Completion Duration", "Commencement Date");
            end;
        }
        field(70147; "Defects Liability Period"; DateFormula)
        {

            Description = 'Defects Liability (Warranty) Period';
        }
        field(70148; "Daily Liquidated Dam Unit Cost"; Decimal)
        {
            Caption = 'Daily Liquidated Damages Unit Cost (LCY)';

            Description = 'Daily Liquidated Damages Unit Cost (LCY)';
        }
        field(70149; "Liquidated Damages Limit %"; Decimal)
        {
            Caption = 'Liquidated Damages Limit % (Contract Value)';

            Description = 'Liquidated Damages Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(70150; "Payment Retention %"; Decimal)
        {

            MaxValue = 100;
            MinValue = 0;
        }
        field(70151; "Retention Amount Limit %"; Decimal)
        {
            Caption = 'Retention Amount Limit % (Contract Value)';

            Description = 'Retention Amount Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(70152; "Min Interim Certificate Amount"; Decimal)
        {
            Caption = 'Minimum Interim Certificate Amount (LCY)';

        }
        field(70153; "Vendor No."; Code[20])
        {

            TableRelation = Vendor."No." where(Blocked = const(" "));

        }
        field(70154; "Sealed Bids (Technical)"; Boolean)
        {

        }
        field(70155; "Sealed Bids (Financial)"; Boolean)
        {

        }
        field(70156; "Contract Description"; Text[250])
        {

        }
        field(70157; "Contract Start Date"; Date)
        {

        }
        field(70158; "Contract End Date"; Date)
        {

        }
        field(70159; "Notice of Award No."; Code[20])
        {

            TableRelation = "Bid Tabulation Header" where("Document Type" = filter("Notice of Award"));
        }
        field(70160; "Awarded Bid No"; Code[20])
        {

            TableRelation = "Purchase Header"."No." where("Document Type" = const(Quote));
        }
        field(70161; "Award Tender Sum Inc Taxes"; Decimal)
        {
            Caption = 'Award Tender Sum Inc Taxes (LCY)';

            Description = 'Award Tender Sum Inc Taxes (LCY)';

            trigger OnValidate()
            begin
                if "Currency Code" <> '' then
                    "Award Tender Sum Incl Taxes(FC" := "Currency Factor" * "Award Tender Sum Inc Taxes";
            end;
        }
        field(70162; "IFS Code"; Code[20])
        {

            TableRelation = "Standard Purchase Code".Code;
        }
        field(70163; "Tender Name"; Text[300])
        {

        }
        field(70164; "Contract Type"; Option)
        {

            OptionCaption = 'Original Contract,Contract Variation';
            OptionMembers = "Original Contract","Contract Variation";
        }
        field(70165; "Parent Contract ID"; Code[30])
        {

        }
        field(70166; "Governing Laws"; Text[250])
        {

        }
        field(70167; "Contract Status"; Option)
        {

            OptionCaption = ' ,Signed,Pending Signing,Cancelled';
            OptionMembers = " ",Signed,"Pending Signing",Cancelled;
        }
        field(70168; "Procuring Entity (PE) Name"; Text[80])
        {

        }
        field(70169; "PE Representative"; Text[80])
        {

        }
        field(70170; "Final Evaluation Report"; Code[20])
        {

        }
        field(70171; "Final Evaluation Report Date"; Date)
        {

        }
        field(70172; "Proffesion Opinion No"; Code[20])
        {

        }
        field(70173; "Proffesion Opinion Date"; Date)
        {

        }
        field(70174; "Due Dilgence Date"; Date)
        {

        }
        field(70175; "Due Diligence Rating"; Code[20])
        {

            Description = 'Due Diligence Assessment Rating';
        }
        field(70176; "Due Diligence Report ID"; Option)
        {

            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(70177; "Due Diligence Voucher"; Code[20])
        {

        }
        field(70178; "Advance Payment Security ID"; Code[20])
        {

        }
        field(70179; "Advance Pmt Guar. Expiry Date"; Date)
        {

        }
        field(70180; "Perforance Security ID"; Code[20])
        {

        }
        field(70181; "Perforamance Sec. Expiry Date"; Date)
        {

        }
        field(70182; "Advance Payment Amount(LCY)"; Decimal)
        {

            Description = 'Advance Payment Amount(LCY)';
        }
        field(70183; "Advance Payment Settled"; Decimal)
        {

        }
        field(70184; "Certificate Number"; Code[30])
        {

        }
        field(70185; "Advance Recovery %"; Decimal)
        {

        }
        field(70186; "Retention %"; Decimal)
        {

        }
        field(70187; "Total Invoiced"; Decimal)
        {
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Document Type" = filter(Invoice),
                                                                           "Vendor No." = field("Buy-from Vendor No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70188; Balance; Decimal)
        {

            Editable = false;
        }
        field(70189; "Project No"; Code[100])
        {

            TableRelation = Job."No.";


        }
        field(70190; "Multiple IFS"; Boolean)
        {

        }
        field(70191; "Award Tender Sum Incl Taxes(FC"; Decimal)
        {

            Description = 'Foreign Curreny';
        }
        field(70192; "Contract Sum"; Decimal)
        {


            trigger OnValidate()
            begin
                if "Currency Code" = '' then begin
                    "Contract Sum" := "Contract Sum" * "Negotiated Exchange Rate";
                end;
            end;
        }
        field(70193; "Negotiated Exchange Rate"; Decimal)
        {


            trigger OnValidate()
            begin
                if "Currency Code" = '' then begin
                    "Contract Sum" := "Contract Sum" * "Negotiated Exchange Rate";
                end;
            end;
        }
        field(70194; "Upgrading Works Contract Sum"; Decimal)
        {


            trigger OnValidate()
            begin
                "Contract Sum" := "Upgrading Works Contract Sum" + "PBRM Works Contract Sum";
            end;
        }
        field(70195; "PBRM Works Contract Sum"; Decimal)
        {


            trigger OnValidate()
            begin
                "Contract Sum" := "Upgrading Works Contract Sum" + "PBRM Works Contract Sum";
            end;
        }
        field(70196; "Commencement Date"; Date)
        {

        }
        field(70197; "Time Of Completion"; Date)
        {

            Editable = false;
        }
        field(70198; "Foreign Currency Component(FCY"; Decimal)
        {

        }
        field(70199; "Percentage of Total Payment(%)"; Decimal)
        {

        }
        field(70200; "Local Currency Component(LCY)"; Decimal)
        {

        }
        field(70201; "No. Of Work Orders"; Integer)
        {

        }
        field(70202; "No. Of Program Of Works"; Integer)
        {

        }
        field(70203; "No. Of Insurance Of Works"; Integer)
        {

        }
        field(70204; "No. Of Progress Inspections"; Integer)
        {

        }
        field(70205; "No. Of Appraisal Reports"; Integer)
        {

        }
        field(70206; "No. EOTs"; Integer)
        {

            Description = 'Extension of Time';
        }
        field(70207; "Minutes Of Site Meetings"; Integer)
        {

        }
        field(70208; "Minutes Of Management Meetings"; Integer)
        {

        }
        field(70209; "Evaluator ID"; Code[20])
        {

        }
        field(70210; "Evaluator Name"; Text[250])
        {

        }
        field(70211; "Bid  Committee Evaluated"; Boolean)
        {

        }
        field(70212; "Contractor Request No"; Code[10])
        {

            TableRelation = "Measurement &  Payment Header"."Document No." where("Document Type" = filter("Contractor Payment Request"));
        }
        field(90213; "Price Validity Period"; Code[2048])
        {

        }


        field(70214; "Store Issue No"; Code[2048])
        {

        }
        field(70215; "Bid Sum 1"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const(Invoice), "Document No." = field("No."), "Contract Type" = const(Construction)));
            // Editable = false;
            FieldClass = FlowField;
        }
        field(70216; "Bid Sum 2"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const(Invoice), "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70217; "Survey/Study/Design Done?"; Option)
        {

            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;

        }
        field(70218; "Approval Rejection Remarks"; Text[2048])
        {

        }
        field(70219; "Approval OKAY Remarks"; Text[2048])
        {

        }
        field(70220; "Approval Approve Remarks"; Text[2048])
        {

        }
        field(70221; "Sixth Approver ID"; Code[100])
        {

            TableRelation = "User Setup";

            trigger OnValidate()
            begin
                if (("First Approver ID" = '') and ("Second Approver ID" = '') and ("Third Approver ID" = '') and ("Fourth Approver ID" = '') and ("Fifth Approver ID" = '')) then
                    Error('Please enter the preceding approvers');
            end;
        }
        field(70222; "First Approver ID"; Code[100])
        {

            TableRelation = "User Setup";
        }
        field(70223; "Second Approver ID"; Code[100])
        {

            TableRelation = "User Setup";

            trigger OnValidate()
            begin
                if "First Approver ID" = '' then
                    Error('Please enter the first approver');
            end;
        }
        field(70224; "Third Approver ID"; Code[100])
        {

            TableRelation = "User Setup";

            trigger OnValidate()
            begin
                if (("First Approver ID" = '') and ("Second Approver ID" = '')) then
                    Error('Please enter the preceding approvers');
            end;
        }
        field(70225; "Fourth Approver ID"; Code[100])
        {

            TableRelation = "User Setup";

            trigger OnValidate()
            begin
                if (("First Approver ID" = '') and ("Second Approver ID" = '') and ("Third Approver ID" = '')) then
                    Error('Please enter the preceding approvers');
            end;
        }
        field(70226; "Fifth Approver ID"; Code[100])
        {

            TableRelation = "User Setup";

            trigger OnValidate()
            begin
                if (("First Approver ID" = '') and ("Second Approver ID" = '') and ("Third Approver ID" = '') and ("Fifth Approver ID" = '')) then
                    Error('Please enter the preceding approvers');
            end;
        }
        field(70227; "Auto Assigned No"; Integer)
        {

        }
        field(70228; "Last Evaluation Version No."; Integer)
        {

        }
        field(70229; "Acceptance Letter Ref"; Code[30])
        {

        }
        field(70230; "Acceptance Letter Date"; Date)
        {

        }
        field(70231; "Quotation No."; CODE[100])
        {

        }
        field(70233; "Quotation Description"; Text[150])
        {

        }

        field(70232; "Total PRN Commitments"; decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Header"."Total PRN Amount" where(Region = field(Region), "Department Code" = field("Department Code")));
        }
        field(8603700; Test; Code[5])
        {

        }
        field(8603701; "Procurement Plan Item Descript"; Text[250])
        {


            trigger OnValidate()
            begin
                //PPlanEntry.RESET;
            end;
        }
        field(8603702; "Item Category Description"; Text[250])
        {

        }
        field(8603703; "WorkPlan No"; Code[20])
        {

            TableRelation = "Project Funding Request Vouche"."Document No";
        }
        field(8603704; "Work Execution Plan No"; Code[20])
        {

        }
        field(8603705; "Engineer Commencement Date"; Date)
        {


        }
        field(8603706; "Contractor Signature"; Blob)
        {

        }
        field(8603707; "Variation of Price %"; Decimal)
        {

        }
        field(8603708; "Contingency Rate"; Decimal)
        {

        }
        field(8603709; "Advance Payment Rate"; Decimal)
        {

        }
        field(8603710; "Variation of Works %"; Decimal)
        {



        }
        field(8603711; "Variation of Works Amount"; Decimal)
        {

            Editable = false;
        }
        field(8603712; "Assigded Procument Officer"; Code[100])
        {

            Editable = TRUE;
            TableRelation = "Salesperson/Purchaser".CODE;


        }
        field(8603713; "Payment Type"; Option)
        {

            Editable = TRUE;
            OptionMembers = "","MilestoneBased","Minimum IPC Amount";
            OptionCaption = ',Milestone Based,Minimum IPC Amount';

        }
        field(8603714; "Bid Scoring Template"; Code[30])
        {

            TableRelation = "Bid Scoring Template".Code;
        }
        field(8603715; "Estimated Cost"; decimal)
        {


        }
        field(8603716; "Entry Used"; boolean)
        {

        }
        field(8603717; "Directorate Name"; Text[1080])
        {

        }
        field(8603718; "Department Name2"; Text[1080])
        {

        }
        //IanCasper
        field(8603719; PRN; Code[20])
        {
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Purchase Requisition"), Status = const(Released), "Ordered PRN" = filter(false), "Responsibility Center" = field("Responsibility Center"));

        }
        field(8603720; "End Of Contract Date"; Date)
        {

        }
        field(8603721; "PBRM Period"; Duration)
        {

        }
        field(8603722; "Contract Period"; Duration)
        {

        }
        field(8603723; Rejected; Boolean)
        {
        }
    }
}
