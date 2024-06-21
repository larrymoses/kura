#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72284 "Measurement & Payment Entries"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "Measurement & Payment Entry";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Job No."; "Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No."; "Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                }
                field("Measurement Type"; "Measurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Linear/Unit Quantity"; "Linear/Unit Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Length (m)"; "Length (m)")
                {
                    ApplicationArea = Basic;
                }
                field("Width (m)"; "Width (m)")
                {
                    ApplicationArea = Basic;
                }
                field("Height/Depth (m)"; "Height/Depth (m)")
                {
                    ApplicationArea = Basic;
                }
                field("Measured Quantity"; "Measured Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Quantity"; "Contract Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Direct Unit Cost (LCY)"; "Direct Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost (LCY)"; "Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Cost (LCY)"; "Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Technology Type"; "Technology Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Category Code"; "Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                }
                field("Works Start Chainage"; "Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage"; "Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; "Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; "Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(Reversed; Reversed)
                {
                    ApplicationArea = Basic;
                }
                field("Reversed By"; "Reversed By")
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

