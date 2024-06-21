#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72256 "Daily Labor Ledger"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Daily Work Record ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Document No.";

            trigger OnValidate()
            begin
                DailyWorkRecord.Reset;
                DailyWorkRecord.SetRange(DailyWorkRecord."Document No.","Daily Work Record ID");
                if DailyWorkRecord.FindSet then begin
                 "Posting Date":=DailyWorkRecord."Document Date";
                  end;
            end;
        }
        field(3;"Job No.";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Project ID";
        }
        field(4;Gender;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Total No. of Staff";Integer)
        {
            Editable = true;
            FieldClass = Normal;
        }
        field(7;"Average ManHours Worked";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Estimate Total Wages Paid";Decimal)
        {
            Caption = 'Estimate Total Wages Paid (LCY)';
            DataClassification = ToBeClassified;
        }
        field(9;"Work Execution Programme ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where ("Document Type"=filter("Work Execution Programme"));
        }
        field(10;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Document Date";
        }
        field(11;"Labour Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Labourer,Artisan,Supervisor';
            OptionMembers = " ",Labourer,Artisan,Supervisor;

            trigger OnValidate()
            begin
                Description:='Labour Summary'+'  -  '+Format(Gender)+' - '+Format("Labour Type");
            end;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DailyWorkRecord: Record "Daily Work Record";
}

