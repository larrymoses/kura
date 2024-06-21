#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69060 "Director Payroll Period"
{
    DrillDownPageID = "Directors Pay Periods";
    LookupPageID = "Directors Pay Periods";

    fields
    {
        field(1;"Starting Date";Date)
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                Name := Format("Starting Date",0,'<Month Text>');
            end;
        }
        field(2;Name;Text[10])
        {
        }
        field(3;"New Fiscal Year";Boolean)
        {

            trigger OnValidate()
            begin
                TestField("Date Locked",false);
            end;
        }
        field(4;Closed;Boolean)
        {
        }
        field(5;"Date Locked";Boolean)
        {
            Editable = true;
        }
        field(19;Status;Option)
        {
            CalcFormula = lookup("Payroll Header".Status where ("Payroll Period"=field("Starting Date")));
            Editable = true;
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected;
        }
        field(50000;"Pay Date";Date)
        {
        }
        field(50001;"Close Pay";Boolean)
        {

            trigger OnValidate()
            begin
                //TESTFIELD("Close Pay",FALSE);
            end;
        }
        field(50002;"P.A.Y.E";Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where ("Payroll Period"=field("Starting Date"),
                                                                  Paye=const(true)));
            FieldClass = FlowField;
        }
        field(50003;"Basic Pay";Decimal)
        {
            CalcFormula = sum("Employee Ledger EntryX"."Basic Pay" where ("Payroll Period"=field("Starting Date")));
            FieldClass = FlowField;
        }
        field(50004;"Market Interest Rate %";Decimal)
        {
        }
        field(50005;"CMS Starting Date";Date)
        {
        }
        field(50006;"CMS End Date";Date)
        {
        }
        field(50007;"Job Book Lock Date";Date)
        {
        }
        field(50008;"Job Book Locked?";Boolean)
        {

            trigger OnValidate()
            begin
                  TestField("Job Book Lock Date");
                   TestField("Job Book Start Date");
                     TestField("Job Book End Date");
            end;
        }
        field(50009;"Job Book Start Date";Date)
        {
        }
        field(50010;"Job Book End Date";Date)
        {
        }
        field(69000;"Financial Year";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(69001;"Advocacy Message";Text[250])
        {
            Caption = 'Meeting Details';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Starting Date")
        {
            Clustered = true;
        }
        key(Key2;"New Fiscal Year","Date Locked")
        {
        }
        key(Key3;Closed)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Starting Date",Name,"Advocacy Message")
        {
        }
        fieldgroup(Brick;"Starting Date",Name,"Advocacy Message")
        {
        }
    }

    trigger OnDelete()
    begin
        TestField("Date Locked",false);
    end;

    trigger OnInsert()
    begin

        AccountingPeriod2 := Rec;
        if AccountingPeriod2.Find('>') then
          AccountingPeriod2.TestField("Date Locked",false);
    end;

    trigger OnRename()
    begin

        TestField("Date Locked",false);
        AccountingPeriod2 := Rec;
        if AccountingPeriod2.Find('>') then
         AccountingPeriod2.TestField("Date Locked",false);
    end;

    var
        AccountingPeriod2: Record "Director Payroll Period";


    procedure CreateLeaveEntitlment(var PayrollPeriod: Record "Payroll PeriodX")
    var
        AccPeriod: Record "Accounting Period";
        NextDate: Date;
        EndOfYear: Boolean;
        MaturityDate: Date;
        NextMaturityDate: Date;
        Emp: Record Employee;
        CarryForwardDays: Decimal;
    begin
        /*
        EndOfYear:=FALSE;
        NextDate:=CALCDATE('1M',"Starting Date");
        IF AccPeriod.GET(NextDate) THEN
        IF AccPeriod."New Fiscal Year" THEN
        EndOfYear:=TRUE;
        
        IF EndOfYear THEN
        BEGIN
        
        MaturityDate:=CALCDATE('1M',PayrollPeriod."Starting Date")-1;
        NextMaturityDate:=CALCDATE('1Y',MaturityDate);
        
        LeaveType.RESET;
        LeaveType.SETRANGE(LeaveType."Annual Leave",TRUE);
        IF LeaveType.FIND('-') THEN
        BEGIN
        
        Emp.RESET;
        Emp.SETRANGE(Emp.Status,Emp.Status::Active);
        IF Emp.FIND('-') THEN
        REPEAT
          IF EmpleaveCpy.GET(Emp."No.",LeaveType.Code,MaturityDate) THEN
          BEGIN
          EmpleaveCpy.CALCFIELDS(EmpleaveCpy."Total Days Taken");
          CarryForwardDays:=EmpleaveCpy.Entitlement-EmpleaveCpy."Total Days Taken";
          IF CarryForwardDays>LeaveType."Max Carry Forward Days" THEN
          CarryForwardDays:=LeaveType."Max Carry Forward Days";
          END;
        
          Empleave.INIT;
          Empleave."Employee No":=Emp."No.";
          Empleave."Leave Code":=LeaveType.Code;
          Empleave."Maturity Date":=NextMaturityDate;
          Empleave.Entitlement:=LeaveType.Days;
          Empleave."Balance Brought Forward":=CarryForwardDays;
          IF NOT Empleave.GET(Empleave."Employee No", Empleave."Leave Code",Empleave."Maturity Date") THEN
          Empleave.INSERT;
        
        UNTIL Emp.NEXT=0;
        
        
        END
        ELSE
        ERROR('You must select one leave type as annual on the leave setup');
        
        END;
        */

    end;
}

