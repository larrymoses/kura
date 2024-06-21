#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 69010 "HR Leave Jnl.-Post"
{
    TableNo = "HR Journal Line";

    trigger OnRun()
    begin
        InsuranceJnlLine.Copy(Rec);
        Code;
        Rec.Copy(InsuranceJnlLine);
    end;

    var
        Text000: label 'Do you want to post the journal lines?';
        Text001: label 'There is nothing to post.';
        Text002: label 'The journal lines were successfully posted.';
        Text003: label 'The journal lines were successfully posted. You are now in the %1 journal.';
        InsuranceJnlTempl: Record "HR Leave Journal Template";
        InsuranceJnlLine: Record "HR Journal Line";
        InsuranceJnlPostBatch: Codeunit "Leave Jnl.-Post Batch";
        TempJnlBatchName: Code[10];

    local procedure "Code"()
    begin
        InsuranceJnlTempl.Get(InsuranceJnlLine."Journal Template Name");
        InsuranceJnlTempl.TestField("Force Posting Report", false);
        //IF NOT CONFIRM(Text000,FALSE) THEN
        //EXIT;
        TempJnlBatchName := InsuranceJnlLine."Journal Batch Name";


        InsuranceJnlPostBatch.Run(InsuranceJnlLine);

        if InsuranceJnlLine."Line No." = 0 then
            Message(Text001);/*
          ELSE
            IF TempJnlBatchName = "Journal Batch Name" THEN
              MESSAGE(Text002)
            ELSE
              MESSAGE(
                Text003,
                "Journal Batch Name");
        */
        if not InsuranceJnlLine.Find('=><') or (TempJnlBatchName <> InsuranceJnlLine."Journal Batch Name") then begin
            InsuranceJnlLine.Reset;
            InsuranceJnlLine.FilterGroup := 2;
            InsuranceJnlLine.SetRange("Journal Template Name", InsuranceJnlLine."Journal Template Name");
            InsuranceJnlLine.SetRange("Journal Batch Name", InsuranceJnlLine."Journal Batch Name");
            InsuranceJnlLine.FilterGroup := 0;
            InsuranceJnlLine."Line No." := 1;
        end;

    end;

    procedure CreateLeaveLedgerEntries(LeaveApp: Record "HR Leave Applications")
    var
        LeaveGjline: record 69212;
        "LineNo.": Integer;
        HREmp: Record Employee;
        objLeaveApps: Record "HR Leave Applications";
        HRSetup: Record "Human Resources Setup";
        HRLeavePeriods: Record "HR Leave Periods";
    begin
        //if Status <> status::Released then error('Leave Must Be fully Approved!');
        // IF Posted = TRUE THEN ERROR('Leave Already posted');
        if LeaveApp."Approved days" = 0 then
            LeaveApp."Approved days" := LeaveApp."Days Applied";
        LeaveApp.TestField("Approved days");

        HRSetup.Reset;
        if HRSetup.Find('-') then begin

            LeaveGjline.Reset;
            LeaveGjline.SetRange("Journal Template Name", HRSetup."Leave Template");
            LeaveGjline.SetRange("Journal Batch Name", HRSetup."Leave Batch");
            MESSAGE('template name%1', HRSetup."Leave Template");
            MESSAGE('template name%1', HRSetup."Leave Batch");
            LeaveGjline.DeleteAll;
            //Dave
            HRSetup.TESTFIELD(HRSetup."Leave Template");
            HRSetup.TESTFIELD(HRSetup."Leave Batch");

            HREmp.Get(LeaveApp."Employee No");
            HREmp.TestField(HREmp."Company E-Mail");

            //POPULATE JOURNAL LINES

            "LineNo." := 10000;
            LeaveGjline.Init;
            LeaveGjline."Journal Template Name" := HRSetup."Leave Template";
            LeaveGjline."Journal Batch Name" := HRSetup."Leave Batch";
            LeaveGjline."Line No." := "LineNo.";
            HRLeavePeriods.Reset;
            HRLeavePeriods.SetRange(HRLeavePeriods.Closed, false);
            if HRLeavePeriods.Find('-') then begin
                LeaveGjline."Leave Period" := Format(HRLeavePeriods.Code);
            end;
            LeaveGjline."Leave Application No." := LeaveApp."Application Code";
            LeaveGjline."Document No." := LeaveApp."Application Code";
            LeaveGjline."Staff No." := LeaveApp."Employee No";
            LeaveGjline.Validate(LeaveGjline."Staff No.");
            LeaveGjline."Posting Date" := Today;
            LeaveGjline."Leave Entry Type" := LeaveGjline."leave entry type"::Negative;
            LeaveGjline."Leave Approval Date" := Today;
            LeaveGjline.Description := LeaveApp."Employee Name" + 'Leave Taken';
            LeaveGjline."Leave Type" := LeaveApp."Leave Type";
            LeaveGjline."Leave Start Date" := LeaveApp."Start Date";
            // ------------------------------------------------------------
            HRSetup.RESET;
            HRSetup.FIND('-');
            HRSetup.TestField(HRSetup."Leave Posting Period[FROM]");
            HRSetup.TestField(HRSetup."Leave Posting Period[TO]");
            // //------------------------------------------------------------
            LeaveGjline."Leave Period Start Date" := HRSetup."Leave Posting Period[FROM]";
            LeaveGjline."Leave Period End Date" := HRSetup."Leave Posting Period[TO]";
            LeaveGjline."No. of Days" := -LeaveApp."Approved days";
            if LeaveGjline."No. of Days" <> 0 then
                LeaveGjline.Insert(true);
            //Post JournaERROR('tumefika');
            LeaveGjline.Reset;
            LeaveGjline.SetRange("Journal Template Name", HRSetup."Leave Template");
            LeaveGjline.SetRange("Journal Batch Name", HRSetup."Leave Batch");
            if LeaveGjline.FindFirst() then begin
                Codeunit.Run(Codeunit::"HR Leave Jnl.-Post", LeaveGjline);
            end;
            objLeaveApps.RESET;
            objLeaveApps.SETRANGE("Application Code", LeaveApp."Application Code");
            IF objLeaveApps.FindFirst() THEN BEGIN
                objLeaveApps.Posted := TRUE;
                objLeaveApps.MODIFY;
            END;


            LeaveApp.Posted := TRUE;
            //MODIFY;

            if HREmp.Get(LeaveApp."Employee No") then begin
                HREmp."Leave Status" := HREmp."leave status"::"On Leave"
            end;

            // NotifyApplicant;
        end;
    end;
}

