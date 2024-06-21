#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50037 "pageextension50037" extends "Posted Purch. Invoice Subform" 
{
    layout
    {
        addafter("Line Discount Amount")
        {
            field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
            {
                ApplicationArea = Basic;
            }
            field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

