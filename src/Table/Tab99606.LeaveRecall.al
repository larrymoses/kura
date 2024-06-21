table 99606 "Leave Recall"
{
    Caption = 'Leave Recall';
    DataClassification = EndUserIdentifiableInformation;

    fields
    {
        field(1; "Recall No"; Code[20])
        {
            Caption = 'Recall No.';
            trigger OnValidate()
            var
                HRSetup: Record "Human Resources Setup";
                NoSeriesManagement: Codeunit NoSeriesManagement;
            begin
                HRSetup.Get();
                if "Recall No" <> xRec."Recall No" then
                    NoSeriesManagement.TestManual(HRSetup."Leave Recall Nos");
            end;
        }
        field(2; "Employee No"; Code[20])
        {
            TableRelation = Employee."No." where(Status = const(Active));
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.Get("Employee No") then begin
                    "Employee Name" := Emp.FullName();
                end;
            end;
        }
        field(3; "Application No"; Code[20])
        {
            TableRelation = "HR Leave Applications"."Application Code" where(Status = const(Released), "Employee No" = field("Employee No"), Posted = const(true));
            trigger OnValidate()
            var
                Leaveapp: Record "HR Leave Applications";
            begin
                Leaveapp.Reset();
                Leaveapp.SetRange("Application Code", "Application No");
                if Leaveapp.FindFirst() then begin
                    Rec."Leave Code" := Leaveapp."Leave Type";
                    Rec."Days Applied" := Leaveapp."Days Applied";
                    Rec."Approved Days" := Leaveapp."Approved days";
                    Rec."Start Date" := Leaveapp."Start Date";
                    Rec."End Date" := Leaveapp."End Date";
                    Rec."Approved Start Date" := Leaveapp."Start Date";
                    Rec."Application Date" := Leaveapp."Application Date";
                end;
            end;
        }
        field(4; "Employee Name"; Text[100])
        {

        }
        field(5; "Leave Code"; Code[50])
        {
            TableRelation = "Leave Types".Code;
        }
        field(6; "Days Applied"; Decimal)
        {
            MinValue = 0;
            DecimalPlaces = 0 : 0;
        }
        field(7; "Start Date"; Date)
        {

        }
        field(8; "End Date"; Date)
        {

        }
        field(9; "Application Date"; Date)
        {

        }
        field(10; "Approved Days"; Decimal)
        {
            MinValue = 0;
            DecimalPlaces = 0 : 0;
        }
        field(11; "Approved Start Date"; Date)
        {

        }
        field(12; Posted; Boolean)
        {

        }
        field(13; "Days Recalled"; Decimal)
        {
            MinValue = 0;
            DecimalPlaces = 0 : 0;
            trigger OnValidate()
            begin
                if Rec."Days Recalled" > Rec."Days Applied" then
                    Error(Text0001, Rec."Days Recalled", Rec."Days Applied");

            end;
        }
        field(14; "Recall Date From"; Date)
        {
            trigger OnValidate()
            var
                LeaveType: Record "HR Leave Types";
            begin
                LeaveType.Reset();
                LeaveType.SetRange(Code, "Leave Code");
                if LeaveType.FindFirst() then begin
                    Validate("Recall Date To", CustomFunction.BaseCalendarRemoveNonWorkingDays("Recall Date From", "Days Recalled", LeaveType."Inclusive of Holidays", LeaveType."Inclusive of Saturday", LeaveType."Inclusive of Sunday"));
                end;
            end;
        }
        field(15; "Recall Date To"; Date)
        {
            trigger OnValidate()
            var
                LeaveType: Record "HR Leave Types";
            begin
                if (Rec."Recall Date From" <> 0D) and (Rec."Recall Date To" <> 0D) then begin
                    LeaveType.Reset();
                    LeaveType.SetRange(Code, "Leave Code");
                    if LeaveType.FindFirst() then
                        CustomFunction.CheckIfEndDateIsNonWorking("Recall Date To", LeaveType."Inclusive of Holidays", LeaveType."Inclusive of Saturday", LeaveType."Inclusive of Sunday");
                    if (Rec."Recall Date From" >= Rec."Start Date") and (Rec."Recall Date From" < Rec."End Date") then
                        Message(Text02, Rec."Start Date", Rec."End Date")
                    else
                        Error(Text01, Rec."Start Date", Rec."End Date");
                end;
            end;
        }
        field(16; "Reason for Recall"; Text[200])
        {

        }
        field(17; "Document Date"; Date)
        {

        }
        field(18; "No. Series"; Code[20])
        {

        }
        field(19; "Approval Status"; Enum "App Status")
        {

        }
        field(20; "Recalled By"; Code[50])
        {

        }
    }
    keys
    {
        key(PK; "Recall No", "Application No", "Employee No")
        {
            Clustered = true;
        }
    }
    var
        Text0001: label 'The number of days %1 recalled cannot be greater than the number of %2 days Applied';
        Text01: label 'The Recall date must be between the leave dates i.e %1 and %2';
        Text02: label 'The Recall date is within the leave dates i.e %1 and %2';
        ConfirmManagement: Codeunit "Confirm Management";
        CustomFunction: Codeunit "Custom Function";

    trigger OnInsert()
    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        Rec."Document Date" := WorkDate();
        if HRSetup.Get() then begin
            HRSetup.TestField("Leave Recall Nos");
            if "Recall No" = '' then
                NoSeriesManagement.InitSeries(HRSetup."Leave Recall Nos", xRec."No. Series", 0D, "Recall No", "No. Series");
        end;
        "Recalled By" := UserId;
    end;

    Procedure PostToLedgerEntries(Recall: Record "Leave Recall")
    var
        HRLEntries: Record "HR Leave Ledger Entries";
        HRLEntries1: Record "HR Leave Ledger Entries";
        HRLEntries2: Record "HR Leave Ledger Entries";
        EntryNo: Integer;
        HRSetup: Record "Human Resources Setup";
        HRLeavePeriods: Record "HR Leave Periods";
    begin
        // if ConfirmManagement.GetResponseOrDefault('Are you sure you want to recall ' + Rec."Employee Name" + ' for ' + Format(Rec."Days Recalled") + ' Days?', true) then begin
        Recall.TestField("Days Recalled");
        Recall.TestField("Recall Date From");
        Recall.TestField("Reason for Recall");
        Recall.TestField(Posted, false);
        if Recall."Days Recalled" > Recall."Days Applied" then
            Error(Text0001, Recall."Days Recalled", Recall."Days Applied");
        if (Recall."Recall Date From" >= Recall."Start Date") and (Recall."Recall Date From" < Recall."End Date") then
            Message(Text02, Recall."Start Date", Recall."End Date")
        else
            Error(Text01, Recall."Start Date", Recall."End Date");
        if HRLEntries1.FindLast then
            EntryNo := HRLEntries1."Entry No.";
        HRLEntries.Init;
        HRLEntries."Entry No." := EntryNo + 1;
        HRLEntries."Staff No." := Recall."Employee No";
        HRLEntries."Staff Name" := Recall."Employee Name";
        HRLEntries."Leave Entry Type" := HRLEntries."leave entry type"::Positive;
        HRLEntries."Posting Date" := Recall."Recall Date From";
        HRLEntries."No. of days" := -Recall."Days Recalled";
        HRLEntries."Document No." := Recall."Recall No";
        HRLEntries."User ID" := UserId;
        HRLEntries2.Reset;
        HRLEntries2.SetRange("Document No.", Recall."Application No");
        if HRLEntries2.FindSet then
            HRLEntries."Leave Period" := HRLEntries2."Leave Period";
        HRLEntries."Leave Approval Date" := Today;
        HRLEntries."Leave Type" := Recall."Leave Code";
        //HRLEntries.
        HRLeavePeriods.Reset;
        HRLeavePeriods.SetRange(HRLeavePeriods.Closed, false);
        if HRLeavePeriods.Find('-') then begin
            HRLEntries."Leave Period" := Format(HRLeavePeriods.Code);
        end;
        HRSetup.Get();
        HRLEntries."Journal Batch Name" := HRSetup."Leave Batch";
        HRLEntries."Leave Posting Description" := 'Leave Recall: ' + Recall."Reason for Recall";
        if HRLEntries.Insert then begin
            Recall.Posted := true;
            if Recall.Modify() then begin
                NotifyEmployee(Recall);
                Message('%1 Successfuly recalled for %2 Days', Recall."Employee Name", Recall."Days Recalled");
            end;
        end;
        //  end;
    end;

    Procedure NotifyEmployee(Recall: Record "Leave Recall")
    var
        Body: text;
        Email: Codeunit Email;
        Mail: Codeunit "Email Message";
        Emp: Record Employee;
        Header: Text;
        CompanyInfo: Record "Company Information";
    begin
        Body := '';
        Header := '';
        if ConfirmManagement.GetResponseOrDefault('Would you like to notify the employee via mail?', true) then begin
            if Emp.Get(Recall."Employee No") then begin
                CompanyInfo.get();
                Header := 'LEAVE APPLICATION RECAL FOR  ' + Format(Recall."Days Recalled") + ' DAYS';
                if Emp."Company E-Mail" <> '' then begin
                    Body := '<br><br>';
                    Body += 'Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',';
                    Body += '<br><br>';
                    Body += 'This is to notify you that you have been recalled back from your leave from ' + Format(Recall."Recall Date From") + ' to ' + Format(Recall."Recall Date To") + ' for a period of ' + Format(Recall."Days Recalled") +
                                        ' Days because of the following reason:';// for the month of January 2014');
                    Body += '<br><br>';
                    Body += '<ul>' + Recall."Reason for Recall" + '</ul> <br>The days recalled will be added back to your leave days';
                    Body += '<br><br>';
                    Body += 'Kindly prepare adequately';
                    Body += '<br><br>';
                    Body += 'Thanks & Regards';
                    Body += '<br><br>';
                    Body += CompanyInfo.Name;
                    Body += '<br><br>';
                    Body += '<HR>';
                    Body += 'This is a system generated mail.';
                    Body += '<br><br>';
                    Body += 'All Enquires regarding wages should be communicated with HR';
                    Body += '<br><br>';
                    Mail.Create(Emp."Company E-Mail", Header, Body, true);
                    EMail.Send(Mail);
                end;
                //End email
            end;
        end;
    end;
}
