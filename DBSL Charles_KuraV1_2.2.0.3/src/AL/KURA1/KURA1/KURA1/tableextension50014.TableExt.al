#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50014 "tableextension50014" extends "Invoice Post. Buffer" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Job No."(Field 6)".

        field(70000;"Procurement Plan";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Header".No;
        }
        field(70001;"Procurement Plan Item";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan1"."Plan Item No" where ("Plan Year"=field("Procurement Plan"));

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
        field(70002;"Responsibility Center";Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
    }


    //Unsupported feature: Code Modification on "PreparePurchase(PROCEDURE 6)".

    //procedure PreparePurchase();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(Rec);
        Type := PurchLine.Type;
        "System-Created Entry" := TRUE;
        #4..11
        "Job No." := PurchLine."Job No.";
        "VAT %" := PurchLine."VAT %";
        "VAT Difference" := PurchLine."VAT Difference";
        IF Type = Type::"Fixed Asset" THEN BEGIN
          "FA Posting Date" := PurchLine."FA Posting Date";
          "Depreciation Book Code" := PurchLine."Depreciation Book Code";
        #18..39
        END;

        OnAfterInvPostBufferPreparePurchase(PurchLine,Rec);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..14
        //added by daudi
        "Procurement Plan":=PurchLine."Procurement Plan";
        "Procurement Plan Item":=PurchLine."Procurement Plan Item";
        "Responsibility Center":=PurchLine."Responsibility Center";

        #15..42
        */
    //end;
}

