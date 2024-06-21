#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69253 "Applications Accomplishmentss"
{

    fields
    {
        field(1;"Code";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Job Application No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Job Applications";
        }
        field(3;"Job Indicator Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Indicators Setup"."Indicator  Code";

            trigger OnValidate()
            begin
                JobIndicatorsSetup.SetRange("Indicator  Code","Job Indicator Code");
                if JobIndicatorsSetup.FindSet then
                  "Indicator Description":=JobIndicatorsSetup."Indicator Description";
            end;
        }
        field(4;"Indicator Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Number;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Additional Comments";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Job Application No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobIndicatorsSetup: Record "Job Indicators Setup";
}

