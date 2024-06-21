#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50103 "tableextension50103" extends "Industry Group" 
{
    fields
    {
        field(4;"No. of Vendors";Integer)
        {
            CalcFormula = count(Vendor where ("Industry Group"=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
    }
}

