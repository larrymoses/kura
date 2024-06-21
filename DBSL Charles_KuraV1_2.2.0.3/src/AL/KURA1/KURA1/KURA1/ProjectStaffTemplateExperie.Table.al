#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70128 "Project Staff Template Experie"
{
    Caption = 'Project Staff Template Experience';

    fields
    {
        field(1;"Key Staff Template ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Key Staff Template".Code where (Blocked=filter(false));
        }
        field(2;"Project Role Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where (Blocked=filter(false));
        }
        field(3;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Experience Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',General Experience,Specialized Experience,Training Experience,No. of Handled Projects,Other Experience';
            OptionMembers = ,"General Experience","Specialized Experience","Training Experience","No. of Handled Projects","Other Experience";
        }
        field(5;"Minimum Years of Experience";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Minimum Experience Req";Text[100])
        {
            Caption = 'Minimum Experience Requirements';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Key Staff Template ID","Project Role Code","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
}

