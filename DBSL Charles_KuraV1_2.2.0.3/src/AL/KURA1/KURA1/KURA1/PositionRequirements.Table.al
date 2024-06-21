#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69118 "Position Requirements"
{

    fields
    {
        field(1;"Job Id";Code[20])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = Positions;
        }
        field(2;"Qualification Type";Option)
        {
            DataClassification = ToBeClassified;
            NotBlank = false;
            OptionMembers = ,Requirement,Skill;
        }
        field(3;"Qualification Code";Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = true;

            trigger OnValidate()
            begin
                QualificationSetUp.Reset;
                QualificationSetUp.SetRange(QualificationSetUp.Code,"Qualification Code");
                if QualificationSetUp.Find('-') then
                Qualification:=QualificationSetUp.Description;
            end;
        }
        field(4;Qualification;Text[200])
        {
            DataClassification = ToBeClassified;
            NotBlank = false;
        }
        field(5;"Job Requirements";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Priority;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",High,Medium,Low;
        }
        field(7;"Job Specification";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Academic,Professional,Technical,Experience;
        }
        field(8;"Score ID";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Need code";Code[10])
        {
            DataClassification = ToBeClassified;
            //TableRelation = Table0;
        }
        field(10;"Stage Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Models".Code where (Type=const(Scores));
        }
        field(11;Mandatory;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Desired Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Total (Stage)Desired Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Qualification Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Code";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Job Id","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        QualificationSetUp: Record Qualification;
}

