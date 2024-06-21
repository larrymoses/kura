#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72116 "RICS County"
{
    DrillDownPageID = "RICS Counties";
    LookupPageID = "RICS Counties";

    fields
    {
        field(1; "RICS No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "County Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'County.Code';
            TableRelation = County1.Code;
        }
        field(3; "Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
            TableRelation = County1.Code;
        }
        field(4; "No. of Existing Roads"; Integer)
        {
            // CalcFormula = count("Road Inventory" where ("Primary Region ID"=field("Region Code")));
            Editable = true;
            FieldClass = FlowField;
        }
        field(5; "No. of New Roads"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "RICS No.", "County Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

