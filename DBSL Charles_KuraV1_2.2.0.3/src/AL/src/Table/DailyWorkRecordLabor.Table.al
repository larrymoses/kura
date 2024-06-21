#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72258 "Daily Work Record Labor"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;Gender;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Total No. of Staff";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Average ManHours Worked";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Estimate Total Wages Paid";Decimal)
        {
            Caption = 'Estimate Total Wages Paid (LCY)';
            DataClassification = ToBeClassified;
        }
        field(8;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Labour Type";Option)
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
        key(Key1;"Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        DailyWorkRecord.Reset;
        DailyWorkRecord.SetRange(DailyWorkRecord."Document No.","Document No.");
        if DailyWorkRecord.FindSet then begin
          "Document Date":=DailyWorkRecord."Document Date";
          end;
    end;

    var
        DailyWorkRecord: Record "Daily Work Record";
}

