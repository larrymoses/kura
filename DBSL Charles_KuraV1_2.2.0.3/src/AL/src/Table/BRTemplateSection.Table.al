#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80214 "BR Template Section"
{

    fields
    {
        field(1;"Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Section Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Section Completion Instruction";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Questions";Integer)
        {
            CalcFormula = count("BR Template Line" where ("Section ID"=field("Section Code")));
            FieldClass = FlowField;
        }
        field(6;"Total Weight %";Decimal)
        {
            CalcFormula = sum("BR Template Line"."Assigned Weight %" where ("Section ID"=field("Section Code")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Template ID","Section Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

