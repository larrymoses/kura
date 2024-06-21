#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72095 "Annual Workplan Section"
{

    fields
    {
        field(1;"Header No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Road Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No." where ("Record Type"=filter("Road Asset"));

            trigger OnValidate()
            begin
                if ObjRoadAsset.Get("Road Code") then
                  "Link Name":=ObjRoadAsset.Description;
            end;
        }
        field(4;"Link Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Works Category";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Works Category";
        }
        field(8;"Funding Source";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source".Code;
        }
        field(9;"Fund Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fund Types";
        }
        field(10;"Workplan Cost";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Original Contract Sum";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Constituency Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency;

            trigger OnValidate()
            begin
                if Constituency.Get("Constituency Code") then
                  "Constituency Name":=Constituency.Description;
            end;
        }
        field(13;"Constituency Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Header No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Constituency: Record Constituency;
        ObjRoadAsset: Record "Fixed Asset";
}

