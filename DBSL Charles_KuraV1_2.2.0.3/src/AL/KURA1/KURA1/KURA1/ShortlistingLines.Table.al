#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69114 "Shortlisting Lines"
{

    fields
    {
        field(1;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Application No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Application Table";
        }
        field(3;"Full Name";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Email;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Interview Location";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Interview Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Interview Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Interview Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Notify;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Oral,Written,Apptitude;
        }
        field(11;"Employment Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Employment Description";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;Employ;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Job Id.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vacancy Requisition Lines"."Job Id";
        }
        field(15;"Written Interview Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Apptitude Interview Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Oral Interview Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No","Application No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

