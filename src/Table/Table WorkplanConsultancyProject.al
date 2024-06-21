/// <summary>
/// Table Workplan Consultancy Projects (ID 99603).
/// </summary>
table 99603 "Workplan Consultancy Projects"
{

    fields
    {
        field(1; "Workplan No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Workplan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Constituency,Regional,Consolidated,Consolidated East,Consolidated West';
            OptionMembers = Constituency,Regional,Consolidated,"Consolidated East","Consolidated West";
        }
        field(3; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Consultancy Project Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Category".Code WHERE("Road Project Category" = FILTER('Survey|Study'));

            trigger OnValidate()
            begin
                WorksCategory.RESET();
                WorksCategory.SETRANGE(WorksCategory.Code, "Consultancy Project Type");
                IF WorksCategory.FINDSET() THEN BEGIN
                    Description := WorksCategory.Description;
                    "Consultancy Project Category" := WorksCategory."Consultancy Project Category";
                END;
            end;
        }
        field(6; Description; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Consultancy Project Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,ESIA Study,Topographic Survey,Traffic Census,Road Safety Audit,Design Works,Environmental Audits,Geotechnical Investigations,Technical Audits,Conditional Surveys,Feasibility Study,Monitoring and Evaluation';
            OptionMembers = " ","ESIA Study","Topographic Survey","Traffic Census","Road Safety Audit","Design Works","Environmental Audits","Geotechnical Investigations","Technical Audits","Conditional Surveys","Feasibility Study","Monitoring and Evaluation";

            trigger OnValidate()
            begin
                IF "Consultancy Project Category" = "Consultancy Project Category"::"Geotechnical Investigations" THEN
                    DIALOG.MESSAGE('Please Update the Bridge Location Details');
            end;
        }
        field(8; "Funding Source Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Region Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Funding Source Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Regular,Savings';
            OptionMembers = " ",Regular,Savings;
        }
        field(11; "Constituency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Bridge Location (KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Workplan No", "Workplan Type", "Line No", "Entry No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        RAMWorkplanLine.RESET;
        RAMWorkplanLine.SETRANGE(RAMWorkplanLine."Document No", "Workplan No");
        RAMWorkplanLine.SETRANGE(RAMWorkplanLine."Workplan Type", RAMWorkplanLine."Workplan Type"::Regional);
        IF RAMWorkplanLine.FINDSET THEN BEGIN
            "Region Code" := RAMWorkplanLine."Region Code";
            "Constituency Code" := RAMWorkplanLine."Constituency Code";
            "Funding Source Code" := RAMWorkplanLine."Global Dimension 2 Code";
            "Funding Source Type" := RAMWorkplanLine."Funding Source Type";
        END;
    end;

    var
        RAMWorkplanLine: Record "RAM Workplan Line";
        WorksCategory: Record "Works Category";
}

