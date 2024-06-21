#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70194 "IFP Response Line RC"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'IFP Response,EOI Response,IFR Response';
            OptionMembers = "IFP Response","EOI Response","IFR Response";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RFI Response"."Document No.";
        }
        field(3;"Procurement Category";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RFI Prequalification Category"."Prequalification Category ID";
        }
        field(4;"Responsibility Center Code";Code[30])
        {
            Caption = 'Region Code';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=const(Region));
        }
        field(5;Description;Text[250])
        {
            CalcFormula = lookup("Responsibility Center".Name where (Code=field("Responsibility Center Code")));
            FieldClass = FlowField;
        }
        field(6;"Vendor No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Constituency Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=const(Constituency),
                                                                "Location Code"=field("Responsibility Center Code"));
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Procurement Category","Responsibility Center Code","Vendor No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

