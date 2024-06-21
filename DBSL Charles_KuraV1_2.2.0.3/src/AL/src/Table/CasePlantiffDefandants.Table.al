#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69514 "Case Plantiff-Defandants"
{

    fields
    {
        field(1;"Case No";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Case Register"."No.";
        }
        field(2;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Plaintiff,Defendant';
            OptionMembers = " ",Plaintiff,Defendant;
        }
        field(3;"Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Plaintive-Defentants".Code where (Type=field(Type));

            trigger OnValidate()
            begin
                Plantiff.Reset;
                Plantiff.SetRange(Code,Code);
                if Plantiff.Find('-') then begin
                    Names:=Plantiff.Names;
                    Contacts:=Plantiff.Contact;
                  end;
            end;
        }
        field(4;Names;Code[300])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type=const(Plaintiff)) "Case Plantiffs All".Names
                            else if (Type=const(Defendant)) "Case Defendants All".Names;
        }
        field(5;Contacts;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Case No",Type,"Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Plantiff: Record "Plaintive-Defentants";
}

