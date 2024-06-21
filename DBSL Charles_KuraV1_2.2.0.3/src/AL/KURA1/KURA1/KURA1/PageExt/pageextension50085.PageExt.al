#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50085 "pageextension50085" extends "Opportunity Card" 
{
    layout
    {
        modify("Salesperson Code")
        {
            Caption = 'PI Code';
        }

        //Unsupported feature: Property Insertion (Visible) on ""Sales Document Type"(Control 40)".


        //Unsupported feature: Property Insertion (Visible) on ""Sales Document No."(Control 30)".

        modify("Sales Cycle Code")
        {
            Caption = 'Grants Cycle Code';
        }
    }
}

