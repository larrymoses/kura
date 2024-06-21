#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50070 "tableextension50070" extends "Analysis View Entry"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Dimension 1 Value Code"(Field 4)".


        //Unsupported feature: Property Modification (Data type) on ""Dimension 2 Value Code"(Field 5)".


        //Unsupported feature: Property Modification (Data type) on ""Dimension 3 Value Code"(Field 6)".


        //Unsupported feature: Property Modification (Data type) on ""Dimension 4 Value Code"(Field 7)".

        field(50000; Description; Text[150])
        {
            CalcFormula = lookup("G/L Entry".Description where("Entry No." = field("Entry No.")));
            FieldClass = FlowField;
        }
        field(50001; "Document No."; Code[20])
        {
            CalcFormula = lookup("G/L Entry"."Document No." where("Entry No." = field("Entry No.")));
            FieldClass = FlowField;
        }
        field(50002; "External Document No."; Code[35])
        {
            CalcFormula = lookup("G/L Entry"."External Document No." where("Entry No." = field("Entry No.")));
            FieldClass = FlowField;
        }
        field(50003; "G/L Account"; Text[50])
        {
        }
        field(50004; "Dimension 1 Value Name"; Text[50])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Dimension 1 Value Code")));
            CaptionClass = GetCaptionClass(1);
            Caption = 'Dimension 1 Value Code';
            FieldClass = FlowField;
        }
        field(50005; "Dimension 2 Value Name"; Text[50])
        {
            CaptionClass = GetCaptionClass(2);
            Caption = 'Dimension 2 Value Code';
        }
        field(50006; "Dimension 3 Value Name"; Text[50])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Dimension 3 Value Code")));
            CaptionClass = GetCaptionClass(3);
            Caption = 'Dimension 3 Value Code';
            FieldClass = FlowField;
        }
        field(50007; "Dimension 4 Value Name"; Text[50])
        {
            CaptionClass = GetCaptionClass(4);
            Caption = 'Dimension 4 Value Code';
        }
    }
}

