#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69740 "Insurance Lines"
{

    fields
    {
        field(1;"Document No.";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Insurance Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = DeductionsX.Code where ("Insurance Code"=filter(true));

            trigger OnValidate()
            begin
                if DED.Get("Insurance Code") then
                  "Insurance Name":=DED.Description;
            end;
        }
        field(3;"Insurance Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Policy Number";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Date of Commencement";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Sum Assuared";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Monthly Deduction";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Type Of Insurance";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Life Policy,Education Policy,Investment Policy';
            OptionMembers = ,"Life Policy","Education Policy","Investment Policy";
        }
        field(9;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(10;"Employee No.";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Insurance Header"."Employee No." where ("Document No."=field("Document No."));
        }
    }

    keys
    {
        key(Key1;"Document No.","Insurance Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DED: Record DeductionsX;
}

