#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50029 "tableextension50029" extends Job
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Search Description"(Field 2)".


        //Unsupported feature: Property Modification (Data type) on "Description(Field 3)".


        //Unsupported feature: Property Modification (Data type) on ""Description 2"(Field 4)".


        //Unsupported feature: Property Insertion (ValidateTableRelation) on ""Bill-to Customer No."(Field 5)".


        //Unsupported feature: Property Insertion (NotBlank) on ""Bill-to Customer No."(Field 5)".

        // modify(Status)
        // {

        //     //Unsupported feature: Property Modification (InitValue) on "Status(Field 19)".

        //   //  OptionCaption = 'Planned,Ongoing,Completed/Under DLP,Under PBRM,Completed';

        //     //Unsupported feature: Property Modification (OptionString) on "Status(Field 19)".

        // }
        modify(Description)
        {
            trigger OnAfterValidate()
            var
                DimensionValue: record "Dimension Value";
            begin
                DimensionValue.INIT;
                DimensionValue."Dimension Code" := 'PROJECT';
                DimensionValue.Code := "No.";
                DimensionValue.VALIDATE(Code);
                DimensionValue.Name := Description;
                DimensionValue.VALIDATE(Name);
                DimensionValue."Dimension Value Type" := DimensionValue."Dimension Value Type"::Standard;
                DimensionValue.Indentation := 0;
                IF NOT DimensionValue.INSERT(TRUE) THEN
                    DimensionValue.MODIFY(TRUE);
            end;
        }

        //Unsupported feature: Code Modification on ""No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          JobsSetup.GET;
          NoSeriesMgt.TestManual(JobsSetup."Job Nos.");
          "No. Series" := '';
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Document Type"="Document Type"::Job THEN BEGIN
        #1..5
        END;

        IF "Document Type"="Document Type"::Project THEN BEGIN
        IF "No." <> xRec."No." THEN BEGIN
          RMSetup.GET;
          NoSeriesMgt.TestManual(RMSetup."Section Nos");
          "No. Series" := '';
        END;
        END;
        */
        //end;


        //Unsupported feature: Code Modification on "Status(Field 19).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF xRec.Status <> Status THEN BEGIN
          IF Status = Status::Completed THEN
            VALIDATE(Complete,TRUE);
          IF xRec.Status = xRec.Status::Completed THEN
            IF DIALOG.CONFIRM(StatusChangeQst) THEN
              VALIDATE(Complete,FALSE)
            ELSE
        #8..10
          JobPlanningLine.SETRANGE("Job No.","No.");
          JobPlanningLine.MODIFYALL(Status,Status);
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF xRec.Status <> Status THEN BEGIN
          IF Status = Status::"Under PBRM" THEN
            VALIDATE(Complete,TRUE);
          IF xRec.Status = xRec.Status::"Under PBRM" THEN
        #5..13
        */
        //end;


        //Unsupported feature: Code Insertion on ""Person Responsible"(Field 20)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        IF Res.GET("Person Responsible") THEN BEGIN
          "Principle Investigator Name":=Res.Name;
          END;
        */
        //end;
        field(15; "Revised End Date"; Date)
        {

        }
        field(50000; "Project Budget"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Job No." = field("No."),
                                                                            "Line Type" = filter("Both Budget and Billable" | Budget)));
            Caption = 'Total Project Budget';
            Description = '//Daudi changed from schedule to budget as per the new 2017';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "Actual Project Costs"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Job No." = field("No."),
                                                                           "Entry Type" = const(Usage)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Budget Commitments"; Decimal)
        {
            Caption = 'Total Budget Commitments';
        }
        field(50003; "Available Funds"; Decimal)
        {
        }
        field(50006; "Last Invoice Date"; Date)
        {
            CalcFormula = max("Job Ledger Entry"."Posting Date" where("Job No." = field("No."),
                                                                       "Entry Type" = const(Sale)));
            FieldClass = FlowField;
        }
        field(50007; "Prior Period Turnover"; Decimal)
        {
        }
        field(50008; "Prior Period Costs"; Decimal)
        {
        }
        field(50009; "Current Period Turnover"; Decimal)
        {
        }
        field(50010; "Current Period Costs"; Decimal)
        {
        }
        field(50011; "Later Period Turnover"; Decimal)
        {
        }
        field(50012; "Later Period Costs"; Decimal)
        {
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50050; "Last Invoice Entry Date"; Date)
        {
            CalcFormula = max("Job Ledger Entry"."Posting Date" where("Job No." = field("No."),
                                                                       "Entry Type" = const(Sale)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50051; "Last Usage Entry Date"; Date)
        {
            CalcFormula = max("Job Ledger Entry"."Posting Date" where("Job No." = field("No."),
                                                                       "Entry Type" = const(Usage)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(52000; "Road Project No"; Code[10])
        {

            TableRelation = "Roads Projects"."Project  No";
        }
        field(52001; "Year Code"; Code[10])
        {

            TableRelation = "Financial Year Code".Code;
        }
        field(57000; "No. Of Project Imprest Memos"; Integer)
        {
            CalcFormula = count("Imprest Memo" where(Project = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57001; "PO Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document Type" = filter(Order),///// Status=filter(Released),
                                                               "Job No." = field("No.")));
            Caption = 'Purchase Order Commitments';
            Editable = false;
            FieldClass = FlowField;
            //FieldClass = Normal;
        }
        field(57002; "PRN Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document Type" = filter("Purchase Requisition"),
                                                                    /// Status=filter(Released),
                                                                    "Job No." = field("No."),
                                                                    Ordered = filter(false)));
            Caption = 'Purchase Requisition(PRN) Commitments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57003; "Store Requisition Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document Type" = filter("Store Requisition"),
                                                                ////   Status=filter(Released),
                                                                "Job No." = field("No."),
                                                                    "Quantity To  Issue" = filter(> 0)));
            Caption = 'Store Requisition(S11) Commitments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57004; "Imprest Application Commitment"; Decimal)
        {
            CalcFormula = sum("Imprest Lines".Amount where(Project = field("No."),
                                                            Status = filter(Released),
                                                            "Payment Type" = filter(<> "Imprest Surrender")));
            Caption = 'Imprest Applications Commitments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57005; "Opportunity Reference"; Code[50])
        {

            TableRelation = "Funding Oportunity".No;

            trigger OnValidate()
            begin
                if FundOp.Get("Opportunity Reference") then begin
                    "Fund Opportunity Name" := FundOp.Name;
                    "Grant Amount" := FundOp.Amount;
                end;
            end;
        }
        field(57006; "Grant Amount"; Decimal)
        {

        }
        field(57007; "Fund Opportunity Name"; Code[50])
        {

        }
        field(57008; "Research Center"; Code[30])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Research Center?" = const(true));
        }
        field(57009; "Research Program"; Code[30])
        {

            TableRelation = "Research Program";
        }
        field(57010; "Research Project Area"; Code[30])
        {

            TableRelation = "Research Project Area" where("Research Program ID" = field("Research Program"));
        }
        field(57011; "Grant Type"; Code[30])
        {

        }
        field(57012; "Researcher Code"; Code[30])
        {

            TableRelation = Resource where("Researcher?" = filter(true));
        }
        field(65000; "Document Type"; Option)
        {

            Description = 'Start of Grants Module';
            OptionCaption = 'Job,Project,Budget';
            OptionMembers = Job,Project,Budget;
        }
        field(65001; "Grant Applications ID"; Code[50])
        {

            TableRelation = "Grant Funding Application" where("Application Status" = const(Won));

            trigger OnValidate()
            begin
                GFA.Reset;
                GFA.SetRange("Application No", "Grant Applications ID");
                if GFA.Find('-') then begin
                    GFA.CalcFields("Principal Investigator");
                    "Bill-to Customer No." := GFA."Grantor No.";
                    "Bill-to Name" := GFA."Grantor Name";
                    "Research Center" := GFA."Research Center";
                    "Person Responsible" := GFA."Principal Investigator";
                    "Currency Code" := GFA."Currency Code";
                    // "Project Manager":=
                end;
            end;
        }
        field(65002; "Grantor Admin Contact ID"; Code[50])
        {

            TableRelation = Contact;
        }
        field(65003; "Grantor Admin Name"; Code[100])
        {

        }
        field(65004; "Grantor Financial Contact ID"; Code[50])
        {

            TableRelation = Contact;
        }
        field(65005; "Grantor Financial Contact Name"; Code[100])
        {

        }
        field(65006; "Grantor Authorized Official ID"; Code[50])
        {

        }
        field(65007; "Grantor Authorized Official"; Code[100])
        {

        }
        field(65008; "Approval Status"; Option)
        {

            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(65009; "Created By"; Code[50])
        {

        }
        field(65010; "Creation Date/Time"; DateTime)
        {

        }
        field(65011; "Notice of Award No."; Code[50])
        {

        }
        field(65012; "External Grant Reference No."; Code[50])
        {

        }
        field(65013; "CFDA No."; Code[50])
        {

        }
        field(65014; "Award Date"; Date)
        {

        }
        field(65015; "Assistance Type"; Option)
        {

            OptionCaption = 'Grant,Cooperative Agreement';
            OptionMembers = Grant,"Cooperative Agreement";
        }
        field(65016; "Budget Start Date"; Date)
        {

        }
        field(65017; "Budget End Date"; Date)
        {

        }
        field(65018; "Project Start Date"; Date)
        {

        }
        field(65019; "Project End Date"; Date)
        {

        }
        field(65020; "Primary Funding Sponsor ID"; Code[50])
        {

            TableRelation = Customer where("Funding Class" = const(Grant));

            // trigger OnValidate()
            // begin
            //     Cust.Reset;
            //     Cust.SetRange("No.","Primary Funding Sponsor ID");
            //     if Cust.Find('-') then begin
            //        "Primary Sponsor Name":=Cust.Name;
            //       end;
            // end;
        }
        field(65021; "Primary Sponsor Name"; Code[100])
        {

        }
        field(65022; "Project Type"; Option)
        {

            OptionCaption = 'Time and Material,Fixed-Price';
            OptionMembers = "Time and Material","Fixed-Price";
        }
        field(65024; "Total Billed Amount"; Decimal)
        {

        }
        field(65025; "Grantee Name"; Code[50])
        {

        }
        field(65026; "Grantee Address"; Code[20])
        {

        }
        field(65027; "Grantee Address 2"; Code[20])
        {

        }
        field(65028; "Grantee Post Code"; Code[20])
        {

        }
        field(65029; "Grantee City"; Code[20])
        {

        }
        field(65030; "Grantee Country/Region"; Code[20])
        {

        }
        field(65031; "Grantee Project Director Name"; Code[100])
        {

        }
        field(65032; "Grantee Financial Contact ID"; Code[50])
        {

            TableRelation = Contact;
        }
        field(65033; "Grantee Financial Contact Name"; Code[100])
        {

        }
        field(65034; "Grantee Authorized Official ID"; Code[50])
        {

            TableRelation = Contact;
        }
        field(65035; "Grantee Authorized Official"; Code[50])
        {

        }
        field(65036; "Grantee Project Director ID"; Code[30])
        {

            TableRelation = Contact;
        }
        field(65037; "Award Type"; Option)
        {

            OptionCaption = 'Prime Recipient,Sub-Recipient';
            OptionMembers = "Prime Recipient","Sub-Recipient";
        }
        field(65038; "Project Funding Contract No"; Code[10])
        {

            TableRelation = "Project Contract Header"."Project Contract No";
        }
        field(65039; "Country Entry Code"; Code[10])
        {

            TableRelation = "Contract Funding Lines"."Year Code" where("Project Contract No." = field("Project Funding Contract No"));
        }
        field(65040; "Grantee Admin Contact ID"; Code[50])
        {

            TableRelation = Contact;
        }
        field(65041; "Grantee Admin Contact Name"; Code[100])
        {

        }
        field(65042; "Total Approved Direct Costs"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Direct Unit Cost (LCY)" where("Job No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65043; "Total Approved Indirect Costs"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Direct Unit Cost (LCY)" where("Job No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65044; "Indirect Cost (%)"; Decimal)
        {

            Editable = false;
        }
        field(65045; "Total Approved Budget"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Job No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65046; "Total Actual Costs"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Job No." = field("No."),
                                                                           "Entry Type" = const(Usage)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65047; "Total Billable Amount"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Line Amount (LCY)" where("Job No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65048; "Total Invoiced Amount"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Line Discount Amount" where("Job No." = field("No."),
                                                                               "Entry Type" = const(Sale)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65049; "Completed (%)"; Decimal)
        {

            Editable = false;
        }
        field(65050; "Invoiced (%)"; Decimal)
        {

            Editable = false;
        }
        field(65051; "Project No"; Code[50])
        {

            TableRelation = Job."No." where("Document Type" = const(Project));
        }
        field(65052; "Budget Type"; Option)
        {

            OptionCaption = 'Original,Revised,Suplementary';
            OptionMembers = Original,Revised,Suplementary;
        }
        field(65053; "Principle Investigator Name"; Text[100])
        {

        }
        field(69000; "Posting Group Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Employee Posting GroupX";
        }
        field(69001; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX";
        }
        field(69002; "Total deductions"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Deduction),
                                                                  "Posting Group Filter" = field("Posting Group Filter"),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Job No" = field("No."),
                                                                  Honoraria = const(false),
                                                                  "Employee No" = field("Employee Filter"),
                                                                  Code = field("Deduction Code Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69003; "Total Earnings"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Posting Group Filter" = field("Posting Group Filter"),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Job No" = field("No."),
                                                                  Honoraria = const(false),
                                                                  "Non-Cash Benefit" = const(false),
                                                                  "Employee No" = field("Employee Filter"),
                                                                  Code = field("Earning Code Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69004; "Total Employer"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Employer Amount" where(Type = const(Payment),
                                                                             "Posting Group Filter" = field("Posting Group Filter"),
                                                                             "Payroll Period" = field("Pay Period Filter"),
                                                                             "Job No" = field("No."),
                                                                             Honoraria = const(false),
                                                                             "Non-Cash Benefit" = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69005; "Earning Code Filter"; Code[50])
        {
            FieldClass = FlowFilter;
            TableRelation = EarningsX;
        }
        field(69006; "Deduction Code Filter"; Code[50])
        {
            FieldClass = FlowFilter;
            TableRelation = DeductionsX;
        }
        field(69007; "Employee Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(70018; "Directorate Code"; Code[50])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"));
        }
        field(70020; exchequer; Boolean)
        {

        }
        field(70021; Commitments; Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where(Job = field("No."),
                                                                  Type = const(Committed)));
            FieldClass = FlowField;
        }
        field(70022; "Road Length(KM)"; Decimal)
        {

        }
        field(70023; "Funding Source"; Code[20])
        {

            // TableRelation = "Funding Source";
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(70024; "Project Category"; Option)
        {

            InitValue = Normal;
            OptionCaption = ' ,Normal,Road';
            OptionMembers = " ",Normal,Road;
        }
        field(70025; "Road Project Sub-Category"; Code[20])
        {

            TableRelation = "Road Project Type".Code where(Blocked = filter(false),
                                                            Category = field("Road Project Type"));
        }
        field(70026; "Road Project Type"; Option)
        {

            OptionCaption = ' ,Construction,Maintenance,Studies_Surveys_Designs';
            OptionMembers = " ",Construction,Maintenance,Studies_Surveys_Designs;
        }
        field(70027; "Road Code"; Code[30])
        {

            TableRelation = "Road Inventory"."Road Code";

            trigger OnValidate()
            var
                RoadInventory: record "Road Inventory";
            begin
                RoadInventory.Reset;
                RoadInventory.SetRange(RoadInventory."Road Code", "Road Code");
                if RoadInventory.FindSet then begin
                    "Link Name" := RoadInventory."Link Name";
                end;
            end;
        }
        field(70028; "Type of Project"; Option)
        {

            OptionCaption = ' ,Maintenance,Road Construction,Survey/Study,Structure Construction';
            OptionMembers = " ",Maintenance,"Road Construction","Survey/Study","Structure Construction";
        }
        field(70029; "Record Type"; Option)
        {

            OptionCaption = ' ,Job,Research,Road Project';
            OptionMembers = " ",Job,Research,"Road Project";
        }
        field(70030; "Road Project Catergory"; Option)
        {

            OptionCaption = ' ,Studies & Surveys,Design Works,Construction,Asset Management';
            OptionMembers = " ","Studies & Surveys","Design Works",Construction,"Asset Management";
        }
        field(70031; "Primary Works Category"; Code[20])
        {

            // TableRelation = "Works Category".Code where ("Default BoQ Template Code"=filter('1'),
            //                                              "Road Project Category"=field("Primary Works Category"));
        }
        field(70032; "Link Name"; Text[250])
        {

        }
        field(70033; "Road Class ID"; Code[20])
        {

            TableRelation = "Road Class"."Road Class ID" where(Blocked = filter(false));
        }
        field(70034; "Road Section No"; Code[20])
        {

            TableRelation = "Road Section"."Road Section No." where("Road Code" = field("Road Code"));

            trigger OnValidate()
            var
                RoadSection: record "Road Section";
            begin
                RoadSection.Reset;
                RoadSection.SetRange(RoadSection."Road Section No.", "Road Section No");
                if RoadSection.FindSet then begin
                    "Section Name" := RoadSection."Section Name";
                    "Constituency ID" := RoadSection."Primary Constituency ID";

                    "County ID" := RoadSection."Primary County ID";
                    "Region ID" := RoadSection."Primary Region ID";
                end;
            end;
        }
        field(70035; "Section Name"; Text[250])
        {

        }
        field(70036; "Constituency ID"; Code[30])
        {

            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Constituency));
        }
        field(70037; "County ID"; Code[40])
        {

            TableRelation = County1.Code;
        }
        field(70038; "Region ID"; Code[40])
        {

            TableRelation = County1.Code;
        }
        field(70039; "Section Start Chainage(Km)"; Decimal)
        {

        }
        field(70040; "Section End Chainage(KM)"; Decimal)
        {

        }
        field(70041; "Total Road Section Length (KM)"; Decimal)
        {

        }
        field(70042; "Purchase Contract ID"; Code[20])
        {

            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Purchase Contract ID");
                if PurchaseHeader.FindSet then begin
                    "Tender Sum Inc Taxes (LCY)" := PurchaseHeader."Contract Sum";
                end;
            end;
        }
        field(70043; "External Contract Reference"; Code[20])
        {

        }
        field(70044; "Contractor No."; Code[20])
        {
            Caption = 'Contracting Vendor No';

            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if Vendor.Get("Contractor No.") then
                    "Contractor Name" := Vendor.Name;
            end;
        }
        field(70045; "Contractor Name"; Text[250])
        {

        }
        field(70046; "Contract Start Date"; Date)
        {

        }
        field(70047; "Contract End Date"; Date)
        {

        }
        field(70048; "Notice of Award Date"; Date)
        {

        }
        field(70049; "Awarded Bid No"; Code[20])
        {

            TableRelation = "Purchase Header"."No." where("Document Type" = filter(Quote));
        }
        field(70050; "Tender Sum Inc Taxes (LCY)"; Decimal)
        {

            TableRelation = "Purchase Header"."Read-out Bid Price (A)";
        }
        field(70051; "IFS Code"; Code[20])
        {

        }
        field(70052; "Staff Appmnt Voucher ID"; Code[20])
        {

        }
        field(70053; "Project Commencement Order"; Code[20])
        {

        }
        field(70054; "Work Execution Plan ID"; Code[20])
        {

        }
        field(70055; "No. of Filed Status Reports"; Integer)
        {
            FieldClass = Normal;
        }
        field(70056; "No. of Supervisor Checklists"; Integer)
        {

        }
        field(70057; "No. of Filed Project Meetings"; Integer)
        {
            FieldClass = Normal;
        }
        field(70058; "No. of Daily Work Records"; Integer)
        {

        }
        field(70059; "No. of Project Change Orders"; Integer)
        {

        }
        field(70060; "No. of Contract Work Conf Nots"; Integer)
        {
            Caption = 'No. of Contractor Work Confirmation Notices';

            Description = '//No. of Contractor Work Confirmation Notices';
        }
        field(70061; "No. of Inspections"; Integer)
        {

        }
        field(70062; "No. of Payment Certificates"; Integer)
        {

            Description = '//No. of Payment Certificates (Both Interim & Final)';
        }
        field(70063; "Road Works Category"; Code[40])
        {

            TableRelation = "Works Category".Code where("Default BoQ Template Code" = filter('1'));

            trigger OnValidate()
            begin
                // WorksCategory.RESET;
                // WorksCategory.SETRANGE();WorksCategory.Code,Rec.road w
            end;
        }
        field(70064; "Road Project Category"; Code[40])
        {

        }
        field(70065; "Gloabl Road Type"; Option)
        {

            OptionCaption = ' ,Development,Maintenance';
            OptionMembers = " ",Development,Maintenance;
        }
        field(70066; "Project Delivery Strategy"; Code[20])
        {

            TableRelation = "Project Delivery Strategy".Code where(Blocked = filter(false));
        }
        field(70067; "Last EOT Request No."; Code[20])
        {
            CalcFormula = max("Project Variation Header"."Document No." where("Project ID" = field("No."),
                                                                               Posted = filter(true),
                                                                               "Document Type" = filter("Extension of Time Request")));
            Caption = 'Last Extension of Time Request No.';
            Description = 'Last Extension of Time Request No.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70068; "Extended Project End Date"; Date)
        {
            CalcFormula = max("Project Variation Header"."Document Date" where("Project ID" = field("No."),
                                                                                Posted = filter(true),
                                                                                "Document Type" = filter("Extension of Time Request")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70069; "Global Budget Book ID"; Code[20])
        {

        }
        field(70070; "Department ID"; Code[20])
        {

            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(70071; "Total Project Cost Excl. VAT"; Decimal)
        {

            Editable = false;
        }
        field(70072; "Total Project Cost Incl. VAT"; Decimal)
        {

            Editable = false;
        }
        field(70073; "Contingency Amount"; Decimal)
        {

            Editable = false;
        }
        field(70074; "Variation of Price Amount"; Decimal)
        {

            Editable = false;
        }
        field(70075; "Project Location ID"; Code[20])
        {

            TableRelation = Location.Code;
        }
        field(70076; "KeRRA Budget Code"; Code[20])
        {
            
        }
        field(70077; "Last Variation Request No."; Integer)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(70078; "Last Taking Over Request No."; Integer)
        {

            Editable = false;
        }
        field(70079; "Last IPC Number"; Integer)
        {

            Editable = false;
        }
        field(70080; "% Physical Progress"; Decimal)
        {

        }
        field(70081; "KM of Tarmac Completed"; Decimal)
        {
            CalcFormula = sum("Job Monthly Progress"."KM of Tarmac Done" where("Job No" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70082; "Workplanned Length"; Decimal)
        {

            Editable = false;
        }
        field(70083; "Reasons for Suspension"; Text[2048])
        {

        }
        field(70084; "Total No of Men Employed"; Integer)
        {
            CalcFormula = sum("Job Monthly Progress"."No of Men Employed" where("Job No" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70085; "Total No of Women Employed"; Integer)
        {
            CalcFormula = sum("Job Monthly Progress"."No of Women Employed" where("Job No" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70086; "Total Men Mandays"; Decimal)
        {
            CalcFormula = sum("Job Monthly Progress"."Men Mandays" where("Job No" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70087; "Total Women Mandays"; Decimal)
        {
            CalcFormula = sum("Job Monthly Progress"."Women Mandays" where("Job No" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70088; "Lot No"; Code[20])
        {

        }
        field(70089; "Study/Survey Type"; Option)
        {

            OptionCaption = ' ,ESIA Study,Topographic Survey,Traffic Census,Road Safety Audit,Design Works,Environmental Audits';
            OptionMembers = " ","ESIA Study","Topographic Survey","Traffic Census","Road Safety Audit","Design Works","Environmental Audits";
        }
        field(70090; "Payments to Date"; Decimal)
        {

        }
        field(70091; "Revised Contract Sum"; Decimal)
        {

        }
        field(70092; "Revised Workplanned Length"; Decimal)
        {

        }
        field(70093; "Last Site Inst No"; Integer)
        {

            Description = 'Last Site Instruction No';
        }
        field(70094; "No of Structures(Planned)"; Integer)
        {

        }
        field(70095; "No of Structures Completed"; Integer)
        {
            CalcFormula = count("Job Monthly Progress" where("Job No" = field("No.")));
            FieldClass = FlowField;
        }
        field(70096; "ESIA Licence No"; Code[30])
        {

        }
        field(70097; "Total KM Designed"; Decimal)
        {
            CalcFormula = sum("Job Monthly Progress"."No of KM Designed" where("Job No" = field("No.")));
            FieldClass = FlowField;
        }
        field(70098; "Project Phase"; Option)
        {

            OptionCaption = 'Inception,Preliminary,Draft Final,Final,Licensed';
            OptionMembers = Inception,Preliminary,"Draft Final",Final,Licensed;
        }
        field(70099; "Assignment Area ID"; Code[50])
        {

            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Duty Station"),
                                                                Blocked = filter(false));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Assignment Area ID");
                if ResponsibilityCenter.FindSet then
                    "Assignment Area Name" := ResponsibilityCenter.Name;
            end;
        }
        field(70100; "Assignment Area Name"; Text[2048])
        {

            Editable = false;
        }
        field(70101; "NEMA Licence Issued"; Boolean)
        {

        }
        field(70102; "NEMA Licence Issue Date"; Date)
        {

        }
        field(70103; "NEMA Licence Validity Period"; DateFormula)
        {

        }
        field(70104; "NEMA Licence Expiry Date"; Date)
        {

        }
        field(70105; "Responsibility Center"; Code[40])
        {

        }
        field(70106; "VR Link"; Text[250])
        {

            ExtendedDatatype = URL;
            InitValue = 'http://www.ambience.co.ke/bobharrismilestone10/';
        }
        field(70107; "Request No"; Code[20])
        {

            Editable = false;
            TableRelation = "Survey Request Header"."Document No.";
        }
        field(70108; "Execution Approach"; Option)
        {

            OptionCaption = 'Inhouse,External Consultant';
            OptionMembers = Inhouse,"External Consultant";
        }
        field(70109; "Commencement Date"; Date)
        {

            Editable = false;
        }
        field(70110; "Description 3"; TEXT[1000])
        {

            Caption = 'Project Description 2';
            Editable = true;
        }
        field(70111; "Total Contract Sum Inc VAT"; Decimal)
        {
            Editable = false;
            fieldClass = flowfield;
            CalcFormula = sum("Job Planning Line"."Total Cost Incl. VAT" where("Job No." = field("No.")));
        }
        field(70112; "Revised Completion Period"; Duration)
        {

        }
        field(70113; "CIT Committee No."; Code[20])
        {
            
        }
        field(70114; "Vendor Bank Account No."; Code[20])
        {
           TableRelation = "Vendor Bank Account".Code where("Vendor No." = field("Contractor No."));
        }
        field(70115; "Person Responsible Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource.Name WHERE(Type = CONST(Person));
            Editable = false;
            Caption = 'Resident Engineer Name';
        }
        modify("Person Responsible")
        {
            trigger OnAfterValidate()
            var
                Res: Record Resource;
            begin
                Res.Reset();
                Res.SetRange("No.", Rec."Person Responsible");
                if Res.Find('-') then
                    "Person Responsible Name" := Res.Name;
            end;
        }
        modify("Global Dimension 2 Code")
        {
            trigger OnAfterValidate()
            begin
                Rec."Funding Source" := Rec."Global Dimension 2 Code";
            end;
        }
    }
    keys
    {
        key(Key1; "Research Center")
        {
        }
    }

    fieldgroups
    {
        addlast(DropDown; "Description 3")
        {

        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    trigger OnInsert()

    begin
        "Bill-to Customer No." := 'CUST00003';
        VALIDATE("Bill-to Customer No.");
        IF Usersetup.GET(USERID) THEN BEGIN
            "Created By" := USERID;
            //   IF NOT Usersetup."Create New Job" THEN
            //     ERROR(PemissionDenied);
            //  END ELSE BEGIN
            // ERROR(UserNotFound, USERID);
        END;

        /*
        JobsSetup.GET;

        IF "No." = '' THEN BEGIN
          JobsSetup.TESTFIELD("Job Nos.");
          NoSeriesMgt.InitSeries(JobsSetup."Job Nos.",xRec."No. Series",0D,"No.","No. Series");
        END;

        IF GETFILTER("Bill-to Customer No.") <> '' THEN
          IF GETRANGEMIN("Bill-to Customer No.") = GETRANGEMAX("Bill-to Customer No.") THEN
        #10..21
        DimMgt.UpdateDefaultDim(
          DATABASE::Job,"No.",
          "Global Dimension 1 Code","Global Dimension 2 Code");
        InitWIPFields;

        "Creation Date" := TODAY;
        "Last Date Modified" := "Creation Date";

        IF ("Project Manager" <> '') AND (Status = Status::Open) THEN
          AddToMyJobs("Project Manager");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        { IF Usersetup.GET(USERID) THEN BEGIN
          IF NOT Usersetup."Create New Job" THEN
            ERROR(PemissionDenied);
         END ELSE BEGIN
          ERROR(UserNotFound,USERID);
         END;
         }
         "Bill-to Customer No.":='KRB';
         VALIDATE("Bill-to Customer No.");
        JobsSetup.GET;
        IF "Document Type"="Document Type"::Job THEN BEGIN
        #3..6
        END;


        JobsSetup.GET;
        IF "Document Type"="Document Type"::Budget THEN BEGIN
        IF "No." = '' THEN BEGIN
          JobsSetup.TESTFIELD("Budget Plan Nos");
          NoSeriesMgt.InitSeries(JobsSetup."Budget Plan Nos",xRec."No. Series",0D,"No.","No. Series");
        END;
        END;

        IF (("Document Type"="Document Type"::Project) AND ("Project Category" <> "Project Category"::Road)) THEN BEGIN
        IF "No." = '' THEN BEGIN
          RMSetup.GET;
          RMSetup.TESTFIELD("Section Nos");
          NoSeriesMgt.InitSeries(RMSetup."Section Nos",xRec."No. Series",0D,"No.","No. Series");
        END;
        END;

        //Roads Construction Projects
        IF "No." = '' THEN BEGIN
        IF ((("Document Type" = "Document Type"::Project) AND ("Project Category" = "Project Category"::Road) AND ("Road Project Type" = "Road Project Type"::Construction))) THEN BEGIN
          RMSetup.GET;
          RMSetup.TESTFIELD("Construction Projects Nos");
          NoSeriesMgt.InitSeries(RMSetup."Construction Projects Nos",xRec."No. Series",0D,"No.","No. Series");
          END;
          END;

        //Road Maintance projects
        IF "No." = '' THEN BEGIN
        IF ((("Document Type" = "Document Type"::Project) AND ("Project Category" = "Project Category"::Road) AND ("Road Project Type" = "Road Project Type"::Maintenance))) THEN BEGIN
          RMSetup.GET;
          RMSetup.TESTFIELD("Maintenance Projects Nos");
          NoSeriesMgt.InitSeries(RMSetup."Maintenance Projects Nos",xRec."No. Series",0D,"No.","No. Series");
          END;
          END;

        //Road surveys,Studies & Designs
        IF "No." = '' THEN BEGIN
        IF ((("Document Type" = "Document Type"::Project) AND ("Project Category" = "Project Category"::Road) AND ("Road Project Type" = "Road Project Type"::Studies_Surveys_Designs))) THEN BEGIN
          RMSetup.GET;
          RMSetup.TESTFIELD("Surveys_Studies_Designs Nos");
          NoSeriesMgt.InitSeries(RMSetup."Surveys_Studies_Designs Nos",xRec."No. Series",0D,"No.","No. Series");
          END;
          END;
        #7..24
        //update JOB Dimensin

        #25..29
        IF ("Project Manager" <> '') AND (Status = Status::"Completed/Under DLP") THEN
          AddToMyJobs("Project Manager");
        */
    end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Date Modified" := TODAY;

    IF (("Project Manager" <> xRec."Project Manager") AND (xRec."Project Manager" <> '')) OR (Status <> Status::Open) THEN
      RemoveFromMyJobs;

    IF ("Project Manager" <> '') AND (xRec."Project Manager" <> "Project Manager") THEN
      IF Status = Status::Open THEN
        AddToMyJobs("Project Manager");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
     IF Usersetup.GET(USERID) THEN BEGIN
      IF NOT Usersetup."Update Job Status" THEN
        ERROR(PemissionDenied);
     END ELSE BEGIN
      ERROR(UserNotFound,USERID);
     END;

    "Last Date Modified" := TODAY;

    IF (("Project Manager" <> xRec."Project Manager") AND (xRec."Project Manager" <> '')) OR (Status <> Status::"Completed/Under DLP") THEN
    #4..6
      IF Status = Status::"Completed/Under DLP" THEN
        AddToMyJobs("Project Manager");
    */
    //end;


    //Unsupported feature: Code Modification on "AddToMyJobs(PROCEDURE 25)".

    //procedure AddToMyJobs();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF Status = Status::Open THEN BEGIN
      MyJob.INIT;
      MyJob."User ID" := ProjectManager;
      MyJob."Job No." := "No.";
    #5..9
      MyJob."Exclude from Business Chart" := FALSE;
      MyJob.INSERT;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF Status = Status::"Completed/Under DLP" THEN BEGIN
    #2..12
    */
    //end;

    procedure FnMetricsComputation()
    begin
        /*IF  ("Total Approved Budget"<>0) THEN BEGIN
            "Indirect Cost (%)":=ROUND("Total Approved Direct Costs"/"Total Approved Budget",0.01,'=');
            "Completed (%)":=ROUND("Total Actual Costs"/"Total Approved Budget",0.01,'=');
          END;
        IF ("Total Billable Amount"<>0) THEN BEGIN
          "Invoiced (%)":=ROUND("Total Invoiced Amount"/"Total Billable Amount",0.01,'=');
          END;
        
        MODIFY;*/

    end;

    //Unsupported feature: Property Modification (Fields) on "DropDown(FieldGroup 1)".



    var
        FundOp: Record "Funding Oportunity";
        GrantsSetup: Record "Grants Setup";
        GFA: Record "Grant Funding Application";
        Res: Record Resource;
        PemissionDenied: label 'User Account is not Setup for Project Creation. Contact System Administrator.';
        UserNotFound: label 'User Setup %1 not found.';
        PemissionDeniedd: label 'User Account is not Setup for Project Modification. Contact System Administrator.';
        Usersetup: Record "User Setup";
        RMSetup: Record "Roads Management Setup";
        // RoadInventory: Record "Road Inventory";
        // RoadSection: Record "Road Section";
        WorksCategory: Record "Works Category";
        Vendor: Record Vendor;
        PurchaseHeader: Record "Purchase Header";
        ResponsibilityCenter: Record "Responsibility Center";
}

