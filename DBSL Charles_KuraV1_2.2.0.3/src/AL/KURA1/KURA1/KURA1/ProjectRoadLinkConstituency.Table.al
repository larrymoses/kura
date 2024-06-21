#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72299 "Project Road Link Constituency"
{

    fields
    {
        field(1;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code";
        }
        field(2;"Constituency Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Constituency));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Constituency Code");
                if ResponsibilityCenter.FindSet then begin
                  "Constituency Name":=ResponsibilityCenter.Name;
                  "Region Code":=ResponsibilityCenter."Location Code";
                  Validate("Region Code");
                  end;
            end;
        }
        field(3;"Constituency Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Region Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Region Code");
                if ResponsibilityCenter.FindSet then
                  "Region Name":=ResponsibilityCenter.Name;
            end;
        }
        field(5;"Region Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Appro Constituency Cost";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Actual Constituency Cost";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"KeRRA Budget Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Global Budget Book ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Workplanned Length";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Road Code","Constituency Code","KeRRA Budget Code","Global Budget Book ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ResponsibilityCenter: Record "Responsibility Center";
}

