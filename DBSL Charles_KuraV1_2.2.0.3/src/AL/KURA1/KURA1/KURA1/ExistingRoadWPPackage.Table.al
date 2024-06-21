#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72136 "Existing Road WP Package"
{

    fields
    {
        field(1; "Road Work Program ID"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                RoadProgram.Reset;
                RoadProgram.SetRange(Code, "Road Work Program ID");
                if RoadProgram.FindSet then begin
                    "Financial Year Code" := RoadProgram."Financial Year Code";
                    "Global Dimension 1" := RoadProgram."Global Dimension 1 Code";
                    "Global Dimension 2" := RoadProgram."Global Dimension 2 Code";

                end;
            end;
        }
        field(2; "Job No."; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where(Blocked = const(" "),
                                             "Record Type" = const("Road Project"));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange("No.", "Job No.");
                if Job.FindSet then begin
                    Description := Job.Description;
                    "Road Code" := Job."Road Code";
                    Validate("Road Section No.", Job."Road Section No");
                    "Road Works Category" := Job."Road Works Category";
                    "Funding Source ID" := Job."Funding Source";
                    "Funding Agency ID" := Job."Bill-to Customer No.";
                    // "BoQ Template Code":=Job."Default BoQ Template Code";
                    // "Road Project Category":=Job."Road Project Category";
                    "Directorate ID" := Job."Directorate Code";
                    // "Department ID":=Job."Default Department";
                    "Road Class" := Job."Road Class ID";
                    /*"Constituency ID":=Job."Constituency ID";
                    "County ID":=Job."County ID"*/
                    "Starting Date" := Job."Starting Date";
                    "Ending Date" := Job."Ending Date";
                    // "Procurement Category":=Job."Default Procurement Category";
                end;

            end;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code";
        }
        field(5; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Section"."Road Section No." where("Road Code" = field("Road Code"));

            trigger OnValidate()
            begin
                RoadSection.Reset;
                RoadSection.SetRange(RoadSection."Road Code", "Road Code");
                RoadSection.SetRange(RoadSection."Road Section No.", "Road Section No.");
                if RoadSection.FindSet then begin
                    "Section Name" := RoadSection."Section Name";
                    "Start Chainage" := RoadSection."Start Chainage(KM)";
                    "End Chainage" := RoadSection."End Chainage(KM)";
                    "Total Road Section Length" := RoadSection."Total Road Length (KMs)";
                    "Workplanned Length (Km)" := RoadSection."Total Road Length (KMs)";
                    "Constituency ID" := RoadSection."Primary Constituency ID";
                    "Region ID" := RoadSection."Primary Region ID";
                    "County ID" := RoadSection."Primary County ID";



                end;
            end;
        }
        field(6; "Section Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Road Works Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Category".Code;

            trigger OnValidate()
            begin
                WorksCategory.Reset;
                WorksCategory.SetRange(Code, "Road Works Category");
                if WorksCategory.FindSet then begin
                    "Road Project Category" := WorksCategory."Road Project Category";
                    "BoQ Template Code" := WorksCategory."Default BoQ Template Code";
                    "Procurement Category" := WorksCategory."Default Procurement Category";
                end;
            end;
        }
        field(8; "Pavement Surface Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pavement Surface Type".Code;
        }
        field(9; "Funding Source ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Funding Source".Code WHERE (Blocked=CONST(No))';
            TableRelation = "Funding Source".Code where(Blocked = const(false));
        }
        field(10; "Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 20 : 20;
            InitValue = 0;
            //   MaxValue = 9999999999999;
            MinValue = 0;
        }
        field(11; "End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 20 : 20;
            //  MaxValue = 999999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Workplanned Length (Km)" := "End Chainage" - "Start Chainage";
                "Total Road Section Length" := "End Chainage" - "Start Chainage";
            end;
        }
        field(12; "Workplanned Length (Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 20 : 20;
        }
        field(13; "Budget (Cost) Excl. VAT"; Decimal)
        {
            CalcFormula = sum("Existing Road WP Activity"."Total Cost (LCY)" where("Road Work Program ID" = field("Road Work Program ID"),
                                                                                    "Job No." = field("Job No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Budget (VAT Amount)"; Decimal)
        {
            Editable = false;
        }
        field(15; "Budget (Cost) Incl. VAT"; Decimal)
        {
            CalcFormula = sum("Existing Road WP Activity"."Total Cost (LCY)" where("Road Work Program ID" = field("Road Work Program ID"),
                                                                                    "Job No." = field("Job No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Funding Agency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Funding Agency".Code';
            TableRelation = Customer."No.";
        }
        field(17; "BoQ Template Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code where("Template Type" = filter(BoQ));
        }
        field(18; "Road Project Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Studies and Surveys,Construction Works,Maitenance Works';
            OptionMembers = ,"Studies and Surveys","Construction Works","Maitenance Works";
        }
        field(19; "Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(20; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(21; "Road Class"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = Table50001.Field1;
        }
        field(22; "Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code where("County Code" = field("County ID"));
        }
        field(23; "County ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code;
        }
        field(24; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(25; "Total Road Section Length"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Total Road Section Length';
        }
        field(26; "Global Dimension 1"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Global Dimension 2"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(28; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Posted Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Planning Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Top-Down (New Works),Bottom-Up (Existing Works)';
            OptionMembers = " ","Top-Down (New Works)","Bottom-Up (Existing Works)";
        }
        field(31; "Procurement Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code;
        }
        field(32; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(33; "Starting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Financial Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code".Code;
        }
    }

    keys
    {
        key(Key1; "Road Work Program ID", "Job No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RoadSection: Record "Road Section";
        Job: Record Job;
        WorksCategory: Record "Works Category";
        RoadProgram: Record "Road Work Program";
}

