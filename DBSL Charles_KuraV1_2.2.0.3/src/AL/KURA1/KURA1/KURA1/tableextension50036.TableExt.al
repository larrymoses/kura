#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50036 "tableextension50036" extends "Work Type"
{
    fields
    {
        field(57000; Rate; Decimal)
        {
        }
        field(57001; Category; Option)
        {
            Description = '//Work Type Category';
            OptionCaption = ' ,Project Team,Machines,Labour';
            OptionMembers = " ","Project Team",Machines,Labour;
        }
        field(57002; "G/L Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(57003; "Responsibility Center Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(57004; "Responsibility Center"; Text[100])
        {
            CalcFormula = lookup("Responsibility Center".Name where(Code = field("Responsibility Center Code")));
            FieldClass = FlowField;
        }
        field(57005; "Local Travel"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(57006; "International Travel"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(57007; "Blocked"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        //  key(Key1;'')
        //  {
        //      Enabled = false;
        //  }
    }
}

