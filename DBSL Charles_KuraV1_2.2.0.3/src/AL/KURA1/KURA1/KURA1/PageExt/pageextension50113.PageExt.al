#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50113 "pageextension50113" extends "Warehouse Receipts" 
{
    layout
    {
        addafter("Assignment Date")
        {
            field("Inspection Completed?";"Inspection Completed?")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

