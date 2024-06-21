#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50023 "pageextension50023" extends "Purchase Order Subform"
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on ""Reserved Quantity"(Control 42)".


        //Unsupported feature: Property Modification (Name) on ""Reserved Quantity"(Control 42)".

        modify("Job Remaining Qty.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Job Remaining Qty."(Control 9)".


            //Unsupported feature: Property Modification (Name) on ""Job Remaining Qty."(Control 9)".

            Editable = true;
        }
        modify("Qty. to Receive")
        {
            Editable = true;
        }
        modify(Quantity)
        {
            Editable = true;
        }
        modify("Direct Unit Cost")
        {
            Editable = true;
        }
        modify("Qty. to Invoice")
        {
            Editable = true;
        }
        modify("VAT Prod. Posting Group")
        {
            visible = true;
        }

        //Unsupported feature: Property Modification (Visible) on ""Job No."(Control 126)".


        //Unsupported feature: Property Modification (Visible) on ""Job Task No."(Control 128)".


        //Unsupported feature: Property Deletion (Visible) on ""VAT Prod. Posting Group"(Control 14)".


        //Unsupported feature: Property Deletion (BlankZero) on ""Reserved Quantity"(Control 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Remaining Qty."(Control 9)".


        //Unsupported feature: Property Deletion (BlankZero) on ""Job Remaining Qty."(Control 9)".


        //Unsupported feature: Property Deletion (Visible) on ""Job Remaining Qty."(Control 9)".

        addafter("No.")
        {

            field("Maintenance Code"; Rec."Maintenance Code")

            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("FA Posting Type"; Rec."FA Posting Type")
            {
                ApplicationArea = Basic;
            }
            field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = Basic;
            }
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Job Remaining Qty.")
        {
            // field("Procurement Plan";"Procurement Plan")
            // {
            //     ApplicationArea = Basic;
            //     Visible = false;
            // }
            // field("Procurement Plan Item";"Procurement Plan Item")
            // {
            //     ApplicationArea = Basic;
            //     Visible = false;
            // }
            // field("Procurement Plan ID";"Procurement Plan ID")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Procurement Plan Entry No";"Procurement Plan Entry No")
            // {
            //     ApplicationArea = Basic;
            // }
        }
        addafter("Line No.")
        {
            field("Depreciation Book Code"; Rec."Depreciation Book Code")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter(Quantity; "Unit of Measure Code")
        moveafter("Unit Price (LCY)"; "Line Amount")
        moveafter("Line Amount"; "Job Remaining Qty.")
    }
}

#pragma implicitwith restore

