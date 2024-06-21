#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69215 "HR Leave Periods"
{
    ApplicationArea = Basic;
    Editable = true;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Leave Periods";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Starts;Starts)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Ends;Ends)
                {
                    ApplicationArea = Basic;
                }
                field(Closed;Closed)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Locked;Locked)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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
            group(Functions)
            {
                Caption = 'Functions';
                action("Close Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Close Period';
                    Image = ClosePeriod;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        //24/9/2020 Muraya
                        HRLeaveTypes.Get('ANNUAL');
                        fnGetOpenPeriod;

                        Question := 'Are you sure you want to close the' +' '+ HRLeavePeriods.Description +' '+ 'period?';

                        Answer := Dialog.Confirm(Question, false);
                        if Answer=true then
                        begin

                                CurrentYear  := Date2dmy(dtOpenPeriod,3);
                                dtNewPeriod  := CalcDate('1Y', dtOpenPeriod);
                                intNewYear   := Date2dmy(dtNewPeriod,3);
                                PeriodStartDate:= dtNewPeriod;
                                NewPeriodRange:=Format(CurrentYear+1);//+FORMAT('/')+FORMAT(intNewYear);

                                //Get leave balances for active employees
                                HREmp.Reset;
                                HREmp.SetRange(HREmp.Status,HREmp.Status::Active);
                                //HREmp.SETRANGE(HREmp."No.",'780');
                                HREmp.Find('-');

                                //Get the last number in the leave ledger table
                                HRLeaveLedger.Reset;
                                if HRLeaveLedger.Find('+') then
                                  begin
                                    LineNo:=HRLeaveLedger."Entry No.";
                                  end else begin
                                    LineNo:=0;
                                  end;
                                repeat     //*********start HRLeaveTypes loop
                                repeat     //*********start HREmp loop
                                    begin

                                                  with HRLeaveLedger do

                                                  begin
                                                     Init;
                                                     "Entry No.":= LineNo + 1;
                                                     "Leave Period":=Format(NewPeriodRange);
                                                     "Staff No.":=HREmp."No.";
                                                     "Staff Name":=HREmp.FullName;
                                                     "Posting Date":=Today;
                                                     "Leave Entry Type":="leave entry type":: Reimbursement;
                                                     "Leave Approval Date":=Today;
                                                     "Document No.":='OPENING BAL';
                                                     "Leave Posting Description":='Reimbursed Leave Days';
                                                     "User ID":=UserId;
                                                     "Journal Batch Name":='N/A';
                                                     "Leave Type":='ANNUAL';


                                                      //CHECK DAYS TO REIMBURSE
                                                     HREmp.Reset;
                                                     HREmp.SetFilter(HREmp."Leave Type Filter",'ANNUAL');
                                                     //HREmp.SETFILTER(HREmp."No.",'%1','780');
                                                     HREmp.CalcFields(HREmp."Allocated Leave Days",HREmp."Leave Outstanding Bal");
                                                     HREmp.Validate(HREmp."Allocated Leave Days");
                                                     HRLeaveTypes.Reset;
                                                     HRLeaveTypes.SetRange(Code,'ANNUAL');
                                                     HREmp.SetFilter(HREmp."Date Filter",'%1..%2',20210107D,20220630D);
                                                     //HREmp.SETRANGE(HREmp."No.",'780');
                                                     if HRLeaveTypes.Find('-') then
                                                     if HREmp."Leave Outstanding Bal">  HRLeaveTypes."Max Carry Forward Days" then
                                                     "No. of days":= HRLeaveTypes."Max Carry Forward Days"
                                                     else
                                                     "No. of days":=HREmp."Leave Outstanding Bal";
                                                     if "No. of days">0 then
                                                     Insert;

                                                     HRLeaveLedger.Reset;
                                                     if HRLeaveLedger.Find('+') then
                                                     begin
                                                       LineNo:=HRLeaveLedger."Entry No.";
                                                     end else begin
                                                       LineNo:=0;
                                                     end;

                                                  end;

                                            //Annual leave allocation
                                              with HRLeaveLedger do
                                                  begin
                                                     Init;
                                                     "Entry No.":= LineNo + 1;
                                                     "Leave Period":=Format(NewPeriodRange);
                                                     "Staff No.":=HREmp."No.";
                                                     "Staff Name":=HREmp.FullName;
                                                     "Posting Date":=Today;
                                                     "Leave Entry Type":="leave entry type"::Positive;
                                                     "Leave Approval Date":=20220107D;
                                                     "Document No.":='OPENING BAL';
                                                     "Leave Posting Description":='Annual Leave Allocation';
                                                     "User ID":=UserId;
                                                     "Journal Batch Name":='N/A';
                                                     "Leave Type":='ANNUAL';
                                                     HRLeaveTypes.Reset;
                                                     HRLeaveTypes.SetRange(Code,'ANNUAL');
                                                     if HRLeaveTypes.Find('-') then
                                                     "No. of days":= HRLeaveTypes.Days;

                                                     Insert;

                                                     HRLeaveLedger.Reset;
                                                     if HRLeaveLedger.Find('+') then
                                                     begin
                                                       LineNo:=HRLeaveLedger."Entry No.";
                                                     end else begin
                                                       LineNo:=0;
                                                     end;

                                                  end;



                                        end;
                                until HREmp.Next=0;          //*********End HREmp loop
                                until HRLeaveTypes.Next = 0; //*********End HRLeaveTypes loop

                               //Mark Leave Ledger Entries for period being closed as 'closed'
                                HRLeaveLedger.Reset;
                               //HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Period",FORMAT(dtOpenPeriod)); //we use dtOpenPeriod because positive adjustments were made using it
                               HRLeaveLedger.SetFilter(HRLeaveLedger."Leave Period",'<>%1',HRLeaveLedger."Leave Period",NewPeriodRange);
                               if HRLeaveLedger.Find('-') then
                                   begin
                                     repeat
                                      //HRLeaveLedger.Closed:=TRUE;
                                      //HRLeaveLedger.MODIFY;
                                      until HRLeaveLedger.Next=0;
                                   end;

                                //Update the Period as Closed
                                HRLeavePeriods.Reset;
                                HRLeavePeriods.SetRange(HRLeavePeriods.Starts,dtOpenPeriod);
                                HRLeavePeriods.SetRange(HRLeavePeriods.Closed,false);
                                if HRLeavePeriods.Find('-') then

                                begin
                                   HRLeavePeriods.Closed:=true;
                                   HRLeavePeriods.Modify;
                                end;
                                //Enter a New Period
                                with HRLeavePeriods do
                                begin
                                    Init;
                                    Code:=intNewYear;
                                    Starts:=PeriodStartDate;
                                    Ends:=CalcDate('1Y', PeriodStartDate);
                                    "Closed By":=UserId;
                                    Description:=Format(intNewYear)+'-'+'Leave Period';
                                    Closed :=false;
                                    Insert;
                                end;


                        Message ('Leave period closing and reimbursement has been done successfully');
                        end else begin
                        Message('You have selected NOT to Close the period');
                        end;
                    end;
                }
                action("Print Leave Reimbursements Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Leave Reimbursements Report';
                    Enabled = false;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                                HRLeaveLedger.SetFilter(HRLeaveLedger."Leave Posting Description",'Reimbursed Leave Days');
                                HRLeaveLedger.SetFilter(HRLeaveLedger."Leave Period",Format(intNewYear));
                                Report.Run(39003938,true,false,HRLeaveLedger);
                    end;
                }
                action("Re-Open Leave Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open Leave Period';
                    Image = ReopenPeriod;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        CurrPage.SetSelectionFilter(HRLeavePeriods);
                        if HRLeavePeriods.Find('-') then
                        begin
                         HRLeavePeriods.Closed:=false;
                         HRLeavePeriods.Modify;
                        end;
                    end;
                }
                action(Action1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Close Period';
                    Image = ClosePeriod;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        
                        fnGetOpenPeriod;
                        
                        Question := 'Are you sure you want to close the' +' '+ HRLeavePeriods.Description +' '+ 'period?';
                        
                        Answer := Dialog.Confirm(Question, false);
                        if Answer=true then
                        begin
                        
                                CurrentYear  := Date2dmy(dtOpenPeriod,3);
                                dtNewPeriod  := CalcDate('1Y', dtOpenPeriod);
                                intNewYear   := Date2dmy(dtNewPeriod,3);
                                PeriodStartDate:= dtNewPeriod;
                        
                        
                                //Get leave types for which carry forward is allowed
                               /* HRLeaveTypes.RESET;
                                HRLeaveTypes.SETRANGE(HRLeaveTypes."Carry Forward Allowed",TRUE);
                                HRLeaveTypes.FIND('-');
                                */
                                //Get leave balances for active employees
                                HREmp.Reset;
                                HREmp.SetRange(HREmp.Status,HREmp.Status::Active);
                                HREmp.Find('-');
                        
                                //Get the last number in the leave ledger table
                                HRLeaveLedger.Reset;
                                if HRLeaveLedger.Find('+') then
                                  begin
                                    LineNo:=HRLeaveLedger."Entry No.";
                                  end else begin
                                    LineNo:=0;
                                  end;
                                repeat     //*********start HRLeaveTypes loop
                                repeat     //*********start HREmp loop
                                    begin
                        
                                                  with HRLeaveLedger do
                        
                                                  begin
                                                     Init;
                                                     "Entry No.":= LineNo + 1;
                                                     "Leave Period":=Format(intNewYear);
                                                     "Staff No.":=HREmp."No.";
                                                     "Staff Name":=HREmp.FullName;
                                                     "Posting Date":=Today;
                                                     "Leave Entry Type":="leave entry type":: Reimbursement;
                                                     "Leave Approval Date":=Today;
                                                     "Document No.":='OPENING BAL';
                                                     "Leave Posting Description":='Reimbursed Leave Days';
                                                     "User ID":=UserId;
                                                     "Journal Batch Name":='LEAVE';
                                                     "Leave Type":=HRLeaveTypes.Code;
                                                     HREmp.SetFilter(HREmp."Leave Type Filter",HRLeaveTypes.Code);
                        
                                                     HREmp.CalcFields(HREmp."Allocated Leave Days",HREmp."Leave Outstanding Bal");
                                                     HREmp.Validate(HREmp."Allocated Leave Days");
                                                     "No. of days":=HREmp."Leave Outstanding Bal";
                        
                                                     Insert;
                        
                                                     HRLeaveLedger.Reset;
                                                     if HRLeaveLedger.Find('+') then
                                                     begin
                                                       LineNo:=HRLeaveLedger."Entry No.";
                                                     end else begin
                                                       LineNo:=0;
                                                     end;
                        
                                                  end;
                        
                                        end;
                                until HREmp.Next=0;          //*********End HREmp loop
                                until HRLeaveTypes.Next = 0; //*********End HRLeaveTypes loop
                        
                        
                        
                                //Update the Period as Closed
                                HRLeavePeriods.Reset;
                                HRLeavePeriods.SetRange(HRLeavePeriods.Starts,dtOpenPeriod);
                                HRLeavePeriods.SetRange(HRLeavePeriods.Closed,false);
                                if HRLeavePeriods.Find('-') then
                        
                                begin
                                   HRLeavePeriods.Closed:=true;
                                   HRLeavePeriods.Modify;
                                end;
                        
                               //Mark Leave Ledger Entries for period being closed as 'closed'
                                HRLeaveLedger.Reset;
                                HRLeaveLedger.SetRange(HRLeaveLedger."Leave Period",Format(dtOpenPeriod)); //we use dtOpenPeriod because positive adjustments were made using it
                                if HRLeaveLedger.Find('-') then
                                begin
                                    repeat
                                    HRLeaveLedger.Closed:=true;
                                    HRLeaveLedger.Modify;
                                    until HRLeaveLedger.Next=0;
                                end;
                                //Enter a New Period
                                with HRLeavePeriods do
                                begin
                                    Init;
                                    Code:=intNewYear;
                                    Starts:=PeriodStartDate;
                                    Ends:=CalcDate('1Y', PeriodStartDate);
                                    "Closed By":=UserId;
                                    Description:=Format(intNewYear);
                                    Closed :=false;
                                    Insert;
                                end;
                        
                        
                        Message ('Leave period closing and reimbursement has been done successfully');
                        end else begin
                        Message('You have selected NOT to Close the period');
                        end;

                    end;
                }
            }
        }
    }

    var
        HRLeavePeriods: Record "HR Leave Periods";
        dtOpenPeriod: Date;
        intNewYear: Integer;
        Question: Text[100];
        Answer: Boolean;
        dtNewPeriod: Date;
        HRLeaveLedger: Record "HR Leave Ledger Entries";
        CurrentYear: Integer;
        PeriodStartDate: Date;
        HREmp: Record Employee;
        HRLeaveTypes: Record "HR Leave Types";
        LineNo: Integer;
        DaysLeft: Integer;
        NewPeriodRange: Text;


    procedure fnGetOpenPeriod()
    begin
        //Get the open/current period
        HRLeavePeriods.Reset;
        HRLeavePeriods.SetRange(HRLeavePeriods.Closed,false);
        if HRLeavePeriods.FindFirst then
           dtOpenPeriod:=HRLeavePeriods.Starts
           else
           Error('There are no open leave periods');
    end;
}

