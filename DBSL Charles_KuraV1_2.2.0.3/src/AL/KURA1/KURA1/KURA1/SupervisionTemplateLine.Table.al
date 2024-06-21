#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72291 "Supervision Template Line"
{

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
            TableRelation = "Supervision Template Category"."Category ID";
        }
        field(4;"Requirement ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Maximum Weight";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Response Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supervision Response Type".Code where (Blocked=filter(false));
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
        key(Key1;"Document Type","Template ID","Category ID","Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if SupervisionResponseType.Get('YES/NO') then
        "Response Type":=SupervisionResponseType.Code;

        ProjectSupervisionTemplate.Reset;
        ProjectSupervisionTemplate.SetRange(ProjectSupervisionTemplate."Template ID","Template ID");
        ProjectSupervisionTemplate.SetRange(ProjectSupervisionTemplate."Document Type","Document Type");
        if ProjectSupervisionTemplate.FindSet then
         Type:=ProjectSupervisionTemplate.Type;
    end;

    var
        SupervisionResponseType: Record "Supervision Response Type";
        ProjectSupervisionTemplate: Record "Project Supervision Template";
}

