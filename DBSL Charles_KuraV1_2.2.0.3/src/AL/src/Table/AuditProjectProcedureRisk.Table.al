#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95205 "Audit Project Procedure Risk"
{
    DrillDownPageID = "Audit Project Procedure Risks";
    LookupPageID = "Audit Project Procedure Risks";

    fields
    {
        field(1;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Business Risk ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Audit Procedure ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Risk Register Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(5;"Risk Management Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Original Risk ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Risk Title";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Risk Category";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Risk Source ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Risk Likelihood Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Risk Impact Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Risk Impact Type";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Likelihood Rate Scale ID';
            OptionCaption = ' ,Negative,Positive';
            OptionMembers = " ",Negative,Positive;
        }
        field(13;"Risk Likelihood Rate Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Risk Impact Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Overall Risk Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Risk Appetite Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Risk Likelihood Rating";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Risk Impact Rating";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Overall Risk Rating";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Overall Risk Level Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"No. of Controls";Integer)
        {
            CalcFormula = count("Audit Proj  Procedure Control" where ("Engagement ID"=field("Engagement ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(22;"Audit Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Engagement ID","Business Risk ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

