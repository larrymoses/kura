#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57009 "Project Members"
{
    DrillDownPageID = "Safari Team";
    LookupPageID = "Safari Team";

    fields
    {
        field(1; "Imprest Memo No."; Code[20])
        {
            TableRelation = "Imprest Memo";

            trigger OnValidate()
            begin
                ImprestMemo.Reset;
                ImprestMemo.SetRange("No.", "Imprest Memo No.");
                if ImprestMemo.FindSet then begin
                    "Global Dimension 1 Code" := ImprestMemo."Shortcut Dimension 1 Code";
                    "Global Dimension 1 Code" := ImprestMemo."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := ImprestMemo."Shortcut Dimension 2 Code";
                end;
            end;
        }
        field(2; "No."; Code[20])
        {
            TableRelation = if (Type = const(Person)) Resource where(Type = const(Person))
            else
            if (Type = const(Machine)) Resource where(Type = const(Machine));

            trigger OnValidate()
            var
                UnpostedImprest: Record payments;
                UnpostedImprestTotal: Decimal;
            begin
                // IF ImprestMemo.GET("Imprest Memo No.") THEN;
                // IF "No."=ImprestMemo.Requestor THEN
                //    "Project Lead":=TRUE
                // ELSE
                //    "Project Lead":=FALSE;

                if ResourceRec.Get("No.") then;
                Name := ResourceRec.Name;
                "Job Group" := ResourceRec."Resource Group No.";
                case Type of
                    Type::Person:
                        begin
                            if EmployeeRec.Get("No.") then begin
                                //Ushindi...Insert Bank Details
                                "Job Group" := ResourceRec."Resource Group No.";
                                EmployeeRec.CalcFields(EmployeeRec."Bank Name", EmployeeRec."Bank Branch Name", EmployeeRec.Balance);
                                UnpostedImprestTotal := 0;
                                UnpostedImprest.Reset();
                                UnpostedImprest.SetRange("Account Type", UnpostedImprest."Account Type"::Employee);
                                UnpostedImprest.SetRange("Account No.", "No.");
                                UnpostedImprest.SetRange("Payment Type", UnpostedImprest."Payment Type"::Imprest);
                                UnpostedImprest.SetRange(Surrendered, false);
                                UnpostedImprest.SetRange("Archive Document", false);
                                //   UnpostedImprest.SetFilter(Status, '%1|%2|%3', UnpostedImprest.Status::Open, UnpostedImprest.Status::"Pending Approval", UnpostedImprest.Status::Released);
                                UnpostedImprest.SetRange(Posted, false);
                                if UnpostedImprest.FindSet() then begin
                                    repeat
                                        UnpostedImprest.calcfields("Imprest Amount");
                                        UnpostedImprestTotal := UnpostedImprestTotal + UnpostedImprest."Imprest Amount";
                                    until UnpostedImprest.Next = 0;
                                    // UnpostedImprest.CalcSums("Imprest Amount");
                                    // UnpostedImprestTotal:= UnpostedImprest."Imprest Amount";
                                end;

                                //*** To check on the control at requisition creation-KeRRa***
                                //IF (EmployeeRec.Balance*-1)>0 THEN
                                //ERROR('Please Surrender your outstanding imprest balance of  %1',EmployeeRec.Balance*-1);
                                Name := EmployeeRec."First Name" + ' ' + EmployeeRec."Middle Name" + ' ' + EmployeeRec."Last Name";

                                "Bank Account Number" := EmployeeRec."Bank Account Number";
                                "Bank Branch" := EmployeeRec."Bank Branch";
                                "Bank Branch Name" := EmployeeRec."Bank Branch Name";
                                "Bank Name" := EmployeeRec."Bank Name";
                                "Job Title" := EmployeeRec."Job Title";
                                "Directorate Code" := EmployeeRec."Directorate Code";
                                "Department Code" := EmployeeRec."Department Code";
                                Division := EmployeeRec.Division;

                                //"Outstanding Amount" := Abs(EmployeeRec.Balance);
                                "Outstanding Amount" := Abs(EmployeeRec.Balance) + UnpostedImprestTotal;
                            end;
                            //Ushindi Changes
                            CustRec.Reset;
                            CustRec.SetRange("No.", "No.");
                            if CustRec.Find('-') then begin
                                CustRec.CalcFields("Balance (LCY)", Balance);
                                //"Outstanding Amount":=CustRec."Balance (LCY)";
                                if CustRec."Balance (LCY)" > CustRec."Credit Limit (LCY)" then //David accountability of unsurrendered imprests
                                    Error(Text001, "No.", CustRec."Balance (LCY)", CustRec.Balance - CustRec."Credit Limit (LCY)");
                            end;
                        end;
                    Type::Machine:
                        begin
                        end;
                end;
                //Ushindi
                //CALCFIELDS(Project);
                //Ushindi


                //FRed Check if the employee is in another Memo and the memo is still runnning

                // IF "Return Date" <>0D THEN BEGIN
                // RESET;
                // SETRANGE("No.","No.");
                // SETFILTER("Return Date",'<=%1',xRec."Return Date");
                // IF FINDFIRST THEN
                //  ERROR('EMployee tied up in %1',xRec."Imprest Memo No.");
                // END ELSE
                // ERROR('Return date is blank');
                /*
                ProjectMembers.RESET;
                ProjectMembers.SETRANGE(ProjectMembers."No.","No.");
                ProjectMembers.SETFILTER(ProjectMembers."Return Date",'<=%1',"Return Date");
                IF ProjectMembers.FINDFIRST THEN
                  BEGIN
                   IF ProjectMembers."Return Date" <> 0D THEN
                     BEGIN
                      REPEAT
                        ERROR('This employee %1 is tied in another imprest memo %2',ProjectMembers."No.",ProjectMembers."Imprest Memo No.");
                     UNTIL ProjectMembers.NEXT =0;
                   END;
                END;
                */

            end;
        }
        field(3; Name; Text[150])
        {
        }
        field(4; "Job Group"; Code[30])
        {
            CalcFormula = lookup(Employee."Salary Scale" where("No." = field("No.")));
            FieldClass = FlowField;
        }
        field(5; "Job Title"; Text[50])
        {
        }
        field(6; Entitlement; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            var
                "Exchange Factor": Decimal;
                "Exchange Rate": Decimal;
            begin
                // "Direct Unit Cost" := (Entitlement - "Transport Costs") / "Time Period";
                if "Currency Code" <> '' then begin
                    CurrExchRate.Reset;
                    CurrExchRate.SetRange(CurrExchRate."Currency Code", "Currency Code");
                    CurrExchRate.SetRange(CurrExchRate."Starting Date", 0D, Today);
                    if CurrExchRate.Find('+') then begin
                        "Exchange Rate" := CurrExchRate."Relational Exch. Rate Amount";
                        if CurrExchRate."Relational Exch. Rate Amount" <> 0 then
                            "Exchange Factor" := CurrExchRate."Exchange Rate Amount" / CurrExchRate."Relational Exch. Rate Amount";

                    end;
                    "Entitlement (LCY)" := CurrExchRate.ExchangeAmtFCYToLCY(Today, "Currency Code", Entitlement, "Exchange Factor");
                end
                else
                    "Entitlement (LCY)" := Entitlement;

            end;
        }
        field(7; "Outstanding Amount"; Decimal)
        {
            Editable = false;
        }
        field(8; "Tasks to Carry Out"; Text[150])
        {
        }
        field(9; "Expected Output"; Text[150])
        {
        }
        field(10; "Unit of Measure"; Code[20])
        {
            TableRelation = "Unit of Measure";
        }
        field(11; Delivery; Decimal)
        {
        }
        field(12; "Work Type"; Code[20])
        {
            TableRelation = "Work Type" where(Category = filter("Project Team" | Machines), blocked = filter(FALSE));

            trigger OnValidate()
            begin
                if WTRec.Get("Work Type") then begin
                    "Unit of Measure" := WTRec."Unit of Measure Code";
                    "G/L Account" := WTRec."G/L Account";
                end;

                ResourceCost.Reset;
                ResourceCost.SetRange("Work Type Code", "Work Type");
                if ResourceCost.Find('-') then begin
                    "Currency Code" := ResourceCost."Currency code";
                    Validate("Currency Code");

                end;
            end;
        }
        field(13; "Time Period"; Decimal)
        {

            trigger OnValidate()
            begin
                ImprestMemo.Reset;//Commented by Ruth
                ImprestMemo.SetRange(ImprestMemo."No.", "Imprest Memo No.");
                if ImprestMemo.FindSet then begin
                    if ((ImprestMemo."Start Date" <> 0D) and (ImprestMemo."No. of days" <> 0)) then
                        "Return Date" := CalcDate(Format("Time Period") + 'D', ImprestMemo."Start Date");
                    //MESSAGE(FORMAT("Return Date"));
                end;
                // VALIDATE("No.");

                if "Work Type" <> '' then begin
                    if ResourceRec.Get("No.") then;
                    if ResourceRec."Resource Group No." <> '' then begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "No.", "Work Type") then begin
                            case Type of
                                Type::Person:
                                    Entitlement := (ResourceCost."Direct Unit Cost" * "Time Period");

                                Type::Machine:
                                    //change by David
                                    "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");

                            //Added the field consumption rate in the formula.
                            end;
                        end
                        else
                            if ResourceCost.Get(ResourceCost.Type::"Group(Resource)", ResourceRec."Resource Group No.", "Work Type") then begin
                                case Type of
                                    Type::Person:
                                        Entitlement := (ResourceCost."Direct Unit Cost" * "Time Period");

                                    Type::Machine:
                                        "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");
                                //Added the field consumption rate in the formula.
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                                // "Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                                end;
                            end;
                    end else begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "No.", "Work Type") then begin
                            case Type of
                                Type::Person:

                                    Entitlement := (ResourceCost."Direct Unit Cost" * "Time Period") + "Transport Costs";
                                Type::Machine:
                                    "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");
                            //"Expected Maintenance Cost":=(ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate");
                            //Added the field consumption rate in the formula.
                            //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                            // "Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                            end;
                        end
                        else begin
                            if ResourceCost.Get(ResourceCost.Type::All, '', "Work Type") then begin
                                case Type of
                                    Type::Person:
                                        Entitlement := (ResourceCost."Direct Unit Cost" * "Time Period");

                                    Type::Machine:
                                        "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");
                                //"Expected Maintenance Cost":=(ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate");
                                //Added the field consumption rate in the formula.
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                                end;
                            end
                            else
                                Error(Text000);
                        end;
                    end;
                end;


                "Direct Unit Cost" := ResourceCost."Direct Unit Cost";
                Validate("Total Entitlement");
                //"Vote Item":="G/L Account";



                //
                // ImprestMemo.RESET;
                // ImprestMemo.SETRANGE("No.","Imprest Memo No.");
                // // ImprestMemo.SETFILTER("End Date",'>%1',TODAY);
                // IF ImprestMemo.FINDSET THEN BEGIN
                //  Rec.RESET;
                //  Rec.SETRANGE("No.","No.");
                //  Rec.SETFILTER("Return Date",'>%1',ImprestMemo."Start Date");
                //  Rec.SETFILTER("Return Date",'<=%2',ImprestMemo."Return Date");
                //  IF Rec.FINDSET THEN
                //    ERROR('This employee is tied to another memo %1',ImprestMemo."No.");
                //  END;
                //  RESET;

                //Check if the # Of days <> the Header.# of days
                ImprestMemo.Reset;
                ImprestMemo.SetRange(ImprestMemo."No.", "Imprest Memo No.");
                if ImprestMemo.FindSet(true) then begin
                    if "Time Period" > ImprestMemo."No. of days" then
                        Error('You cannot exceed %1 days', ImprestMemo."No. of days");
                end;
                Validate(Entitlement);
            end;
        }
        field(14; Type; Option)
        {
            OptionCaption = 'Person,Machine';
            OptionMembers = Person,Machine;
        }
        field(15; "Last Maintenance Cost"; Decimal)
        {
        }
        field(16; "Expected Maintenance Cost"; Decimal)
        {
            Editable = false;
        }
        field(17; "Bank Name"; Text[100])
        {
        }
        field(18; "Bank Branch"; Code[100])
        {
        }
        field(19; "Bank Account Number"; Code[100])
        {
        }
        field(20; "Project Lead"; Boolean)
        {
        }
        field(21; "Project Lead Costs"; Decimal)
        {
            CalcFormula = sum("Project Members".Entitlement where(Type = const(Machine)));
            FieldClass = FlowField;
        }
        field(22; Posted; Boolean)
        {
        }
        field(23; Linked; Boolean)
        {
        }
        field(24; Project; Code[20])
        {
            FieldClass = Normal;
            TableRelation = Job;

            trigger OnValidate()
            begin
                // IF JobRec.GET(Project) THEN BEGIN
                // JobRec.CALCFIELDS("Project Budget","Actual Project Costs",
                // "PO Commitments","PRN Commitments","Store Requisition Commitments","Imprest Application Commitment");
                // "Project Description":=JobRec.Description;
                // "Project Budget":=JobRec."Project Budget";
                // "Actual Project Costs":=JobRec."Actual Project Costs";
                // "PO Commitments":=JobRec."PO Commitments";
                // "PRN Commitments":=JobRec."PRN Commitments";
                // "Store Requisition Commitments":=JobRec."Store Requisition Commitments";
                // "Imprest Application Commitment":=JobRec."Imprest Application Commitment";
                //  "Total Budget Commitments":="PO Commitments"+"PRN Commitments"+"Store Requisition Commitments"+"Imprest Application Commitment";
                // "Available Funds":="Project Budget"-"Actual Project Costs"-"Total Budget Commitments";
                // "Global Dimension 2 Code":=Project;
                // VALIDATE("Global Dimension 2 Code");
                // END;
            end;
        }
        field(25; "Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field(Job));

            trigger OnValidate()
            begin
                // CALCFIELDS(Project);
                if TaskRec.Get(Project, "Task No.") then;
                "Tasks to Carry Out" := TaskRec.Description;
                "Job Task Description" := TaskRec.Description;
            end;
        }
        field(26; "Expense Type"; Option)
        {
            OptionCaption = 'Fuel,Maintenance';
            OptionMembers = Fuel,Maintenance;
        }
        field(27; "Bank Branch Name"; Text[100])
        {
        }
        field(28; "Actual Time Period"; Integer)
        {

            trigger OnValidate()
            begin
                if "Work Type" <> '' then begin
                    if ResourceRec.Get("No.") then;
                    if ResourceRec."Resource Group No." <> '' then begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "No.", "Work Type") then begin
                            case Type of
                                Type::Person:
                                    "Actual Spent" := ResourceCost."Direct Unit Cost" * "Actual Time Period";

                                Type::Machine:
                                    //change by David
                                    "Actual Maintanance Costs" := (ResourceCost."Direct Unit Cost" * "Actual Distance covered" / "Consumption Rate");

                            //Added the field consumption rate in the formula.
                            end;
                        end
                        else
                            if ResourceCost.Get(ResourceCost.Type::"Group(Resource)", ResourceRec."Resource Group No.", "Work Type") then begin
                                case Type of
                                    Type::Person:
                                        "Actual Spent" := ResourceCost."Direct Unit Cost" * "Actual Time Period";

                                    Type::Machine:
                                        "Actual Maintanance Costs" := (ResourceCost."Direct Unit Cost" * "Actual Distance covered" / "Consumption Rate");
                                //Added the field consumption rate in the formula.
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                                // "Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                                end;
                            end;
                    end else begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "No.", "Work Type") then begin
                            case Type of
                                Type::Person:
                                    "Actual Spent" := ResourceCost."Direct Unit Cost" * "Actual Time Period";

                                Type::Machine:
                                    "Actual Maintanance Costs" := (ResourceCost."Direct Unit Cost" * "Actual Distance covered" / "Consumption Rate");
                            //"Expected Maintenance Cost":=(ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate");
                            //Added the field consumption rate in the formula.
                            //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                            // "Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                            end;
                        end
                        else begin
                            if ResourceCost.Get(ResourceCost.Type::All, '', "Work Type") then begin
                                case Type of
                                    Type::Person:
                                        "Actual Spent" := ResourceCost."Direct Unit Cost" * "Actual Time Period";

                                    Type::Machine:
                                        "Actual Maintanance Costs" := (ResourceCost."Direct Unit Cost" * "Actual Distance covered" / "Consumption Rate");
                                //"Expected Maintenance Cost":=(ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate");
                                //Added the field consumption rate in the formula.
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                                end;
                            end
                            else
                                Error(Text000);
                        end;
                    end;
                end;
            end;
        }
        field(29; "Actual Spent"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "Work Type" <> '' then begin
                    if ResourceRec.Get("No.") then;
                    if ResourceRec."Resource Group No." <> '' then begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "No.", "Work Type") then begin
                            case Type of
                                Type::Person:
                                    Entitlement := ResourceCost."Direct Unit Cost" * "Time Period";

                                Type::Machine:
                                    //change by David
                                    "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");

                            //Added the field consumption rate in the formula.
                            end;
                        end
                        else
                            if ResourceCost.Get(ResourceCost.Type::"Group(Resource)", ResourceRec."Resource Group No.", "Work Type") then begin
                                case Type of
                                    Type::Person:
                                        Entitlement := ResourceCost."Direct Unit Cost" * "Time Period";

                                    Type::Machine:
                                        "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");
                                //Added the field consumption rate in the formula.
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                                // "Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                                end;
                            end;
                    end else begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "No.", "Work Type") then begin
                            case Type of
                                Type::Person:
                                    Entitlement := ResourceCost."Direct Unit Cost" * "Time Period";

                                Type::Machine:
                                    "Expected Maintenance Cost" := (ResourceCost."Direct Unit Cost" * "Time Period" / "Consumption Rate");
                            //"Expected Maintenance Cost":=(ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate");
                            //Added the field consumption rate in the formula.
                            //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                            // "Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                            end;
                        end
                        else begin
                            if ResourceCost.Get(ResourceCost.Type::All, '', "Work Type") then begin
                                case Type of
                                    Type::Person:
                                        "Actual Spent" := ResourceCost."Direct Unit Cost" * "Actual Time Period";

                                    Type::Machine:
                                        "Actual Maintanance Costs" := (ResourceCost."Direct Unit Cost" * "Actual Distance covered" / "Consumption Rate");
                                //"Expected Maintenance Cost":=(ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate");
                                //Added the field consumption rate in the formula.
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period"/ResourceCost."Consumption Rate";
                                //"Expected Maintenance Cost":=ResourceCost."Direct Unit Cost"*"Time Period";
                                end;
                            end
                            else
                                Error(Text000);
                        end;
                    end;
                end;
            end;
        }
        field(30; "Actual Delivery"; Decimal)
        {
        }
        field(31; Surrendered; Boolean)
        {
        }
        field(32; Status; Option)
        {
            CalcFormula = lookup("Imprest Memo".Status where("No." = field("Imprest Memo No.")));
            Editable = true;
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(50020; "Vote Item"; Code[20])
        {
            Editable = true;
            TableRelation = "G/L Account"."No.";
        }
        field(50021; "Vote Amount"; Decimal)
        {
            Editable = false;
        }
        field(50022; "Actual to Date"; Decimal)
        {
            Editable = false;
        }
        field(50023; Commitments; Decimal)
        {
            Editable = false;
        }
        field(50024; "Vote Item Desc."; Text[200])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50025; "Available Funds"; Decimal)
        {
            Editable = false;
        }
        field(57000; "Job Task Description"; Text[50])
        {
            Caption = 'Job Task Description';
            Editable = false;
        }
        field(57001; "Consumption Rate"; Decimal)
        {
            FieldClass = Normal;
        }
        field(57002; "Direct Unit Cost"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                //"Direct Unit Cost":=(Entitlement-"Transport Costs")/"Time Period";
                Validate("Currency Code");
            end;
        }
        field(57003; "Actual Maintanance Costs"; Decimal)
        {
        }
        field(57004; "Actual Distance covered"; Decimal)
        {
        }
        field(57005; "Approved days"; Integer)
        {
        }
        field(57006; "G/L Account"; Code[20])
        {
            CalcFormula = lookup("Receipts and Payment Types1"."G/L Account" where(Code = field("Type of Expense"),
                                                                                    "Appear on Imprest?" = filter(true)));
            Editable = true;
            FieldClass = FlowField;
            TableRelation = "G/L Account";

            trigger OnValidate()
            begin
                //"Vote Item":="G/L Account";

            end;
        }
        field(57007; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
            trigger OnValidate()
            begin
                Validate(Entitlement);
            end;
        }
        field(57008; "Type of Expense"; Code[50])
        {
            TableRelation = "Receipts and Payment Types1" where("Appear on Imprest?" = filter(true));

            trigger OnValidate()
            begin
                tExpense.Reset;
                tExpense.SetRange(Code, "Type of Expense");
                if tExpense.FindSet then begin
                    "Vote Item" := tExpense."G/L Account";
                    gEntry.Reset;
                    actualAmount := 0;
                    cSetup.Get;
                    Bcommitments.Reset;
                    gEntry.SetRange("G/L Account No.", tExpense."G/L Account");
                    gEntry.SetFilter(gEntry."Posting Date", '%1..%2', cSetup."Leave Posting Period[FROM]", cSetup."Leave Posting Period[TO]");
                    if gEntry.FindSet then begin
                        repeat
                            actualAmount := actualAmount + Abs(gEntry.Amount);
                        until gEntry.Next = 0;
                    end;

                    "Actual to Date" := actualAmount;

                    //             Bcommitments.SETRANGE("Document Date","Vote Item");
                    //             IF Bcommitments.FINDSET THEN
                    //               BEGIN
                    //              "Vote Amount":=Bcommitments."Created By";
                    //              Bcommitments.CALCFIELDS("No. Series","Posted Dividend Schedule","Creation Date");
                    //              Commitments:=(Bcommitments."No. Series"+Bcommitments."Posted Dividend Schedule"+Bcommitments."Creation Date");
                    //              "Available Funds":="Vote Amount"-actualAmount-(Bcommitments."No. Series"+Bcommitments."Posted Dividend Schedule"+Bcommitments."Creation Date");
                    //              END;
                end;
            end;
        }
        field(57009; "Transport Costs"; Decimal)
        {

            trigger OnValidate()
            begin
                Validate("Total Entitlement");
            end;
        }
        field(57010; "Total Entitlement"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                "Total Entitlement" := Entitlement + "Transport Costs";
            end;
        }
        field(57011; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            begin
                UpdateCommitment();
            end;
        }
        field(57012; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code;
            trigger OnValidate()
            begin
                UpdateCommitment();
            end;
        }
        field(69022; "Currency Factor"; Integer)
        {
        }

        field(69023; Job; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job where(exchequer = const(true));

            trigger OnValidate()
            begin
                if JobRec.Get(Job) then
                    "Job Name" := JobRec.Description;
            end;
        }
        field(69024; "Job  Task"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job),
                                                              "Global Dimension 1 Code" = field("Global Dimension 1 Code"),
                                                             "Job Task Type" = const(Posting));

            trigger OnValidate()
            begin
                TaskRec.Reset;
                TaskRec.SetRange("Job No.", Job);
                TaskRec.SetRange("Job Task No.", "Job  Task");
                if TaskRec.Find('-') then begin
                    repeat
                        TaskRec.CalcFields("Schedule (Total Cost)", "Remaining (Total Cost)", "Usage (Total Cost)", Commitments);
                        "Job Task Name" := TaskRec.Description;
                        "Job Task Budget" := TaskRec."Schedule (Total Cost)";
                        "Job Task Remaining Amount" := TaskRec."Schedule (Total Cost)" - (TaskRec."Usage (Total Cost)" - TaskRec.Commitments) - "Total Entitlement";
                    until TaskRec.Next = 0;
                end;
                if ("Total Entitlement" > "Job Task Remaining Amount") then
                    Error('Applied imprest Memo of Amount (%1) is more than Available Amount (%2)', "Total Entitlement", "Job Task Remaining Amount");
            end;
        }
        field(69025; "Job Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(69026; "Job Task Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(69027; "Job Task Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69028; "Job Task Remaining Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; "Return Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70021; "Imprest Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70022; "Constituency Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code;
        }
        field(70023; Region; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code;
        }
        field(70024; "Use Own Vehicle"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70025; "Own Vehicle  Milleage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70026; "Age Of Own Vehicle(M)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70027; "Own Vehicle Fuel Capacity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70028; "Fuel Consumption Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70029; From; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70030; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70031; "Local Travel"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70032; "International Travel"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(70040; "Advance Type"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Receipts and Payment Types1".Code where(Type = filter(Payment));

            trigger OnValidate()
            var
                AdvanceTypes: Record "Receipts and Payment Types1";
            begin
                if AdvanceTypes.Get("Advance Type") then begin
                    AdvanceTypes.TestField("G/L Account");
                    "Vote Item" := AdvanceTypes."G/L Account";
                    "Type of Expense" := AdvanceTypes."G/L Account";
                    Rec.Validate("Type of Expense");
                    UpdateCommitment();
                end;

            end;
        }
        field(70041; "Imprest No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70042; "Committed Amount"; Decimal)
        {
            Editable = false;
        }
        field(70043; "Budgeted Amount"; Decimal)
        {
            Editable = false;
        }
        field(70044; "Available Amount"; Decimal)
        {
            Editable = false;
        }
        field(70045; "Account Actual Spent"; Decimal)
        {
            Editable = false;
            Caption = 'Actual Spent';
        }
        field(70046; "Entitlement (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Imprest Memo No.", "No.", "Work Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ImprestMemo.Reset;
        ImprestMemo.SetRange("No.", "Imprest Memo No.");
        if ImprestMemo.FindSet then begin
            "Local Travel" := ImprestMemo."Local Travel";
            "International Travel" := ImprestMemo."International Travel";

        end;
        if "No." <> '' then
            Validate("Time Period");
    end;

    var
        ProjectTeam: Record "Project Members";
        ImprestMemo: Record "Imprest Memo";
        ResourceRec: Record Resource;
        
        EmployeeRec: Record Employee;
        CustRec: Record Customer;
        WTRec: Record "Work Type";
        ResourceCost: Record "Resource Cost";
        Text000: label 'Kindly setup resource costs';
        TaskRec: Record "Job Task";
        Text001: label 'The staff No. %1 you selected has an outstanding imprest Amounting to Kshs.   %2 that is greater than the credit limit set for the staff by Ksh. %3. You can only have a team with balance less than the set Credit limit.';
        Localcurr: BigInteger;
        currency: Record Currency;
        tExpense: Record "Receipts and Payment Types1";
        fAsset: Record "Fixed Asset";
        Bcommitments: Record "Budget Commitment";
        cSetup: Record "Human Resources Setup";
        gEntry: Record "G/L Entry";
        actualAmount: Decimal;
        Constituencies: Page Constituencies;
        County: Record County1;
        ProjectMembers: Record "Project Members";
        JobRec: Record Job;

        CurrExchRate: Record "Currency Exchange Rate";

    Local Procedure UpdateCommitment()
    var
        CustomFunction: Codeunit "Custom Function";
        ImprestMemo: Record "Imprest Memo";
    begin
        CalcFields("G/L Account");
        ImprestMemo.Reset();
        ImprestMemo.SetRange("No.", "Imprest Memo No.");
        if ImprestMemo.findfirst() then begin
            "Budgeted Amount" := CustomFunction.GetBudgtedAmount("G/L Account", ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code",ImprestMemo."Department Code");
            "Account Actual Spent" := CustomFunction.GetActualSpent("G/L Account", ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code",ImprestMemo."Department Code");
            "Committed Amount" := CustomFunction.GetCommittedAmount("G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code", ImprestMemo."Department Code");
            "Available Amount" := "Budgeted Amount" - ("Account Actual Spent" + "Committed Amount");
        end;
    end;
}

