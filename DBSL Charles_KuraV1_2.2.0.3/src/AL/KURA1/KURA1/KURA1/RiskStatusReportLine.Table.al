#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95129 "Risk Status Report Line"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Risk Voucher,Risk Status Report';
            OptionMembers = " ","New Risk Voucher","Risk Status Report";
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Risk Management Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Risk ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Risk Title";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Risk Likelihood Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Risk Impact Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Risk Impact Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Negative,Positive';
            OptionMembers = " ",Negative,Positive;
        }
        field(9;"Estimate Fin. Impact (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Estimate Fin. Impact (LCY)';
        }
        field(10;"Estimate Delay Impact (Days)";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Gen. Risk Response Strategy";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Gen. Risk Response Strategy';
        }
        field(12;"Risk Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Open,Closed';
            OptionMembers = " ",Open,Closed;
        }
        field(13;"Date Closed";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Risk Likelihood Rate Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Likelihood Rate Scale ID';
        }
        field(15;"Risk Impact Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Overall Risk Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Risk Appetite Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Appetite Rating Scale ID';
        }
        field(18;"Risk Likelihood Rating";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Risk Impact Rating";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Overal Risk Rating";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Overall Risk Level Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Risk Heat Zone";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Red,Yellow,Green';
            OptionMembers = " ",Red,Yellow,Green;
        }
        field(23;"No. of Actual Risk Resp. Actns";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Actual Risk Resp. Actns';
        }
        field(24;"Risk Register Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Risk Register Type","Risk Management Plan ID","Risk ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

