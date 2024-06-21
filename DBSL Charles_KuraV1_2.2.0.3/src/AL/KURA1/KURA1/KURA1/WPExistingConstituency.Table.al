#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72153 "WP Existing Constituency"
{

    fields
    {
        field(1;"Wp No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"County Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'County.Code';
            TableRelation = County1.Code;
        }
        field(3;"Region Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
            TableRelation = County1.Code;
        }
        field(4;"Constituency Code";Code[20])
        {
            Editable = true;
            FieldClass = Normal;
            TableRelation = Constituency.Code where ("County Code"=field("County Code"));
        }
        field(5;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Wp No.","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

