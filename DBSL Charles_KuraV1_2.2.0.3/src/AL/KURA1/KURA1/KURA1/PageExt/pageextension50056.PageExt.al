#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50056 "pageextension50056" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Posted Prepmt. Cr. Memo Nos.")
        {
            field("ICT Helpdesk Nos."; "ICT Helpdesk Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Delegation Nos"; Rec."Delegation Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Delegation Nos field.';
            }
        }
        addafter("Direct Debit Mandate Nos.")
        {
            field("Disposal No."; "Disposal No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

