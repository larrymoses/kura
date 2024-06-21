#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72143 "Project Staff Template Expe"
{

    fields
    {
        field(1; "Key Staff Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Staff Role Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '20';
            TableRelation = "Project Staff Role Code"."Staff Role Code" where(Blocked = filter(false));
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Experience Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,General experience,Specialized Experience,Training Experience,No. Of Handled Projects,Other Experience';
            OptionMembers = " ","General experience","Specialized Experience","Training Experience","No. Of Handled Projects","Other Experience";
        }
        field(5; "Minimum Years of Experience"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Min Experience Requirements"; Text[250])
        {
            Caption = 'Minimum  Experience Requirements';
            DataClassification = ToBeClassified;
            Description = 'Min Experience Requirements';
        }
    }

    keys
    {
        key(Key1; "Key Staff Template ID", "Staff Role Code", "Entry No")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups
    {
    }
}

