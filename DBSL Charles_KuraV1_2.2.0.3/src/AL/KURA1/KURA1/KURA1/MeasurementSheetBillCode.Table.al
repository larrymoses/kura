#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72189 "Measurement Sheet Bill Code"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Measurement Sheet,Contractor Notice of Works,Works Inspection,Payment Certificate';
            OptionMembers = " ","Measurement Sheet","Contractor Notice of Works","Works Inspection","Payment Certificate";
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Bill Item Category Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code where ("Bill Item Group"=const(true));

            trigger OnValidate()
            begin
                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Road Activity Categories","Bill Item Category Code");
                if not JobPlanningLine.FindSet then
                  Error('This bill %1 is not planned for',"Bill Item Category Code");
            end;
        }
        field(4;"No. of Measurement Lines";Integer)
        {
            CalcFormula = count("Measurement & Payment Line" where ("Document Type"=field("Document Type"),
                                                                    "Document No"=field("Document No"),
                                                                    "Bill Item Category Code"=field("Bill Item Category Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5;"Job No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Job."No.";
        }
        field(6;"Planning Line No";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Planning Line"."Line No." where ("Job No."=field("Job No"));

            trigger OnValidate()
            begin
                JobPlanningLine.Reset;
                JobPlanningLine.SetRange("Job No.",Rec."Job No");
                JobPlanningLine.SetRange(JobPlanningLine."Line No.","Planning Line No");
                if JobPlanningLine.FindSet then begin
                  "Bill Item Category Code":=JobPlanningLine."Road Activity Categories";
                  //MESSAGE("Bill Item Category Code");
                  //MODIFY;
                  end;
            end;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Bill Item Category Code","Job No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobPlanningLine: Record "Job Planning Line";
}

