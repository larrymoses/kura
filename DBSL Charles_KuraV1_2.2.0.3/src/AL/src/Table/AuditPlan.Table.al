#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95192 "Audit Plan"
{

    fields
    {
        field(1;"Audit Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Audit Plan Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Audit Plan,Project Audit Plan';
            OptionMembers = " ","Internal Audit Plan","Project Audit Plan";
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Year Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code".Code;

            trigger OnValidate()
            begin
                FinancialYearCode.Reset;
                FinancialYearCode.SetRange(Code,"Year Code");
                if FinancialYearCode.FindSet then
                  begin
                    "Planning Start Date":=FinancialYearCode."Starting Date";
                    "Planning End Date":=FinancialYearCode."Ending Date";
                    end;
                Description:=UpperCase(COMPANYNAME)+' '+"Year Code"+' '+ 'Annual Audit Plan';
            end;
        }
        field(5;"Planning Start Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Planning End Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Corporate Strategic Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(8;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange("No.","Project ID");
                if Job.FindSet then begin
                  "Project Name":=Job.Description;
                  end;
            end;
        }
        field(9;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Overall Purpose";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Internal Audit Charter ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Internal Audit Charter".Code;
        }
        field(13;"Chief Audit Executive ID";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person),
                                                  Blocked=filter(false));
        }
        field(14;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"No. Of Budgeted New Audit Proj";Integer)
        {
            CalcFormula = count("Audit Plan Line" where ("Engagement Category"=filter("New Audit")));
            Description = 'No. of Budgeted New Audit Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16;"No. Of Budgeted WIP Audit Proj";Integer)
        {
            CalcFormula = count("Audit Plan Line" where ("Engagement Category"=filter("Work In Process")));
            Description = 'No. of Budgeted WIP Audit Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17;"No. Of Budgeted Audit Follow-u";Integer)
        {
            CalcFormula = count("Audit Plan Line" where ("Engagement Category"=filter("Audit Follow-up")));
            Description = 'No. of Budgeted  Audit Follow-up Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(19;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20;"Created Datetime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(22;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Audit Plan ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Document Date":=Today;
        Status:=Status::Open;

        "Created By":=UserId;
        "Created Datetime":=CreateDatetime(Today,Time);


        if "Audit Plan ID"='' then begin
          if "Audit Plan Type"="audit plan type"::"Internal Audit Plan" then begin
          AuditAssuranceSetup.Get;
          AuditAssuranceSetup.TestField("Audit Plan Nos.");
          NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Plan Nos.",xRec."No. Series",Today,"Audit Plan ID","No. Series");
          end;
          end;

        if "Audit Plan ID"='' then begin
          if "Audit Plan Type"="audit plan type"::"Project Audit Plan" then begin
          AuditAssuranceSetup.Get;
          AuditAssuranceSetup.TestField("Audit Plan Nos.");
          NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Plan Nos.",xRec."No. Series",Today,"Audit Plan ID","No. Series");
          end;
          end;
    end;

    var
        FinancialYearCode: Record "Financial Year Code";
        Job: Record Job;
        AuditAssuranceSetup: Record "Audit & Assurance Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
}

