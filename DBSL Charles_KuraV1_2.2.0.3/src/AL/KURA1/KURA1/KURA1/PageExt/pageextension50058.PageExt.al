#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50058 "pageextension50058" extends "Jobs Setup"
{
    layout
    {
        addafter("Job WIP Nos.")
        {
            field("Budget Plan Nos"; Rec."Budget Plan Nos")
            {
                ApplicationArea = Basic;
            }
            field("Billable Nos"; Rec."Billable Nos")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

