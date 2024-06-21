#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 69020 "HR Make Leave Ledg. Entry"
{

    trigger OnRun()
    begin
    end;


    procedure CopyFromJnlLine(var InsCoverageLedgEntry: Record "HR Leave Ledger Entries"; var InsuranceJnlLine: Record "HR Journal Line")
    begin
        with InsCoverageLedgEntry do begin
            "User ID" := UserId;
            "Leave Period" := InsuranceJnlLine."Leave Period";
            "Staff No." := InsuranceJnlLine."Staff No.";
            "Staff Name" := InsuranceJnlLine."Staff Name";
            "Posting Date" := InsuranceJnlLine."Posting Date";
            "Leave Recalled No." := InsuranceJnlLine."Leave Recalled No.";
            "Leave Entry Type" := InsuranceJnlLine."Leave Entry Type";
            "Leave Type" := InsuranceJnlLine."Leave Type";
            "Leave Approval Date" := InsuranceJnlLine."Leave Approval Date";
            "Leave Type" := InsuranceJnlLine."Leave Type";
            if "Leave Approval Date" = 0D then
                "Leave Approval Date" := "Posting Date";
            "Document No." := InsuranceJnlLine."Document No.";
            "External Document No." := InsuranceJnlLine."External Document No.";
            "No. of days" := InsuranceJnlLine."No. of Days";
            "Leave Posting Description" := InsuranceJnlLine.Description;
            "Global Dimension 1 Code" := InsuranceJnlLine."Shortcut Dimension 1 Code";
            "Global Dimension 2 Code" := InsuranceJnlLine."Shortcut Dimension 2 Code";
            "Source Code" := InsuranceJnlLine."Source Code";
            "Journal Batch Name" := InsuranceJnlLine."Journal Batch Name";
            "Reason Code" := InsuranceJnlLine."Reason Code";
            Closed := SetDisposedFA(InsCoverageLedgEntry."Staff No.");
            "No. Series" := InsuranceJnlLine."Posting No. Series";
            "Leave Start Date" := InsuranceJnlLine."Leave Start Date"
        end;
    end;


    procedure CopyFromInsuranceCard(var InsCoverageLedgEntry: Record "HR Leave Ledger Entries"; var Insurance: Record "HR Leave Applications")
    begin
        /*WITH InsCoverageLedgEntry DO BEGIN
          "FA Class Code" := Insurance."FA Class Code";
          "FA Subclass Code" := Insurance."FA Subclass Code";
          "FA Location Code" := Insurance."FA Location Code";
          "Location Code" := Insurance."Location Code";
        END;*/

    end;


    procedure SetDisposedFA(FANo: Code[20]): Boolean
    var
        FASetup: Record "Human Resources Setup";
    begin
        /*FASetup.GET;
        FASetup.TESTFIELD("Insurance Depr. Book");
        IF FADeprBook.GET(FANo,FASetup."Insurance Depr. Book") THEN
          EXIT(FADeprBook."Disposal Date" > 0D)
        ELSE
          EXIT(FALSE);
         */

    end;


    procedure UpdateLeaveApp(LeaveCode: Code[20]; Status: Option)
    var
        LeaveApplication: Record "HR Leave Applications";
    begin
    end;

    procedure CloseStaffExit(Record: Record Employee)
    var
        Employee: Record Employee;
        ClearanceForm: Record "Staff Clearance";
        TerminationForm: Record "Exit Termination Grounds";
        GLSetup: Record "General Ledger Setup";
        LineCount: Integer;
        ContinueClosingQn: Label 'Are you sure you want to close the staff exit document for Employee No. %1?';
        NoTerminationGroundsErr: Label 'No termination grounds are stated for Employee No. %1.';
        NoClearanceLinesErr: Label 'There are no clearance lines for Employee No. %1.';
        NoInterviewLinesErr: Label 'There are no interview lines for Employee No. %1.';
        OutstandingBalErr: Label 'Employee No. %1 has an outstanding balance of %2 %3';
    begin
        if NOT Confirm(ContinueClosingQn, FALSE, Record."No.") then
        exit;
        ClearAll();
        Employee := Record;

        Employee.TestField("Staff Exit Code");
        Employee.TestField("Date Of Leaving");

        if Employee."Requires Exit Interview" then begin
          Employee.TestField("Exit Interview Conducted", Employee."Exit Interview Conducted"::Yes);
        end;

        if Employee."Requires Clearance" then begin
            if Employee.Balance <> 0 then Error(OutstandingBalErr, Employee."No.", GLSetup."LCY Code", Employee.Balance);
            ClearanceForm.Reset();
            ClearanceForm.SetRange("Document No.", Employee."No.");
            LineCount := 0;
            IF not ClearanceForm.FindFirst() THEN
                ERROR(NoClearanceLinesErr, Employee."No.") else begin
                LineCount := LineCount + 1;
                repeat
                    ClearanceForm.TestField(Status, ClearanceForm.Status::Cleared);
                until ClearanceForm.NEXT = 0;
            end;
        end;

        if Employee."Has Termination Grounds" then begin
            TerminationForm.Reset();
            TerminationForm.SetRange("Document No.", Employee."No.");
            IF not TerminationForm.FindFirst() THEN
                ERROR(NoTerminationGroundsErr, Employee."No.");
        end;

        if Employee."Has Termination Grounds" then begin
            Employee.Status := Employee.Status::Terminated;
            Employee."Termination Date" := Employee."Date Of Leaving";
        end else begin
            Employee.Status := Employee.Status::Inactive;
        end;
        Employee."Closed By" := UserId;
        Employee.Modify();
        Commit();
    end;
}

