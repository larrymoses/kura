#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50024 "tableextension50024" extends "Purch. Inv. Header" 
{
    fields
    {
        field(50001;"Debit Note";Boolean)
        {
        }
        field(70185;"Advance Recovery %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70186;"Retention %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70187;Discounted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70212;"Contractor Request No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Measurement &  Payment Header"."Document No." where ("Document Type"=filter("Contractor Payment Request"));
        }
        field(70213;"Project ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70214;"Certificate No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8603719; PRN; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}

