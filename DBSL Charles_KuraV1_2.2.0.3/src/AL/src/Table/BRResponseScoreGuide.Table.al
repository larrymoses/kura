#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80225 "BR Response Score Guide"
{

    fields
    {
        field(1;"Survey Response ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Section Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Question ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Rating Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Options Text,Open Text';
            OptionMembers = "Options Text","Open Text";
        }
        field(6;"Desired Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(7;"Response Value";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Score %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Survey Response ID","Section Code","Question ID","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

