#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72380 "Road Constituency"
{

    fields
    {
        field(1; "Road Code"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Constituency Code"; Code[40])
        {
            DataClassification = ToBeClassified;
            //   TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Constituency));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Constituency Code");
                //   ResponsibilityCenter.SetRange(ResponsibilityCenter."Operating Unit Type",ResponsibilityCenter."operating unit type"::Constituency);
                if ResponsibilityCenter.FindSet then begin
                    "Constituency Name" := ResponsibilityCenter.Name;
                    "Region Code" := ResponsibilityCenter."Location Code";
                    Validate("Region Code");
                end;
            end;
        }
        field(3; "Constituency Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Start Chainage(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "End Chainage(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Chainage Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Additional Notes"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));
        }
        field(9; "County Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));
        }
        field(10; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Road Code", "Constituency Code", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ResponsibilityCenter: Record "Responsibility Center";
    //  County1: Record County1;
}

