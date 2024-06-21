#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50022 "pageextension50022" extends "Purchase List" 
{
    layout
    {
        addafter("No.")
        {
            field(Description;Description)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Ship-to Code")
        {
            field("Amount Including VAT";"Amount Including VAT")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

