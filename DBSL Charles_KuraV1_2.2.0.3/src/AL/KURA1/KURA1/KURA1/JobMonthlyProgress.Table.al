#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72350 "Job Monthly Progress"
{

    fields
    {
        field(1;"Job No";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;Date;Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Month Name":=Lowercase(Format(Date,0,'<Month Text>'));
            end;
        }
        field(4;"Month Name";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"KM of Tarmac Done";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Updated By";Code[500])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"No of Men Employed";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"No of Women Employed";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Men Mandays";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Women Mandays";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"No of Structures Completed";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"No of KM Designed";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Type of project";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Maintenance,Road Construction,Survey/Study,Structure Construction';
            OptionMembers = " ",Maintenance,"Road Construction","Survey/Study","Structure Construction";
        }
    }

    keys
    {
        key(Key1;"Job No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Month Name":=Lowercase(Format(Date,0,'<Month Text>'));
        "Updated By":=UserId;

         Job.Reset;
         Job.SetRange(Job."No.","Job No");
         if Job.FindSet then
          "Type of project":=Job."Type of Project";

    end;

    trigger OnModify()
    begin
        "Updated By":=UserId;
    end;

    var
        Job: Record Job;
        Structuresvisible: Boolean;
        KMDoneVisible: Boolean;
        KMDesgnedVisible: Boolean;

    local procedure PageVisibility()
    begin

    end;
}

