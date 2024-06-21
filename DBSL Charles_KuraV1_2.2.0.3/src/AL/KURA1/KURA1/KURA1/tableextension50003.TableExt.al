#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50003 "tableextension50003" extends "G/L Entry"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 7)".


        //Unsupported feature: Property Modification (Data type) on ""Job No."(Field 41)".

        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(50000; "Vendor Name"; Text[100])
        {
            CalcFormula = lookup(Vendor.Name where("No." = field("Source No.")));
            FieldClass = FlowField;
        }
        field(50008; "Broker/Agency Code"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(50009; "Broker/Agency Name"; Text[50])
        {
        }
        field(50010; "Sales Rep. No."; Code[20])
        {
        }
        field(50011; "Sales Rep. Name"; Text[50])
        {
        }
        field(50012; "First Premium"; Decimal)
        {
        }
        field(50013; "PCF  Levy"; Decimal)
        {
        }
        field(50014; "Training Levy"; Decimal)
        {
        }
        field(50015; "Stamp Duty"; Decimal)
        {
        }
        field(50016; "Yellow Card"; Decimal)
        {
        }
        field(50017; "R/I Code"; Option)
        {
            OptionMembers = "1","2","3","4","5","6";
        }
        field(50018; "Period Start"; Date)
        {
        }
        field(50019; "Period End"; Date)
        {
        }
        field(50020; "Percentage Of Share"; Decimal)
        {
        }
        field(50021; "Total Renewable Premium"; Decimal)
        {
        }
        field(50022; "Share Of Risk (%)"; Decimal)
        {
        }
        field(50023; "Endorsement No."; Code[20])
        {
        }
        field(50024; "Commission Rate"; Decimal)
        {
        }
        field(50025; "Commission Amount"; Decimal)
        {
        }
        field(50026; "Net Premium"; Decimal)
        {
        }
        field(50027; "Business Source"; Option)
        {
            OptionCaption = ' ,Direct,Facultative';
            OptionMembers = " ","1","2";
        }
        field(50028; "Business Line"; Option)
        {
            OptionCaption = ' ,COM,COM-MOU,PLS,PLS-MOU';
            OptionMembers = " ","1","2","3","4";
        }
        field(50029; "Business Class"; Code[10])
        {
        }
        field(50030; Department; Code[20])
        {
        }
        field(50031; "Investment Code"; Code[20])
        {
            TableRelation = "Investment Asset";
        }
        field(50032; "No. Of Units"; Decimal)
        {

            trigger OnValidate()
            begin
                /* IF "Receipt Payment Type"="Receipt Payment Type"::"Unit Trust" THEN BEGIN
                 IF Brokers.GET("Unit Trust Member No") THEN BEGIN
                
                 Brokers.CALCFIELDS("No.Of Units","Acquisition Cost","Current Value",Revaluations);
                 IF "No. Of Units">Brokers."No.Of Units" THEN
                  ERROR('You cannot redeem more units than you have!!');
                
                
                   IF  Brokers."No.Of Units" >0 THEN
                // "Current unit price":=Brokers."Current Value"/Brokers."No.Of Units" ;
                 //"Price Per Share":="Current unit price";
                VALIDATE("Price Per Share");
                VALIDATE(Amount);
                  END;
                
                 END ELSE BEGIN
                  IF "No. Of Units"<0 THEN
                  ERROR('You Cannot Sale Negative No. of Shares!!');
                
                   VALIDATE(Amount);
                 END;*/

            end;
        }
        field(50033; "Investment Transcation Type"; Option)
        {
            OptionCaption = ' ,Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,Share-split,Premium,Discounts,Other Income,Expenses,Contribution,Withdrawal';
            OptionMembers = "  ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,Contribution,Withdrawal;
        }
        field(50034; "Original Currency"; Code[20])
        {
            TableRelation = Currency;
        }
        field(50035; "Original Currency Amount"; Decimal)
        {
        }
        field(50036; "AC Type"; Option)
        {
            OptionMembers = "Income Statement","Balance Sheet";
        }
        field(50037; "GL Type"; Option)
        {
            OptionCaption = ' ,Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,Share-split,Premium,Discounts,Other Income,Expenses,Loan Repayment';
            OptionMembers = " ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,"Loan Repayment",Subsidy;
        }
        field(50038; "UT Member No"; Code[20])
        {
        }
        field(50039; "Unit Trust Type"; Option)
        {
            OptionCaption = ',Equity,Money Market,Growth';
            OptionMembers = ,Equity,"Money Market",Growth;
        }
        field(50040; "Books Closure Date"; Date)
        {
        }
        field(50041; "Payment Date"; Date)
        {
        }
        field(50042; "Fund Code"; Code[20])
        {
            TableRelation = "Fund Code".Code;
        }
        field(50043; "Custodian Code"; Code[20])
        {
            TableRelation = "Custodian Code".Code;
        }
        field(50044; "Cheque No"; Integer)
        {
        }
        field(70000; "Procurement Plan"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Header".No;
        }
        field(70001; "Procurement Plan Item"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan1"."Plan Item No" where("Plan Year" = field("Procurement Plan"));

            trigger OnValidate()
            begin

                /* ProcurementPlan.RESET;
                ProcurementPlan.SETRANGE(ProcurementPlan."Plan Item No","Procurement Plan Item");
               IF ProcurementPlan.FIND('-') THEN BEGIN
               IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN BEGIN
                 Type:=Type::Item;
                 No:=ProcurementPlan."No.";
               END;
               IF ProcurementPlan."Procurement Type"<>ProcurementPlan."Procurement Type"::Service THEN BEGIN
                Type:=Type::"Non Stock";
                No:=ProcurementPlan."Source of Funds";
               END;
                 "Budget Line":=ProcurementPlan."Source of Funds";
                  Description:=ProcurementPlan."Item Description";
                 "Unit of Measure":=ProcurementPlan."Unit of Measure";
                 "Unit Price":=ProcurementPlan."Unit Price";
               END;
              */

            end;
        }
        field(70002; "Project No"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(70003; Retention; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70004; "Advance Payment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70005; "Earning Code"; Code[20])
        {

        }
    }


    //Unsupported feature: Code Modification on "CopyFromGenJnlLine(PROCEDURE 4)".

    //procedure CopyFromGenJnlLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Posting Date" := GenJnlLine."Posting Date";
    "Document Date" := GenJnlLine."Document Date";
    "Document Type" := GenJnlLine."Document Type";
    #4..33
    "No. Series" := GenJnlLine."Posting No. Series";
    "IC Partner Code" := GenJnlLine."IC Partner Code";

    OnAfterCopyGLEntryFromGenJnlLine(Rec,GenJnlLine);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..36
    //added for procurement plan
    "Procurement Plan":=GenJnlLine."Procurement Plan";
    "Procurement Plan Item":=GenJnlLine."Procurement Plan Item";


    OnAfterCopyGLEntryFromGenJnlLine(Rec,GenJnlLine);
    */
    //end;
}

