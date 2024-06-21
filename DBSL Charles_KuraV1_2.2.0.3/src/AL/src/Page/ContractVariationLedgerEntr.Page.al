#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72478 "Contract Variation Ledger Entr"
{
    ApplicationArea = Basic;
    Caption = 'Contract Variation Ledger Entries';
    CardPageID = "Contract Variation Ledger";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Contract Variation Ledger";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Source Document Type";"Source Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Source Document No.";"Source Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Original Quantity";"Original Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Original Total Cost (LCY)";"Original Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                }
                field("New Quantity";"New Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("New Total Cost (LCY)";"New Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Net Change (Quantity)";"Net Change (Quantity)")
                {
                    ApplicationArea = Basic;
                }
                field("Net Change (Total Cost LCY)";"Net Change (Total Cost LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Category Code";"Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID";"Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No.";"Contractor No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
