#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50135 "tableextension50135" extends "Item Category" 
{
    fields
    {
        field(70000;"Bill Item Group";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(72000;"Default Job Task No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(72001;"No Of Bill Items";Integer)
        {
            CalcFormula = count(Item where ("Item Category Code"=field(Code)));
            FieldClass = FlowField;
        }
        field(72002;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}

