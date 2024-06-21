#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80094 "Improvement Plan Line"
{

    fields
    {
        field(1;"PIP ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'PIP,PIP Review';
            OptionMembers = PIP,"PIP Review";
        }
        field(4;"Expectation to be met";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Performance Deficiency ID";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Achievement Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Outcome Perfomance Indicator";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Unit of Measure";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Desired Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(10;"Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Achievement Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Final Performance Rating";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"PIP ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

