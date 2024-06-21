#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72200 "Consolidated WP Planning Lines"
{
    PageType = List;
    SourceTable = "New Road Work Program Activity";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Work Program ID";"Road Work Program ID")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Entry No";"Budget Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("BoQ Template Code";"BoQ Template Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Category Code";"Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Code";"Activity Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Technology Type";"Technology Type")
                {
                    ApplicationArea = Basic;
                }
                field("Labour %";"Labour %")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Rate (Unit Cost)";"Planned Rate (Unit Cost)")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Quantity";"Planned Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Contingency %";"Contingency %")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer's Rate (Unit Cost)";"Engineer's Rate (Unit Cost)")
                {
                    ApplicationArea = Basic;
                }
                field("Packaged Quantity";"Packaged Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Line Amount Excl. VAT";"Line Amount Excl. VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT %";"VAT %")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Amount";"VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Line Amount Incl. VAT";"Line Amount Incl. VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Variant Code";"Variant Code")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Default Job Task No.";"Default Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted Job No.";"Posted Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Job Task No.";"Posted Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Job Planning Line No.";"Posted Job Planning Line No.")
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

