#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72119 "RICS Existing Road Section"
{

    fields
    {
        field(1;"RICS No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code";

            trigger OnValidate()
            begin
                 RoadInventory.Reset;
                 RoadInventory.SetRange(RoadInventory."Road Code","Road Code");
                 if RoadInventory.FindSet(true) then
                   begin
                    "Primary County ID":=RoadInventory."Primary County ID";
                    "Primary Region ID":=RoadInventory."Primary Region ID";
                   end;
            end;
        }
        field(3;"Road Section No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Road Section"."Road Section No." WHERE (Road Code=FIELD(Road Code))';

            trigger OnValidate()
            begin
                RoadSection.Reset;
                RoadSection.SetRange(RoadSection."Road Section No.","Road Section No.");
                if RoadSection.FindSet(true) then
                  begin
                  "Primary Constituency ID":=RoadSection."Primary Constituency ID";
                 end;
            end;
        }
        field(4;"Section Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Primary Constituency ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code;
        }
        field(6;"Primary County ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code;
        }
        field(7;"Primary Region ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
        }
        field(8;"Start Chainage(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 20:20;
        }
        field(9;"End Chainage(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 20:20;
        }
        field(10;"Total Road Length (KMs)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 20:20;
        }
    }

    keys
    {
        key(Key1;"RICS No.","Road Code","Road Section No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RoadInventory: Record "Road Inventory";
        RoadSection: Record "Road Section";
}

