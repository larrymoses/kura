#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50025 "tableextension50025" extends "Purch. Inv. Line"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 11)".


        //Unsupported feature: Property Modification (Data type) on ""Job No."(Field 45)".


        //Unsupported feature: Property Modification (Data type) on ""Job Task No."(Field 1001)".

        modify("Operation No.")
        {
            TableRelation = "Prod. Order Routing Line"."Operation No." where(Status = const(Released),
                                                                              "Prod. Order No." = field("Prod. Order No."),
                                                                              "Routing No." = field("Routing No."));


            //Unsupported feature: Property Insertion (Editable) on ""Operation No."(Field 99000751)".

        }

        //Unsupported feature: Property Insertion (Editable) on ""Work Center No."(Field 99000752)".


        //Unsupported feature: Property Insertion (Editable) on ""Prod. Order Line No."(Field 99000754)".


        //Unsupported feature: Code Insertion on ""Operation No."(Field 99000751)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //var
        //ProdOrderRtngLine: Record "Prod. Order Routing Line";
        //begin
        /*
        IF "Operation No." = '' THEN
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
        //end;


        //Unsupported feature: Code Insertion on ""Work Center No."(Field 99000752)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        // IF Type = Type::"Charge (Item)" THEN
        //  TESTFIELD("Work Center No.",'');
        // IF "Work Center No." = '' THEN
        //  EXIT;
        //
        // WorkCenter.GET("Work Center No.");
        // "Gen. Prod. Posting Group" := WorkCenter."Gen. Prod. Posting Group";
        // "VAT Prod. Posting Group" := '';
        // IF GenProdPostingGrp.ValidateVatProdPostingGroup(GenProdPostingGrp,"Gen. Prod. Posting Group") THEN
        //  "VAT Prod. Posting Group" := GenProdPostingGrp."Def. VAT Prod. Posting Group";
        // VALIDATE("VAT Prod. Posting Group");
        //
        // "Overhead Rate" := WorkCenter."Overhead Rate";
        // VALIDATE("Indirect Cost %",WorkCenter."Indirect Cost %");
        //
        // CreateDim(
        //  DATABASE::"Work Center","Work Center No.",
        //  DimMgt.TypeToTableID3(Type),"No.",
        //  DATABASE::Job,"Job No.",
        //  DATABASE::"Responsibility Center","Responsibility Center");
        */
        //end;


        //Unsupported feature: Code Insertion on ""Overhead Rate"(Field 99000755)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        VALIDATE("Indirect Cost %");
        */
        //end;
        field(50000; "Purchase Requisition No."; Code[20])
        {
            Editable = false;
            Enabled = false;
        }
        field(50001; "Purchase Requisition Line No."; Integer)
        {
            Editable = false;
        }
        field(50002; Status; Option)
        {
            Editable = true;
            FieldClass = Normal;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Cancelled';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled;
        }
        field(50003; Select; Boolean)
        {

            trigger OnValidate()
            begin
                Modify(false);
            end;
        }
        field(50004; "Quantity To  Issue"; Decimal)
        {

            trigger OnValidate()
            begin


                Modify(false);
                if "Quantity To  Issue" = 0 then
                    Error('YOU CANNOT ISSUE ZERO QUANTITIES.PLEASE CHECK!!');

                // IF"Quantity To  Issue">("Qty. Requested"-"Quantity  issued") THEN
                // ERROR('YOU CANNOT ISSUE MORE THAN WHAT WAS REQUESTED.PLEASE CHECK!!');

                if "Quantity To  Issue" > ("Qty Approved" - "Quantity  issued") then
                    Error('YOU CANNOT ISSUE MORE THAN WHAT WAS APPROVED.PLEASE CHECK!!');



                CalcFields("Quantity In Store");
                if "Quantity To  Issue" > "Quantity In Store" then
                    Error('INSUFFICIENT STOCK TO ISSUE FROM %1 STORE.PLEASE CHECK!!', "Location Code");

                //PurchHeader.GET("Document Type","Document No.");

                /*IF PurchHeader."Requisition Type"<>PurchHeader."Requisition Type"::"Stock Return" THEN BEGIN
                
                IF Type=Type::Item THEN BEGIN
                CALCFIELDS("Quantity In Store");
                  //new code to convert unit of measure
                  IF UoM.GET("No.","Unit of Measure Code")  THEN BEGIN
                    qty:="Quantity To  Issue"*UoM."Qty. per Unit of Measure";
                END
                 //   MESSAGE('%1',qty);
                IF qty>"Quantity In Store" THEN
                
                ERROR('INSUFFICIENT STOCK TO ISSUE FROM %1 STORE.PLEASE CHECK!!',"Location Code");
                 END;;
                
                END;*///*************Commented by Morris During upgrade

            end;
        }
        field(50005; Category; Option)
        {
            OptionCaption = ' ,Item,Service,Capex';
            OptionMembers = " ",Item,Service,Capex;

            trigger OnValidate()
            begin

                ///
            end;
        }
        field(50006; "Service/Item Code"; Code[20])
        {
            TableRelation = Item."No." where(Blocked = const(false),
                                              "Location Filter" = field("Location Code"),
                                              "Item Category Code" = field("Item Category"));

            trigger OnValidate()
            begin
                //TestStatusOpen;
                /*IF (Category=Category::Service) THEN
                BEGIN
                       Service.RESET;
                       Service.SETRANGE(Service."Service Code","Service/Item Code");
                    IF Service.FINDSET THEN
                    BEGIN
                      Type:=Type::"G/L Account";
                      VALIDATE(Type);
                      "No.":=Service."G/L Account";
                      VALIDATE("No.");
                      Category:=Category::Service;
                      "Service/Item Code":=Service."Service Code";
                      Description:=Service."Service Name";
                   END;
                END;*/
                // IF  (Category=Category::Capex) THEN
                //  BEGIN
                //   Service.SETRANGE(Service."Service Code","Service/Item Code");
                //    IF Service.FINDSET THEN
                //    BEGIN
                //      Type:=Type::"Fixed Asset";
                //      VALIDATE(Type);
                //     "No.":=Service."G/L Account";
                //      VALIDATE("No.");
                //      Category:=Category::Capex;
                //      "Service/Item Code":=Service."Service Code";
                //      Description:=Service."Service Name";
                // END;
                // END;

                // Item.RESET;
                //  Item.SETRANGE("No.","Service/Item Code");
                //  IF Item.FIND('-') THEN BEGIN
                //     Description:=Item.Description;
                //     //"Unit of Measure Code":= base unit;
                //     "Unit of Measure":=Item."Base Unit of Measure";
                //  END;
                //
                // //IF (Category=Category::Item) OR (Category=Category::Service)THEN BEGIN
                // Type:=Type::Item;
                // "No.":="Service/Item Code";
                //
                //  Item.RESET;
                //  Item.SETRANGE("No.","Service/Item Code");
                //  IF Item.FIND('-') THEN BEGIN
                //     Description:=Item.Description;
                //      "Unit of Measure":=Item."Base Unit of Measure";
                //     //"Unit of Measure Code":=Item."Unit of Measure Id";
                //
                //  END;
                //
                // // VALIDATE("No.");
                // "Service/Item Code":="No.";
                // //"Item Category":="Posting Group";
                //  Category:=Category::Item;
                //
                // IF PurchLine2.GET("Document Type","Document No.","Line No.") THEN
                //
                //  BEGIN
                //
                //   MODIFY;
                //
                //  END;
                //
                // //END;
                // VALIDATE("Qty. Requested");

            end;
        }
        field(50007; "Partially Issued"; Boolean)
        {
        }
        field(50008; "Fully Issued"; Boolean)
        {
        }
        field(50009; "Quantity  issued"; Decimal)
        {
            Editable = true;
        }
        field(50010; "Quantity In Store"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                  "Location Code" = field("Location Code")));
            Caption = 'Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50011; "Qty. on Purch. Order"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Outstanding Qty. (Base)" where("Document Type" = const(Order),
                                                                               Type = const(Item),
                                                                               "No." = field("No.")));
            Caption = 'Qty. on Purch. Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50012; "Qty on Requisition"; Decimal)
        {
        }
        field(50013; "PO Number"; Code[20])
        {
            TableRelation = "Purchase Header"."No." where("Document Type" = filter(Order),
                                                           Status = const(Open));

            trigger OnValidate()
            begin
                Modify(false);
            end;
        }
        field(50014; Select2; Boolean)
        {
            Caption = 'Select';

            trigger OnValidate()
            begin
                //Ushindi
                Modify(false);
                TestField("PO Type");
                TestField("Buy-from Vendor No.");
                "Selected By" := UserId;
            end;
        }
        field(50015; Ordered; Boolean)
        {

            trigger OnValidate()
            begin
                Modify(false);
            end;
        }
        field(50016; "Preferred Supplier"; Code[10])
        {
            TableRelation = Vendor;
        }
        field(50017; "Ordered by"; Code[50])
        {
            TableRelation = User."User Name";
        }
        field(50018; "Order Creation date"; Date)
        {
        }
        field(50019; "Order Creation Time"; Time)
        {
        }
        field(50020; "Last Issued By"; Code[50])
        {
        }
        field(50021; "Last Issue date"; Date)
        {
        }
        field(50022; "Last Issue Time"; Time)
        {
        }
        field(50023; "Budget Amount"; Decimal)
        {
            Editable = false;
        }
        field(50024; "Actual To Date"; Decimal)
        {
            Editable = false;
        }
        field(50025; "Requisition Type"; Option)
        {
            OptionCaption = ' ,Internal Use,Project,Stock Replenishment,Technical Installation,Technical Maintenance,Stock Return';
            OptionMembers = " ","Internal Use",Project,"Stock Replenishment","Technical Installation","Technical Maintenance","Stock Return";
        }
        field(50026; "Customer No."; Code[10])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                //Ushindi


                if "Requisition Type" = "requisition type"::"Internal Use" then begin
                    Error('Your requisition is for Internal use.You cannot fill in this field!!');
                    Modify := false;
                end;


                if "Requisition Type" = "requisition type"::"Stock Replenishment" then begin
                    Error('Your requisition is for Stock Replenishment.You cannot fill in this field!!');
                    Modify := false;
                end;
            end;
        }
        field(50027; "Requisition No."; Code[20])
        {
            CalcFormula = lookup("Purchase Line"."Document No." where("Document Type" = const("Store Requisition"),
                                                                       Type = field(Type),
                                                                       "PO Number" = field("Document No."),
                                                                       "No." = field("No.")));
            FieldClass = FlowField;
        }
        field(50028; "Employee No"; Code[10])
        {
            TableRelation = Employee."No.";
        }
        field(50029; "Employee Name"; Text[100])
        {
            CalcFormula = lookup(Customer.Name where("No." = field("Employee No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; "Item Category"; Code[20])
        {
            TableRelation = "Item Category".Code;

            trigger OnValidate()
            begin

                // /
            end;
        }
        field(50031; VendorName; Text[100])
        {
            FieldClass = Normal;
        }
        field(50032; Branch; Code[20])
        {
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
                                                                                     "Dimension Code" = const('BRANCH')));
            FieldClass = FlowField;
        }
        field(50033; Department; Code[20])
        {
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
                                                                                     "Dimension Code" = const('DEPARTMENT')));
            FieldClass = FlowField;
        }
        field(50034; "G/L Name"; Text[100])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("No.")));
            FieldClass = FlowField;
        }
        field(50035; "IR Approval History"; Code[50])
        {
        }
        field(50036; "Selected By"; Code[50])
        {
        }
        field(50037; "Qty. Requested"; Decimal)
        {

            trigger OnValidate()
            begin

                //TestStatusOpen;

                // VALIDATE("Direct Unit Cost");
                // Quantity:="Qty. Requested";
                // "Line Amount":="Qty. Requested"*"Direct Unit Cost";
                //
                // IF "Document Type"="Document Type"::"Purchase Requisition" THEN
                //      BEGIN
                //
                //
                //
                //
                //
                // ProcurementPlan.RESET;
                //  ProcurementPlan.SETRANGE(ProcurementPlan."Plan Item No","Procurement Plan Item");
                // IF ProcurementPlan.FIND('-') THEN BEGIN
                // IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN
                //     Category:=Category::Item
                // ELSE
                // IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Service THEN
                //    Category:=Category::Service;
                //
                // ProcurementPlan.CALCFIELDS("Approved Budget",Commitment,Actual);
                //    "Vote Amount":=ProcurementPlan."Approved Budget";
                //    "Budget Commitments":=ProcurementPlan.Commitment;
                //    "Available Funds":="Vote Amount"-ProcurementPlan.Actual-"Budget Commitments";
                //
                //    //Description:=ProcurementPlan."Item Description";
                //   "Unit of Measure":=ProcurementPlan."Unit of Measure";
                //   "Unit Cost":=ProcurementPlan."Unit Cost";
                //    //Budgeted:=BudgetLines.Amount;
                //  "Budget Amount":=ProcurementPlan."Approved Budget";
                //  //"Direct Unit Cost":=ProcurementPlan."Unit Cost";
                //    VALIDATE("Direct Unit Cost");
                // {   IF Category=Category::Service THEN BEGIN
                //  "Qty. Requested":=ProcurementPlan.Quantity;
                //  Quantity:=ProcurementPlan.Quantity;;
                //  END;}
                //  "Line Amount":="Qty. Requested"*"Direct Unit Cost";
                //
                // END;
                //  END ;
                //
                // //Fred
                // "Qty Approved":="Qty. Requested";
            end;
        }
        field(50038; "Include in Purch. Order"; Boolean)
        {
        }
        field(50039; "Request-By No."; Code[10])
        {
            TableRelation = Employee."No.";
        }
        field(50040; "Request-By Name"; Text[50])
        {
        }
        field(50041; "Quantity Rejected"; Decimal)
        {

            trigger OnValidate()
            begin

                /*
             //RGK CHECK IF CURRENT USER HAS RIGHTS EDIT THIS FIELD
             UserSetup.SETFILTER(UserSetup."User ID",'%1',USERID);
             IF UserSetup.FINDFIRST THEN BEGIN
               IF UserSetup."Perform Purchase Inspection"<>TRUE THEN
                  ERROR(AAA01);
             END ELSE BEGIN
               EXIT;
             END;
              */

            end;
        }
        field(50042; "Quantity Returned"; Decimal)
        {

            trigger OnValidate()
            begin

                /*
             //RGK CHECK IF CURRENT USER HAS RIGHTS EDIT THIS FIELD
             UserSetup.SETFILTER(UserSetup."User ID",'%1',USERID);
             IF UserSetup.FINDFIRST THEN BEGIN
               IF UserSetup."Perform Purchase Inspection"<>TRUE THEN
                  ERROR(AAA01);
             END ELSE BEGIN
               EXIT;
             END;
              */

            end;
        }
        field(50043; "Requestor ID"; Code[50])
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(50044; "IR Line Reference"; Code[35])
        {
        }
        field(50045; "Requisition Header Type"; Option)
        {
            Description = '//Ushindi...Lookup IR Type from Header';
            OptionCaption = ' ,Internal Use,Project,Stock Replenishment,Technical Installation,Technical Maintenance,Stock Return';
            OptionMembers = " ","Internal Use",Project,"Stock Replenishment","Technical Installation","Technical Maintenance","Stock Return";
        }
        field(50046; "Project Description"; Code[250])
        {
            CalcFormula = lookup(Job.Description where("No." = field("Job No.")));
            FieldClass = FlowField;
        }
        field(50050; "Remaining Quantity"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No.")));
            FieldClass = FlowField;
        }
        field(50061; "PO Type"; Option)
        {
            OptionCaption = ' ,LSO,LPO';
            OptionMembers = " ",LSO,LPO;

            trigger OnValidate()
            begin
                Decision := Decision::Order;
            end;
        }
        field(50062; Decision; Option)
        {
            OptionCaption = ' ,Order';
            OptionMembers = " ","Order";
        }
        field(50063; "TRF Unit of measue"; Code[20])
        {
        }
        field(50064; "Type of Vehicle"; Code[20])
        {
            TableRelation = "Transport Method".Code;

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
            end;
        }
        field(50065; "Vehicle Description"; Text[100])
        {
            CalcFormula = lookup("Transport Method".Description where(Code = field("Type of Vehicle")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50066; "Date From"; Date)
        {
        }
        field(50067; "To Date"; Date)
        {

            trigger OnValidate()
            begin
                // Description:="Vehicle Description";
                // VALIDATE("Date From");
                // IF ("To Date")<("Date From") THEN
                //  ERROR(Text0010);
            end;
        }
        field(50068; "External Doc No"; Code[20])
        {
            CalcFormula = lookup("Purchase Header"."Vendor Order No." where("No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(50069; "Vote Item"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50070; "Vote Amount"; Decimal)
        {
            Editable = false;
        }
        field(50071; "Available Funds"; Decimal)
        {
            Editable = false;
        }
        field(50072; "Budget Commitments"; Decimal)
        {
            Editable = false;
        }
        field(50073; "Approved Requisition Amount"; Decimal)
        {
        }
        field(50074; "Approved Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                "Approved Requisition Amount" := Quantity * "Approved Unit Cost";
            end;
        }
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

                //  ProcurementPlan.RESET;
                //  ProcurementPlan.SETRANGE(ProcurementPlan."Plan Item No","Procurement Plan Item");
                // IF ProcurementPlan.FIND('-') THEN BEGIN
                /*IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN BEGIN
                  Type:=Type::Item;
                  "No.":=ProcurementPlan."No.";
                END;
                IF ProcurementPlan."Procurement Type"<>ProcurementPlan."Procurement Type"::Service THEN BEGIN
                 Type:=Type::"G/L Account";
                 "No.":=ProcurementPlan."Source of Funds";
                END;*/
                //"Budget Line":=ProcurementPlan."Source of Funds";
                /*Type:=Type::Item;
               "No.":=ProcurementPlan."No.";*/
                /*
                 Description:=ProcurementPlan."Item Description";
                "Unit of Measure":=ProcurementPlan."Unit of Measure";
                Amount:=ProcurementPlan."Estimated Cost";
                //"Unit Cost":=ProcurementPlan."Unit Cost";
                 //Budgeted:=BudgetLines.Amount;
               "Budget Amount":=ProcurementPlan."Estimated Cost";*/

                // END;
                //
                // ProcurementPlan.RESET;
                //  //ProcurementPlan.SETRANGE("Plan Year","Procurement Plan");
                //  ProcurementPlan.SETRANGE("Plan Item No","Procurement Plan Item");
                //  IF ProcurementPlan.FINDSET THEN BEGIN
                //    "General Item Category":=ProcurementPlan.Category;
                //    IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN
                //    "General Item Category":='GOODS';
                //    IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Service THEN BEGIN
                //    "Qty. Requested":=ProcurementPlan.Quantity;
                //
                //    "General Item Category":='Service';
                //    END;
                //    IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Works THEN
                //    "General Item Category":='Works';
                //    "Item Category":=ProcurementPlan.Category;
                //    "Job No.":=ProcurementPlan."Job ID";
                //    "Job Task No.":=ProcurementPlan."Job Task No.";
                //    //"Qty. Requested":=1;
                //    IF GeneralItem.GET("Item Category") THEN BEGIN
                //    //"Service/Item Code":=GeneralItem.Code;
                //    Item.RESET;
                //  Item.SETRANGE("No.","Service/Item Code");
                //  IF Item.FIND('-') THEN BEGIN
                //     Description:=Item.Description;
                //  END;
                //  Type:=Type::Item;
                //  "No.":="Service/Item Code";
                //    END;
                //    END;

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
        field(70007; "Process Type"; Code[10])
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
        field(70028; "Item Description"; Text[60])
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
                "Direct Unit Cost" := "Direct Unit Cost Inc. VAT";
                Validate("Direct Unit Cost");
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
                Validate("Job Task No.", "Workplan Task No.");
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
        field(99000753; Finished; Boolean)
        {
            Caption = 'Finished';
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
                // IF "Planning Flexibility" <> xRec."Planning Flexibility" THEN
                //  ReservePurchLine.UpdatePlanningFlexibility(Rec);
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
}

