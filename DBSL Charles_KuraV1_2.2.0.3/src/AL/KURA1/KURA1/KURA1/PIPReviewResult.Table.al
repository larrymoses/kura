#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80095 "PIP Review Result"
{

    fields
    {
        field(1;"PIP Review ID";Code[100])
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
        field(4;"PIP ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"PIP Objective  ID";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Performance Deficiency ID";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Expectation to be met";Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Performance Notes";Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Actual Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Outcome Perfomance Indicator";Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Unit of Measure";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Desired Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(13;"Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Achievement Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Final Performance Rating";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"PIP Review ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

