/// <summary>
/// TableExtension Purch Header Arch Ext (ID 50154) extends Record Purchase Header Archive.
/// </summary>
tableextension 50154 "Purch Header Arch Ext" extends "Purchase Header Archive"
{
    fields
    {
        field(50011; Description; Text[250])
        {
        }
        field(50018; "Request-By Name"; Text[50])
        {
        }
        field(50019; "Requester ID"; Code[50])
        {
        }
        field(70047; "Procurement Plan Entry No"; Integer)
        {
        }
        field(70046; "Procurement Plan ID"; Code[10])
        {
        }
        field(70048; "PP Planning Category"; Code[20])
        {
            TableRelation = "Procurement Plan Entry"."Planning Category";
        }
        field(70049; "PP Funding Source ID"; Code[20])
        {
        }
        field(70050; "PP Total Budget"; Decimal)
        {
        }
        field(70053; "PP Total Available Budget"; Decimal)
        {
        }
        field(70052; "PP Total Commitments"; Decimal)
        {
        }
        field(70058; "Ordered PRN"; Boolean)
        {
        }
        field(70063; "Total PRN Amount"; Decimal)
        {
            CalcFormula = sum("Purchase Line Archive"."Amount" where("Document Type" = field("Document Type"),
                                                                            "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70064; "Total PRN Amount (LCY)"; Decimal)
        {
            CalcFormula = sum("Purchase Line Archive"."Amount Including VAT" where("Document Type" = field("Document Type"),
                                                                            "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8603719; PRN; Code[20])
        {
        }
    }
}
