pageextension 50151 "Vendor Lookup Ext" extends "Vendor Lookup"
{
    trigger OnOpenPage()
    begin
        Rec.SetRange(Blocked,Rec.Blocked::" ");
    end;
}
