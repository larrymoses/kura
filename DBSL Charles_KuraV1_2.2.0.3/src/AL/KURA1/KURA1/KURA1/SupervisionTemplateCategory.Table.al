#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72290 "Supervision Template Category"
{
    DrillDownPageID = "Supervision Template Categorie";
    LookupPageID = "Supervision Template Categorie";

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Project Checklist Template,Project Evaluation Template';
            OptionMembers = " ","Project Checklist Template","Project Evaluation Template";
        }
        field(2;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Category ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Requirements";Integer)
        {
            CalcFormula = count("Supervision Template Line" where ("Category ID"=field("Category ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;"Total Weight";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Works Inspection,Lab Works,Survey Works';
            OptionMembers = " ","Works Inspection","Lab Works","Survey Works";
        }
    }

    keys
    {
        key(Key1;"Document Type","Template ID","Category ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ProjectSupervisionTemplate.Reset;
        ProjectSupervisionTemplate.SetRange(ProjectSupervisionTemplate."Template ID","Template ID");
        if ProjectSupervisionTemplate.FindSet then
          begin
            Type:=ProjectSupervisionTemplate.Type;
            end;
    end;

    var
        ProjectSupervisionTemplate: Record "Project Supervision Template";
}

