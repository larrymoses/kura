#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56205 "Annual  Appraisal Lines"
{

    fields
    {
        field(1;"Appraisal No";Code[20])
        {
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
        }
        field(3;"Agreed Performance Targets";Text[250])
        {
            Caption = 'Agreed Annual  Performance Targets';
        }
        field(4;"Achieved Targets  of Annual";Text[250])
        {
            Caption = 'Achieved Results in line with projected indicators';
        }
        field(5;"Performance Indicator";Text[250])
        {
        }
        field(6;"Percentage Cumulative Achievem";Decimal)
        {
            Caption = 'Percentage Cumulative Achievement';
        }
        field(7;"Appraisal Score";Text[100])
        {
        }
        field(8;"Targets changed or added";Text[250])
        {
        }
        field(9;Remarks;Text[250])
        {
            Caption = 'Remarks (Indicate level of achievement)';
        }
    }

    keys
    {
        key(Key1;"Appraisal No","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

