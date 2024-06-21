table 50040 "Benefits Matrix Setup"
{
    Caption = 'Benefits Matrix Setup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Benefit Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Benefits Types";

            trigger OnValidate()
            begin
                IF BenefitsTypes.GET("Benefit Type") THEN
                  "Benefit Description":=BenefitsTypes.Description;
            end;
        }
        field(3;"Benefit Description";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Beneficiary Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Spouse,Primary Beneficiary,Child,Biological Parent';
            OptionMembers = Spouse,"Primary Beneficiary",Child,"Biological Parent";
        }
        field(5;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Benefit Type")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Benefit Description","Beneficiary Category")
        {
        }
    }

    var
        BenefitsTypes: Record "Benefits Types";
}

