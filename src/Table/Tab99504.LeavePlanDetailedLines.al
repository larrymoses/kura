table 99504 "Leave Plan Detailed Lines"
{
    Caption = 'Leave Plan Detailed Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            Editable = false;
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.Get(Rec."Employee No.") then begin
                    Rec."Shortcut Dimension 3 Code" := Emp."Shortcut Dimension 3";
                end;
            end;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Leave Type"; Code[50])
        {
            Caption = 'Leave Type';
            Editable = false;
        }
        field(5; "Days Applied"; Decimal)
        {
            Caption = 'No. of Days';
            trigger onvalidate()
            begin
                if Rec."Start Date" <> 0D then
                    Validate("Start Date");
            end;
        }
        field(6; "Start Date"; Date)
        {
            Caption = 'Start Date';
            trigger OnValidate()
            begin
                if "Days Applied" > 0 then begin
                    HRLeaveType.Reset();
                    HRLeaveType.SetRange(Annual, true);
                    if HRLeaveType.FindFirst() then begin
                        //Rec.Validate("End Date",Customfunction.BaseCalendarRemoveNonWorkingDays(Rec."Start Date", Rec."Days Applied", HRLeaveType."Inclusive of Holidays", HRLeaveType."Inclusive of Saturday", HRLeaveType."Inclusive of Sunday"));
                        GeneralOptions.Get;
                        HRSetup.Get;
                        if "Start Date" = 0D then begin
                            "End Date" := 0D;
                            exit;
                        end else begin
                            if DetermineIfIsNonWorking("Start Date") = true then begin
                                Error('Start date must be a working day');
                            end;
                        end;
                        NoOfWorkingDays := 0;
                        if "Days Applied" <> 0 then begin
                            if "Start Date" <> 0D then begin
                                NextWorkingDate := "Start Date";

                                repeat
                                    if not CheckDateStatusNew(HRSetup."Base Calender Code", NextWorkingDate) then
                                        NoOfWorkingDays := NoOfWorkingDays + 1;

                                    if HRLeaveType.Get("Leave Type") then begin
                                        if HRLeaveType."Inclusive of Holidays" then begin
                                            BaseCalendar.Reset;
                                            BaseCalendar.SetRange("Base Calendar Code", HRSetup."Base Calender Code");
                                            BaseCalendar.SetRange(Date, NextWorkingDate);
                                            BaseCalendar.SetRange(Nonworking, true);
                                            BaseCalendar.SetRange("Recurring System", BaseCalendar."recurring system"::"Annual Recurring");
                                            if BaseCalendar.Find('-') then begin
                                                NoOfWorkingDays := NoOfWorkingDays + 1;
                                                // MESSAGE('Holiday =%1 Day of week %2',BaseCalendar.Date,BaseCalendar.Description);
                                            end;

                                        end;

                                        if HRLeaveType."Inclusive of Saturday" then begin
                                            BaseCalender.Reset;
                                            BaseCalender.SetRange(BaseCalender."Period Type", BaseCalender."period type"::Date);
                                            BaseCalender.SetRange(BaseCalender."Period Start", NextWorkingDate);
                                            BaseCalender.SetRange(BaseCalender."Period No.", 6);

                                            if BaseCalender.Find('-') then begin
                                                NoOfWorkingDays := NoOfWorkingDays + 1;
                                                // MESSAGE('SATURDAY =%1 Day of week %2',BaseCalender."Period Start",BaseCalender."Period Name");
                                            end;
                                        end;


                                        if HRLeaveType."Inclusive of Sunday" then begin
                                            BaseCalender.Reset;
                                            BaseCalender.SetRange(BaseCalender."Period Type", BaseCalender."period type"::Date);
                                            BaseCalender.SetRange(BaseCalender."Period Start", NextWorkingDate);
                                            BaseCalender.SetRange(BaseCalender."Period No.", 7);
                                            if BaseCalender.Find('-') then begin
                                                NoOfWorkingDays := NoOfWorkingDays + 1;
                                                //  MESSAGE('Sunday =%1 Day of week %2',BaseCalender."Period Start",BaseCalender."Period Name");
                                            end;
                                        end;


                                        if HRLeaveType."Off/Holidays Days Leave" then
                                        ;

                                    end;

                                    NextWorkingDate := CalcDate('1D', NextWorkingDate);
                                until NoOfWorkingDays = "Days Applied";
                                "End Date" := NextWorkingDate - 1;
                                "End Date" := NextWorkingDate;
                            end;
                        end;
                        HumanResSetup.Reset();
                        HumanResSetup.Get();
                        HumanResSetup.TestField(HumanResSetup."Base Calender Code");
                        NonWorkingDay := false;
                        if "Start Date" <> 0D then begin
                            while NonWorkingDay = false
                              do begin
                                NonWorkingDay := CheckDateStatusNew(HumanResSetup."Base Calender Code", "End Date");
                                if NonWorkingDay then begin
                                    NonWorkingDay := false;
                                    "End Date" := CalcDate('1D', "End Date");
                                end
                                else begin
                                    NonWorkingDay := true;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        }
        field(7; "End Date"; Date)
        {
            Caption = 'End Date';
            trigger OnValidate()
            begin
                HRLeaveType.Reset();
                HRLeaveType.SetRange(Annual, true);
                if HRLeaveType.FindFirst() then
                    Rec."End Date" := Customfunction.CheckIfEndDateIsNonWorking(Rec."End Date", HRLeaveType."Inclusive of Holidays", HRLeaveType."Inclusive of Saturday", HRLeaveType."Inclusive of Sunday");
            end;
        }
        field(8; "Leave Period"; Code[10])
        {
            Editable = false;
            TableRelation = "HR Leave Periods";
        }

        field(9; Reliever; Code[50])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                Txt001: Label 'The Reliever %1 is unavailable at this time.';
            begin
                //DISPLAY RELEIVERS NAME
                if HREmp.Get(Reliever) then begin

                    //Check Reliever Availability
                    if CheckAvailability(Reliever, "Start Date", "End Date", "Leave Period") = true then
                        Error(Txt001, HREmp.FullName);

                    "Reliever Name" := HREmp.FullName;
                end;
            end;
        }
        field(10; "Reliever Name"; Text[100])
        {
        }
        field(11; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            FieldClass = Normal;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
    }
    keys
    {
        key(PK; "Document No.", "Employee No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        LeavePlanDetailedLines: Record "Leave Plan Detailed Lines";
        HRHRLeaveType: Record "HR Leave Types";
        LeaveLine: Record "HR Leave Planner Lines";
    begin
        LeavePlanDetailedLines.Reset();
        LeavePlanDetailedLines.SetRange("Document No.", Rec."Document No.");
        LeavePlanDetailedLines.SetRange("Employee No.", Rec."Employee No.");
        if LeavePlanDetailedLines.FindLast() then
            Rec."Line No." := LeavePlanDetailedLines."Line No." + 1
        else
            Rec."Line No." := 1;

        HRHRLeaveType.Reset();
        HRHRLeaveType.SetRange(Annual, true);
        if HRHRLeaveType.FindFirst() then
            Rec."Leave Type" := HRHRLeaveType.Code;
        LeaveLine.Reset();
        LeaveLine.SetRange("Application Code", Rec."Document No.");
        if LeaveLine.FindFirst() then
            Rec."Leave Period" := LeaveLine."Leave Period";
    end;

    var
        Customfunction: Codeunit "Custom Function";
        HRLeaveType: Record "HR Leave Types";
        HREmp: Record Employee;
        NoOfWorkingDays: Integer;
        NextWorkingDate: Date;
        CalendarMgmt: Codeunit "Calendar Management";
        BaseCalendar: Record "Base Calendar Change";
        BaseCalender: Record Date;
        NonWorkingDay: Boolean;
        GeneralOptions: Record "Company Information";
        HumanResSetup: Record "Human Resources Setup";
        HRSetup: Record "Human Resources Setup";
        BaseCalendarChange: Record "Base Calendar Change";
        ReturnDateLoop: Boolean;

    local procedure CheckDateStatusNew(var CalendarCode: Code[20]; Var TargetDate: Date): Boolean
    var
        BaseCalChange: Record "Base Calendar Change";
        Description: Text;
    begin
        Description := '';
        BaseCalChange.RESET;
        BaseCalChange.SETRANGE("Base Calendar Code", CalendarCode);
        IF BaseCalChange.FINDSET THEN
            REPEAT
                CASE BaseCalChange."Recurring System" OF
                    BaseCalChange."Recurring System"::" ":
                        IF TargetDate = BaseCalChange.Date THEN BEGIN
                            Description := BaseCalChange.Description;
                            EXIT(BaseCalChange.Nonworking);
                        END;
                    BaseCalChange."Recurring System"::"Weekly Recurring":
                        IF DATE2DWY(TargetDate, 1) = BaseCalChange.Day THEN BEGIN
                            Description := BaseCalChange.Description;
                            EXIT(BaseCalChange.Nonworking);
                        END;
                    BaseCalChange."Recurring System"::"Annual Recurring":
                        IF (DATE2DMY(TargetDate, 2) = DATE2DMY(BaseCalChange.Date, 2)) AND
                           (DATE2DMY(TargetDate, 1) = DATE2DMY(BaseCalChange.Date, 1))
                        THEN BEGIN
                            Description := BaseCalChange.Description;
                            EXIT(BaseCalChange.Nonworking);
                        END;
                END;
            UNTIL BaseCalChange.NEXT = 0;
        Description := '';
    end;

    procedure DetermineIfIsNonWorking(var bcDate: Date) Isnonworking: Boolean
    begin
        HRSetup.Find('-');
        HRSetup.TestField(HRSetup."Base Calender Code");
        BaseCalendarChange.SetFilter(BaseCalendarChange."Base Calendar Code", HRSetup."Base Calendar");
        BaseCalendarChange.SetRange(BaseCalendarChange.Date, bcDate);
        if BaseCalendarChange.Find('-') then begin
            if BaseCalendarChange.Nonworking = false then
                Message('Start date can only be a Working Day Date');
            exit(true);
        end;

        /*
        Customized.RESET;
        Customized.SETRANGE(Customized.Date,bcDate);
        IF Customized.FIND('-') THEN BEGIN
            IF Customized."Non Working" = TRUE THEN
            EXIT(TRUE)
            ELSE
            EXIT(FALSE);
        END;
         */

    end;

    local procedure CheckAvailability(ReliverCode: Code[20]; var StartDate: Date; var EndDate: Date; LeavePeriod: Code[10]): Boolean
    var
        LeavePlanDetailedLines: Record "Leave Plan Detailed Lines";
    begin
        LeavePlanDetailedLines.Reset();
        LeavePlanDetailedLines.SetRange("Employee No.", ReliverCode);
        LeavePlanDetailedLines.SetRange("Leave Period", LeavePeriod);
        LeavePlanDetailedLines.SetFilter("Start Date", '<=%1', StartDate);
        LeavePlanDetailedLines.SetFilter("End Date", '>=%1', EndDate);
        if LeavePlanDetailedLines.FindFirst then begin
            exit(true);
        end;
    end;
}
