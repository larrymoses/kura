#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50109 "pageextension50109" extends "Warehouse Receipt" 
{
    layout
    {
        addafter("Sorting Method")
        {
            field("Source Document";"Source Document")
            {
                ApplicationArea = Basic;
            }
            field("Source No.";"Source No.")
            {
                ApplicationArea = Basic;
            }
            field("Inspection Team Setup?";"Inspection Team Setup?")
            {
                ApplicationArea = Basic;
            }
            field("Inspection Completed?";"Inspection Completed?")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

