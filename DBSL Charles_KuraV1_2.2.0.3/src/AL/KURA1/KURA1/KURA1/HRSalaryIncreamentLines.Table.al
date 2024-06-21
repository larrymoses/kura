#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69059 "HR Salary Increament Lines"
{

    fields
    {
        field(1;"Batch No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where (Status=const(Active));

            trigger OnValidate()
            begin
                if Emp.Get("Employee No") then begin
                  "Employee Name" := Emp."First Name" +' '+Emp."Middle Name" +' ' +Emp."Last Name";
                  "Current Salary Scale" := Emp.Present;
                  "Current Present" := Emp."Salary Scale";
                  Emp.CalcFields(Emp."Job Title");
                  "Job Title" := Emp."Job Title";
                  if SaloIncHead.Get("Batch No") then begin

                    "Effective Start Date" := SaloIncHead."Effective Start  Date";
                    "Effective End Date" := SaloIncHead.Date;
                  end;
                end;
            end;
        }
        field(3;"Employee Name";Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Job Title";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Current Present";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Salary Pointers"."Salary Pointer";
        }
        field(6;"Current Salary Scale";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Salary Scales".Scale;
        }
        field(7;"New Present";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Pointers"."Salary Pointer" where ("Salary Scale"=field("New Salary Scale"));

            trigger OnValidate()
            begin
                 GetPayPeriod;

                 ScaleBenefits.Reset;
                 ScaleBenefits.SetRange(ScaleBenefits."Salary Scale","New Present");
                 ScaleBenefits.SetRange(ScaleBenefits."Salary Pointer","New Salary Scale");
                 if ScaleBenefits.Find('-') then
                 repeat
                  AssMatrix.Init;

                  AssMatrix."Employee No":="Employee No";
                  AssMatrix.Validate(AssMatrix."Employee No");
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=ScaleBenefits."ED Code";
                  AssMatrix.Validate(AssMatrix.Code);
                  //MESSAGE('Payroll period %1',Begindate);
                  AssMatrix."Payroll Period":="Effective Start Date";
                  AssMatrix.Amount:=ScaleBenefits.Amount;
                  if not AssMatrix.Get(AssMatrix."Employee No",AssMatrix.Type,AssMatrix.Code,AssMatrix."Payroll Period",
                  AssMatrix."Reference No") then
                  AssMatrix.Insert;

                 until ScaleBenefits.Next=0;
            end;
        }
        field(8;"New Salary Scale";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales".Scale;
        }
        field(9;"Effective Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Effective End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Batch No","Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HumanResSetup: Record "Human Resources Setup";
        Res: Record Resource;
        PostCode: Record "Post Code";
        AlternativeAddr: Record "Alternative Address";
        EmployeeQualification: Record "Employee Qualification";
        Relative: Record "Employee Relative";
        EmployeeAbsence: Record "Employee Absence";
        MiscArticleInformation: Record "Misc. Article Information";
        ConfidentialInformation: Record "Confidential Information";
        HumanResComment: Record "Human Resource Comment Line";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmployeeResUpdate: Codeunit "Employee/Resource Update";
        EmployeeSalespersonUpdate: Codeunit "Employee/Salesperson Update";
        DimMgt: Codeunit DimensionManagement;
        CauseOfAbsence: Record "Cause of Absence";
        Dates: Codeunit "HR Dates";
        SalPointer: Record "Salary Pointers";
        Scale: Record "Salary Scales";
        DateInt: Integer;
        Earnings: Record EarningsX;
        AssMatrix: Record "Assignment Matrix-X";
        Ded: Record DeductionsX;
        PayPeriod: Record "Payroll PeriodX";
        ScaleBenefits: Record "Scale Benefits";
        PeriodStartDate: Date;
        Begindate: Date;
        Emp: Record Employee;
        OK: Boolean;
        UserMgt: Codeunit "User Management";
        GTermination: Record "Grounds for Termination";
        EthnicBackground: Record "Ethnic Background";
        EmployeeBank: Record "Employee Bank AccountX";
        SaloIncHead: Record "HR Salary Increament Header";


    procedure GetPayPeriod()
    begin
         PayPeriod.Reset;
         PayPeriod.SetRange(PayPeriod."Close Pay",false);
          if PayPeriod.Find('-') then
         begin
          //PayPeriodtext:=PayPeriod.Name;
          Begindate:=PayPeriod."Starting Date";
          //MESSAGE('%1',Begindate);
         end;
    end;
}

