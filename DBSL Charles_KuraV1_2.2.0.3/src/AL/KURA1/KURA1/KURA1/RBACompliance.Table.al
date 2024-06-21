#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54014 "RBA Compliance"
{
    DrillDownPageID = "RBA Compliance Table";
    LookupPageID = "RBA Compliance Table";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[250])
        {
        }
        field(3;"% Recommended";Decimal)
        {
        }
        field(4;"Date Filter";Date)
        {
            FieldClass = FlowFilter;
        }
        field(5;"Fund Filter";Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

