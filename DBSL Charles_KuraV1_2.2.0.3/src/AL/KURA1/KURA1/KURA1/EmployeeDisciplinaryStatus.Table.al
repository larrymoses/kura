#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56036 "Employee Disciplinary Status"
{
    DrillDownPageID = "Employee Disciplinary Status.";
    LookupPageID = "Employee Disciplinary Status.";

    fields
    {
        field(1; "Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Emp.Get("Employee No") then
                    "Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            end;
        }
        field(2; "Case Number"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Disciplinary Status"; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disciplinary Status Table"."Disciplinary Status";
        }
        field(4; "Start Period"; Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payroll PeriodX"."Starting Date";

            trigger OnValidate()
            begin
                "End Period" := CalcDate(Duration, "Start Period");
            end;
        }
        field(5; Duration; DateFormula)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "End Period" := CalcDate(Duration, "Start Period");
            end;
        }
        field(6; "End Period"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Stop; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Effect on Payroll"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Effect on Payroll" = true then begin
                    TestField("Disciplinary Status");
                    if Dialog.Confirm('Are you sure you want to effect deduction for  ' + "Employee Name" + '?', true) then begin
                        if DisciplinaryStatus.Get("Disciplinary Status") then begin
                            AssignmentMatrixX.Init;
                            AssignmentMatrixX.Type := AssignmentMatrixX.Type::Deduction;
                            AssignmentMatrixX.Code := DisciplinaryStatus."Deduction Code";
                            AssignmentMatrixX.Validate(AssignmentMatrixX.Code);
                            AssignmentMatrixX."Payroll Period" := "Start Period";
                            AssignmentMatrixX."Employee No" := Rec."Employee No";
                            AssignmentMatrixX.Validate(AssignmentMatrixX."Employee No");
                            AssignmentMatrixX."Effective Start Date" := "Start Period";
                            AssignmentMatrixX."Effective End Date" := "End Period";
                            AssignmentMatrixX."Next Period Entry" := true;
                            //Get deduction amount
                            case DisciplinaryStatus."Computation Method" of
                                DisciplinaryStatus."computation method"::"Flat Amount":
                                    begin
                                        AssignmentMatrixX.Amount := -DisciplinaryStatus.Amount;
                                    end;
                                DisciplinaryStatus."computation method"::Percentage:
                                    begin
                                        AssMatx.Reset;
                                        AssMatx.SetRange(Code, DisciplinaryStatus."Deductions Based On");
                                        AssMatx.SetRange("Employee No", Rec."Employee No");
                                        if AssMatx.FindLast then begin
                                            AssignmentMatrixX.Amount := AssMatx.Amount * (DisciplinaryStatus.Percentage / 100);
                                        end;
                                    end;
                                DisciplinaryStatus."computation method"::Formula:
                                    begin

                                    end;
                            end;
                            if AssignmentMatrixX.Insert(true) then begin
                                Cases.Get(Rec."Employee No", Rec."Case Number");
                                Cases."Inserted to Payroll" := true;
                                Cases.Modify();
                            end;
                        end;
                        Message('Payroll deduction Added');
                    end else begin
                        "Effect on Payroll" := xRec."Effect on Payroll";
                        Modify;
                    end;
                end else
                    if "Effect on Payroll" = false then begin
                        TestField("Disciplinary Status");
                        if Dialog.Confirm('Are you sure you want to remove deduction for  ' + "Employee Name" + '?', true) then begin
                            if DisciplinaryStatus.Get("Disciplinary Status") then begin
                                AssignmentMatrixX.Reset;
                                AssignmentMatrixX.SetRange(AssignmentMatrixX.Type, AssignmentMatrixX.Type::Deduction);
                                AssignmentMatrixX.SetRange(AssignmentMatrixX.Code, DisciplinaryStatus."Deduction Code");
                                AssignmentMatrixX.SetRange(AssignmentMatrixX."Employee No", "Employee No");
                                AssignmentMatrixX.DeleteAll;
                            end;
                        end;
                    end;
            end;
        }
    }

    keys
    {
        key(Key1; "Employee No", "Case Number", "Disciplinary Status")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Emp: Record Employee;
        DisciplinaryStatus: Record "Disciplinary Status Table";
        Cases: Record "HR Disciplinary Cases";
        ProgressWindow: Dialog;
        Filename: Text;
        // SMTPSetup: Record "Email Account";
        // SMTPMail: Codeunit Mail;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Employee: Record Employee;
        HRDiscipMemb: Record "Disciplinary Committee Members";
        HRCases: Record "HR Disciplinary Cases";
        CaseRegister: Record "Case Register";
        AssignmentMatrixX: Record "Assignment Matrix-X";
        PayPeriod: Record "Payroll PeriodX";
        CR: Record "Case Register";
        AmountDeducted: Decimal;
        AssMatx: Record "Assignment Matrix-X";
        DiscStatus: Record "Employee Disciplinary Status";
}

