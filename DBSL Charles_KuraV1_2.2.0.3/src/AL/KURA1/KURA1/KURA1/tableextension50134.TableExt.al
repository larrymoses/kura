#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
/// <summary>
/// TableExtension "tableextension50134" (ID 50134) extends Record Responsibility Center.
/// </summary>
TableExtension 50134 tableextension50134 extends "Responsibility Center"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Name(Field 2)".

        field(50005; "No. of Research Programs"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50006; "No. of Grant Proposals"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50007; "No. of Awarded GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Application Status" = const(Won),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50008; "No. of Lost Grant GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Application Status" = const(Lost),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50009; "No. of Ongoing RProjects"; Integer)
        {
            CalcFormula = count(Job where("Research Center" = field(Code),
                                           "Project Start Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50010; "No. of Completed RProjects"; Integer)
        {
            CalcFormula = count(Job where("Research Center" = field(Code),
                                           "Project End Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50011; "Total Amount Awarded(LCY)"; Decimal)
        {
            CalcFormula = sum("Grant Funding Application"."Awarded Grant Amount (LCY)" where("Research Center" = field(Code),
                                                                                              "Application Status" = const(Won),
                                                                                              "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50012; "No. of Assets"; Integer)
        {
            CalcFormula = count("Fixed Asset" where("Research Center" = field(Code)));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(72000; "Total Road Network Length (Km)"; Decimal)
        {
            CalcFormula = sum("Road Section"."Total Road Length (KMs)" where("Primary Region ID" = field(Code),
                                                                               Blocked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72001; "Paved Road Length (Km)"; Decimal)
        {
            CalcFormula = sum("Pavement Surface Entry"."Road Length (Kms)" where("Region ID" = field(Code),
                                                                                  Reversed = const(false),
                                                                                  "Pavement Category" = const(Paved)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72002; "Paved Road Length %"; Decimal)
        {
            ;
            Editable = false;
        }
        field(72003; "Unpaved Road Length %"; Decimal)
        {
            ;
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(72004; "No. of Planned Road Projects"; Integer)
        {
            CalcFormula = count(Job where(Status = filter(Planned | Ongoing), "Region ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72005; "No. of Ongoing Road Projects"; Integer)
        {
            CalcFormula = count(Job where(Status = filter("Completed/Under DLP"), "Region ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72006; "No. of Completed Road Projects"; Integer)
        {
            CalcFormula = count(Job where(Status = filter("Under PBRM"), "Region ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72007; "Total Budget (Construction)"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Region ID" = field(Code), "Line Type" = filter(Budget | "Both Budget and Billable"),
                                                                          Text = const('2')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72008; "Total Budget (Maintainenace)"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Region ID" = field(Code), "Line Type" = filter(Budget | "Both Budget and Billable"),
                                                                          Text = const('3')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72009; "Actual Cost (Maintainenace)"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Region ID" = field(Code),
                                                                           "Entry Type" = const(Usage),
                                                                           "Road Project Category" = const("Maitenance Works")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72010; "Actual Cost (Construction)"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Region ID" = field(Code),
                                                                           "Entry Type" = const(Usage),
                                                                           "Road Project Category" = const("Construction Works")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72011; "No. of Road Sections"; Integer)
        {
            CalcFormula = count("Road Section" where("Primary Region ID" = field(Code), Blocked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72012; "No. Of Constituencies"; Integer)
        {
            CalcFormula = count(Constituency where("Region Code" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(80000; "Operating Unit Type"; Enum "Responsibility Center Operating unit types")
        {
          //  ;
          //  OptionCaption = ' ,Directorate,Department/Center,Division/Section,Region,Constituency,Branch,Board,Company-Level,Duty Station,Town';
            // OptionMembers = " ",Directorate,"Department/Center","Division/Section",Region,Constituency,Branch,Board,"Company-Level","Duty Station";
        }
        field(80001; "Direct Reports To"; Code[50])
        {
            
            TableRelation = "Responsibility Center";
        }
        field(80002; "Indirect Reports To"; Code[50])
        {
            
            TableRelation = "Responsibility Center";
        }
        field(80003; "Hierarchical  Level ID"; Option)
        {
            
            OptionCaption = 'Level 1,Level 2,Level 3,Level 4,Level 5';
            OptionMembers = "Level 1","Level 2","Level 3","Level 4","Level 5";
        }
        field(80004; "Headed By (Title)"; Code[50])
        {
            
            TableRelation = "Company Positions"."Position ID";
        }
        field(80005; "Current Head"; Code[50])
        {
            
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Current Head") then begin
                    "Current Head Name" := Employee.FullName;
                end;
            end;
        }
        field(80006; Blocked; Boolean)
        {
            
        }
        field(80007; Vision; Text[255])
        {
            
            Description = 'SPM';
        }
        field(80008; Mission; Text[255])
        {
            
            Description = 'SPM';
        }
        field(80009; Motto; Text[255])
        {
            
            Description = 'SPM';
        }
        field(80010; "Research Center?"; Boolean)
        {
            
        }
        field(80011; Region; Boolean)
        {
            
        }
        field(80012; "Current Head Name"; Text[100])
        {
            
            Description = 'SPM';
        }
        field(80013; "Performance Contra. Signatory"; Text[250])
        {
            
            Description = 'Performance Contracting Signatory';
        }
        field(80014; PDE; Boolean)
        {
            
        }
        field(80015; HQ; Boolean)
        {
            
        }
        field(80016; "Assignment Area ID"; Code[100])
        {
            
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Duty Station"));
        }
        field(880017; "No of RAM Workplans";Integer)
        {
            
        }
        field(880018; Identifier; Enum "Resp Center Identifier")
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;Name)
        // {
        // }
    }

    var
        Employees: Record Employee;
        Employee: Record Employee;
}

