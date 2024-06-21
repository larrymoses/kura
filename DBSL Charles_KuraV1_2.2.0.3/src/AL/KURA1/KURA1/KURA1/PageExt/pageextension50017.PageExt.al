#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50017 "pageextension50017" extends "Sales Invoice Subform"
{
    layout
    {
        modify("Job No.")
        {
            Editable = true;
        }
        modify("Job Task No.")
        {
            Editable = true;
        }
        addafter("FA Posting Date")
        {
            field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            {
                ApplicationArea = Basic;
            }
        }

        MODIFY("Gen. Prod. Posting Group")
        {
            VISIBLE = TRUE;
        }
    }
}


