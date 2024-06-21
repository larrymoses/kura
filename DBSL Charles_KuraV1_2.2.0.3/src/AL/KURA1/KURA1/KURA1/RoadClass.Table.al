#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72004 "Road Class"
{
    DrillDownPageID = "Road Classes";
    LookupPageID = "Road Classes";

    fields
    {
        field(1; "Road Class ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Purpose; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Road Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Primary National,Secondary National,County Road';
            OptionMembers = " ","Primary National","Secondary National","County Road";
        }
        field(5; "Classification Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Classified,Unclassified';
            OptionMembers = " ",Classified,Unclassified;
        }
        field(6; "Special Purpose Road (SPR)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No. of Road Links"; Integer)
        {
            CalcFormula = count("Road Inventory" where("Road Class ID" = field("Road Class ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Total Road Network Length (Km)"; Decimal)
        {
            CalcFormula = sum("Road Inventory"."Gazetted Road Length (KMs)" where("Road Class ID" = field("Road Class ID")));
            DecimalPlaces = 10 : 10;
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Paved Road Length (Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Paved Road Length %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Unpaved Road Length %"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(12; "No. of Planned Road Projects"; Integer)
        {
            CalcFormula = count(Job where("Road Class ID" = field("Road Class ID"), Status = filter(Planned)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "No. of Ongoing Road Projects"; Integer)
        {
            CalcFormula = count(Job where("Road Class ID" = field("Road Class ID"), Status = filter("Completed/Under DLP")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "No. of Completed Road Projects"; Integer)
        {
            CalcFormula = count(Job where("Road Class ID" = field("Road Class ID"), Status = filter("Under PBRM")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Desired Road Reserve Width (M)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Min Road Reserve Width (M)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Desired Road Reserve(M)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Road Class ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

