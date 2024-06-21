#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50014 "pageextension50014" extends "General Journal"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Modification (Visible) on ""Account Type"(Control 8)".


        //Unsupported feature: Property Insertion (Description) on ""Gen. Posting Type"(Control 14)".


        //Unsupported feature: Property Insertion (Description) on ""Gen. Bus. Posting Group"(Control 77)".


        //Unsupported feature: Property Insertion (Description) on ""Gen. Prod. Posting Group"(Control 16)".


        //Unsupported feature: Property Modification (Visible) on "Amount(Control 18)".


        //Unsupported feature: Property Modification (Visible) on ""Amount (LCY)"(Control 113)".


        //Unsupported feature: Property Modification (Visible) on ""Bal. Account Type"(Control 53)".


        //Unsupported feature: Property Modification (Visible) on ""Bal. Account No."(Control 55)".


        //Unsupported feature: Property Modification (Visible) on "Correction(Control 114)".


        //Unsupported feature: Property Deletion (Visible) on ""Document No."(Control 6)".


        //Unsupported feature: Property Deletion (Visible) on ""Gen. Posting Type"(Control 14)".


        //Unsupported feature: Property Deletion (Visible) on ""Gen. Bus. Posting Group"(Control 77)".


        //Unsupported feature: Property Deletion (Visible) on ""Gen. Prod. Posting Group"(Control 16)".


        //Unsupported feature: Property Deletion (Visible) on ""VAT Bus. Posting Group"(Control 41)".


        //Unsupported feature: Property Deletion (Visible) on ""VAT Prod. Posting Group"(Control 85)".


        //Unsupported feature: Property Deletion (Visible) on ""Shortcut Dimension 1 Code"(Control 136)".


        //Unsupported feature: Property Deletion (Visible) on ""Shortcut Dimension 2 Code"(Control 135)".

        addfirst(Control1)
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Posting Date")
        {
            field("Posting Group"; Rec."Posting Group")
            {
                ApplicationArea = Basic;
                Editable = true;
            }
        }
        addafter("Document No.")
        {
            field("FA Posting Type"; Rec."FA Posting Type")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Account No.")
        {
            field("Job Quantity"; Rec."Job Quantity")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(AccountName)
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = Basic;
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Description)
        {
            field("Project No"; Rec."Project No")
            {
                ApplicationArea = Basic;
            }
            field("Contractor No"; Rec."Contractor No")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Business Unit Code")
        {
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = Basic;
            }
            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
            {
                ApplicationArea = Basic;
            }
            field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
            {
                ApplicationArea = Basic;
            }

        }

    }

}

#pragma implicitwith restore

