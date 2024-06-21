#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69411 "HSE Role Member"
{

    fields
    {
        field(1;"Role ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Resource No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=const(Person),
                                                  Blocked=const(false));

            trigger OnValidate()
            begin
                if Resources.Get("Resource No.") then begin
                  Name:=Resources.Name;
                  Email:=Resources.Email
                  end;
            end;
        }
        field(3;Name;Text[240])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Telephone No.";Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Email;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Membership Role Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Member,Chairperson,Secretary,Expert,3rd Party,Other';
            OptionMembers = " ",Member,Chairperson,Secretary,Expert,"3rd Party",Other;
        }
        field(7;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Service Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Service End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Role ID","Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resources: Record Resource;
}
