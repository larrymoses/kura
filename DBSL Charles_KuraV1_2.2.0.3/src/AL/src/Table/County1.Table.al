#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72010 "County1"
{
    DrillDownPageID = Counties;
    LookupPageID = Counties;

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Description := UpperCase(Description);
            end;
        }
        field(3; "No. Of Constituencies"; Integer)
        {
            CalcFormula = count(Constituency where("County Code" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "No. of Road Sections"; Integer)
        {
            CalcFormula = count("Road Section" where("Primary County ID" = field(Code),
                                                      Blocked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Region Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Region),
                                                                Blocked = const(false));
        }
        field(6; "Total Road Network Length (Km)"; Decimal)
        {
            CalcFormula = sum("Road Section"."Total Road Length (KMs)" where("Primary County ID" = field(Code),
                                                                              Blocked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Paved Road Length (Km)"; Decimal)
        {
            CalcFormula = sum("Pavement Surface Entry"."Road Length (Kms)" where("County ID" = field(Code),
                                                                                  Reversed = const(false),
                                                                                  "Pavement Category" = const(Paved)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Paved Road Length %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Unpaved Road Length %"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(10; "No. of Planned Road Projects"; Integer)
        {
            CalcFormula = count(Job where(Status = filter(Planned | Ongoing), "County ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "No. of Ongoing Road Projects"; Integer)
        {
            CalcFormula = count(Job where(Status = filter("Completed/Under DLP"), "County ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "No. of Completed Road Projects"; Integer)
        {
            CalcFormula = count(Job where(Status = filter("Under PBRM"), "County ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Total Budget (Construction)"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("County ID" = field(Code),
                                                                            "Line Type" = filter(Budget | "Both Budget and Billable"),
                                                                            Text = const('2')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Total Budget (Maintainenace)"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("County ID" = field(Code),
                                                                            "Line Type" = filter(Budget | "Both Budget and Billable"),
                                                                            Text = const('3')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Actual Cost (Maintainenace)"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("County ID" = field(Code),
                                                                           "Entry Type" = const(Usage),
                                                                           "Road Project Category" = const("Maitenance Works")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Actual Cost (Construction)"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("County ID" = field(Code),
                                                                           "Entry Type" = const(Usage),
                                                                           "Road Project Category" = const("Construction Works")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

