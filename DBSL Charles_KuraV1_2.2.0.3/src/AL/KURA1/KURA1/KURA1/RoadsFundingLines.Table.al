#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 52025 "Roads Funding Lines"
{

    fields
    {
        field(1; "Project No."; Code[20])
        {
            // DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Year Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Year Codes";

            trigger OnValidate()
            begin
                if FundingYear.Get("Year Code") then begin
                    Description := FundingYear.Description;
                end;
            end;
        }
        field(4; Description; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Budget Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Budget End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Funding Customer"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Funding Class" = const(Grant));
        }
        field(9; "Funding Currency"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(10; "Approved Funding Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Job No"; Code[50])
        {
            CalcFormula = lookup(Job."No." where("Road Project No" = field("Project No."),
                                                  "Year Code" = field("Year Code")));
            FieldClass = FlowField;
        }
        field(12; "Job Status"; Option)
        {
            CalcFormula = lookup(Job.Status where("Road Project No" = field("Project No."),
                                                   "Year Code" = field("Year Code")));
            FieldClass = FlowField;
            OptionCaption = 'Planning,Quote,Open,Completed';
            OptionMembers = Planning,Quote,Open,Completed;
        }
    }

    keys
    {
        key(Key1; "Project No.", "Line No", "Year Code", "Funding Customer", "Funding Currency")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FundingYear: Record "Funding Year Codes";
}

