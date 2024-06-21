#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 59103 "Transfer Director to Journal"
{
    Caption = 'Transfer Director Payroll to Journal';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Vendor;Vendor)
        {
            DataItemTableView = where("Vendor Type"=const(Director));
            RequestFilterFields = "No.","Pay Period Filter";
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                
                //Earnings
                Earnings.Reset();
                if Earnings.FindSet(false,false) then begin
                Earnings.TestField("G/L Account");
                Earnings.TestField("Account No.");
                
                repeat
                    DirectorLedgerEntry.Reset();
                    DirectorLedgerEntry.SetRange(DirectorLedgerEntry.Type,DirectorLedgerEntry.Type::Payment); //Earnings
                    DirectorLedgerEntry.SetRange(DirectorLedgerEntry."Payroll Period",PayrollPeriodFilter);
                    DirectorLedgerEntry.SetRange(DirectorLedgerEntry."Director No",Vendor."No.");
                    DirectorLedgerEntry.SetRange(DirectorLedgerEntry.Code,Earnings.Code);
                    if DirectorLedgerEntry.FindSet(false,false) then begin
                        repeat
                            GenJnLine.Init();
                
                            GenJnLine."Journal Template Name":=HRSetup."Payroll Journal Template";
                            GenJnLine."Journal Batch Name":=HRSetup."Payroll Journal Batch";
                
                            GenJnLine."Line No.":=fn_LastLineNo;
                
                            GenJnLine."Account Type":=Earnings."Account Type"; //Testfields
                            GenJnLine.Validate("Account Type");
                
                            GenJnLine."Account No.":=Earnings."Account No.";   //Testfields
                            GenJnLine.Validate("Account No.");
                
                                GenJnLine."Bal. Account Type":=GenJnLine."account type"::Vendor;
                                GenJnLine."Bal. Account No.":=Vendor."No.";
                                GenJnLine.Validate(GenJnLine."Account No.");
                
                            GenJnLine."Posting Date":=PayrollPeriodFilter; //Testfields
                            GenJnLine.Validate("Posting Date");
                
                            //GenJnLine.Description:=Earnings.Description+' - ' + Vendor."No." + ', ' + FORMAT(PayrollPeriodFilter,0,'<month text> <year4>');
                
                            //GenJnLine."Document No.":=Vendor."No."+ ' : ' + FORMAT(PayrollPeriodFilter);
                
                            GenJnLine."Document No.":=Format(PayrollPeriodFilter) + '-DIR';
                
                
                            PayrollHeader.Reset;
                            PayrollHeader.SetRange(PayrollHeader."Payroll Period",PayrollPeriodFilter);
                            if PayrollHeader.FindSet then
                              begin
                                GenJnLine."Dimension Set ID":=PayrollHeader."Dimension Set ID";
                                GenJnLine.Validate("Dimension Set ID");
                                GenJnLine.Description:=Earnings.Description+' - ' + Vendor."No." + ', ' + PayrollHeader.Description;
                              end;
                
                
                            GenJnLine.Amount:=DirectorLedgerEntry.Amount;

                            GenJnLine.Validate(Amount);
                            GenJnLine."Earning Code" := DirectorLedgerEntry.Code;
                            if GenJnLine.Amount <> 0 then  GenJnLine.Insert();
                        until DirectorLedgerEntry.Next() = 0;
                    end;
                until Earnings.Next() = 0;
                
                //Deductions
                Deductions.Reset();
                Deductions.SetRange("PAYE Code",false);
                if Deductions.FindSet(false,false) then
                begin
                    repeat
                    Deductions.TestField("G/L Account");
                    Deductions.TestField("Account No.");
                        DirectorLedgerEntry.Reset();
                        DirectorLedgerEntry.SetRange(DirectorLedgerEntry.Type,DirectorLedgerEntry.Type::Deduction); //Deductions
                        DirectorLedgerEntry.SetRange(DirectorLedgerEntry."Payroll Period",PayrollPeriodFilter);
                        DirectorLedgerEntry.SetRange(DirectorLedgerEntry."Director No",Vendor."No.");
                        DirectorLedgerEntry.SetRange(DirectorLedgerEntry.Code,Deductions.Code);
                        if DirectorLedgerEntry.FindSet(false,false) then
                        begin
                            repeat
                
                                GenJnLine.Init();
                
                                GenJnLine."Journal Template Name":=HRSetup."Payroll Journal Template";
                                GenJnLine."Journal Batch Name":=HRSetup."Payroll Journal Batch";
                
                
                                GenJnLine."Line No.":=fn_LastLineNo;
                
                                GenJnLine."Account Type":=GenJnLine."account type"::Vendor; //Testfields
                                GenJnLine.Validate("Account Type");
                
                                GenJnLine."Account No.":=Vendor."No.";   //Testfields
                                GenJnLine.Validate("Account No.");
                
                                GenJnLine."Bal. Account Type":=GenJnLine."account type"::Vendor;
                                GenJnLine."Bal. Account No.":=Deductions."Account No.";
                                GenJnLine.Validate(GenJnLine."Bal. Account No.");
                
                                GenJnLine."Posting Date":=PayrollPeriodFilter; //Testfields
                                GenJnLine.Validate("Posting Date");
                
                                //GenJnLine.Description:=Deductions.Description+' - ' + Vendor."No." + ', ' + FORMAT(PayrollPeriodFilter,0,'<month text> <year4>');
                
                                //GenJnLine."Document No.":=Vendor."No."+ ' : ' + FORMAT(PayrollPeriodFilter);
                
                                GenJnLine."Document No.":=Format(PayrollPeriodFilter) + '-DIR';
                
                                PayrollHeader.Reset;
                                PayrollHeader.SetRange(PayrollHeader."Payroll Period",PayrollPeriodFilter);
                                if PayrollHeader.FindSet then
                                begin
                                  GenJnLine."Dimension Set ID":=PayrollHeader."Dimension Set ID";
                                  GenJnLine.Validate("Dimension Set ID");
                                  GenJnLine.Description:=Deductions.Description+' - ' + Vendor."No." +' '+PayrollHeader.Description;
                                end;
                                if DirectorLedgerEntry."Employer Amount" <> 0 then
                                GenJnLine.Amount:=-DirectorLedgerEntry.Amount + -DirectorLedgerEntry."Employer Amount"
                                else
                                GenJnLine.Amount:=-DirectorLedgerEntry.Amount;
                                GenJnLine.Validate(Amount);
                                GenJnLine."Earning Code" := DirectorLedgerEntry.Code;
                                if GenJnLine.Amount <> 0 then 
                                 GenJnLine.Insert();
                
                            until DirectorLedgerEntry.Next() = 0;
                
                        end;
                    until Deductions.Next() = 0;
                end;
                end;
                
                //Deductions
                /*Deductions.RESET();
                Deductions.SETRANGE("PAYE Code",TRUE);
                IF Deductions.FINDSET(FALSE,FALSE) THEN
                BEGIN
                    Deductions.TESTFIELD("G/L Account");
                    Deductions.TESTFIELD("Account No.");
                
                    REPEAT
                        DirectorLedgerEntry.RESET();
                        DirectorLedgerEntry.SETRANGE(DirectorLedgerEntry.Type,DirectorLedgerEntry.Type::Deduction); //Deductions
                        DirectorLedgerEntry.SETRANGE(DirectorLedgerEntry."Payroll Period",PayrollPeriodFilter);
                        DirectorLedgerEntry.SETRANGE(DirectorLedgerEntry."Director No",Vendor."No.");
                        DirectorLedgerEntry.SETRANGE(DirectorLedgerEntry.Code,Deductions.Code);
                        IF DirectorLedgerEntry.FINDSET(FALSE,FALSE) THEN
                        BEGIN
                            REPEAT
                
                                GenJnLine.INIT();
                
                                GenJnLine."Journal Template Name":=HRSetup."Payroll Journal Template";
                                GenJnLine."Journal Batch Name":=HRSetup."Payroll Journal Batch";
                
                
                                GenJnLine."Line No.":=fn_LastLineNo;
                
                                GenJnLine."Account Type":=GenJnLine."Account Type"::Vendor; //Testfields
                                GenJnLine.VALIDATE("Account Type");
                
                                GenJnLine."Account No.":=Vendor."No.";   //Testfields
                                GenJnLine.VALIDATE("Account No.");
                
                                //GenJnLine."Bal. Account Type":=GenJnLine."Account Type"::Vendor;
                                //GenJnLine."Bal. Account No.":=Deductions."Account No.";
                               // GenJnLine.VALIDATE(GenJnLine."Bal. Account No.");
                
                                GenJnLine."Posting Date":=PayrollPeriodFilter; //Testfields
                                GenJnLine.VALIDATE("Posting Date");
                
                                //GenJnLine.Description:=Deductions.Description+' - ' + Vendor."No." + ', ' + FORMAT(PayrollPeriodFilter,0,'<month text> <year4>');
                
                                //GenJnLine."Document No.":=Vendor."No."+ ' : ' + FORMAT(PayrollPeriodFilter);
                
                                GenJnLine."Document No.":=FORMAT(PayrollPeriodFilter) + '-DIR';
                
                                  PayrollHeader.RESET;
                                  PayrollHeader.SETRANGE(PayrollHeader."Payroll Period",PayrollPeriodFilter);
                                  IF PayrollHeader.FINDSET THEN
                                  BEGIN
                                    GenJnLine."Dimension Set ID":=PayrollHeader."Dimension Set ID";
                                    GenJnLine.VALIDATE("Dimension Set ID");
                                    GenJnLine.Description:=Deductions.Description+' - ' + Vendor."No." +'-'+PayrollHeader.Description;
                                  END;
                
                                GenJnLine.Amount:=-DirectorLedgerEntry.Amount;
                                GenJnLine.VALIDATE(Amount);
                
                                IF GenJnLine.Amount <> 0 THEN  GenJnLine.INSERT();
                
                
                
                                GenJnLine.INIT();
                
                                GenJnLine."Journal Template Name":=HRSetup."Payroll Journal Template";
                                GenJnLine."Journal Batch Name":=HRSetup."Payroll Journal Batch";
                
                
                                GenJnLine."Line No.":=fn_LastLineNo;
                
                                GenJnLine."Account Type":=GenJnLine."Account Type"::Vendor; //Testfields
                                GenJnLine.VALIDATE("Account Type");
                
                                GenJnLine."Account No.":=Deductions."Account No.";   //Testfields
                                GenJnLine.VALIDATE("Account No.");
                
                                //GenJnLine."Bal. Account Type":=GenJnLine."Account Type"::Vendor;
                                //GenJnLine."Bal. Account No.":=Deductions."Account No.";
                                //GenJnLine.VALIDATE(GenJnLine."Bal. Account No.");
                
                                GenJnLine."Posting Date":=PayrollPeriodFilter; //Testfields
                                GenJnLine.VALIDATE("Posting Date");
                
                                //GenJnLine.Description:=Deductions.Description+' - ' + Vendor."No." + ', ' + FORMAT(PayrollPeriodFilter,0,'<month text> <year4>');
                
                                //GenJnLine."Document No.":=Vendor."No."+ ' : ' + FORMAT(PayrollPeriodFilter);
                
                                GenJnLine."Document No.":=FORMAT(PayrollPeriodFilter) + '-DIR';
                
                                PayrollHeader.RESET;
                                PayrollHeader.SETRANGE(PayrollHeader."Payroll Period",PayrollPeriodFilter);
                                IF PayrollHeader.FINDSET THEN
                                BEGIN
                                  GenJnLine."Dimension Set ID":=PayrollHeader."Dimension Set ID";
                                  GenJnLine.VALIDATE("Dimension Set ID");
                                  GenJnLine.Description:=Deductions.Description+' - ' + Vendor."No." + '-'+PayrollHeader.Description;
                                END;
                
                                GenJnLine.Amount:=DirectorLedgerEntry.Amount;
                                GenJnLine.VALIDATE(Amount);
                
                                IF GenJnLine.Amount <> 0 THEN  GenJnLine.INSERT();
                
                            UNTIL DirectorLedgerEntry.NEXT() = 0;
                
                        END;
                    UNTIL Deductions.NEXT() = 0;
                END;
                */
                
                //Direct Posting to GL Entry
                //CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnLine);

            end;

            trigger OnPreDataItem()
            begin
                PayrollPeriodFilter:=Vendor.GetRangeMin("Pay Period Filter");
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    var
        GenJournalLine: Record "Gen. Journal Line";
    begin
        if Confirm('Payroll Journal has been created. Do you wish to open it now?',true) = true then
        begin
          GenJournalLine.Reset();
          GenJournalLine.SetRange("Journal Template Name",HRSetup."Payroll Journal Template");
          GenJournalLine.SetRange("Journal Batch Name",HRSetup."Payroll Journal Batch");
          if GenJnLine.FindSet(false,false) then Page.Run(Page::"General Journal",GenJnLine);
        end;
    end;

    trigger OnPreReport()
    begin


        HRSetup.Get();
        HRSetup.TestField("Payroll Journal Template");
        HRSetup.TestField("Payroll Journal Batch");

        //Check if Journal Bactch Exists
        if not JnlTemp.Get(HRSetup."Payroll Journal Template",HRSetup."Payroll Journal Batch") then
        begin
            JnlTemp.Init();

            JnlTemp."Journal Template Name":=HRSetup."Payroll Journal Template";
            JnlTemp.Name:=HRSetup."Payroll Journal Batch";

            JnlTemp.Insert();
        end;

        GenJnLine.Reset();
        GenJnLine.SetRange("Journal Template Name",HRSetup."Payroll Journal Template");
        GenJnLine.SetRange("Journal Batch Name",HRSetup."Payroll Journal Batch");
        if not GenJnLine.IsEmpty() then GenJnLine.DeleteAll();
    end;

    var
        HRSetup: Record "Human Resources Setup";
        JnlTemp: Record "Gen. Journal Batch";
        GenJnLine: Record "Gen. Journal Line";
        Earnings: Record "Directors Earnings";
        Deductions: Record "Director Deductions";
        DirectorLedgerEntry: Record "Director Ledger Entry";
        PayrollPeriodFilter: Date;
        PayrollHeader: Record "Payroll Header";

    local procedure fn_LastLineNo(): Integer
    var
        GenJnLine_LastLineNo: Record "Gen. Journal Line";
    begin
        GenJnLine_LastLineNo.Reset();
        GenJnLine_LastLineNo.SetRange("Journal Template Name",HRSetup."Payroll Journal Template");
        GenJnLine_LastLineNo.SetRange("Journal Batch Name",HRSetup."Payroll Journal Batch");
        if GenJnLine_LastLineNo.FindLast() then
          exit(GenJnLine_LastLineNo."Line No." + 1);
        exit(1);
    end;
}

