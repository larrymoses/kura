table 60012 "Incidence Mitigation Strategy"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Mitigation Strategy";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Mitigation Strategy Descriptio";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Noted By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Noted At";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Noted At":=CURRENTDATETIME;
        "Noted By":=USERID;
    end;
}

