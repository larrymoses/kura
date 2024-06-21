#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50032 "pageextension50032" extends "G/L Budget Entries"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""G/L Budget Entries"(Page 120)".

    layout
    {
        addafter("Global Dimension 2 Code")
        {
            field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
            {
                ApplicationArea = Basic;
                Caption = 'Directorates';
            }
            field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
            {
                ApplicationArea = Basic;
                Caption = 'Division/Section';
            }
            field("Project Code"; "Project Code")
            {
                ApplicationArea = Basic;
            }
            field("KeRRA Budget Code"; "KeRRA Budget Code")
            {
                ApplicationArea = Basic;
                Caption = 'KURA Budget Code';
            }
            field("Project Type"; "Project Type")
            {
                ApplicationArea = Basic;
            }
            field("Works Type"; "Works Type")
            {
                ApplicationArea = Basic;
            }
            field("Original Budget"; "Original Budget")
            {
                ApplicationArea = Basic;
            }
            field("Budget Type 1"; "Budget Type 1")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Description)
        {
            field("Key Input"; '')
            {
                ApplicationArea = Basic;
                Caption = 'Key Output';
            }
        }
        addafter("Entry No.")
        {
            field("Budget Type"; "Budget Type")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

