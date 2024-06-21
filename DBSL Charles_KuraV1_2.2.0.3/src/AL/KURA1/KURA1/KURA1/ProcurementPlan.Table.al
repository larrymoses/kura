#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70098 "Procurement Plan"
{
    LookupPageId = 75190;
    DrillDownPageId = 75190;

    fields
    {
        field(1; "Code"; Code[40])
        {
            
            Editable = true;
        }
        field(2; Description; Text[60])
        {
            
        }
        field(3; "Corporate Strategic Plan ID"; Code[10])
        {
            
            TableRelation = "Corporate Strategic Plans".Code where("Approval Status" = const(Released));
        }
        field(4; "Financial Budget ID"; Code[10])
        {
            
            TableRelation = "G/L Budget Name";
        }
        field(5; "Financial Year Code"; Code[20])
        {
            
            TableRelation = "Financial Year Code";

            trigger OnValidate()
            begin
                YearCodes.Reset;
                YearCodes.SetRange(Code, "Financial Year Code");
                if YearCodes.FindSet then begin
                    "Start Date" := YearCodes."Starting Date";
                    "End Date" := YearCodes."Ending Date";
                end;
            end;
        }
        field(6; "Start Date"; Date)
        {
            
        }
        field(7; "End Date"; Date)
        {
            
        }
        field(8; "Created By"; Code[30])
        {
            
            Editable = false;
        }
        field(9; "Date Created"; Date)
        {
            
            Editable = false;
        }
        field(10; "Time Created"; Time)
        {
            
            Editable = false;
        }
        field(11; "Plan Type"; Option)
        {
            
            OptionCaption = 'Functional,Consolidated,...';
            OptionMembers = Functional,Consolidated,"...";
        }
        field(12; "Approval Status"; Option)
        {  
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14; "Echequer Job ID"; Code[20])
        {
            
            TableRelation = Job."No.";
        }
        field(15; "Total Budget (Goods)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = const('GOODS'),
                                                                                   "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Total Budget (Works)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = const('WORKS'),
                                                                                 "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Total Budget (Services)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = const('SERVICES'),
                                                                                 "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Total Budgeted Spend"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Total Actual (Works)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Total Actual Costs" where("Procurement Type" = const('WORKS'),
                                                                                   "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Total Actual (Services)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Total Actual Costs" where("Procurement Type" = const('SERVICES'),
                                                                                   "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "Total Actual Spend"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Total Actual Costs" where("Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "Spend %"; Decimal)
        {
            CalcFormula = average("Procurement Plan Entry"."Total Actual Costs" where("Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; "Department Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(24; "Budget Plan Posted"; Boolean)
        {
            
        }
        field(25; "Total Actual (Goods)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Total Actual Costs" where("Procurement Type" = const('GOODS'),
                                                                                   "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(36; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                
                PurchaseReqDet.VALIDATE(PurchaseReqDet."No."); */

            end;
        }
        field(37; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 1 Code';
            
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                 END;*/

            end;
        }
        field(38; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';
            
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                Dimen := "Global Dimension 3 Code";
                Dimen := CopyStr(Dimen, 1, 3);
                "Global Dimension 2 Code" := Dimen;
                Dimens := "Global Dimension 3 Code";
                Dimens := CopyStr(Dimens, 1, 1);
                "Global Dimension 1 Code" := Dimens;

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 3 Code":="Global Dimension 3 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                
                 END;
                
                {IF "Global Dimension 2 Code" = '' THEN
                  EXIT;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
                
                }  */

            end;
        }
        field(39; "Consolidated Procurement Plan"; Code[20])
        {
            
            TableRelation = "Procurement Plan".Code where("Plan Type" = const(Consolidated));

            trigger OnValidate()
            begin
                // plan.RESET;
                // plan.SETRANGE("Consolidated Procurement Plan",plan.Code);
                // IF plan.FIND('-') THEN
                //   "Corporate Strategic Plan ID":= plan."Corporate Strategic Plan ID";
                //   "Document Date":=TODAY;
                //   "Date Created":=TODAY;
                //   "Financial Budget ID":= plan."Financial Budget ID";
                //   "Financial Year Code":= plan."Financial Year Code";
                //   "Start Date":= plan."Start Date";
                //   "End Date":= plan."End Date";
                //   "Time Created":=TIME;



            end;
        }
        field(40; "Planning Responsibility Center"; Code[20])
        {
            
            TableRelation = "Responsibility Center".Code;
        }
        field(41; "Total PRN Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const("Purchase Requisition"), //////Status = const(Released), "Ordered PRN" = const(false),
                                                                       "Procurement Plan ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(42; "Total Contract Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const("Blanket Order"),// Status=const(Released),

                                                       "Procurement Plan ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(43; "Total PO Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const(Order),
                                                         // Status=const(Released),
                                                         "Procurement Plan ID" = field(Code),
                                                            "Blanket Order No." = const('')));
            FieldClass = FlowField;
        }
        field(44; "Total Purchase Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = filter("Purchase Requisition" | Order | "Blanket Order"),
                                                            //  Status=const(Released),
                                                            "Procurement Plan ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(45; "Total Purchase Invoices"; Decimal)
        {
            CalcFormula = sum("Purch. Inv. Line".Amount where("Department Code" = field(Code)));
            FieldClass = FlowField;
        }
        field(46; "Total Purchase Credit Memos"; Decimal)
        {
            CalcFormula = sum("Purch. Cr. Memo Line".Amount where("Department Code" = field(Code)));
            FieldClass = FlowField;
        }
        field(47; "Total Actual Costs"; Decimal)
        {
            
        }
        field(48; "Available Procurement Budget"; Decimal)
        {
            
        }
        field(49; "Document Date"; Date)
        {
            
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Global Dimension 2 Code");
            end;
        }
        field(481; Blocked; Boolean)
        {
            
        }
        field(70000; "Revision Voucher"; Boolean)
        {
            
        }
        field(70001; Type; Option)
        {
            
            OptionCaption = ' ,Functional,Consolidated';
            OptionMembers = " ",Functional,Consolidated;
        }
        field(70002; "Plan No"; Code[30])
        {
            
            TableRelation = if (Type = const(Consolidated)) "Procurement Plan".Code where("Plan Type" = const(Consolidated))
            else
            if (Type = const(Functional)) "Procurement Plan".Code where("Plan Type" = const(Functional));
        }
        field(70003; "Document Type"; Option)
        {
            
            OptionCaption = 'Procurement Plan,Revision Voucher';
            OptionMembers = "Procurement Plan","Revision Voucher";
        }
        field(70004; "Global Dimension 1 Code Name"; Text[1000])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department Name';
            
            TableRelation = "Dimension Value".Name where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                
                PurchaseReqDet.VALIDATE(PurchaseReqDet."No."); */

            end;
        }
        field(70005; "Total Budget R11 (Goods)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = const('GOODS'), Region = const('R11'),
                                                                                   "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70006; "Total Budget R11 (Services)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = const('SERVICES'), Region = const('R11'), //CC-09082023/
            "Funding Source ID" = filter('15% OPS' | '15% RDWKS'),
                                                                                    "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70007; "Total Budget R11 (Works)"; Decimal)
        {
            //11092023
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = const('works'), Region = CONST('R11'),
                                                                                    "Funding Source ID" = filter('10% RDWKS' | '15% RDWKS' | '15% SPECIAL'), "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70008; "Total Budgeted Spend LCY"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost (LCY)" where("Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70009; Consolidated; Boolean)
        {
            Editable =false;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin


        if Code = '' then begin

            PurchSetup.Get;
            PurchSetup.TestField("Procument Plan Nos");
            NoSeriesMgt.InitSeries(PurchSetup."Procument Plan Nos", xRec.Code, 0D, Code, "No. Series");
        end;
        "Created By" := UserId;
        USER.Reset;
        USER.SetRange("User ID", UserId);
        IF USER.FindSet THEN begin
            "Global Dimension 1 Code" := USER."Region Code";
        end;



        "Date Created" := Today;
        "Time Created" := Time;
        "Document Date" := Today;

        /*"End Date":=TIME;
        "Start Date":=TODAY;*/

    end;

    var
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        YearCodes: Record "Financial Year Code";
        Dimen: Text;
        Dimens: Text;
        PostCode: Record "Post Code";
        DimMgt: Codeunit DimensionManagement;
        plan: Record "Procurement Plan";
        USER: Record "User Setup";

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        //  OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1 %2','',Code),
        //     "Global Dimension 1 Code","Global Dimension 2 Code");

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;
}

