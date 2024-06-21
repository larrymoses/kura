#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50075 "tableextension50075" extends "Detailed Vendor Ledg. Entry" 
{
    fields
    {
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
        field(70003;"Project No";Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(70004;"Contractor No";Code[40])
        {
            DataClassification = ToBeClassified;
        }
         field(70005;"Earning Code"; Code[20])
        {
          
        }
    }
}

