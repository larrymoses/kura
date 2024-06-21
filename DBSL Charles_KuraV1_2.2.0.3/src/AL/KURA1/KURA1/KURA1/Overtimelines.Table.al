#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69127 "Overtime lines"
{

    fields
    {
        field(1;"EmpNo.";Code[10])
        {
        }
        field(2;Day;Date)
        {
        }
        field(3;"Start Time";Time)
        {

            trigger OnValidate()
            begin

                  TestField(Day);
                  TestField("Overtime Type");

                  if ("End Time"<>0T) and ("Start Time"<>0T) then
                  value:=("End Time"-"Start Time");

                  if value<>0 then
                    Hours:=value/3600000 ;
                Validate("Overtime Type");
            end;
        }
        field(4;"End Time";Time)
        {

            trigger OnValidate()
            begin

                  TestField(Day);
                  TestField("Overtime Type");

                  if "End Time"<"Start Time" then
                    Error('End Time can not be less than the start time enter right time');

                  if "End Time"="Start Time" then
                    Error('Time to can not beequal to time from enter right time');
                    if ("End Time"<>0T) and ("Start Time"<>0T) then
                  value:="End Time"-"Start Time";
                  if value<>0 then
                   Hours:= value/3600000;
                  Validate("Overtime Type");
            end;
        }
        field(5;"Work Done";Text[150])
        {
        }
        field(6;"Application Code";Code[10])
        {
        }
        field(13;"Overtime Type";Code[20])
        {
            TableRelation = "Overtime Type Rates"."Overtime Type";

            trigger OnValidate()
            begin
                if TypeRates.Get("Overtime Type") then begin
                  "Overtime Rate" := TypeRates."Overtime Rate";
                end;
                HRSetup.Get;
                AssMatrixX.SetRange(AssMatrixX.Code,HRSetup."Basic Salary Code");
                AssMatrixX.SetRange(AssMatrixX."Employee No","EmpNo.");
                if AssMatrixX.FindLast then begin
                  "Employee Basic Pay" := AssMatrixX.Amount;
                  "Overtime Amount" := (AssMatrixX.Amount / 30) * "Overtime Rate" * ROUND((Hours / 24),0.1,'>')
                end;
            end;
        }
        field(14;Hours;Decimal)
        {
        }
        field(15;"Overtime Rate";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Overtime Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Employee Basic Pay";Decimal)
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee.Basic where ("No."=field("EmpNo."));
        }
    }

    keys
    {
        key(Key1;"Application Code","EmpNo.",Day,"Start Time")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Overtim: Record "Overtime Header";
        OvertimD: Record "Overtime lines";
        value: Decimal;
        TypeRates: Record "Overtime Type Rates";
        AssMatrixX: Record "Assignment Matrix-X";
        HRSetup: Record "Human Resources Setup";
}

