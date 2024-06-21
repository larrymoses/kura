#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80209 "Colaborators & Partners"
{

    fields
    {
        field(1;"GFA No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Contact Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Colaborator,Partner';
            OptionMembers = Colaborator,Partner;
        }
        field(3;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Contact Type"=const(Colaborator)) Contact."No." where (TEST=const('1'))
                            else if ("Contact Type"=const(Partner)) Contact."No." where (TEST=const('3'));

            trigger OnValidate()
            begin
                if Contact.Get(Code) then
                  Name:=Contact.Name;
            end;
        }
        field(4;Name;Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"GFA No.","Contact Type","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Contact: Record Contact;
}

