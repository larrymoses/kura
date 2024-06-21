#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50021 "tableextension50021" extends "G/L Budget Entry"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Budget Dimension 1 Code"(Field 12)".


        //Unsupported feature: Property Modification (Data type) on ""Budget Dimension 2 Code"(Field 13)".


        //Unsupported feature: Property Modification (Data type) on ""Budget Dimension 3 Code"(Field 14)".


        //Unsupported feature: Property Modification (Data type) on ""Budget Dimension 4 Code"(Field 15)".

        field(50000; "Budget Dimension 5 Code"; Code[40])
        {

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 5 Code" <> xRec."Budget Dimension 5 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 5 Code",12,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY;
                  UpdateBudgetDim("Budget Dimension 5 Code",4);
                END;
                */

            end;
        }
        field(50001; "Budget Dimension 6 Code"; Code[40])
        {
            Caption = 'Budget Dimension 4 Code';
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 6 Code" <> xRec."Budget Dimension 6 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 6 Code",12,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY;
                  UpdateBudgetDim("Budget Dimension 6 Code",5);
                END;
                */

            end;
        }
        field(50002; "Transferred from Item Budget"; Boolean)
        {
            
            Description = 'Added';
        }
        field(50003; WorkplanCode; Code[20])
        {
            
            Description = 'Added';
        }
        field(50004; Votehead; Code[20])
        {
            
            TableRelation = Voteheads.Code;

            trigger OnValidate()
            begin
                VoteheadRec.Reset;
                VoteheadRec.SetRange(Code, Votehead);
                if VoteheadRec.Find('-') then begin
                    VoteheadRec.TestField("G/L Account");
                    "G/L Account No." := VoteheadRec."G/L Account";
                end;
            end;
        }
        field(50005; "Budgeted Amount"; Decimal)
        {
            

            trigger OnValidate()
            begin
                Amount := "Budgeted Amount";
            end;
        }
        field(50006; Quantity; Decimal)
        {
            

            trigger OnValidate()
            begin
                "Budgeted Amount" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");

                "Revised Estimate" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");

                "Budgeted Amount" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");

                "Revised Estimate" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");
            end;
        }
        field(50007; "Unit Price"; Decimal)
        {
            

            trigger OnValidate()
            begin
                "Budgeted Amount" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");
            end;
        }
        field(50008; "Revised Estimate"; Decimal)
        {
            

            trigger OnValidate()
            begin
                Amount := "Budgeted Amount";
            end;
        }
        field(50009; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(50010; "Revised 2"; Decimal)
        {
            
        }
        field(50011; "Amount 2"; Decimal)
        {
            
        }
        field(50012; "Budgeted 2"; Decimal)
        {
            
        }
        field(50013; "Global Dimension 1"; Text[50])
        {
            
        }
        field(50014; "Global Dimension 2"; Text[50])
        {
            
        }
        field(50015; "Budget Dimension 1"; Text[50])
        {
            
        }
        field(50016; "Budget Dimension 2"; Text[50])
        {
            
        }
        field(50017; "Budget Dimension 3"; Text[50])
        {
            
        }
        field(50018; "Budget Dimension 4"; Text[50])
        {
            
        }
        field(50019; "Sub Ledger Type"; Option)
        {
            
            OptionCaption = ',Customer,Vendor';
            OptionMembers = ,Customer,Vendor;
        }
        field(50020; "SL Code"; Code[20])
        {
            
            TableRelation = if ("Sub Ledger Type" = const(Customer)) Customer
            else
            if ("Sub Ledger Type" = const(Vendor)) Vendor;
        }
        field(50021; "Budget Type"; Option)
        {
            
            OptionCaption = 'Approved,Revised,Suplimentary';
            OptionMembers = Approved,Revised,Suplimentary;
        }
        field(50022; Status; Option)
        {
            
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(50023; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Sub Department Code';
            
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(50024; "Shortcut Dimension 4 Code"; Code[20])
        {
            Caption = 'Project Code';
            
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(50025; "Project Code"; Code[20])
        {
            
        }
        field(50026; "KeRRA Budget Code"; Code[20])
        {
            
            Description = 'KURA Budget Code';
        }
        field(50027; "Project Type"; Option)
        {
            
            OptionCaption = ' ,Road Work Plan,Global Budget Book,Multi-Year Programs,New Job Voucher';
            OptionMembers = " ","Road Work Plan","Global Budget Book","Multi-Year Programs","New Job Voucher";
        }
        field(50028; "Works Type"; Option)
        {
            
            OptionCaption = ' ,Maintenance,Road Construction,Survey/Study,Structure Construction';
            OptionMembers = " ",Maintenance,"Road Construction","Survey/Study","Structure Construction";
        }
        field(50029; "Original Budget"; Code[30])
        {
            
        }
        field(50030; "Budget Type 1"; Option)
        {
            
            OptionCaption = 'Original,Supplementary 1,Supplementary 2,Supplimentary 3, Supplementary 4';
            OptionMembers = Original,"Supplementary 1","Supplementary 2","Supplimentary 3"," Supplementary 4";
        }
        field(50031; "Key Input"; Text[30])
        {
            

        }
        field(50032; Works; Boolean)
        {
            
        }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckIfBlocked;
    DeleteAnalysisViewBudgetEntries;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
     CheckIfBlocked;
    // bCommitment.RESET;
    // bCommitment.SETRANGE("Budget Name","Budget Name");
    // bCommitment.SETRANGE(bCommitment."Account No.","G/L Account No.");
    // bCommitment.SETRANGE("Entry No.","Entry No.");
    //    IF bCommitment.FINDSET THEN
    //      BEGIN
    //      bCommitment.CALCFIELDS("Commited Amount Imprest","Commited Amount Orders","Commited Amount PRN");
    //      totalCommitments:=(bCommitment."Commited Amount Imprest"+bCommitment."Commited Amount Orders"+bCommitment."Commited Amount PRN");
    //      IF totalCommitments<>0 THEN
    //          ERROR(Text57021,totalCommitments)
    //      ELSE
    //          bCommitment.DELETE;
    //      END;

     DeleteAnalysisViewBudgetEntries;
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckIfBlocked;
    TESTFIELD(Date);
    TESTFIELD("G/L Account No.");
    #4..17
    UpdateDimSet(TempDimSetEntry,GLBudgetName."Budget Dimension 4 Code","Budget Dimension 4 Code");
    OnInsertOnAfterUpdateDimSets(TempDimSetEntry,Rec);
    VALIDATE("Dimension Set ID",DimMgt.GetDimensionSetID(TempDimSetEntry));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..20

     //Budget Commitment entries added by David 25-01-2018
    //    bCommitment.RESET;
    //    bCommitment."Entry No.":="Entry No.";
    //    bCommitment."Account No.":="G/L Account No.";
    //    bCommitment."Budget Name":="Budget Name";
    //    VALIDATE(Amount);
    //    bCommitment."Budgeted Amount":=Amount;
    //    bCommitment."Account Name":=Description;
    //    bCommitment."Budget Start Date":=Date;
    //    bCommitment.INSERT;
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckIfBlocked;
    "User ID" := USERID;
    "Last Date Modified" := TODAY;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // CheckIfBlocked;
    // "User ID" := USERID;
    // "Last Date Modified" := TODAY;
    // bCommitment.SETRANGE(bCommitment."Account No.","G/L Account No.");
    // bCommitment.SETRANGE("Entry No.","Entry No.");
    //    IF bCommitment.FINDSET THEN
    //      BEGIN
    //         VALIDATE(Amount);
    //         bCommitment."Budgeted Amount":=Amount;
    //         bCommitment."Account Name":=Description;
    //         bCommitment.MODIFY;
    //        END;
    */
    //end;

    var
        bCommitment: Record "Budget Commitment";
        totalCommitments: Decimal;
        Text57021: label 'The budget line has commited entries and thefore cannot be deleted.';

    var
        VoteheadRec: Record Voteheads;
}

