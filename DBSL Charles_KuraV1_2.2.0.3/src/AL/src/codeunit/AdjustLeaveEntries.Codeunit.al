#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 60043 "AdjustLeaveEntries"
{

    trigger OnRun()
    begin
        //ERROR('You are not allowed to run this. Please contact system Administrator.');
        //IdentifyDuplicates();
        //FlagForReversal();

        //CreateReversalEntries();
        //FnInserVendorLedger();
        //FnInserDetailedVendorLedger();
        FnInserLedgerEntries();
    end;

    var
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        LeaveTemp: Record "Leave Temp";
        HRLeaveLedgerEntriesTemp: Record "HR Leave Ledger Entries";
        HRLeaveLedgerEntriesInsert: Record "HR Leave Ledger Entries";

    local procedure IdentifyDuplicates()
    begin
        HRLeaveLedgerEntries.Reset;
        //HRLeaveLedgerEntries.SETRANGE(Closed,FALSE);
        HRLeaveLedgerEntries.SetFilter("Document No.",'<>%1&<>%2&<>%3','OPENING BAL','2019/2020','2020/2021');
        HRLeaveLedgerEntries.SetFilter("Posting Date",'%1..%2',20210107D,20210916D);
        if HRLeaveLedgerEntries.Find('-') then begin

          repeat
            HRLeaveLedgerEntries.CalcFields(TotalEntries);
            if HRLeaveLedgerEntries.TotalEntries>1 then begin
            LeaveTemp.Reset;
            LeaveTemp.SetRange("Leave No",HRLeaveLedgerEntries."Document No.");
            if LeaveTemp.Find('-') then begin
               LeaveTemp.Duplicate:=true;
               LeaveTemp.Modify();
            end else
            begin
              LeaveTemp.Init;
              LeaveTemp."Entry No":=HRLeaveLedgerEntries."Entry No.";
              LeaveTemp."Leave No":=HRLeaveLedgerEntries."Document No.";
              LeaveTemp.Staff:=HRLeaveLedgerEntries."Staff No.";
              LeaveTemp."No of Duplicates":=HRLeaveLedgerEntries.TotalEntries;
              LeaveTemp."Posting Date":=HRLeaveLedgerEntries."Posting Date";
              LeaveTemp.Insert(true);
            end;
            end;

          until HRLeaveLedgerEntries.Next=0;
        end;
        Message('Done');
    end;

    local procedure FlagForReversal()
    begin
            LeaveTemp.Reset;
            LeaveTemp.SetRange(Duplicate,true);
            if LeaveTemp.Find('-') then begin
              repeat
               HRLeaveLedgerEntries.Reset;
               HRLeaveLedgerEntries.SetRange("Document No.",LeaveTemp."Leave No");
               HRLeaveLedgerEntries.SetFilter("Entry No.",'<>%1',LeaveTemp."Entry No");
               if HRLeaveLedgerEntries.Find('-') then begin
                 repeat
                  HRLeaveLedgerEntries.Reversed:=true;
                  HRLeaveLedgerEntries.Modify(true);
                  LeaveTemp.Reversed:=true;
                  LeaveTemp.Modify(true);
                 until HRLeaveLedgerEntries.Next=0;
               end;
              until LeaveTemp.Next=0;
            end;
            Message('Finished');
    end;

    local procedure CreateReversalEntries()
    var
        lastentry: Integer;
    begin
        HRLeaveLedgerEntries.Reset;
        HRLeaveLedgerEntries.SetRange(Reversed,true);
        HRLeaveLedgerEntries.SetFilter("Document No.",'<>%1&<>%2','REIMBURSEMENT','OPENING BAL');
        HRLeaveLedgerEntries.SetFilter("Leave Start Date",'<>%1',0D);
        if HRLeaveLedgerEntries.Find('-') then begin
          repeat
          lastentry:=0;
          HRLeaveLedgerEntriesTemp.Reset;
         // HRLeaveLedgerEntriesTemp.SETRANGE(Closed,FALSE);
          if HRLeaveLedgerEntriesTemp.FindLast() then begin
              lastentry:=HRLeaveLedgerEntriesTemp."Entry No."+100;
          end;
          HRLeaveLedgerEntriesInsert.Init;
          HRLeaveLedgerEntriesInsert."Entry No.":=lastentry;
          HRLeaveLedgerEntriesInsert."Leave Period":=HRLeaveLedgerEntries."Leave Period";
          HRLeaveLedgerEntriesInsert.Closed:=HRLeaveLedgerEntries.Closed;
          HRLeaveLedgerEntriesInsert."Staff No.":=HRLeaveLedgerEntries."Staff No.";
          HRLeaveLedgerEntriesInsert."Staff Name":=HRLeaveLedgerEntries."Staff Name";
          HRLeaveLedgerEntriesInsert."Posting Date":=Today;
          HRLeaveLedgerEntriesInsert."Leave Entry Type":=HRLeaveLedgerEntries."leave entry type"::Positive;
          HRLeaveLedgerEntriesInsert."Leave Approval Date":=Today;
          HRLeaveLedgerEntriesInsert."Document No.":='REIMBURSEMENT';
          HRLeaveLedgerEntriesInsert."No. of days":=-HRLeaveLedgerEntries."No. of days";
          HRLeaveLedgerEntriesInsert."Leave Posting Description":='REIMBURSEMENT'+HRLeaveLedgerEntries."Document No.";
          HRLeaveLedgerEntriesInsert."User ID":=UserId;
          HRLeaveLedgerEntriesInsert."Journal Batch Name":='N/A';
          HRLeaveLedgerEntriesInsert."Leave Type":=HRLeaveLedgerEntries."Leave Type";
          HRLeaveLedgerEntriesInsert.Reversed:=HRLeaveLedgerEntries.Reversed;
          HRLeaveLedgerEntriesInsert.Insert(true);

        until HRLeaveLedgerEntries.Next=0;
        end;
        Message('Done-');
    end;

    procedure FnInserVendorLedger()
    var
        ObjVendorLedgerEntry: Record "Vendor Ledger Entry";
        EntryNo: Integer;
    begin
        // ObjVendorLedgerEntry.RESET;
        // ObjVendorLedgerEntry.SETRANGE(ObjVendorLedgerEntry."Vendor No.",'VEND1715');
        // IF ObjVendorLedgerEntry.FINDSET THEN BEGIN
        EntryNo:=0;
        if ObjVendorLedgerEntry.FindLast then
          EntryNo :=ObjVendorLedgerEntry."Entry No."+1;
        ObjVendorLedgerEntry.Init;
        ObjVendorLedgerEntry."Entry No.":=EntryNo;
        ObjVendorLedgerEntry."Vendor No.":='VEND1715';
        ObjVendorLedgerEntry.Validate("Vendor No.");
        ObjVendorLedgerEntry."Posting Date":=20210324D;
        ObjVendorLedgerEntry."Document Type":=ObjVendorLedgerEntry."document type"::Invoice;
        ObjVendorLedgerEntry."Document No.":='PINV-03862';
        ObjVendorLedgerEntry.Description:='KeRRA/11/KBU/39/GOK/2-27-19/20-353 FOR KIRINGI-RUTHIRUINI-KIHINGO (P 200 KIAMBU)';
        //ObjVendorLedgerEntry.Amount:=-4716178.65;
        ObjVendorLedgerEntry.Validate(Amount);
        ObjVendorLedgerEntry."Amount (LCY)":=ObjVendorLedgerEntry."Amount (LCY)";
        ObjVendorLedgerEntry."Global Dimension 1 Code":='R02';
        ObjVendorLedgerEntry.Validate("Global Dimension 1 Code");
        ObjVendorLedgerEntry."Global Dimension 2 Code":='GOK MAINTA';
        ObjVendorLedgerEntry.Validate("Global Dimension 2 Code");
        ObjVendorLedgerEntry."Dimension Set ID":=6083;
        ObjVendorLedgerEntry.Validate("Dimension Set ID");
        ObjVendorLedgerEntry."User ID":='KERRA0\ESTHER.MBUGUA';
        ObjVendorLedgerEntry.Open:=true;
        ObjVendorLedgerEntry."Project No":='2-27-19/20-353';
        ObjVendorLedgerEntry."Contractor No":='VEND1715';
        ObjVendorLedgerEntry.Insert(true);
        //END;
    end;

    procedure FnInserDetailedVendorLedger()
    var
        ObjVendorLedgerEntry: Record "Detailed Vendor Ledg. Entry";
        EntryNo: Integer;
    begin
        // ObjVendorLedgerEntry.RESET;
        // ObjVendorLedgerEntry.SETRANGE(ObjVendorLedgerEntry."Vendor No.",'VEND1715');
        // IF ObjVendorLedgerEntry.FINDSET THEN BEGIN
        EntryNo:=0;
        if ObjVendorLedgerEntry.FindLast then
          EntryNo :=ObjVendorLedgerEntry."Entry No."+1;
        ObjVendorLedgerEntry.Init;
        ObjVendorLedgerEntry."Entry No.":=EntryNo;
        ObjVendorLedgerEntry."Vendor Ledger Entry No.":=325006;
        ObjVendorLedgerEntry."Entry Type":=ObjVendorLedgerEntry."entry type"::"Initial Entry";
        ObjVendorLedgerEntry."Vendor No.":='VEND1715';
        ObjVendorLedgerEntry.Validate("Vendor No.");
        ObjVendorLedgerEntry."Posting Date":=20210324D;
        ObjVendorLedgerEntry."Document Type":=ObjVendorLedgerEntry."document type"::Invoice;
        ObjVendorLedgerEntry."Document No.":='PINV-03862';
        //ObjVendorLedgerEntry.Description:='KeRRA/11/KBU/39/GOK/2-27-19/20-353 FOR KIRINGI-RUTHIRUINI-KIHINGO (P 200 KIAMBU)';
        ObjVendorLedgerEntry.Amount:=-4716178.65;
        ObjVendorLedgerEntry.Validate(Amount);
        //ObjVendorLedgerEntry."Global Dimension 1 Code":='R02';
        //ObjVendorLedgerEntry.VALIDATE("Global Dimension 1 Code");
        //ObjVendorLedgerEntry."Global Dimension 2 Code":='GOK MAINTA';
        //.VALIDATE("Global Dimension 2 Code");
        //ObjVendorLedgerEntry."Dimension Set ID":=6083;
        //ObjVendorLedgerEntry.VALIDATE("Dimension Set ID");
        ObjVendorLedgerEntry."User ID":='KERRA0\ESTHER.MBUGUA';
        // ObjVendorLedgerEntry.Open:=TRUE;
        ObjVendorLedgerEntry."Project No":='2-27-19/20-353';
        ObjVendorLedgerEntry."Contractor No":='VEND1715';
        ObjVendorLedgerEntry.Insert(true);
        Message('Success');
        //END;
    end;

    procedure FnInserLedgerEntries()
    var
        ObjVendorLedgerEntry: Record "G/L Entry";
        EntryNo: Integer;
    begin
        // ObjVendorLedgerEntry.RESET;
        // ObjVendorLedgerEntry.SETRANGE(ObjVendorLedgerEntry."Vendor No.",'VEND1715');
        // IF ObjVendorLedgerEntry.FINDSET THEN BEGIN
        EntryNo:=0;
        if ObjVendorLedgerEntry.FindLast then
          EntryNo :=ObjVendorLedgerEntry."Entry No."+1;
        ObjVendorLedgerEntry.Init;
        ObjVendorLedgerEntry."Entry No.":=EntryNo;
        ObjVendorLedgerEntry."G/L Account No.":='2300010';
        ObjVendorLedgerEntry.Validate("G/L Account No.");
        ObjVendorLedgerEntry."Source No.":='VEND1715';
        ObjVendorLedgerEntry."Source Type":=ObjVendorLedgerEntry."source type"::Vendor;
        ObjVendorLedgerEntry."Posting Date":=20210324D;
        ObjVendorLedgerEntry."Document Type":=ObjVendorLedgerEntry."document type"::Invoice;
        ObjVendorLedgerEntry."Document No.":='PINV-03862';
        ObjVendorLedgerEntry.Description:='KeRRA/11/KBU/39/GOK/2-27-19/20-353 FOR KIRINGI-RUTHIRUINI-KIHINGO (P 200 KIAMBU)';
        ObjVendorLedgerEntry.Amount:=-4716178.65;
        ObjVendorLedgerEntry.Validate(Amount);
        ObjVendorLedgerEntry."Dimension Set ID":=6083;
        ObjVendorLedgerEntry.Validate("Dimension Set ID");
        ObjVendorLedgerEntry."User ID":='KERRA0\ESTHER.MBUGUA';
        ObjVendorLedgerEntry."Project No":='2-27-19/20-353';
        ObjVendorLedgerEntry."System-Created Entry":=true;
        ObjVendorLedgerEntry.Insert(true);
        Message('Success');
        //END;
    end;
}

