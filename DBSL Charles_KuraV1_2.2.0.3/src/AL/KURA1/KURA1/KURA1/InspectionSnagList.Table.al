#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72322 "Inspection Snag List"
{

    fields
    {
        field(1;"Inspection No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Inspection Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Daily Works Inspection,Taking Over Inspection,End of DLP Inspection';
            OptionMembers = " ","Daily Works Inspection","Taking Over Inspection","End of DLP Inspection";
        }
        field(3;"Item No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Item Description";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Works Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Works End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Additional Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Bill Item Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field("Project ID"));
        }
        field(11;"Plan Line No";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Planning Line"."Line No." where ("Job No."=field("Project ID"),
                                                                  "Job Task No."=field("Bill Item Code"));

            trigger OnValidate()
            begin
                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.","Project ID");
                JobPlanningLine.SetRange(JobPlanningLine."Job Task No.","Bill Item Code");
                JobPlanningLine.SetRange(JobPlanningLine."Line No.","Plan Line No");
                if JobPlanningLine.FindSet then begin
                  "Bill No":=JobPlanningLine."No.";
                  "Bill Description":=JobPlanningLine.Description;
                  end;
            end;
        }
        field(12;"Bill No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"Bill Description";Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;Status;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Contractor Comments";Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Inspection No","Inspection Type","Item No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        InspectionHeadersss.Reset;
        InspectionHeadersss.SetRange(InspectionHeadersss."Inspection No","Inspection No");
        if InspectionHeadersss.FindSet then
          "Project ID":=InspectionHeadersss."Project ID";
    end;

    var
        JobTask: Record "Job Task";
        JobPlanningLine: Record "Job Planning Line";
        InspectionHeadersss: Record "Inspection Headersss";
}

