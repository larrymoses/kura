#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69137 "Training Plan Header"
{

    fields
    {
        field(1;No;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Global;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Department Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(7;"Department  Name";Text[100])
        {
            CalcFormula = lookup("Responsibility Center".Name where (Code=field("Department Code")));
            FieldClass = FlowField;
        }
        field(8;"Year Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code;

            trigger OnValidate()
            begin
                if AnnualReportingCodes.Get("Year Code") then
                  "Start Date":=AnnualReportingCodes."Reporting Start Date";
                "End Date":=AnnualReportingCodes."Reporting End Date";
            end;
        }
        field(9;"Approved Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(10;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Created On";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Corporate Strategic Plan Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Total Estimated Cost";Decimal)
        {
            CalcFormula = sum("Planning Line Entry"."Planned Budget" where ("Training Plan Id"=field(No)));
            FieldClass = FlowField;
        }
        field(16;"Bugdet Available";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Budget Allocation";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Budget Utilized";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Internal Training";Decimal)
        {
            CalcFormula = sum("Planning Line Entry"."Planned Budget" where ("Training Plan Id"=field(No),
                                                                            "Training Type"=filter(Internal)));
            FieldClass = FlowField;
        }
        field(20;"External Training";Decimal)
        {
            CalcFormula = sum("Planning Line Entry"."Planned Budget" where ("Training Plan Id"=field(No),
                                                                            "Training Type"=filter(External)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //GENERATE DOCUMENT NUMBER
        if No = '' then begin
          HRSetup.Get;
          HRSetup.TestField(HRSetup."Traning Planning Nos");
          NoSeriesMgt.InitSeries(HRSetup."Traning Planning Nos",xRec."No. Series",0D,No,"No. Series");
        end;

        "Created By":=UserId;
        "Created On":=Today;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        userSetup: Record "User Setup";
        AnnualReportingCodes: Record "Annual Reporting Codes";
        PlanEntry: Record "Planning Line Entry";
}

