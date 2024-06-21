#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70101 "Procurement Plan Entry"
{
    Caption = 'Procurement Plan Entry';

    fields
    {
        field(1; "Procurement Plan ID"; Code[20])
        {
            Caption = 'Procurement Plan ID';
            TableRelation = "Procurement Plan".Code;

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::"Revision Voucher" then begin
                    ProcurementPlan.Reset;
                    ProcurementPlan.SetRange(Code, "Procurement Plan ID");
                    if ProcurementPlan.FindSet then begin
                        ProcurementPlan.TestField("Plan No");
                        "Revised Plan No" := ProcurementPlan."Plan No";
                        // MODIFY(TRUE);
                    end;


                end;
            end;
        }
        field(2; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(3; "Planning Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code;

            trigger OnValidate()
            begin
                ProcurementCategories.Reset;
                ProcurementCategories.SetRange(Code, "Planning Category");
                if ProcurementCategories.FindSet then begin
                    "Procurement Type" := ProcurementCategories."Procurement Type";
                    Description := ProcurementCategories.Description;
                    //"Funding Source ID":=ProcurementCategories.
                    Region := ProcurementCategories."Applicable Location";
                end;
            end;
        }
        field(4; "Work Plan Project ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(6; "Procurement Type"; Code[20])
        {
            Caption = 'Procurement Type';
            TableRelation = "Procurement Types".Code;

            trigger OnValidate()
            begin
                if "Procurement Type" = 'GOODS' then
                    "Requisition Product Group" := "requisition product group"::Goods;
                if "Procurement Type" = 'SERVICES' then
                    "Requisition Product Group" := "requisition product group"::Services;
                if "Procurement Type" = 'WORKS' then
                    "Requisition Product Group" := "requisition product group"::Works;
                if "Procurement Type" = 'ASSETS' then
                    "Requisition Product Group" := "requisition product group"::Assets;
            end;
        }
        field(7; "Solicitation Type"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Solicitation Type".Code;
        }
        field(8; "Procurement Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(9; "Preference/Reservation Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Special Vendor Category".Code;
        }
        field(10; "Funding Source ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source".Code;
        }
        field(11; "Planning Date"; Date)
        {
            Caption = 'Planning Date';
            ClosingDates = true;
            TableRelation = "Procurement Plan"."Start Date" where(Code = field("Procurement Plan ID"));
        }
        field(12; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Line Budget Cost" := Quantity * "Unit Cost";
            end;
        }
        field(13; "Unit Cost"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate(Quantity);
                Validate("Line Budget Cost");
            end;
        }
        field(14; "Line Budget Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
            NotBlank = TRUE;
            trigger OnValidate()
            begin
                GLSetup.Get;
                if Rec."Currency Code" <> '' then begin
                    "Line Budget Cost (LCY)" := ROUND(
                          CurrExchRate.ExchangeAmtFCYToLCY(
                            Today, "Currency Code",
                            "Line Budget Cost", "Currency Factor"),
                          GLSetup."Unit-Amount Rounding Precision");
                end else
                    "Line Budget Cost (LCY)" := "Line Budget Cost";
            end;
        }
        field(15; Region; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));

        }
        field(70999; "Region Name"; Text[130])
        {

            FieldClass = FlowField;
            CalcFormula = lookup("Responsibility Center".name where(Code = field(Region)));

        }

        field(16; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(71001; "Directorate Name"; text[310])
        {

            FieldClass = FlowField;
            CalcFormula = lookup("Responsibility Center".name where(Code = field(Directorate)));
        }
        field(17; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));//,

            //  "Direct Reports To" = field(Directorate));
        }
        field(71000; "Department Name"; text[310])
        {

            FieldClass = FlowField;
            CalcFormula = lookup("Responsibility Center".name where(Code = field(Department)));
        }
        field(18; County; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code;
        }
        field(19; "Road No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code";

            trigger OnValidate()
            var
                roadinv: record "Road Inventory";
            begin
                Roadinv.Reset;
                Roadinv.SetRange("Road Code", "Road No.");
                if Roadinv.FindSet then
                    "Road Name" := Roadinv."Link Name";
            end;
        }
        field(20; "Road Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin

                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 1 Code", "Global Dimension 1 Code");
                UpdateDimensionSetId(GLSetup."Global Dimension 1 Code", "Global Dimension 1 Code");
            end;
        }
        field(79999; "Global Dimension 1 Code Name"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department Name';
            TableRelation = "Dimension Value".Name where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin

                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 1 Code", "Global Dimension 1 Code");
                UpdateDimensionSetId(GLSetup."Global Dimension 1 Code", "Global Dimension 1 Code");
            end;
        }
        field(22; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                if "Global Dimension 2 Code" = xRec."Global Dimension 2 Code" then
                    exit;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 2 Code", "Global Dimension 2 Code");
                UpdateDimensionSetId(GLSetup."Global Dimension 2 Code", "Global Dimension 2 Code");
            end;
        }
        field(23; "Procurement Start Date"; Date)
        {
            AutoFormatType = 1;
            Caption = 'Procurement Start Date';
        }
        field(24; "Procurement End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Procurement Duration (Days)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Business Unit Code"; Code[20])
        {
            Caption = 'Business Unit Code';
            TableRelation = "Business Unit";
        }
        field(28; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                //UserMgt.ValidateUserName("User ID");
            end;
        }
        field(29; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(30; "Workplan Task No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Project_Combined Proc Budget"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'This is a lookup field that is populated from the Job Table (Job.Combine Procurement Budget). When the Project has combined procurement budget, the system shall not allow for specification of the Task Nos. If the Project does not combine the procurement budget i.e. Procurement planning is done per Task No, then the PP Entries must be mapped to a Task No.';
        }
        field(33; "Requisition Product Group"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'New field used to categorize the Items further into Goods, Works, Services and Assets. NB: In most organizations, the Works, Services and Assets shall be setup under TYPE:SERVICE';
            OptionCaption = 'Goods,Services,Works,Assets';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(34; "Procurement Use"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Standard (Internal Use),Project-Specific Use';
            OptionMembers = "Standard (Internal Use)","Project-Specific Use";
        }
        field(35; "Total PRN Commitments"; Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where("Procurement Plan" = field("Procurement Plan ID"),
                                                                  "Commitment Type" = const(PRN),
                                                                  "Vote Item" = field("Entry No.")));
            FieldClass = FlowField;
        }
        field(36; "Total Contract Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const("Blanket Order"),
                                                             //  Status=const(Released),
                                                             "Procurement Plan ID" = field("Procurement Plan ID"),
                                                            "Procurement Plan Entry No" = field("Entry No.")));
            FieldClass = FlowField;
        }
        field(37; "Total PO Commitments"; Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where("Procurement Plan" = field("Procurement Plan ID"),
                                                                  "Commitment Type" = const(LPO),
                                                                  Type = const(Committed),
                                                                  "Vote Item" = field("Entry No.")));
            FieldClass = FlowField;
        }
        field(38; "Total Purchase Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = filter("Purchase Requisition" | Order | "Blanket Order"), "Procurement Plan ID" = field("Procurement Plan ID"),
                                                         "Procurement Plan Entry No" = field("Entry No.")));
            FieldClass = FlowField;
        }
        field(39; "Total Purchase Invoices"; Decimal)
        {
            CalcFormula = sum("Purch. Inv. Line".Amount where("Department Code" = field(Department),
                                                               "Directorate Code" = field(Directorate)));
            FieldClass = FlowField;
        }
        field(40; "Total Purchase Credit Memos"; Decimal)
        {
            CalcFormula = sum("Purch. Cr. Memo Line".Amount where("Department Code" = field(Department),
                                                                   "Directorate Code" = field(Directorate)));
            FieldClass = FlowField;
        }
        field(41; "Total Actual Costs"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Available Procurement Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Invitation Notice Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Single  Stage Tender,Two Stage Tender,RFQ,Low Value Procurement';
            OptionMembers = ,"Single  Stage Tender","Two Stage Tender",RFQ,"Low Value Procurement";
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;

            trigger OnValidate()
            begin
                if not DimMgt.CheckDimIDComb("Dimension Set ID") then
                    Error(DimMgt.GetDimCombErr);
            end;
        }
        field(5701; "Budget Control Job No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(5702; "Budget Control Job Task No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Budget Control Job No"));
        }
        field(50002; "Transferred from Item Budget"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Added';
        }
        field(50022; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(50023; "Start Chainage(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50024; "End Chainage(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Section Length(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50026; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50027; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50028; "Q1 Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50029; "Q1 Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50030; "Q2 Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50031; "Q2 Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50032; "Q3 Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50033; "Q3 Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50034; "Q4 Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50035; "Q4 Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70000; "Vendor Group"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',General,Special';
            OptionMembers = ,General,Special;
        }
        field(70001; "Vendor Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Local,Foreign';
            OptionMembers = "Local",Foreign;
        }
        field(70002; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Procurement Plan,Revision Voucher';
            OptionMembers = "Procurement Plan","Revision Voucher";
        }
        field(70003; "Vote Item"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan Entry"."Entry No." where("Procurement Plan ID" = field("Revised Plan No"),
                                                                        "Planning Category" = field("Planning Category"));

            trigger OnValidate()
            begin
                ProcurementPlanEntry.Reset;
                ProcurementPlanEntry.SetRange("Procurement Plan ID", "Revised Plan No");
                ProcurementPlanEntry.SetRange("Entry No.", "Vote Item");
                if ProcurementPlanEntry.FindSet then begin
                    //"Procurement Plan ID":=ProcurementPlan.Code;
                    //"Document Type":=ProcurementPlan."Document Type";
                    //"Vote Item":=ProcurementPlanEntry."Entry No.";
                    "Planning Category" := ProcurementPlanEntry."Planning Category";
                    Description := ProcurementPlanEntry.Description;
                    "Solicitation Type" := ProcurementPlanEntry."Solicitation Type";
                    "Procurement Method" := ProcurementPlanEntry."Procurement Method";
                    Quantity := ProcurementPlanEntry.Quantity;
                    "Unit Cost" := ProcurementPlanEntry."Unit Cost";
                    "Line Budget Cost" := ProcurementPlanEntry."Line Budget Cost";
                    Directorate := ProcurementPlanEntry.Directorate;
                    Department := ProcurementPlanEntry.Department;
                    "Global Dimension 1 Code" := ProcurementPlanEntry."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := ProcurementPlanEntry."Global Dimension 2 Code";
                    "Budget Control Job No" := ProcurementPlanEntry."Budget Control Job No";
                    "Budget Control Job Task No." := ProcurementPlanEntry."Budget Control Job Task No.";
                    "Procurement Type" := ProcurementPlanEntry."Procurement Type";
                    "Procurement Use" := ProcurementPlanEntry."Procurement Use";
                    "Preference/Reservation Code" := ProcurementPlanEntry."Preference/Reservation Code";
                    "Vendor Group" := ProcurementPlanEntry."Vendor Group";
                    "Vendor Type" := ProcurementPlanEntry."Vendor Type";
                    "Work Plan Project ID" := ProcurementPlanEntry."Work Plan Project ID";
                    "Workplan Task No." := ProcurementPlanEntry."Workplan Task No.";
                    "Q1 Amount" := ProcurementPlanEntry."Q1 Amount";
                    "Q1 Quantity" := ProcurementPlanEntry."Q1 Quantity";
                    "Q2 Amount" := ProcurementPlanEntry."Q2 Amount";
                    "Q2 Quantity" := ProcurementPlanEntry."Q2 Quantity";
                    "Q3 Amount" := ProcurementPlanEntry."Q3 Amount";
                    "Q3 Quantity" := ProcurementPlanEntry."Q3 Quantity";
                    "Q4 Amount" := ProcurementPlanEntry."Q4 Amount";
                    "Q4 Quantity" := ProcurementPlanEntry."Q4 Quantity";
                    "Invite Tender" := ProcurementPlanEntry."Invite Tender";
                    "Open Tender" := ProcurementPlanEntry."Open Tender";
                    "Bid Evaluation" := ProcurementPlanEntry."Bid Evaluation";
                    "Tender Committee Action" := ProcurementPlanEntry."Tender Committee Action";
                    "Notification of Award" := ProcurementPlanEntry."Notification of Award";
                    "Signing of Contract" := ProcurementPlanEntry."Signing of Contract";
                    "Completion of works" := ProcurementPlanEntry."Completion of works";
                    "Procurement Duration (Days)" := ProcurementPlanEntry."Procurement Duration (Days)";
                    "Procurement Start Date" := ProcurementPlanEntry."Procurement Start Date";
                    "Procurement End Date" := ProcurementPlanEntry."Procurement End Date";

                end;
            end;
        }
        field(70004; "Revised Plan No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70005; "Invite Tender"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70006; "Open Tender"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70007; "Bid Evaluation"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70008; "Tender Committee Action"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70009; "Notification of Award"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70010; "Signing of Contract"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70011; "Work Commencement"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70012; "Completion of works"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70013; "Unit of Measure"; Code[30])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Unit of Measure".Code;
        }
        field(70014; "Revision  No"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70015; "Estimated Cost of Project"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70016; "Total Workplanned Length"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70017; "Project Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(70018; "KeRRA Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'KURA Budget Code';
        }
        field(70019; "Project Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Road Work Plan,Global Budget Book,Multi-Year Programs,New Job Voucher';
            OptionMembers = " ","Road Work Plan","Global Budget Book","Multi-Year Programs","New Job Voucher";
        }
        field(70020; "Works Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Maintenance,Road Construction,Survey/Study,Structure Construction';
            OptionMembers = " ",Maintenance,"Road Construction","Survey/Study","Structure Construction";
        }
        field(70021; "Original Budget"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70022; "Budget Type 1"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Original,Supplementary 1,Supplementary 2,Supplimentary 3, Supplementary 4';
            OptionMembers = Original,"Supplementary 1","Supplementary 2","Supplimentary 3"," Supplementary 4";
        }
        field(70023; Constituency; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code;
        }
        field(70024; "Actual Days"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70025; "Planned Days"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70026; "Time to Contract Signature"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = ' TotalTime to Contract Signature';
        }
        field(70027; "Time to Contract Completion"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Time to Contract Signature';
        }
        field(70028; "AWP No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan".No;
        }
        field(70029; "Activity No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Workplan Lines"."Activity ID";
        }
        field(70030; "Sub Activity No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sub Workplan Activity"."Sub Initiative No.";
        }
        field(70031; Items; Code[150])
        {
            DataClassification = ToBeClassified;
            TableRelation = item."No." where("Procurement Category" = field("Planning Category"));
            trigger onvalidate()
            var
                item: record Item;
            begin
                if item.get(Items) then
                    "Item Description" := item.Description;
                "Unit of Measure" := item."Base Unit of Measure";
            end;
        }
        field(70032; "Item Description"; Text[150])
        {
            DataClassification = ToBeClassified;

        }
        field(70033; "Goods Total Per ProTypeR"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('GOODS'), REGION = field(Region)));
            trigger OnValidate()
            var

            begin

            end;
        }

        field(70034; "Services Total Per ProTypeR"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = SUM("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('SERVICES'), REGION = field(Region), "Funding Source ID" = filter('15% OPS' | '15% RDWKS' | '15% SPECIAL')));
        }
        field(70035; "Works Total Per ProTypeR"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('WORKS'), REGION = field(Region), "Funding Source ID" = filter('15% OPS' | '15% RDWKS' | '15% SPECIAL')));
        }
        field(70036; "Goods Total Per ProType"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('GOODS'), Region = FILTER('R11'), Department = field(Department), "Funding Source ID" = filter('10% RDWKS' | '15% OPS' | '15% RDWKS' | '15% SPECIAL')));
        }
        field(70037; "Works Total Per ProType"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('WORKS'), Region = FILTER('R11'), Department = field(Department), "Funding Source ID" = filter('10% RDWKS' | '15% RDWKS' | '15% SPECIAL')));
        }
        field(70038; "Services Total Per ProType"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = SUM("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('SERVICES'), Region = FILTER('R11'), Department = field(Department), "Funding Source ID" = filter('10% RDWKS' | '15% OPS' | '15% RDWKS')));
        }
        field(70039; "Goods Total Per ProTypeR05"; Decimal)
        {

            DataClassification = ToBeClassified;
            //  CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = filter('GOODS'), REGION = field(Region)));
        }
        field(70040; "Total Goods Total Per ProTypeR"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('GOODS'), REGION = filter(<> 'R11'), "Funding Source ID" = filter('15% OPS' | '15% RDWKS' | '15% SPECIAL')));

        }
        field(70041; "TotalServicesTotalPerProTypeR"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('SERVICES'), REGION = filter(<> 'R11'), "Funding Source ID" = filter('15% OPS' | '15% RDWKS' | '15% SPECIAL')));

        }
        field(70042; "TotalWorksTotalPerProTypeR"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('WORKS'), REGION = filter(<> 'R11'), "Funding Source ID" = filter('15% OPS' | '15% RDWKS' | '15% SPECIAL')));

        }
        field(70043; "Total Goods Total Per HQRLMF"; Decimal)
        {

            FieldClass = FlowField;
            //CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = filter('GOODS'), REGION = filter('R11'), "Funding Source ID" = FILTER(<> 'GOK DEV' | <> 'CHINA_EXIM' | <> 'EU' | <> 'JICA' | <> 'KOREA_EXIM')));//, Department = filter(<> '')));
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = filter('GOODS'), REGION = filter('R11'), "Funding Source ID" = filter('15% OPS' | '15% RDWKS' | '15% SPECIAL'), Department = filter(<> '')));
        }
        field(70044; "Total Services Total Per HQRLMF"; Decimal)
        {

            FieldClass = FlowField;
            // CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = filter('SERVICES'), REGION = filter('R11'), "Funding Source ID" = FILTER(<> 'GOK DEV' | <> 'CHINA_EXIM' | <> 'EU' | <> 'JICA' | <> 'KOREA_EXIM'), Department = filter(<> '')));
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = filter('SERVICES'), REGION = filter('R11'), "Funding Source ID" = filter('15% OPS' | '15% RDWKS'), Department = filter(<> '')));
        }
        field(70045; "Total Works Total Per HQRLMF"; Decimal)
        {

            FieldClass = FlowField;
            // CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = filter('WORKS'), REGION = filter('R11'), "Funding Source ID" = FILTER(<> 'GOK DEV' | <> 'CHINA_EXIM' | <> 'EU' | <> 'JICA' | <> 'KOREA_EXIM'), Department = filter(<> '')));
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = filter('WORKS'), REGION = filter('R11'), "Funding Source ID" = filter('15% RDWKS' | '15% SPECIAL'), Department = filter(<> '')));
        }
        FIELD(70046; "Total PP Goods"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = field("Procurement Plan ID"), "Procurement Type" = filter('GOODS')));

        }
        FIELD(70047; "Total PP Services"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('SERVICES')));

        }
        FIELD(70048; "Total PP Works"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('WORKS')));

        }
        field(70049; "Services Total Per ProTypeEXIM"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('SERVICES'), Department = FIELD(Department), "Funding Source ID" = filter('CHINA_EXIM' | 'EU' | 'JICA' | 'KOREA_EXIM')));
            trigger OnValidate()
            var

            begin

            end;
        }
        field(80049; "Services Total Total Per ProTypeEXIM"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('SERVICES'), "Funding Source ID" = filter('CHINA_EXIM' | 'EU' | 'JICA' | 'KOREA_EXIM')));
            trigger OnValidate()
            var

            begin

            end;
        }
        field(70050; "Works Total Per ProTypeEXIM"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('WORKS'), Department = FIELD(Department), "Funding Source ID" = filter('CHINA_EXIM' | 'EU' | 'JICA' | 'KOREA_EXIM')));
            trigger OnValidate()
            var

            begin

            end;
        }
        field(80050; "Works Total Total Per ProTypeEXIM"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = FIELD("Procurement Plan ID"), "Procurement Type" = filter('WORKS'), "Funding Source ID" = filter('CHINA_EXIM' | 'EU' | 'JICA' | 'KOREA_EXIM')));
            trigger OnValidate()
            var

            begin

            end;
        }
        field(70051; "Entry Used"; boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(70052; "Invitation Date"; DateTime)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Standard Purchase Code"."Created Date/Time" where("Procurement Plan Entry No" = field("Entry No.")));
        }
        field(70053; "Currency Code"; Code[10])
        {
            TableRelation = Currency.Code;
            trigger OnValidate()
            begin
                Pplan.Reset();
                Pplan.SetRange(Code, Rec."Procurement Plan ID");
                if Pplan.FindFirst() then begin
                    if "Currency Code" <> '' then begin
                        if ("Currency Code" <> xRec."Currency Code") or
                           (Pplan."Document Date" <> Pplan."Document Date") or
                           (CurrFieldNo = FieldNo("Currency Code")) or
                           ("Currency Factor" = 0)
                        then
                            "Currency Factor" :=
                              CurrExchRate.ExchangeRate(Pplan."Document Date", "Currency Code");
                    end else
                        "Currency Factor" := 0;
                    Validate("Currency Factor");
                end;
            end;

        }
        field(70054; "Currency Factor"; Decimal)
        {
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(70055; "Line Budget Cost (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Procurement Plan ID", "Entry No.", "Planning Category", "Document Type", "Item Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        CheckIfBlocked;

        /* bCommitment.SETRANGE(bCommitment."Account No.","G/L Account No.");
         bCommitment.SETRANGE("Entry No.","Entry No.");
            IF bCommitment.FINDSET THEN
              BEGIN
              bCommitment.CALCFIELDS("Commited Amount Imprest","Commited Amount Orders","Commited Amount PRN");
              totalCommitments:=(bCommitment."Commited Amount Imprest"+bCommitment."Commited Amount Orders"+bCommitment."Commited Amount PRN");
              IF totalCommitments<>0 THEN
                  ERROR(Text57021,totalCommitments)
              ELSE
                  bCommitment.DELETE;
              END;*/

        DeleteAnalysisViewBudgetEntries;

    end;

    trigger OnInsert()
    var
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
    begin
        CheckIfBlocked;
        //TESTFIELD("Work Plan Project ID");
        //TESTFIELD("Entry No.");
        LockTable;
        "User ID" := UserId;


        /*
        GetGLSetup;
        DimMgt.GetDimensionSet(TempDimSetEntry,"Dimension Set ID");
        UpdateDimSet(TempDimSetEntry,GLSetup."Global Dimension 1 Code",Description);
        UpdateDimSet(TempDimSetEntry,GLSetup."Global Dimension 2 Code","Procurement Type");
        OnInsertOnAfterUpdateDimSets(TempDimSetEntry,Rec);
        VALIDATE("Dimension Set ID",DimMgt.GetDimensionSetID(TempDimSetEntry));*/

        //Budget Commitment entries added by David 25-01-2018
        /*bCommitment.RESET;
        bCommitment."Entry No.":="Entry No.";
        bCommitment."Account No.":="G/L Account No.";
        bCommitment."Budget Name":="Budget Name";
        VALIDATE(Amount);
        bCommitment."Budgeted Amount":=Amount;
        bCommitment."Account Name":=Description;
        bCommitment."Budget Start Date":=Date;
        bCommitment.INSERT;*/

    end;

    trigger OnModify()
    begin
        CheckIfBlocked;
        "User ID" := UserId;

        /*bCommitment.SETRANGE(bCommitment."Account No.","G/L Account No.");
        bCommitment.SETRANGE("Entry No.","Entry No.");
           IF bCommitment.FINDSET THEN
             BEGIN
                VALIDATE(Amount);
                bCommitment."Budgeted Amount":=Amount;
                bCommitment."Account Name":=Description;
                bCommitment.MODIFY;
               END;
               */

    end;

    var
        Pplan: Record "Procurement Plan";
        Text000: label 'The dimension value %1 has not been set up for dimension %2.';
        Text001: label '1,5,,Budget Dimension 1 Code';
        Text002: label '1,5,,Budget Dimension 2 Code';
        Text003: label '1,5,,Budget Dimension 3 Code';
        Text004: label '1,5,,Budget Dimension 4 Code';
        GLBudgetName: Record "G/L Budget Name";
        Salesheader: page "Sales Invoice";
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
        DimMgt: Codeunit DimensionManagement;
        GLSetupRetrieved: Boolean;
        bCommitment: Record "Budget Commitment";
        totalCommitments: Decimal;
        CurrExchRate: Record "Currency Exchange Rate";
        Text57021: label 'The budget line has commited entries and thefore cannot be deleted.';
        AnalysisViewBudgetEntryExistsErr: label 'You cannot change the amount on this G/L budget entry because one or more related analysis view budget entries exist.\\You must make the change on the related entry in the G/L Budget window.';
        VoteheadRec: Record Voteheads;
        ProcurementCategories: Record "Procurement Category";
        Roads: Record "Fixed Asset";
        ProcurementLines: Record "Procurement Plan Lines";
        //  Roadinv: Record "Road Inventory";
        ProcurementPlanEntry: Record "Procurement Plan Entry";
        ProcurementPlan: Record "Procurement Plan";

    local procedure CheckIfBlocked()
    begin
        /*IF "Budget Name" = GLBudgetName.Name THEN
          EXIT;
        IF GLBudgetName.Name <> "Budget Name" THEN
          GLBudgetName.GET("Budget Name");
        GLBudgetName.TESTFIELD(Blocked,FALSE);*/
        //TESTFIELD(Blocked,FALSE);

    end;

    local procedure ValidateDimValue(DimCode: Code[20]; var DimValueCode: Code[20])
    var
        DimValue: Record "Dimension Value";
    begin
        if DimValueCode = '' then
            exit;

        DimValue."Dimension Code" := DimCode;
        DimValue.Code := DimValueCode;
        DimValue.Find('=><');
        if DimValueCode <> CopyStr(DimValue.Code, 1, StrLen(DimValueCode)) then
            Error(Text000, DimValueCode, DimCode);
        DimValueCode := DimValue.Code;
    end;

    local procedure GetGLSetup()
    begin
        if not GLSetupRetrieved then begin
            GLSetup.Get;
            GLSetupRetrieved := true;
        end;
    end;

    local procedure OnLookupDimCode(DimOption: Option "Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4"; DefaultValue: Code[20]): Code[20]
    var
        DimValue: Record "Dimension Value";
        DimValueList: Page "Dimension Value List";
    begin
        /*IF DimOption IN [DimOption::"Global Dimension 1",DimOption::"Global Dimension 2"] THEN
          GetGLSetup
        ELSE
          IF GLBudgetName.Procurement Plan ID <> "Entry No." THEN
            GLBudgetName.GET("Entry No.");
        CASE DimOption OF
          DimOption::"Global Dimension 1":
            DimValue."Dimension Code" := GLSetup."Global Dimension 1 Code";
          DimOption::"Global Dimension 2":
            DimValue."Dimension Code" := GLSetup."Global Dimension 2 Code";
          DimOption::"Budget Dimension 1":
            DimValue."Dimension Code" := GLBudgetName."Budget Dimension 1 Code";
          DimOption::"Budget Dimension 2":
            DimValue."Dimension Code" := GLBudgetName."Budget Dimension 2 Code";
          DimOption::"Budget Dimension 3":
            DimValue."Dimension Code" := GLBudgetName."Budget Dimension 3 Code";
          DimOption::"Budget Dimension 4":
            DimValue."Dimension Code" := GLBudgetName."Budget Dimension 4 Code";
        END;
        DimValue.SETRANGE("Dimension Code",DimValue."Dimension Code");
        IF DimValue.GET(DimValue."Dimension Code",DefaultValue) THEN;
        DimValueList.SETTABLEVIEW(DimValue);
        DimValueList.SETRECORD(DimValue);
        DimValueList.LOOKUPMODE := TRUE;
        IF DimValueList.RUNMODAL = ACTION::LookupOK THEN BEGIN
          DimValueList.GETRECORD(DimValue);
          EXIT(DimValue.Code);
        END;
        EXIT(DefaultValue);
        */

    end;

    local procedure GetNextEntryNo(): Integer
    var
        GLBudgetEntry: Record "Procurement Plan Entry1";
    begin
        GLBudgetEntry.SetCurrentkey("Entry No.");
        if GLBudgetEntry.FindLast then
            exit(GLBudgetEntry."Entry No." + 1);

        exit(1);
    end;

    procedure GetCaptionClass(BudgetDimType: Integer): Text[250]
    begin
        if GetFilter("Entry No.") <> '' then begin
            GLBudgetName.SetFilter(Name, GetFilter("Entry No."));
            if not GLBudgetName.FindFirst then
                Clear(GLBudgetName);
        end;
        case BudgetDimType of
            1:
                begin
                    if GLBudgetName."Budget Dimension 1 Code" <> '' then
                        exit('1,5,' + GLBudgetName."Budget Dimension 1 Code");

                    exit(Text001);
                end;
            2:
                begin
                    if GLBudgetName."Budget Dimension 2 Code" <> '' then
                        exit('1,5,' + GLBudgetName."Budget Dimension 2 Code");

                    exit(Text002);
                end;
            3:
                begin
                    if GLBudgetName."Budget Dimension 3 Code" <> '' then
                        exit('1,5,' + GLBudgetName."Budget Dimension 3 Code");

                    exit(Text003);
                end;
            4:
                begin
                    if GLBudgetName."Budget Dimension 4 Code" <> '' then
                        exit('1,5,' + GLBudgetName."Budget Dimension 4 Code");

                    exit(Text004);
                end;
        end;
    end;

    procedure ShowDimensions()
    var
        DimSetEntry: Record "Dimension Set Entry";
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2 %3', "Entry No.", "Planning Category", "Procurement Plan ID"));

        if OldDimSetID = "Dimension Set ID" then
            exit;

        GetGLSetup;
        GLBudgetName.Get("Entry No.");
        /*
        Description := '';
        "Procurement Type" := '';
        Quantity := '';
        "Unit Cost" := '';
        "Line Budget Cost" := '';
        Region := '';*/



        OnAfterShowDimensions(Rec);

    end;

    procedure UpdateDimSet(var TempDimSetEntry: Record "Dimension Set Entry" temporary; DimCode: Code[20]; DimValueCode: Code[20])
    begin
        if DimCode = '' then
            exit;
        if TempDimSetEntry.Get("Dimension Set ID", DimCode) then
            TempDimSetEntry.Delete;
        if DimValueCode = '' then
            DimVal.Init
        else
            DimVal.Get(DimCode, DimValueCode);
        TempDimSetEntry.Init;
        TempDimSetEntry."Dimension Set ID" := "Dimension Set ID";
        TempDimSetEntry."Dimension Code" := DimCode;
        TempDimSetEntry."Dimension Value Code" := DimValueCode;
        TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
        TempDimSetEntry.Insert;
    end;

    local procedure UpdateDimensionSetId(DimCode: Code[20]; DimValueCode: Code[20])
    var
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
    begin
        DimMgt.GetDimensionSet(TempDimSetEntry, "Dimension Set ID");
        UpdateDimSet(TempDimSetEntry, DimCode, DimValueCode);
        OnAfterUpdateDimensionSetId(TempDimSetEntry, Rec, xRec);
        "Dimension Set ID" := DimMgt.GetDimensionSetID(TempDimSetEntry);
    end;

    local procedure DeleteAnalysisViewBudgetEntries()
    var
        AnalysisViewBudgetEntry: Record "Analysis View Budget Entry";
    begin
        /*AnalysisViewBudgetEntry.SETRANGE("Budget Name","Entry No.");
        AnalysisViewBudgetEntry.SETRANGE("Entry No.","Procurement Plan ID");
        AnalysisViewBudgetEntry.DELETEALL;*/

    end;

    local procedure VerifyNoRelatedAnalysisViewBudgetEntries(GLBudgetEntry: Record "Procurement Plan Entry")
    var
        AnalysisViewBudgetEntry: Record "Analysis View Budget Entry";
    begin
        /*AnalysisViewBudgetEntry.SETRANGE("Budget Name",GLBudgetEntry."Entry No.");
        AnalysisViewBudgetEntry.SETRANGE("G/L Account No.",GLBudgetEntry."Planning Category");
        AnalysisViewBudgetEntry.SETRANGE("Posting Date",GLBudgetEntry."Work Plan Project ID");
        AnalysisViewBudgetEntry.SETRANGE("Business Unit Code",GLBudgetEntry."Funding Source ID");
        IF NOT AnalysisViewBudgetEntry.ISEMPTY THEN
          ERROR(AnalysisViewBudgetEntryExistsErr);
          */

    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterShowDimensions(var GLBudgetEntry: Record "Procurement Plan Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateDimensionSetId(var TempDimensionSetEntry: Record "Dimension Set Entry" temporary; var GLBudgetEntry: Record "Procurement Plan Entry"; xGLBudgetEntry: Record "Procurement Plan Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInsertOnAfterUpdateDimSets(var TempDimensionSetEntry: Record "Dimension Set Entry" temporary; var GLBudgetEntry: Record "Procurement Plan Entry")
    begin
    end;
}

