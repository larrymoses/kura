#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69058 "HR Salary Increament Header"
{

    fields
    {
        field(1;"Batch No";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Batch No" <> xRec."Batch No" then begin
                  HumanResSetup.Get;
                  NoSeriesMgt.TestManual(HumanResSetup."Salary Icreament Nos");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;Descriptions;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Run By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Effective Start  Date";Date)
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = "Payroll PeriodX"."Starting Date" where (Closed=const(false));
        }
        field(7;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,Closed;
        }
        field(8;"Effective End Date";Date)
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = "Payroll PeriodX"."Starting Date" where (Closed=const(false));
        }
    }

    keys
    {
        key(Key1;"Batch No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Batch No" = '' then begin
          HumanResSetup.Get;
          HumanResSetup.TestField("Salary Icreament Nos");
          NoSeriesMgt.InitSeries(HumanResSetup."Salary Icreament Nos",xRec."No. Series",0D,"Batch No","No. Series");
        end;
        "Run By" := UserId;
        Date := Today;
    end;

    var
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

