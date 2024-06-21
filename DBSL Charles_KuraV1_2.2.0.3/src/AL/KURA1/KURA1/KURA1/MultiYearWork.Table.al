#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72205 "Multi_Year Work"
{

    fields
    {
        field(1; "Road Work Program ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Road Code"; Code[10])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //  RoadInventory.RESET;
                //  RoadInventory.SETRANGE(RoadInventory."Road Code","Road Code");
                //  IF RoadInventory.FINDSET THEN BEGIN
                //   Description:=RoadInventory."Link Name";
                //   END;
            end;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Road Project Category"; Option)
        {
            DataClassification = ToBeClassified;
            InitValue = "Construction Works";
            OptionCaption = ' ,Studies and Surveys,Construction Works,Maintenance Works';
            OptionMembers = " ","Studies and Surveys","Construction Works","Maintenance Works";
        }
        field(5; "Road Works Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Category".Code where("Road Project Category" = field("Road Project Category"));
        }
        field(6; "Total Budget Cost"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("G/L Budget Entry".Amount where("KeRRA Budget Code" = field("KeRRA Budget Code"),
                                                               "Budget Type 1" = filter(Original)));
            Caption = 'Total Budget Cost';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Total Project Cost"; Decimal)
        {
            CalcFormula = sum("Detailed Multi_Year Line"."Annual Projection" where("Road Work Program ID" = field("Road Work Program ID"),
                                                                                    "KeRRA Budget Code" = field("KeRRA Budget Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Global Dimension Code 2"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(9; "KeRRA Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Total Workplanned Length"; Decimal)
        {
            CalcFormula = sum("Project Road Link"."Workplanned Length(KM)" where("Global Budget Book Code" = field("Road Work Program ID"),
                                                                                  "KeRRA Budget Code" = field("KeRRA Budget Code")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Road Work Program ID", "KeRRA Budget Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // RoadWorkProgram.Reset;
        // RoadWorkProgram.SetRange(RoadWorkProgram.Code, "Road Work Program ID");
        // if RoadWorkProgram.FindSet then begin
        //     "Start Date" := RoadWorkProgram."Start Date";
        //     "End Date" := RoadWorkProgram."End Date";
        // end;
    end;

    var
        //  RoadSection: Record "Road Section";
        //RoadWorkProgram: Record "Road Work Program";
        Constituency: Record Constituency;
        WorksCategory: Record "Works Category";
        FundingSource: Record "Funding Source";
        VATProductPostingGroup: Record "VAT Product Posting Group";
        VATPostingSetup: Record "VAT Posting Setup";
        NewRoadWorkProgramPackage: Record "New Road Work Program Package";
        TotalBudgetLines: Decimal;
    //RoadInventory: Record "Road Inventory";
}

