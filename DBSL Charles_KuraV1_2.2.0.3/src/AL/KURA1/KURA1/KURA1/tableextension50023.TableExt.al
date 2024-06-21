#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50023 "tableextension50023" extends "Purch. Rcpt. Line"
{
    fields
    {
        modify("Job Task No.")
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting), "Global Dimension 1 Code" = field("Shortcut Dimension 1 Code"),
                                                                     "Job No." = field("Job No."));
        }

        field(50000; "Quantity Received"; Integer)
        {
        }
    }
}

