#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80219 "BR Survey Question"
{

    fields
    {
        field(1;"Survey ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Section Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BR Survey Section"."Section Code";
        }
        field(3;"Question ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Question;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Rating Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Options Text,Open Text';
            OptionMembers = "Options Text","Open Text";
        }
        field(6;"Option Text Response Type";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Assigned Weight %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Desired Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
    }

    keys
    {
        key(Key1;"Survey ID","Section Code","Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

