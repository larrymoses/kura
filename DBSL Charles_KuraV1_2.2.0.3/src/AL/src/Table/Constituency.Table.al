#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72011 "Constituency"
{
    DrillDownPageID = Constituencies;
    LookupPageID = Constituencies;

    fields
    {
        field(1; "Code"; Code[30])
        {
            
        }
        field(2; Description; Text[100])
        {
            
        }
        field(3; "County Code"; Code[30])
        {
            
            TableRelation = County1.Code where(Blocked = filter(false));
        }
        field(4; "Region Code"; Code[30])
        {
            
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(5; "No. of Road Sections"; Integer)
        {
            CalcFormula = count("Road Section" where("Primary Constituency ID" = field(Code), Blocked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Total Road Network Length (Km)"; Decimal)
        {
            CalcFormula = sum("Road Section"."Total Road Length (KMs)" where("Primary Constituency ID" = field(Code),
                                                                              Blocked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Paved Road Length (Km)"; Decimal)
        {
            CalcFormula = sum("Pavement Surface Entry"."Road Length (Kms)" where("Constituency ID" = field(Code),
                                                                                  Reversed = const(false),
                                                                                  "Pavement Category" = const(Paved)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Paved Road Length %"; Decimal)
        {
            
            Editable = false;
        }
        field(9; "Unpaved Road Length %"; Decimal)
        {
            
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(10; "No. of Planned Road Projects"; Integer)
        {
            CalcFormula = count(Job where(Status = filter(Planned | Ongoing),
                                           "Constituency ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "No. of Ongoing Road Projects"; Integer)
        {
            CalcFormula = count(Job where(Status = filter("Completed/Under DLP"), "Constituency ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "No. of Completed Road Projects"; Integer)
        {
            CalcFormula = count(Job where(Status = filter("Under PBRM"),
                                            "Constituency ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Total Budget (Construction)"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Constituency ID" = field(Code),
                                                                            "Line Type" = filter(Budget | "Both Budget and Billable"),
                                                                            Text = const('2')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Total Budget (Maintainenace)"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Constituency ID" = field(Code),
                                                                            "Line Type" = filter(Budget | "Both Budget and Billable"),
                                                                            Text = const('3')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Actual Cost (Maintainenace)"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Constituency ID" = field(Code),
                                                                           "Entry Type" = const(Usage),
                                                                           "Road Project Category" = const("Maitenance Works")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Actual Cost (Construction)"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Constituency ID" = field(Code),
                                                                           "Entry Type" = const(Usage),
                                                                           "Road Project Category" = const("Construction Works")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; Blocked; Boolean)
        {
            
        }
        field(19;"No of Workplans"; Integer)
        {
            
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

