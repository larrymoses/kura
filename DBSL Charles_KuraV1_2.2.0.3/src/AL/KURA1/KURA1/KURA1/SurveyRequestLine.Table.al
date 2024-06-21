#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72367 "Survey Request Line"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Project ID";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                if Job.Get("Project ID") then begin
                  "Project Name":=Job.Description;
                  "Directorate ID":=Job."Directorate Code";
                  Validate("Directorate ID");
                  "Department ID":=Job."Department ID";
                  Validate("Department ID");
                  "Region ID":=Job."Global Dimension 1 Code";
                  Validate("Region ID");
                  Status:=Job.Status;
                  "Workplanned Length (KM)":=Job."Workplanned Length";
                  "Project Start Date":=Job."Project Start Date";
                  end;
            end;
        }
        field(3;"Project Name";Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Region ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region),
                                                                Blocked=filter(false));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Region ID");
                if ResponsibilityCenter.FindSet then
                  begin
                    "Region Name":=ResponsibilityCenter.Name
                    end;
            end;
        }
        field(5;"Region Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;Status;Option)
        {
            Editable = false;
            FieldClass = Normal;
            OptionCaption = 'Planned,Ongoing,Completed/Under DLP,Under PBRM,Completed';
            OptionMembers = Planned,Ongoing,"Completed/Under DLP","Under PBRM",Completed;
        }
        field(7;Posted;Boolean)
        {
            CalcFormula = lookup("Survey Request Header".Posted where ("Document No."=field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"Directorate ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Directorate),
                                                                Blocked=filter(false));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Directorate ID");
                if ResponsibilityCenter.FindSet then
                  begin
                    "Directorate Name":=ResponsibilityCenter.Name
                    end;
            end;
        }
        field(9;"Department ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter("Department/Center"),
                                                                Blocked=filter(false));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Department ID");
                if ResponsibilityCenter.FindSet then
                  begin
                    "Department Name":=ResponsibilityCenter.Name
                    end;
            end;
        }
        field(10;"Directorate Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Department Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(13;"Study/Survey/Design Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,ESIA Study,Topographic Survey,Traffic Census,Road Safety Audit,Design Works,Environmental Audits';
            OptionMembers = " ","ESIA Study","Topographic Survey","Traffic Census","Road Safety Audit","Design Works","Environmental Audits";
        }
        field(14;"Workplanned Length (KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Proposed Scope of Works";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Project Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Project Duration";DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Project Location";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Project Location");
                if ResponsibilityCenter.FindSet then
                  begin
                    "Project Location Name":=ResponsibilityCenter.Name
                    end;
            end;
        }
        field(19;"Project Location Name";Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Job: Record Job;
        ResponsibilityCenter: Record "Responsibility Center";
        SurveyRequestHeader: Record "Survey Request Header";
}

