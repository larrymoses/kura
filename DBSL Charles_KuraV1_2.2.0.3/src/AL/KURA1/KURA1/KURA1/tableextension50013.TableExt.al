#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
/// <summary>
/// TableExtension "tableextension50013" (ID 50013) extends Record Purchase Line.
/// </summary>
TableExtension 50013 tableextension50013 extends "Purchase Line"
{
    fields
    {
        // modify("Document Type")
        // {
        //     OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition';

        //     //Unsupported feature: Property Modification (OptionString) on ""Document Type"(Field 1)".

        // }



        //Unsupported feature: Property Modification (Editable) on ""Buy-from Vendor No."(Field 2)".


        

        //Unsupported feature: Property Modification (Data type) on "Description(Field 11)".


        //Unsupported feature: Property Modification (Data type) on ""Description 2"(Field 12)".

        modify("Unit of Measure")
        {
            TableRelation = "Unit of Measure".Code;
        }
        modify("Job Task No.")
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting), "Global Dimension 1 Code" = field("Shortcut Dimension 1 Code"),
                                                                     "Job No." = field("Job No."));
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                UpdateCommitment();
            end;
        }
        modify("Shortcut Dimension 1 Code")
        {
            trigger OnAfterValidate()
            begin
                UpdateCommitment();
            end;
        }
        modify("Shortcut Dimension 2 Code")
        {
            trigger OnAfterValidate()
            begin
                UpdateCommitment();
            end;
        }

        //Unsupported feature: Property Insertion (Editable) on ""Qty. to Receive"(Field 18)".
        // ("Job Task Type" = 
        //         modify("Job Task No.") = 
        //         {
        //             TableRelation = "Job Task"."Job Task No." where ("Job Task Type"=const(Posting),
        //                                                              "Job No."=field("Job No."));
        //         }
        //         modify("Item Category Code")
        //         {
        //             TableRelation = "Item Category".Code;
        //         }

        //Unsupported feature: Code Insertion on ""Document No."(Field 3)".

        /*
        PurchHeader.RESET;
        PurchHeader.SETRANGE("No.","Document No.");
        IF PurchHeader.FINDSET THEN BEGIN
        "Directorate Code":=PurchHeader."Directorate Code";
        Division:=PurchHeader.Division;
        "Department Code":=PurchHeader."Department Code";
        "Location Code":=PurchHeader."Location Code";
        //initialize line type based on the requisition product group
        IF PurchHeader."Requisition Product Group"=PurchHeader."Requisition Product Group"::Goods THEN
          Type:=Type::Item;
        IF PurchHeader."Requisition Product Group"=PurchHeader."Requisition Product Group"::Assets THEN
          Type:=Type::"Fixed Asset";
        IF PurchHeader."Requisition Product Group"=PurchHeader."Requisition Product Group"::Services THEN
          Type:=Type::Item;
        IF PurchHeader."Requisition Product Group"=PurchHeader."Requisition Product Group"::Works THEN
          Type:=Type::Item;
        END;
        */
        //end;


        //Unsupported feature: Code Modification on "Quantity(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        IsHandled := FALSE;
        OnValidateQuantityOnBeforeDropShptCheck(Rec,xRec,CurrFieldNo,IsHandled);
        IF NOT IsHandled THEN
          IF "Drop Shipment" AND ("Document Type" <> "Document Type"::Invoice) THEN
            ERROR(
              Text001,FIELDCAPTION(Quantity),"Sales Order No.");
        "Quantity (Base)" := CalcBaseQty(Quantity);
        IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN BEGIN
          IF (Quantity * "Return Qty. Shipped" < 0) OR
        #11..85
        END;

        CheckWMS;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        {=======} //TARGET
        #2..7
        {<<<<<<<}
        #8..88
        IF "Document Type"="Document Type"::Invoice THEN
          BEGIN
            gEntry.RESET;
                  actualAmount:=0;
                  cSetup.GET;
                  Bcommitments.RESET;
                  gEntry.SETRANGE("G/L Account No.","Vote Item");
                  gEntry.SETFILTER(gEntry."Posting Date",'%1..%2',cSetup."Leave Posting Period[FROM]",cSetup."Leave Posting Period[TO]");
                   IF gEntry.FINDSET THEN
                     BEGIN
                       REPEAT
                          actualAmount:=actualAmount+ABS(gEntry.Amount);
                       UNTIL gEntry.NEXT=0;
                     END;

                    "Actual To Date":=actualAmount;


                     Bcommitments.SETRANGE("Account No.","Vote Item");
                     IF Bcommitments.FINDSET THEN
                       BEGIN
                      "Vote Amount":=Bcommitments."Budgeted Amount";
                      Bcommitments.CALCFIELDS("Commited Amount Imprest","Commited Amount Orders","Commited Amount PRN","Committed Invoices");
                      "Budget Commitments":=(Bcommitments."Commited Amount Imprest"+Bcommitments."Commited Amount Orders"+Bcommitments."Commited Amount PRN"+Bcommitments."Committed Invoices");
                      "Available Funds":="Vote Amount"-actualAmount-"Budget Commitments";
                      END;


          END;
        */
        //end;


        //Unsupported feature: Code Modification on ""Direct Unit Cost"(Field 22).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        VALIDATE("Line Discount %");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        VALIDATE("Line Discount %");
        "Line Amount":="Qty. Requested"*"Direct Unit Cost";
        */
        //end;


        //Unsupported feature: Code Modification on "Amount(Field 29).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetPurchHeader;
        Amount := ROUND(Amount,Currency."Amount Rounding Precision");
        CASE "VAT Calculation Type" OF
        #4..29
                      "VAT Base Amount","Quantity (Base)",PurchHeader."Currency Factor"),
                    Currency."Amount Rounding Precision");
                IF "VAT Base Amount" <> 0 THEN
                  "VAT %" :=
                    ROUND(100 * ("Amount Including VAT" - "VAT Base Amount") / "VAT Base Amount",0.00001)
                ELSE
                  "VAT %" := 0;
              END;
            END;
        END;

        InitOutstandingAmount;
        UpdateUnitCost;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        #1..32
                  "VAT %" :=ROUND(100 * ("Amount Including VAT" - "VAT Base Amount") / "VAT Base Amount",0.00001)
        #35..42
        */
        //end;

        //Unsupported feature: Property Deletion (Editable) on "Amount(Field 29)".



        //Unsupported feature: Code Modification on ""Operation No."(Field 99000751).OnValidate".

        //trigger "(Field 99000751)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Operation No." = '' THEN
          EXIT;

        #4..17

        "Expected Receipt Date" := ProdOrderRtngLine."Ending Date";
        VALIDATE("Work Center No.",ProdOrderRtngLine."No.");
        VALIDATE("Direct Unit Cost",ProdOrderRtngLine."Direct Unit Cost");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..20

        VALIDATE("Direct Unit Cost",ProdOrderRtngLine."Direct Unit Cost");
        #1..20

            VALIDATE "Purchase Requisition No."; erRtngLine."Direct Unit Cost");
            */
        //end;
        field(50000; "Purchase Requisition No."; Code[20])
        {
            //  Editable "Purchase Requisition Line No."; 
            Enabled = false;
        }
        // field(50001;"Purchase Requisition Line No.";Integer)
        // { Status; 
        //     Editable = false;
        // }("Document Type" = 
        // field(50002;Status;Option) = 
        // {
        //     CalcFormula = lookup("Purchase Header".Status where ("Document Type"=field("Document Type"),
        //                                                          "No."=field("Document No.")));
        //     Editable = true;
        //     FieldClass = FlowField;
        //     OptionCa Select;  'Open,Released,Pending Approval,Pending Prepayment,Cancelled';
        //     OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled;
        // }
        field(50003; Select; Boolean)
        {

            trigger OnValidate()
            begin
                //  Modi "Quantity To  Issue";
            end;
        }
        field(50004; "Quantity To  Issue"; Decimal)
        {

            // ger OnValidate()
            // begin
            //      = 0 then
            //         Modify(false);

            // // IF"Quantity To  Issue">("Qty. Requested"-"Quantity  issued") THEN
            // // ERROR('YOU CANNOT ISSUE MORE THAN WHAT WAS REQUESTED.PLEASE CHECK!!');

            // //if "Quantity To  Issue" > ("Qty Approved" - ted"-"Quantity  issued") THEN
            // // ERROR('YOU CANNOT ISSUE MORE THAN WHAT WAS REQUESTED.PLEASE CHECK!!');


            // Error('YOU CANNOT ISSUE MORE THAN WHAT WAS APPROVED.PLEASE CHECK!!');


            // CalcFields("Quantity In Store");
            // if "Quantity To  Issue" > "Quantity In Store" then
            // // Error('INSUFFICIENT STOCK TO ISSUE FROM %1 STORE.PLEASE CHECK!!',"Location Code");

            // PurchHeader.Get("Document Type","Document No.");

            /*IF PurchHeader."Requisition Type"<>PurchHeader."Requisition Type"::"Stock Return" THEN BEGIN

            IF  //new code to convert unit of measure
              CALCFIELDS("Quantit "Unit of Measure Code") THEN BEGIN
                    qty := "Quantity To  Issue" * f measure
                END
            //   MESSAGE('%1',qty);
            IF qty > "Quantity In Store" THEN
                    IF qty>"Quantity In Store" THEN 
            END;
            ;

         END;;

            END;*///*************Commented by Morris During upgrade

            //  end; Category; 
        }
        field(50005; Category; Option)
        {
            OptionCaption = ' ,Item,Service,Capex';
            OptionMembers = " ",Item,Service,Capex;

            // trigger OnValidate()
            // begi//Ushindi
            //     TestStatusOpen;
            //     if Category =  begin
            //         Type := 
            //     begin
            //         Type:=Type::Item
            //        end;
            // end; "Service/Item Code"; 
        }
        field(50006; "Service/Item Code"; Code[30])
        {

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

            // trigger OnValidate()
            // begin
            //     Modify(false);
            //     TestField("PO Type");
            //     TestField("Buy-from Vendor No.");
            //     "Selected By":=UserId;
            // end;
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
            TableRelation = if ("Document Type" = const("Store Requisition")) "Item Category".Code where("Bill Item Group" = const(false));

            // trigger OnValidate()
            // begin

            //     if ("Document Type"="document type"::"Store Requisition") then begin
            //     //   //Category:=Category::Item;
            //     // Validate(Category);
            //     // PurchHeader.Reset;
            //     // PurchHeader.SetRange("No.","Document No.");
            //     // if PurchHeader.FindSet then
            //     // "Location Code":=PurchHeader."Location Code";
            //     // end;
            //     //INSERT(TRUE);
            // end;
        }
        field(50031; VendorName; Text[100])
        {
            CalcFormula = lookup("Purchase Header"."Buy-from Vendor Name" where("Document Type" = field("Document Type"),
                                                                                 "No." = field("Document No.")));
            FieldClass = FlowField;
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

            // trigger OnValidate()
            // begin

            //     TestStatusOpen;

            //     Validate("Direct Unit Cost");
            //     Quantity:="Qty. Requested";
            //     "Line Amount":="Qty. Requested"*"Direct Unit Cost";

            //     if "Document Type"="document type"::"Purchase Requisition" then
            //           begin





            // ProcurementPlan.Reset;
            //   ProcurementPlan.SetRange(ProcurementPlan."Plan Item No","Procurement Plan Item");
            //  if ProcurementPlan.Find('-') then begin
            //  if ProcurementPlan."Procurement Type"=ProcurementPlan."procurement type"::Goods then
            //      Category:=Category::Item
            // else
            // if ProcurementPlan."Procurement Type"=ProcurementPlan."procurement type"::Service then
            //     Category:=Category::Service;

            //  ProcurementPlan.CalcFields("Approved Budget",Commitment,Actual);
            //     "Vote Amount":=ProcurementPlan."Approved Budget";
            //     "Budget Commitments":=ProcurementPlan.Commitment;
            //     "Available Funds":="Vote Amount"-ProcurementPlan.Actual-"Budget Commitments";

            //     //Description:=ProcurementPlan."Item Description";
            //    "Unit of Measure":=ProcurementPlan."Unit of Measure";
            //    "Unit Cost":=ProcurementPlan."Unit Cost";
            //     //Budgeted:=BudgetLines.Amount;
            //   "Budget Amount":=ProcurementPlan."Approved Budget";
            //   //"Direct Unit Cost":=ProcurementPlan."Unit Cost";
            //     Validate("Direct Unit Cost");
            //  /*   IF Category=Category::Service THEN BEGIN
            //   "Qty. Requested":=ProcurementPlan.Quantity;
            //   Quantity:=ProcurementPlan.Quantity;;
            //   END;*/
            //   "Line Amount":="Qty. Requested"*"Direct Unit Cost";

            //      end;
            //       end ;

            //     //Fred
            //     "Qty Approved":="Qty. Requested";

            // end;
        }
        field(50038; "Include in Purch. Order"; Boolean)
        {
        }
        field(50039; "Request-By No."; Code[10])
        {
            TableRelation = Employee."No.";
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                "Employee No" := Rec."Request-By No.";
                if Emp.Get("Employee No") then
                    "Employee Name" := Emp.FullName();
            end;
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
            CalcFormula = lookup("Purchase Header".Test where("Document Type" = field("Document Type"),
                                                               "No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50044; "IR Line Reference"; Code[35])
        {
        }
        field(50045; "Requisition Header Type"; Option)
        {
            Description = '//Ushindi...Lookup IR Type from Header';
            FieldClass = Normal;
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
                //  TestField(Status,Status::Open);
            end;
        }
        field(50065; "Vehicle Description"; Text[250])
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
        field(50068; "External Doc No"; Code[35])
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

            // trigger OnValidate()
            // begin

            //       ProcurementPlan.Reset;
            //       ProcurementPlan.SetRange(ProcurementPlan."Plan Item No","Procurement Plan Item");
            //      if ProcurementPlan.Find('-') then begin
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

            // end;

            //  ProcurementPlan.Reset;
            //   //ProcurementPlan.SETRANGE("Plan Year","Procurement Plan");
            //   ProcurementPlan.SetRange("Plan Item No","Procurement Plan Item");
            //   if ProcurementPlan.FindSet then begin
            //     "General Item Category":=ProcurementPlan.Category;
            //     if ProcurementPlan."Procurement Type"=ProcurementPlan."procurement type"::Goods then
            //     "General Item Category":='GOODS';
            //     if ProcurementPlan."Procurement Type"=ProcurementPlan."procurement type"::Service then begin
            //     "Qty. Requested":=ProcurementPlan.Quantity;

            //     "General Item Category":='Service';
            //     end;
            //     if ProcurementPlan."Procurement Type"=ProcurementPlan."procurement type"::Works then
            //     "General Item Category":='Works';
            //     "Item Category":=ProcurementPlan.Category;
            //     "Job No.":=ProcurementPlan."Job ID";
            //     "Job Task No.":=ProcurementPlan."Job Task No.";
            //     //"Qty. Requested":=1;
            //     if GeneralItem.Get("Item Category") then begin
            //     //"Service/Item Code":=GeneralItem.Code;
            //     Item.Reset;
            //   Item.SetRange("No.","Service/Item Code");
            //       if Item.Find('-') then begin
            //          Description:=Item.Description;
            //       end;
            //       Type:=Type::Item;
            //       "No.":="Service/Item Code";
            //         end;
            //         end;

            // end;
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
            Caption = 'Procurement Plan Entry No';
            // TableRelation = "Procurement Plan Entry"."Entry No." where ("Procurement Plan ID"=field("Procurement Plan Entry No"));

            // trigger OnValidate()
            // begin
            //     /* PlanItem.RESET;
            //      PlanItem.SETRANGE("Plan Item No","Procurement Plan Item");
            //      IF PlanItem.FIND('-') THEN
            //        "Procurement Plan Item Descript":=PlanItem."Item Description";*/

            // end;
        }
        field(70038; "Quantity Partial Issued"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70039; Awarded; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70040; "IFS Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70041; Selected; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70042; Applied; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70043; "Quantity Available"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70044; "Contract Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Construction,PBRM';
            OptionMembers = " ",Construction,PBRM;
        }
        field(70045; "Reversion Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'To Contractor,To Authority';
            OptionMembers = "To Contractor","To Authority";
        }
        field(70046; "Fixed Asset No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";

            trigger OnValidate()
            begin
                fAsset.Reset;
                fAsset.SetRange(fAsset."No.", "Fixed Asset No");
                if fAsset.FindSet then
                    "Fixed Asset Name" := fAsset.Description;
            end;
        }
        field(70047; "Fixed Asset Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70048; "Escalation Percentage"; Decimal)
        {
        }
        field(70049; "Escalaleted Amount"; Decimal)
        {
            FieldClass = Normal;
        }
        field(70050; Test1; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Escalaleted Amount" := Test1 * Amount;
            end;
        }
        field(70051; "Escalated By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70052; "Escalated On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(70053; Escalated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(90053; Inventory; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70054; Description3; Text[2000])
        {
            Caption = 'Description';
            TableRelation = IF (Type = CONST("G/L Account"), "No." = CONST(''),
                "System-Created Entry" = CONST(false)) "G/L Account".Name WHERE("Direct Posting" = CONST(true),
                                                                                "Account Type" = CONST(Posting),
                                                                                Blocked = CONST(false))
            ELSE
            IF (Type = CONST("G/L Account"), "System-Created Entry" = CONST(true)) "G/L Account".Name
            ELSE
            IF (Type = CONST(Item), "Document Type" = FILTER(<> "Credit Memo" & <> "Return Order")) Item.Description WHERE(Blocked = CONST(false),
                                                                                    "Purchasing Blocked" = CONST(false))
            ELSE
            IF (Type = CONST(Item), "Document Type" = FILTER("Credit Memo" | "Return Order")) Item.Description WHERE(Blocked = CONST(false))
            ELSE
            IF (Type = CONST("Fixed Asset")) "Fixed Asset".Description
            ELSE
            IF (Type = CONST("Charge (Item)")) "Item Charge".Description
            else
            if (Type = CONST(Resource)) Resource.Name;
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
                FindRecordMgt: Codeunit "Find Record Management";
                ReturnValue: Text[50];
                IsHandled: Boolean;
                ShouldErrorForFindDescription: Boolean;
            begin
                IsHandled := TRUE;
                ///  OnBeforeValidateDescription(Rec, xRec, CurrFieldNo, IsHandled);
                if IsHandled then
                    exit;

                if Type = Type::" " then
                    exit;

                if "No." <> '' then
                    exit;

                case Type of
                    Type::Item:
                        // ValidateItemDescription();ELSE
                        begin
                            ReturnValue := FindRecordMgt.FindNoByDescription(Type.AsInteger(), Description, true);
                            if ReturnValue <> '' then begin
                                CurrFieldNo := FieldNo("No.");
                                Validate("No.", CopyStr(ReturnValue, 1, MaxStrLen("No.")));
                            end;
                        end;
                end;

                ShouldErrorForFindDescription := ("No." = '') and GuiAllowed() and ApplicationAreaMgmtFacade.IsFoundationEnabled() and ("Document Type" = "Document Type"::Order);
                //  OnValidateDescriptionOnAfterCalcShouldErrorForFindDescription(Rec, xRec, ShouldErrorForFindDescription);
                if ShouldErrorForFindDescription then
                    Error('Danger !!!');
            end;
        }
        field(8603700; Test; Code[10])
        {
            DataClassification = ToBeClassified;
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
        field(99000765; "Road Code."; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(99000766; "Committed Amount"; Decimal)
        {

        }
        field(99000767; "Budgeted Amount"; Decimal)
        {

        }
        field(99000768; "Available Amount"; Decimal)
        {

        }
        field(99000769; "Account Actual Spent"; Decimal)
        {

        }

    }
    keys
    {

        key(Key3; "Procurement Plan")
        {
        }
    }


    trigger OnInsert()
    var
        usersetup: Record "User Setup";
        Emp: Record Employee;
    begin
        Rec."Requestor ID" := UserId;
        if usersetup.get(UserId) then begin
            if not usersetup."Portal User" then begin
                //Rec.Region := usersetup."Region Code";
                Rec.Validate("Request-By No.", usersetup."Employee No.");
                Rec."Request-By Name" := usersetup."Employee Name";
                Rec."Location Code" := usersetup."Responsibility Center";
                if Emp.Get(usersetup."Employee No.") then begin
                    Rec.Validate("Directorate Code", Emp."Directorate Code");
                    Rec.Validate("Department Code", Emp."Department Code");
                end
            end;
        end;
    end;

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestStatusOpen;
    IF Quantity <> 0 THEN BEGIN
      OnBeforeVerifyReservedQty(Rec,xRec,0);
      ReservePurchLine.VerifyQuantity(Rec,xRec);
    END;
    LOCKTABLE;
    PurchHeader."No." := '';
    IF ("Deferral Code" <> '') AND (GetDeferralAmount <> 0) THEN
      UpdateDeferralAmounts;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TestStatusOpen;

    #2..9

    PurchHeader.RESET;
    PurchHeader.SETRANGE("No.","Document No.");
    PurchHeader.SETRANGE(Status,PurchHeader.Status::Open);
    IF PurchHeader.FINDSET THEN BEGIN
    "Procurement Plan":=PurchHeader."Procurement Plan";
      //"Procurement Plan Item":=PurchHeader."Procurement Plan Item";
      //"Item Category":=PurchHeader."Item Category";

      //"General Item Category":=PurchHeader."General Item Category";
      IF GeneralItem.GET("Item Category") THEN BEGIN
        //"Service/Item Code":=GeneralItem.Code;
        Item.RESET;
      Item.SETRANGE("No.","Service/Item Code");
      IF Item.FIND('-') THEN BEGIN
         Description:=Item.Description;
      END;
      Type:=Type::Item;
      "No.":="Service/Item Code";
      //VALIDATE("No.");

        //VALIDATE("Service/Item Code");
        END;

    {"Directorate Code":=PurchHeader."Di;rectorate Code";
    Division:=PurchHeader.Division;
    "Department Code":=PurchHeader."Department Code";}
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "InitHeaderDefaults(PROCEDURE 97)".

    //procedure InitHeaderDefaults();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    PurchHeader.TESTFIELD("Buy-from Vendor No.");

    "Buy-from Vendor No." := PurchHeader."Buy-from Vendor No.";
    #4..29
    "Order Date" := PurchHeader."Order Date";

    OnAfterInitHeaderDefaults(Rec,PurchHeader);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF PurchHeader."Document Type"<>PurchHeader."Document Type"::"Purchase Requisition" THEN
    #1..32
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromItem(PROCEDURE 100)".

    //procedure CopyFromItem();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetItem(Item);
    GetGLSetup;
    OnBeforeCopyFromItem(Rec,Item);
    Item.TESTFIELD(Blocked,FALSE);
    Item.TESTFIELD("Gen. Prod. Posting Group");
    IF Item."Purchasing Blocked" THEN
      ERROR(PurchasingBlockedErr);
    IF Item.Type = Item.Type::Inventory THEN BEGIN
      Item.TESTFIELD("Inventory Posting Group");
      "Posting Group" := Item."Inventory Posting Group";
    END;
    Description := Item.Description;
    "Description 2" := Item."Description 2";
    "Unit Price (LCY)" := Item."Unit Price";
    #15..48
    "Unit of Measure Code" := Item."Purch. Unit of Measure";
    InitDeferralCode;
    OnAfterAssignItemValues(Rec,Item);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    ERROR(PurchasingBlockedErr);
    IF Item.Type = Item.Type::Inventory THEN BEGIN
    Item.TESTFIELD("Inventory Posting Group");
    "Posting Group" := Item."Inventory Posting Group";
    END;

    #12..51
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateAmounts(PROCEDURE 3)".

    //procedure UpdateAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF Type = Type::" " THEN
      EXIT;
    GetPurchHeader;
    #4..11
    IF "Line Amount" <> ROUND(Quantity * "Direct Unit Cost",Currency."Amount Rounding Precision") - "Line Discount Amount" THEN BEGIN
      "Line Amount" :=
        ROUND(Quantity * "Direct Unit Cost",Currency."Amount Rounding Precision") - "Line Discount Amount";
      "VAT Difference" := 0;
      LineAmountChanged := TRUE;
    END;
    #18..67
    CalcPrepaymentToDeduct;

    OnAfterUpdateAmountsDone(Rec,xRec,CurrFieldNo);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
        VALIDATE("Line Amount");
    #15..70
    */
    //end;


    //Unsupported feature: Code Modification on "TestStatusOpen(PROCEDURE 37)".

    //procedure TestStatusOpen();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeTestStatusOpen(Rec,PurchHeader);

    IF StatusCheckSuspended THEN
      EXIT;
    GetPurchHeader;
    IF NOT "System-Created Entry" THEN
      IF HasTypeToFillMandatoryFields THEN
        PurchHeader.TESTFIELD(Status,PurchHeader.Status::Open);

    OnAfterTestStatusOpen(Rec,PurchHeader);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
        //PurchHeader.TESTFIELD(Status,PurchHeader.Status::Open);

    OnAfterTestStatusOpen(Rec,PurchHeader);
    */
    //end;


    //Unsupported feature: Property Modification (Id) on "ItemChargeAssignmentErr(Variable 1097)".

    //var
    //>>>> ORIGINAL VALUE:
    //ItemChargeAssignmentErr : 1097;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemChargeAssignmentErr : 1297;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CannotFindDescErr(Variable 1035)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotFindDescErr : 1035;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotFindDescErr : 1635;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CommentLbl(Variable 1024)".

    //var
    //>>>> ORIGINAL VALUE:
    //CommentLbl : 1024;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CommentLbl : 1524;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "LineDiscountPctErr(Variable 1036)".

    //var
    //>>>> ORIGINAL VALUE:
    //LineDiscountPctErr : 1036;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LineDiscountPctErr : 1536;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "PurchasingBlockedErr(Variable 1037)".

    //var
    //>>>> ORIGINAL VALUE:
    //PurchasingBlockedErr : 1037;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchasingBlockedErr : 1537;
    //Variable type has not been exported.

    var
        // GLPostCheckLineCDU: Codeunit "Gen. Jnl.-Check Line";
        GLAccCode: Code[20];
        GDimensions: array[8] of Code[20];
        GPostDate: Date;
        GBusUnitCode: Code[20];
        GCurrFactor: Decimal;
        UserSetup: Record "User Setup";
        Service: Record "Service Items";
        Jobs: Record Job;
        qty: Decimal;
        UoM: Record "Item Unit of Measure";
        Text055: label 'You have exceeded availble budget by KES %1, Please seek advice from accounts and finance department';
        "...........................Bcommitments................................": Integer;
        fAsset: Record "Fixed Asset";
        Bcommitments: Record "Budget Commitment";
        cSetup: Record "Human Resources Setup";
        gEntry: Record "G/L Entry";
        actualAmount: Decimal;
        ProcurementPlan: Record "Procurement Plan1";
        Item: Record Item;
        GeneralItem: Record "Item Category";
        "----------Editable.............................................................": Integer;
        AmountEditable: Boolean;
        LineAmountEditable: Boolean;
        QuantityEditable: Boolean;
        PCT: Decimal;
        EscPerc: Record "Escalation Percentage";

    Local Procedure UpdateCommitment()//PurchaseLine: Record "Purchase Line"
    var
        CustomFunction: Codeunit "Custom Function";
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseHeader.Reset();
        PurchaseHeader.SetRange("No.", "Document No.");
        if PurchaseHeader.findfirst() then begin
            // PurchaseLine.CalcFields("G/L Account");
            "Budgeted Amount" := CustomFunction.GetBudgtedAmount("No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code","Department Code");
            "Account Actual Spent" := CustomFunction.GetActualSpent("No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code","Department Code");
            "Committed Amount" := CustomFunction.GetCommittedAmount("No.", CustomFunction.GetBudgetYear(PurchaseHeader."Posting Date"), "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code","Department Code");
            // PurchaseLine.modify();
            "Available Amount" := "Budgeted Amount" -("Account Actual Spent"+"Committed Amount");
        end;
    end;
}

