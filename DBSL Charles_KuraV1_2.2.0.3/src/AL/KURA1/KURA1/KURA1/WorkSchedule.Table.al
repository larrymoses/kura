#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72086 "Work Schedule"
{

    fields
    {
        field(1;"Workplan No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Q1(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = '%';
            InitValue = 0;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                FnValidateTotalPercentage;
            end;
        }
        field(4;"Q2(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = '%';
            InitValue = 0;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                FnValidateTotalPercentage;
            end;
        }
        field(5;"Q3(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = '%';
            InitValue = 0;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                FnValidateTotalPercentage;
            end;
        }
        field(6;"Q4(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = '%';
            InitValue = 0;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                FnValidateTotalPercentage;
            end;
        }
        field(7;"Total(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = '%';
            InitValue = 0;
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1;"Workplan No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    local procedure FnValidateTotalPercentage()
    begin
        "Total(LCY)":="Q1(LCY)"+"Q2(LCY)"+"Q3(LCY)"+"Q4(LCY)";
        if "Total(LCY)"> 100 then
          Error('%1 cannot be greater than 100',FieldCaption("Total(LCY)"));
    end;
}

