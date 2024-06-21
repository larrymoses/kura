table 60011 "Incidence Resolution Table"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Resolution Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,In Progress,Escalated,Resolved,Closed,Other';
            OptionMembers = Open,"In Progress",Escalated,Resolved,Closed,Other;
        }
        field(3;"Actions Taken";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Actioned By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Actioned At";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Duration Taken";Duration)
        {
            DataClassification = ToBeClassified;
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
        "Actioned At" := CURRENTDATETIME;
        "Actioned By" := USERID;
    end;
}

