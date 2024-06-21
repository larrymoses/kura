#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72356 "RMS PC Target Line"
{

    fields
    {
        field(1;"Document No";Code[40])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Project Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Maintenance,Road Construction,Survey/Study,Structure Construction';
            OptionMembers = " ",Maintenance,"Road Construction","Survey/Study","Structure Construction";
        }
        field(3;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Project Code";Code[40])
        {
            DataClassification = ToBeClassified;
         //   TableRelation = Job."No." where (Status=filter(<>"Under PBRM"));

            trigger OnValidate()
            begin
                 Job.Reset;
                 Job.SetRange(Job."No.","Project Code");
                 if Job.FindSet then begin
                   "Project Name":=Job.Description;
                   "Workplanned Length":=Job."Workplanned Length";
                   "Progress %":=Job."% Physical Progress";
                   "Region Code":=Job."Global Dimension 1 Code";
                   "Constituency Code":=Job."Constituency ID";
                   end;
            end;
        }
        field(5;"Project Name";Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Workplanned Length";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Progress %";Decimal)
        {
            CalcFormula = lookup(Job."% Physical Progress" where ("No."=field("Project Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"Financial Year Target";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Q1 Target":="Financial Year Target"/4;
                "Q2 Target":="Financial Year Target"/4;
                "Q3 Target":="Financial Year Target"/4;
                "Q4 Target":="Financial Year Target"/4;
            end;
        }
        field(9;"Q1 Target";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Q2 Target";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Q3 Target";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Q4 Target";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Q1 Output";Decimal)
        {
            CalcFormula = sum("Job Monthly Progress"."KM of Tarmac Done" where ("Month Name"=filter('JULY'|'AUGUST'|'SEPTEMBER'),
                                                                                "Job No"=field("Project Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14;"Q2 Output";Decimal)
        {
            CalcFormula = sum("Job Monthly Progress"."KM of Tarmac Done" where ("Month Name"=filter('OCTOBER'|'NOVEMBER'|'DECEMBER'),
                                                                                "Job No"=field("Project Code")));
            FieldClass = FlowField;
        }
        field(15;"Q3 Output";Decimal)
        {
            CalcFormula = sum("Job Monthly Progress"."KM of Tarmac Done" where ("Month Name"=filter('JANUARY'|'FEBRUARY'|'MARCH'),
                                                                                "Job No"=field("Project Code")));
            FieldClass = FlowField;
        }
        field(16;"Q4 Output";Decimal)
        {
            CalcFormula = sum("Job Monthly Progress"."KM of Tarmac Done" where ("Month Name"=filter('APRIL'|'MAY'|'JUNE'),
                                                                                "Job No"=field("Project Code")));
            FieldClass = FlowField;
        }
        field(17;"Region Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Constituency Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Financial Year Output";Decimal)
        {
            CalcFormula = sum("Job Monthly Progress"."KM of Tarmac Done" where ("Job No"=field("Project Code")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Document No","Project Type","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Job: Record Job;
}

