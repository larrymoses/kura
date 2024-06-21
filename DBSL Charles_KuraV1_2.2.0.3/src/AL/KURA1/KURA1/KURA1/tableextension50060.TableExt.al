#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50060 "tableextension50060" extends "Inventory Setup" 
{
    fields
    {
        field(50003;"Item Jnl Template";Code[10])
        {
            TableRelation = "Item Journal Template";
        }
        field(50004;"Item Jnl Batch";Code[10])
        {
            TableRelation = "Item Journal Batch".Name;
        }
    }
}

