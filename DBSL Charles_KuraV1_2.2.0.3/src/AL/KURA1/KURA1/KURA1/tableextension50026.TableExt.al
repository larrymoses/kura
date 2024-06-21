#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50026 "tableextension50026" extends "Purch. Cr. Memo Line"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 11)".


        //Unsupported feature: Property Modification (Data type) on ""Job No."(Field 45)".

        field(70000; "Procurement Plan"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Header".No;
        }
        field(70001; "Procurement Plan Item"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan1"."Plan Item No" where("Plan Year" = field("Procurement Plan"),
                                                                      "Department Code" = field("Department Code"));

            trigger OnValidate()
            begin

                /* ProcurementPlan.RESET;
                 ProcurementPlan.SETRANGE(ProcurementPlan."Plan Item No","Procurement Plan Item");
                IF ProcurementPlan.FIND('-') THEN BEGIN
                {IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN BEGIN
                  Type:=Type::Item;
                  "No.":=ProcurementPlan."No.";
                END;
                IF ProcurementPlan."Procurement Type"<>ProcurementPlan."Procurement Type"::Service THEN BEGIN
                 Type:=Type::"G/L Account";
                 "No.":=ProcurementPlan."Source of Funds";
                END;}
                  //"Budget Line":=ProcurementPlan."Source of Funds";
                   {Type:=Type::Item;
                  "No.":=ProcurementPlan."No.";}
                  {
                   Description:=ProcurementPlan."Item Description";
                  "Unit of Measure":=ProcurementPlan."Unit of Measure";
                  Amount:=ProcurementPlan."Estimated Cost";
                  //"Unit Cost":=ProcurementPlan."Unit Cost";
                   //Budgeted:=BudgetLines.Amount;
                 "Budget Amount":=ProcurementPlan."Estimated Cost";}

                END;

                ProcurementPlan.RESET;
                 //ProcurementPlan.SETRANGE("Plan Year","Procurement Plan");
                 ProcurementPlan.SETRANGE("Plan Item No","Procurement Plan Item");
                 IF ProcurementPlan.FINDSET THEN BEGIN
                   "General Item Category":=ProcurementPlan.Category;
                   IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN
                   "General Item Category":='GOODS';
                   IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Service THEN BEGIN
                   "Qty. Requested":=ProcurementPlan.Quantity;

                   "General Item Category":='Service';
                   END;
                   IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Works THEN
                   "General Item Category":='Works';
                   "Item Category":=ProcurementPlan.Category;
                   "Job No.":=ProcurementPlan."Job ID";
                   "Job Task No.":=ProcurementPlan."Job Task No.";
                   //"Qty. Requested":=1;
                   IF GeneralItem.GET("Item Category") THEN BEGIN
                   //"Service/Item Code":=GeneralItem.Code;
                   Item.RESET;
                 Item.SETRANGE("No.","Service/Item Code");
                 IF Item.FIND('-') THEN BEGIN
                    Description:=Item.Description;
                 END;
                 Type:=Type::Item;
                 "No.":="Service/Item Code";
                   END;
                   END;
               */

            end;
        }
        field(70002; "Requisition Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Approved,Rejected;
        }
        field(70003; "Requisition Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70004; "Requisition Type1"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Purchase Requisition,Store Requisition,Imprest,Claim-Accounting,Appointment,Payment Voucher';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Purchase Requisition","Store Requisition",Imprest,"Claim-Accounting",Appointment,"Payment Voucher";
        }
        field(70005; Committed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70006; "Request Generated"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70007; "Process Type"; Code[20])
        {
            CalcFormula = lookup("Purchase Header"."Process Type" where("No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(70008; "Contract No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70009; "Activity Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',WorkPlan,Admin & PE,Proc Plan';
            OptionMembers = ,WorkPlan,"Admin & PE","Proc Plan";

            trigger OnValidate()
            begin
                /*
                CashMngt.GET;
                GLSetup.GET;
                "Current Budget":=GLSetup."Current Budget";
                //message('%1',"Current Budget");
                */

            end;
        }
        field(70010; Activity; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70011; "Current Budget"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(70012; "BD Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70013; "Purchase Type"; Code[30])
        {
            CalcFormula = lookup("Purchase Header"."Process Type" where("No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(70014; "Requisition No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Requisition Header1";
        }
        field(70015; "Department Code"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70016; "Directorate Code"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70017; Division; Code[50])
        {
            Description = 's';
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70027; "General Item Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "General Item Categories".Code;
        }
        field(70028; "Item Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70029; Specifications; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70030; "Direct Unit Cost Inc. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // "Direct Unit Cost":="Direct Unit Cost Inc. VAT";
                // VALIDATE("Direct Unit Cost");
            end;
        }
        field(70031; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70032; "Workplan Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field("Job No."),
                                                             "Global Dimension 1 Code" = field("Shortcut Dimension 1 Code"));

            trigger OnValidate()
            begin
                //VALIDATE("Job Task No.","Workplan Task No.");
            end;
        }
        field(70033; "Ordered PRN"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70034; "Linked IFS No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70035; "Linked LPO No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70036; "Procurement Plan ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code;
        }
        field(70037; "Procurement Plan Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Procurement Plan Entry"."Entry No." where ("Procurement Plan ID"=field("Procurement Plan Entry No"));

            trigger OnValidate()
            begin
                /* PlanItem.RESET;
                 PlanItem.SETRANGE("Plan Item No","Procurement Plan Item");
                 IF PlanItem.FIND('-') THEN
                   "Procurement Plan Item Descript":=PlanItem."Item Description";*/

            end;
        }
        field(70038; "Quantity Partial Issued"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8603700; Test; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(99000750; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            TableRelation = "Routing Header";
        }
        field(99000751; "Operation No."; Code[10])
        {
            Caption = 'Operation No.';
            Editable = false;
            TableRelation = "Prod. Order Routing Line"."Operation No." where(Status = const(Released),
                                                                              "Prod. Order No." = field("Prod. Order No."),
                                                                              "Routing No." = field("Routing No."));

            trigger OnValidate()
            var
                ProdOrderRtngLine: Record "Prod. Order Routing Line";
            begin
                /*IF "Operation No." = '' THEN
                  EXIT;
                
                TESTFIELD(Type,Type::Item);
                TESTFIELD("Prod. Order No.");
                TESTFIELD("Routing No.");
                
                ProdOrderRtngLine.GET(
                  ProdOrderRtngLine.Status::Released,
                  "Prod. Order No.",
                  "Routing Reference No.",
                  "Routing No.",
                  "Operation No.");
                
                ProdOrderRtngLine.TESTFIELD(
                  Type,
                  ProdOrderRtngLine.Type::"Work Center");
                
                "Expected Receipt Date" := ProdOrderRtngLine."Ending Date";
                VALIDATE("Work Center No.",ProdOrderRtngLine."No.");
                VALIDATE("Direct Unit Cost",ProdOrderRtngLine."Direct Unit Cost");
                */

            end;
        }
        field(99000752; "Work Center No."; Code[20])
        {
            Caption = 'Work Center No.';
            Editable = false;
            TableRelation = "Work Center";

            trigger OnValidate()
            begin
                /*IF Type = Type::"Charge (Item)" THEN
                  TESTFIELD("Work Center No.",'');
                IF "Work Center No." = '' THEN
                  EXIT;
                
                WorkCenter.GET("Work Center No.");
                "Gen. Prod. Posting Group" := WorkCenter."Gen. Prod. Posting Group";
                "VAT Prod. Posting Group" := '';
                IF GenProdPostingGrp.ValidateVatProdPostingGroup(GenProdPostingGrp,"Gen. Prod. Posting Group") THEN
                  "VAT Prod. Posting Group" := GenProdPostingGrp."Def. VAT Prod. Posting Group";
                VALIDATE("VAT Prod. Posting Group");
                
                "Overhead Rate" := WorkCenter."Overhead Rate";
                VALIDATE("Indirect Cost %",WorkCenter."Indirect Cost %");
                
                CreateDim(
                  DATABASE::"Work Center","Work Center No.",
                  DimMgt.TypeToTableID3(Type),"No.",
                  DATABASE::Job,"Job No.",
                  DATABASE::"Responsibility Center","Responsibility Center");
                */

            end;
        }
        field(99000753; Finished; Boolean)
        {
            Caption = 'Finished';
        }
        field(99000754; "Prod. Order Line No."; Integer)
        {
            Caption = 'Prod. Order Line No.';
            Editable = false;
            TableRelation = "Prod. Order Line"."Line No." where(Status = filter(Released ..),
                                                                 "Prod. Order No." = field("Prod. Order No."));
        }
        field(99000755; "Overhead Rate"; Decimal)
        {
            Caption = 'Overhead Rate';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                //VALIDATE("Indirect Cost %");
            end;
        }
        field(99000756; "MPS Order"; Boolean)
        {
            Caption = 'MPS Order';
        }
        field(99000757; "Planning Flexibility"; Option)
        {
            Caption = 'Planning Flexibility';
            OptionCaption = 'Unlimited,None';
            OptionMembers = Unlimited,"None";

            trigger OnValidate()
            begin
                /*IF "Planning Flexibility" <> xRec."Planning Flexibility" THEN
                  ReservePurchLine.UpdatePlanningFlexibility(Rec);*/

            end;
        }
        field(99000758; "Safety Lead Time"; DateFormula)
        {
            Caption = 'Safety Lead Time';

            trigger OnValidate()
            begin
                //VALIDATE("Inbound Whse. Handling Time");
            end;
        }
        field(99000759; "Routing Reference No."; Integer)
        {
            Caption = 'Routing Reference No.';
        }
        field(99000760; "Qty Approved"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(99000761; "Labour %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(99000762; "Technology Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(99000763; "Start Chainage(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(99000764; "End Chainage(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        ProcurementPlan: Record "Procurement Plan";
}

