#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72089 "Stakeholder's Road Priority"
{

    fields
    {
        field(1;"Road Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No." where ("Record Type"=filter("Road Asset"));

            trigger OnValidate()
            begin
                //IF ObjRoadAsset.GET(road
            end;
        }
        field(2;"Link Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Pririty;Integer)
        {
            DataClassification = ToBeClassified;
            InitValue = 0;
            MaxValue = 20;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1;"Road Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ObjRoadAsset: Record "Fixed Asset";
}

