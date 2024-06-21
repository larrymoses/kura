#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69611 "HR Guiding Principle"
{

    fields
    {
        field(1;No;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"HR Process";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Recruitment & Selection,Staff Promotion,Staff Transfer,Leave Management,Training & Development,Disciplinary Management,Health & Safety,Staff Welfare,Compesation & Benefits,Performance Management,Employee Separation,Other';
            OptionMembers = "Recruitment & Selection","Staff Promotion","Staff Transfer","Leave Management","Training & Development","Disciplinary Management","Health & Safety","Staff Welfare","Compesation & Benefits","Performance Management","Employee Separation",Other;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

