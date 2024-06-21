#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69517 "Disciplinary Status Table"
{
    DrillDownPageID = "Disciplinary Status";
    LookupPageID = "Disciplinary Status";

    fields
    {
        field(1;"Disciplinary Status";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Deduction Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = DeductionsX.Code;
        }
        field(3;"Deductions Based On";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Computation Method";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Percentage,Flat Amount,Formula';
            OptionMembers = Percentage,"Flat Amount",Formula;
        }
        field(5;Percentage;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Formula;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Disciplinary Status")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

