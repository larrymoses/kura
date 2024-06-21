#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50145 "tableextension50145" extends "Warehouse Receipt Header" 
{
    fields
    {
        field(51000;"Inspection Completed?";Boolean)
        {
            CalcFormula = -exist("Goods & Services Inspection" where ("No."=field("No."),
                                                                      Decision=filter(" "|Rejected),
                                                                      "Vendor Shipment No."=field("Vendor Shipment No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(51001;"Source No.";Code[20])
        {
            CalcFormula = lookup("Warehouse Receipt Line"."Source No." where ("No."=field("No.")));
            Caption = 'Source No.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(51002;"Source Document";Option)
        {
            CalcFormula = lookup("Warehouse Receipt Line"."Source Document" where ("No."=field("No.")));
            Caption = 'Source Document';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = ',Sales Order,,,Sales Return Order,Purchase Order,,,Purchase Return Order,Inbound Transfer';
            OptionMembers = ,"Sales Order",,,"Sales Return Order","Purchase Order",,,"Purchase Return Order","Inbound Transfer";
        }
        field(51003;"Inspection Team Setup?";Boolean)
        {
            CalcFormula = exist("Goods & Services Inspection" where ("No."=field("No."),
                                                                     "Vendor Shipment No."=field("Vendor Shipment No.")));
            Editable = false;
            FieldClass = FlowField;
        }
    }
}

