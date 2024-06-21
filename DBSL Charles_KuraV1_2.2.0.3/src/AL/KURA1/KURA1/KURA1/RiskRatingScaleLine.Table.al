#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95111 "Risk Rating Scale Line"
{

    fields
    {
        field(1;"Risk Rating Scale Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Likelihood Rating,Impact Rating,Overall Risk Rating,Risk Appetite Rating';
            OptionMembers = " ","Likelihood Rating","Impact Rating","Overall Risk Rating","Risk Appetite Rating";
        }
        field(2;"Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Min Probability Percentage";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(6;"Max Probability Percentage";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(7;"No. of Criteria";Integer)
        {
            CalcFormula = count("Risk Rating Criteria" where ("Risk Rating Scale Type"=field("Risk Rating Scale Type"),
                                                              "Rating Scale ID"=field("Rating Scale ID"),
                                                              Code=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"Rating Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Min Overall Rating";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Max Overall Rating";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Default Risk Response Strategy";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Response Strategy"."Strategy ID" where (Blocked=filter(false));
        }
        field(12;"Risk Heat Zone";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Red,Yellow,Green';
            OptionMembers = " ",Red,Yellow,Green;
        }
        field(13;"No. of Risk Response Actions";Integer)
        {
            CalcFormula = count("Overal Risk Response Action" where ("Risk Rating Scale Type"=field("Risk Rating Scale Type"),
                                                                     "Rating Scale ID"=field("Rating Scale ID"),
                                                                     Code=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14;"Risk Taking Philosophy";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Will take justified risks,Will take strong justified risks,Preference for safe delivery,Extremely conservative,Sacred (risk avoidance is a core objective)';
            OptionMembers = " ","Will take justified risks","Will take strong justified risks","Preference for safe delivery","Extremely conservative","Sacred (risk avoidance is a core objective)";
        }
        field(15;Tolerance;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Extremely low,Low,Limited,Expect some,Fully anticipated';
            OptionMembers = " ","Extremely low",Low,Limited,"Expect some","Fully anticipated";
        }
        field(16;Choice;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Always select option with highest return,Fully accept risk but manage impact,Accept if risk is limited & benefits outweigh risks,Only selects lowest risk option';
            OptionMembers = " ","Always select option with highest return","Fully accept risk but manage impact","Accept if risk is limited & benefits outweigh risks","Only selects lowest risk option";
        }
        field(17;"Trade-Off";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Willing,Willing under certain conditions,Prefer to avoid,With extreme reluctance,Never';
            OptionMembers = " ",Willing,"Willing under certain conditions","Prefer to avoid","With extreme reluctance",Never;
        }
        field(18;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Risk Rating Scale Type","Rating Scale ID","Code","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

