#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72016 "Road Study Task"
{

    fields
    {
        field(1;"Study ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"No.  of Final Findings";Integer)
        {
            CalcFormula = count("Road Study Result" where ("Study Task ID"=field(Code),
                                                           "Study ID"=field("Study ID"),
                                                           "Result Type"=filter(Finding),
                                                           "Report Type"=const(Final)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7;"No. of Final Conclusions";Integer)
        {
            CalcFormula = count("Road Study Result" where ("Study Task ID"=field(Code),
                                                           "Study ID"=field("Study ID"),
                                                           "Result Type"=filter(Conclusion),
                                                           "Report Type"=const(Final)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"No. of Final Recommendations";Integer)
        {
            CalcFormula = count("Road Study Result" where ("Study Task ID"=field(Code),
                                                           "Study ID"=field("Study ID"),
                                                           "Result Type"=filter(Recommendation),
                                                           "Report Type"=const(Final)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9;"No. of Interim Results";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Study ID","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

