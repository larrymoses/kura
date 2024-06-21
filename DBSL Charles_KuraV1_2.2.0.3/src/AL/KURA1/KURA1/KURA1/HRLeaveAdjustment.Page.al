#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69211 "HR Leave Adjustment"
{
    ApplicationArea = Basic;
    AutoSplitKey = false;
    DelayedInsert = true;
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Worksheet;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SaveValues = true;
    ShowFilter = true;
    SourceTable = "HR Journal Line";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            field(CurrentJnlBatchName;CurrentJnlBatchName)
            {
                ApplicationArea = Basic;
                Caption = 'Batch Name';
                Lookup = true;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    CurrPage.SaveRecord;

                    //Rec.RESET;

                    InsuranceJnlManagement.LookupName(CurrentJnlBatchName,Rec);
                    CurrPage.Update(false);
                end;

                trigger OnValidate()
                begin

                    InsuranceJnlManagement.CheckName(CurrentJnlBatchName,Rec);
                      CurrentJnlBatchNameOnAfterVali;
                end;
            }
            repeater(Control1102755000)
            {
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Leave Period";"Leave Period")
                {
                    ApplicationArea = Basic;
                }
                field("Staff No.";"Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Name";"Staff Name")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Type";"Leave Type")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date";"Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Entry Type";"Leave Entry Type")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Application No.";"Leave Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Days";"No. of Days")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Leave Period Start Date";"Leave Period Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Period End Date";"Leave Period End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Post Adjustment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Adjustment';
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        //IF ISEMPTY THEN EXIT;

                        //RESET;
                        //SETRANGE("Journal Template Name",'ISSUE');
                        //SETRANGE("Journal Batch Name",'LEAVE');
                        //IF FIND('-') THEN BEGIN
                        Codeunit.Run(Codeunit::"HR Leave Jnl.-Post",Rec);

                        //END;

                        CurrentJnlBatchName := GetRangemax("Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
                action("Batch Allocation")
                {
                    ApplicationArea = Basic;
                    Image = Batch;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        
                        AllocationDone:=false;
                        
                        HRJournalBatch.Reset;
                        HRJournalBatch.Get("Journal Template Name","Journal Batch Name");
                        
                        //GET THE CURRENT LEAVE PERIOD
                        HRLeavePeriods.Reset;
                        //HRLeavePeriods.SETRANGE(,TRUE);
                        HRLeavePeriods.SetRange(HRLeavePeriods.Closed,false);
                        HRLeavePeriods.Find('-');
                        
                        //WE ARE ALLOCATING FOR ACTIVE EMPLOYEES ONLY
                        HREmp.Reset;
                        HREmp.SetRange(HREmp.Status,HREmp.Status::Active);
                        HREmp.FindFirst;
                        HRLeaveTypes.Reset;
                        HRLeaveTypes.FindFirst;
                            begin
                             repeat
                        
                                      //CHECK IF ALLOCATION OF CURRENT LEAVE TYPE FOR THE CURRENT PERIOD AND FOR CURRENT EMPLOYEE HAS BEEN DONE
                                      HRLeaveLedger.SetRange(HRLeaveLedger."Staff No.",HREmp."No.");
                                      HRLeaveLedger.SetRange(HRLeaveLedger."Leave Type",HRLeaveTypes.Code);
                                      HRLeaveLedger.SetRange(HRLeaveLedger."Leave Entry Type",HRJournalBatch.Type);
                                      HRLeaveLedger.SetRange(HRLeaveLedger."Leave Period",Format(HRLeavePeriods.Starts));
                                      if not HRLeaveLedger.Find('-') then
                        
                                      OK:=CheckGender(HREmp,HRLeaveTypes);
                        
                                      if OK then
                        
                                        begin
                                            //INSERT INTO JOURNAL
                                             Init;
                                            "Journal Template Name":="Journal Template Name";
                                            "Journal Batch Name":="Journal Batch Name";
                                            "Line No.":="Line No."+1000;
                                            "Leave Period":=Format(HRLeavePeriods.Starts);
                                            "Staff No.":=HREmp."No.";
                                             Validate("Staff No.");
                                            "Posting Date":=Today;
                                             Description:=HRJournalBatch."Posting Description";
                                            "Leave Entry Type":=HRJournalBatch.Type;
                                            "Leave Type":=HRLeaveTypes.Code;
                                            /* IF HRLeaveTypes.Code='ANNUAL' THEN BEGIN
                                             IF HREmp.GET("Staff No.") THEN BEGIN
                                             Grades.RESET;
                                             Grades.SETRANGE(Grades."Salary Grade",HREmp.Grade);
                                             IF Grades.FIND('-') THEN BEGIN
                                             "No. of Days":=Grades."Leave Days";
                                             END
                                             END
                                             END ELSE*/
                                            "No. of Days":=HRLeaveTypes.Days;
                                            "Leave Period Start Date":=HRLeavePeriods.Starts;
                                            "Leave Period End Date":=HRLeavePeriods.Ends;
                                            "Document No.":='Allocation';
                                             Insert();
                        
                                      /*IF (HREmp."Leave Balance"<>0) AND (HRLeaveTypes."Max Carry Forward Days"<>0) THEN BEGIN
                                        IF CarryOverAll THEN BEGIN
                                            CarryForwardLeave:=HREmp."Leave Balance"
                                        END ELSE
                                        BEGIN
                                         IF HREmp."Leave Balance">=HRLeaveTypes."Max Carry Forward Days" THEN
                                            CarryForwardLeave:=HRLeaveTypes."Max Carry Forward Days"
                                           ELSE
                                           CarryForwardLeave:=HREmp."Leave Balance";
                        
                                        END;
                                            INIT;
                                            "Journal Template Name":="Journal Template Name";
                                            "Journal Batch Name":="Journal Batch Name";
                                            "Line No.":="Line No."+1000;
                                            "Leave Period":=FORMAT(HRLeavePeriods.Starts);
                                            "Staff No.":=HREmp."No.";
                                             VALIDATE("Staff No.");
                                            "Posting Date":=TODAY;
                                             Description:=HRJournalBatch."Posting Description";
                                            "Leave Entry Type":="Leave Entry Type"::Reimbursement;
                                            "Leave Type":=HRLeaveTypes.Code;
                                            "No. of Days":=CarryForwardLeave;
                                            "Leave Period Start Date":=HRLeavePeriods.Starts;
                                            //"Leave Period End Date":=HRLeavePeriods.Ends;
                                            "Document No.":='N/A';
                                             IF CarryForwardLeave<>0 THEN
                                             INSERT();
                        
                                      END;  */
                                            AllocationDone:=true;
                        
                                        end;
                        
                        
                                      //UNTIL HRLeaveTypes.NEXT=0;
                        
                                      //HRLeaveTypes.FINDFIRST;
                        
                              until HREmp.Next=0;
                            end;
                        HRLeaveTypes.FindFirst;
                        
                        if not AllocationDone then
                        Message('Allocation of leave days for '+Format(HRLeavePeriods.Starts)+
                         ' period has already been done for all ACTIVE employees');

                    end;
                }
                action("Reimbursement Adjustment")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        //Get Current Year
                        HRLeavePeriods.Reset;
                        //HRLeavePeriods.SETRANGE(HRLeavePeriods."Reimbursement Clossing Date",TRUE);
                        HRLeavePeriods.SetRange(HRLeavePeriods.Closed,false);
                        if HRLeavePeriods.Find('-') then
                        StartDate:= HRLeavePeriods.Starts;
                           if Today<=(StartDate) then
                          ;// ERROR(Text0001);

                        HRLeavePeriods.Reset;
                        //HRLeavePeriods.SETRANGE(HRLeavePeriods."New Fiscal Year",TRUE);
                        HRLeavePeriods.SetRange(HRLeavePeriods.Closed,false);
                        if HRLeavePeriods.Find('-') then begin
                                                //CHECK IF ALLOCATION OF CURRENT LEAVE TYPE FOR THE CURRENT PERIOD AND FOR CURRENT EMPLOYEE HAS BEEN DONE
                         HRLeaveLedger.SetRange("Leave Entry Type",HRLeaveLedger."leave entry type"::Reimbursement);
                         HRLeaveLedger.SetRange(HRLeaveLedger."Leave Period",Format(HRLeavePeriods.Starts));
                          if  HRLeaveLedger.Find('-') then
                               begin
                                 repeat

                               //INSERT INTO JOURNAL
                                Init;
                                "Journal Template Name":="Journal Template Name";
                                "Journal Batch Name":="Journal Batch Name";
                                "Line No.":="Line No."+1000;
                                "Leave Period":=Format(HRLeavePeriods.Starts);
                                "Staff No.":=HRLeaveLedger."Staff No.";
                                Validate("Staff No.");
                                "Posting Date":=Today;
                                Description:='Reimbursement Rerversal as at '+Format(StartDate);
                                "Leave Entry Type":="leave entry type"::Reimbursement;
                                "Leave Type":=HRLeaveLedger."Leave Type";
                                "No. of Days":=-HRLeaveLedger."No. of days";
                                "Leave Period Start Date":=HRLeavePeriods.Starts;
                                //"Leave Period End Date":=HRLeavePeriods.Ends;
                                "Document No.":='N/A';
                                Insert();
                             until HRLeaveLedger.Next=0;
                           end;
                         end;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        JnlSelected: Boolean;
        InsuranceJnlManagement: Codeunit LeaveJnlManagement;
    begin

        OpenedFromBatch := ("Journal Batch Name" <> '') and ("Journal Template Name" = '');
        if OpenedFromBatch then begin
          CurrentJnlBatchName := "Journal Batch Name";
          InsuranceJnlManagement.OpenJournal(CurrentJnlBatchName,Rec);
          exit;
        end;
        InsuranceJnlManagement.TemplateSelection(Page::"HR Leave Journal Lines",Rec,JnlSelected);
        if not JnlSelected then
          Error('');
        InsuranceJnlManagement.OpenJournal(CurrentJnlBatchName,Rec);
    end;

    var
        HRLeaveTypes: Record "HR Leave Types";
        HREmp: Record Employee;
        HRLeaveLedger: Record "HR Leave Ledger Entries";
        InsuranceJnlManagement: Codeunit LeaveJnlManagement;
        ReportPrint: Codeunit "Test Report-Print";
        CurrentJnlBatchName: Code[30];
        InsuranceDescription: Text[30];
        FADescription: Text[30];
        ShortcutDimCode: array [8] of Code[20];
        OpenedFromBatch: Boolean;
        HRLeavePeriods: Record "HR Leave Periods";
        AllocationDone: Boolean;
        HRJournalBatch: Record "HR Leave Journal Batch";
        OK: Boolean;
        OldHrLeaveLedger: Record "HR Leave Ledger Entries";
        CarryForwardLeave: Decimal;
        StartDate: Date;
        Text0001: label 'Reversal cannot be done before the date of Reimbursement expiry';
        Grades: Record "Salary Scales2";


    procedure CheckGender(Emp: Record Employee;LeaveType: Record "HR Leave Types") Allocate: Boolean
    begin

        //CHECK IF LEAVE TYPE ALLOCATION APPLIES TO EMPLOYEE'S GENDER

        if Emp.Gender=Emp.Gender::Male then begin
         if LeaveType.Gender=LeaveType.Gender::Female then
         Allocate:=true;
        end;

        if Emp.Gender=Emp.Gender::" " then begin
         if LeaveType.Gender=LeaveType.Gender::Male then
         Allocate:=true;
        end;

        if LeaveType.Gender=LeaveType.Gender::" " then
        Allocate:=true;
        exit(Allocate);

        if Emp.Gender<>LeaveType.Gender then
        Allocate:=false;

        exit(Allocate);
    end;

    local procedure CurrentJnlBatchNameOnAfterVali()
    begin
        CurrPage.SaveRecord;
        InsuranceJnlManagement.SetName(CurrentJnlBatchName,Rec);
        CurrPage.Update(false);
    end;


    procedure CarryOverAll() CarryOver: Boolean
    begin
    end;
}

