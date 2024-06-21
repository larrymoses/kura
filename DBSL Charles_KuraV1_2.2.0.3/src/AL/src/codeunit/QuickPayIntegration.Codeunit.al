#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 58001 "QuickPay Integration"
{

    trigger OnRun()
    begin
        // ImportTemplate('RWC 574','CPR0075','BILL01','1.01 (I)',17);
    end;

    var
        // StringBuilder: dotnet Capture;
        MyFile: File;
        MyOutStream: OutStream;
        CRLF: Text[2];
        TransType: Option " ",Internal,"Inter Bank",PesaLink,MPESA,EAPS,RTGS,SWIFT;
        KCBPaymentLines: Record "KCB Payment Lines";
        LineText: Text;
        BankPaymentsBatching: Record "Bank Payments Batching";
        cu400: Codeunit Mail;


    // procedure GeneratePaymentFile(BatchNo: Code[20])
    // var
    //     StringBuilder: dotnet Capture;
    //     MyFile: File;
    //     MyOutStream: OutStream;
    //     CRLF: Text[2];
    //     TransType: Option " ",Internal,"Inter Bank",PesaLink,MPESA,EAPS,RTGS,SWIFT;
    //     FileLocation: label 'D:\temp\KCB\KCB INTEGRATION\Outgoing\Generated\';
    //     StreamWriter: dotnet StreamWriter;
    //     Encoding: dotnet Encoding;
    //     FileName: Text;
    //     FileLocationLive: label 'E:\KCB INTEGRATION\Outgoing\Generated\';
    // begin
    //     CRLF:='';
    //     CRLF[1]:=13;
    //     CRLF[2]:=10;

    //     KCBPaymentLines.Reset;
    //     KCBPaymentLines.SetRange("Batch No",BatchNo);
    //     KCBPaymentLines.SetRange(Approved,true);
    //     if KCBPaymentLines.Find('-') then begin

    //       FileName:=FileLocation + KCBPaymentLines."Batch No" + '.txt';
    //     MyFile.Create(FileName); //Create File
    //     MyFile.CreateOutstream(MyOutStream);

    //     StreamWriter := StreamWriter.StreamWriter(MyOutStream, Encoding.BigEndianUnicode);
    //     LineText:='0'+'^' + DelChr(Format(Today, 0, 9), '=', '-') + '^^^^^^' + CRLF;
    //     StreamWriter.WriteLine(LineText);

    //     repeat

    //     LineText:='P^' + DelChr(Format(KCBPaymentLines.Amount), '=', ',') + '^' + 'KES'+'^' + KCBPaymentLines.DrBnkCode +
    //                           '^' + KCBPaymentLines.DrAccount + '^' + KCBPaymentLines.Reference+'^'+KCBPaymentLines.Trcode+'^'+DelChr(Format(Today, 0, 9), '=', '-') +
    //                           '^' + KCBPaymentLines."Payment Narration" + '^' + KCBPaymentLines.CrBnkCode + '^' + Format(KCBPaymentLines.CrAccount) + '^'
    //                           + KCBPaymentLines.CrName + '^' + KCBPaymentLines."Payment Narration" + '^^^^^^^^^^^^^^' + CRLF;

    //       StreamWriter.WriteLine(LineText);
    //     until KCBPaymentLines.Next=0;
    //     end;
    // end;

    // procedure GetGeneratedFile() batchNo: Text[20]
    // begin
    //     BankPaymentsBatching.Reset;
    //     BankPaymentsBatching.SetRange("Payment File Generated",true);
    //     BankPaymentsBatching.SetRange("File Sent to Bank",false);
    //     if BankPaymentsBatching.Find('-') then begin
    //     batchNo:=BankPaymentsBatching."Batch No";
    //     end;
    // end;

    // procedure UpdatePaymentLines(BatchNo: Code[20];Type: Code[20])
    // begin
    //     BankPaymentsBatching.Reset;
    //     BankPaymentsBatching.SetRange("Batch No",BatchNo);
    //     if BankPaymentsBatching.Find('-') then begin
    //       if Type='PROCESSED' then begin
    //          BankPaymentsBatching."Payment Processed":=true;
    //          BankPaymentsBatching."Date Processed":=Today;
    //       end;
    //       if Type='SENTTOBANK' then begin
    //          BankPaymentsBatching."File Sent to Bank":=true;
    //          BankPaymentsBatching."Date Sent to Bank":=Today;
    //       end;
    //       BankPaymentsBatching.Modify(true);
    //     end;
    // end;

    // procedure PaymentResponse(BatchNo: Code[20];Status: Code[20];RefNo: Text[50];FailureReason: Text[250])
    // begin
    //     BankPaymentsBatching.Reset;
    //     BankPaymentsBatching.SetRange("Batch No",BatchNo);
    //     if BankPaymentsBatching.Find('-') then begin
    //        BankPaymentsBatching."Payment Processed":=true;
    //        BankPaymentsBatching."Date Processed":=Today;
    //        BankPaymentsBatching.Response:=Status;
    //        BankPaymentsBatching."Response Ref No":=RefNo;
    //        BankPaymentsBatching."Failure Reason":=FailureReason;
    //        BankPaymentsBatching.Modify(true);
    //     end;
    // end;

    // procedure GetSentFile() batchNo: Text[20]
    // begin
    //     BankPaymentsBatching.Reset;
    //     BankPaymentsBatching.SetRange("Payment File Generated",true);
    //     BankPaymentsBatching.SetRange("File Sent to Bank",true);
    //     BankPaymentsBatching.SetRange("Payment Processed",false);

    //     //BankPaymentsBatching.ASCENDING();
    //     if BankPaymentsBatching.FindFirst then begin
    //     batchNo:=BankPaymentsBatching."Batch No";
    //     end;
    // end;

    // procedure GetRecord() Code_Phone: Text[50]
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     Employee: Record Employee;
    //     phone: Code[20];
    // begin

    //     ApprovalEntry.Reset;
    //     ApprovalEntry.SetRange("Document Type",ApprovalEntry."document type"::"45");
    //     ApprovalEntry.SetRange(Status,ApprovalEntry.Status::Open);
    //     ApprovalEntry.SetRange("OTP Status",ApprovalEntry."otp status"::"1");
    //     if ApprovalEntry.Find('-') then begin

    //       Employee.Reset;
    //       Employee.SetRange("User ID",ApprovalEntry."Approver ID");
    //       if Employee.FindFirst() then begin
    //          phone:=Employee."Phone No.";
    //       end;
    //        BankPaymentsBatching.Reset;
    //        BankPaymentsBatching.SetRange("Batch No",ApprovalEntry."Document No.");
    //        if BankPaymentsBatching.FindFirst then begin
    //             Code_Phone:=BankPaymentsBatching."Batch No"+'::'+phone+'::'+BankPaymentsBatching."OTP SMS Verification";
    //        end;
    //     end;
    // end;

    // procedure UpdateRecord(BatchNo: Code[20])
    // var
    //     ApprovalEntry: Record "Approval Entry";
    // begin
    //     ApprovalEntry.Reset;
    //     ApprovalEntry.SetRange("Document No.",BatchNo);
    //     ApprovalEntry.SetRange(Status,ApprovalEntry.Status::Open);
    //     ApprovalEntry.SetRange("OTP Status",ApprovalEntry."otp status"::"1");
    //     if ApprovalEntry.Find('-') then begin
    //       ApprovalEntry."OTP Status":=ApprovalEntry."otp status"::"2";
    //       ApprovalEntry.Modify(true);
    //     end;
    // end;

    // procedure FnSendOTP()
    // var
    //     cu400: Codeunit Mail;
    //     SenderAddress: Text[100];
    //     HRSetup: Record "Company Information";
    //     RequesterName: Text[100];
    //     RequesterEmail: Text[100];
    //     OTP: Text[50];
    //     RandomDigit: Text[50];
    //     BankPaymentsBatching: Record "Bank Payments Batching";
    //     ApprovalEntry: Record "Approval Entry";
    //     Message: label 'Dear Sir/Madam,<BR><BR>Please find below system Generated Bank Payments One Time Passcode<BR><BR>PassCode:  <b> %1</b> </BR>';
    //     Header: label 'KERRA Online Bank Payments - OTP (Batch No:%1)';
    //     CompInfo: Record "Company Information";
    //     Employee: Record Employee;
    // begin

    //     ApprovalEntry.Reset;
    //     ApprovalEntry.SetRange("Document Type",ApprovalEntry."document type"::"45");
    //     ApprovalEntry.SetRange("OTP Status",ApprovalEntry."otp status"::"1");
    //     if ApprovalEntry.FindFirst() then begin

    //       Employee.Reset;
    //       Employee.SetRange("User ID",ApprovalEntry."Approver ID");
    //       if Employee.FindFirst() then begin
    //           RequesterEmail:=Employee."Company E-Mail";
    //       end;


    //         //Get OTP
    //         RandomDigit := CreateGuid;
    //         RandomDigit := DelChr(RandomDigit,'=','{}-01');
    //         RandomDigit := CopyStr(RandomDigit,1,6);

    //         OTP:=RandomDigit;

    //     if RequesterEmail<>'' then begin
    //         HRSetup.Get();
    //         SenderAddress:=HRSetup."E-Mail";

    //         cu400.CreateMessage(CompInfo.Name,SenderAddress,RequesterEmail,StrSubstNo(Header,ApprovalEntry."Document No."),
    //         StrSubstNo(Message,OTP), true);

    //         cu400.Send;
    //         end;

    //           BankPaymentsBatching.Reset;
    //           BankPaymentsBatching.SetRange("Batch No",ApprovalEntry."Document No.");
    //           if BankPaymentsBatching.Find('-') then begin
    //              BankPaymentsBatching."OTP SMS":='';
    //              BankPaymentsBatching."Enter OTP":='';
    //              BankPaymentsBatching."OTP Verification":=OTP;
    //              BankPaymentsBatching.Modify(true);
    //           end;

    //         ApprovalEntry."OTP Status":=ApprovalEntry."otp status"::"2";
    //         ApprovalEntry.Modify();
    //     end;
    // end;

    // procedure FnSendOTP1()
    // var
    //     cu400: Codeunit Mail;
    //     SenderAddress: Text[100];
    //     HRSetup: Record "Company Information";
    //     RequesterName: Text[100];
    //     RequesterEmail: Text[100];
    //     OTP: Text[50];
    //     RandomDigit: Text[50];
    //     BankPaymentsBatching: Record "Bank Payments Batching";
    //     ApprovalEntry: Record "Approval Entry";
    //     Message: label 'Dear Sir/Madam,<BR><BR>Batch Payment %1 has been received by the bank</BR>';
    //     Header: label 'KERRA Online Bank Payments - Acknowledgement (Batch No:%1)';
    //     CompInfo: Record "Company Information";
    //     Employee: Record Employee;
    // begin

    //     ApprovalEntry.Reset;
    //     ApprovalEntry.SetRange("Document Type",ApprovalEntry."document type"::"45");
    //     ApprovalEntry.SetRange("OTP Status",ApprovalEntry."otp status"::"1");
    //     if ApprovalEntry.FindFirst() then begin

    //       Employee.Reset;
    //       Employee.SetRange("User ID",ApprovalEntry."Approver ID");
    //       if Employee.FindFirst() then begin
    //           RequesterEmail:=Employee."Company E-Mail";
    //       end;

    //     if RequesterEmail<>'' then begin

    //           BankPaymentsBatching.Reset;
    //           BankPaymentsBatching.SetRange("Batch No",ApprovalEntry."Document No.");
    //           if BankPaymentsBatching.Find('-') then begin

    //             HRSetup.Get();
    //             SenderAddress:=HRSetup."E-Mail";

    //             cu400.CreateMessage(CompInfo.Name,SenderAddress,RequesterEmail,StrSubstNo(Header,ApprovalEntry."Document No."),
    //             StrSubstNo(Message,OTP), true);

    //             cu400.Send;
    //             end;

    //              BankPaymentsBatching."OTP SMS":='';
    //              BankPaymentsBatching."Enter OTP":='';
    //              BankPaymentsBatching."OTP Verification":=OTP;
    //              BankPaymentsBatching.Modify(true);
    //           end;

    //         ApprovalEntry."OTP Status":=ApprovalEntry."otp status"::"2";
    //         ApprovalEntry.Modify();
    //     end;
    // end;

    // procedure ImportTemplate(Project_ID: Text; Document_No: Text; BillCode: Text; ItemCode: Text; Qty: Decimal; line_No: Integer)
    // var
    //     "**mscorlib**": Integer;
    //     sb: dotnet StringBuilder;
    //     stream: dotnet StreamWriter;
    //     str: dotnet Stream;
    //     ascii: dotnet Encoder;
    //     "**System**": Integer;
    //     uriObj: dotnet Uri;
    //     lgRequest: dotnet HttpWebRequest;
    //     lgResponse: dotnet HttpWebResponse;
    //     reader: dotnet XmlTextReader;
    //     document: dotnet XmlDocument;
    //     credentials: dotnet CredentialCache;
    //     ContractorRequestPlanLine: Record "Contractor Request Plan Line";
    //     MeasurementPaymentHeader: Record "Measurement &  Payment Header";
    //     lineno: Integer;
    // begin
    //     // Evaluate(lineno, ItemCode);
    //     ContractorRequestPlanLine.Reset;
    //     ContractorRequestPlanLine.SetRange("Job No.", Project_ID);
    //     ContractorRequestPlanLine.SetRange("Document No", Document_No);
    //     ContractorRequestPlanLine.SetRange("Job Task No.", BillCode);
    //     ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Line No.", line_No);
    //     if ContractorRequestPlanLine.Find('-') then begin
    //         ContractorRequestPlanLine."Qty. to Order" := Qty;
    //         ContractorRequestPlanLine."Total Cost Incl. VAT" := ContractorRequestPlanLine."Unit Cost" * Qty;
    //         ContractorRequestPlanLine."Total Cost Excl. VAT" := ContractorRequestPlanLine."Unit Cost" * Qty;
    //         ContractorRequestPlanLine.Modify(true);
    //     end;
    // end;

    local procedure Test()
    var
        ContractorRequestPlanLine: Record "Contractor Request Plan Line";
    begin
        ContractorRequestPlanLine.Reset;
        ContractorRequestPlanLine.SetFilter("Description 2", '%1', '');
        if ContractorRequestPlanLine.Find('-') then begin
            repeat
                ContractorRequestPlanLine."Description 2" := ContractorRequestPlanLine.Description;
                ContractorRequestPlanLine.Modify();
            until ContractorRequestPlanLine.Next = 0;
        end;
    end;

    procedure UpdatePaymentRequest(DocumentNo: Text)
    var
        MeasurementPaymentHeader: Record "Measurement &  Payment Header";
    begin
        MeasurementPaymentHeader.Reset;
        MeasurementPaymentHeader.SetRange("Document No.", DocumentNo);
        if MeasurementPaymentHeader.FindFirst() then begin
            MeasurementPaymentHeader.Generate := false;
            MeasurementPaymentHeader.Modify();
        end;
    end;

    procedure UpdatePaymentRequestI(DocumentNo: Text)
    var
        MeasurementPaymentHeader: Record "Measurement &  Payment Header";
        ContractorRequestPlanLine: Record "Contractor Request Plan Line";
    begin
        MeasurementPaymentHeader.Reset;
        MeasurementPaymentHeader.SetRange("Document No.", DocumentNo);
        if MeasurementPaymentHeader.FindFirst() then begin
            MeasurementPaymentHeader.Import := false;
            MeasurementPaymentHeader.Modify();
        end;
    end;

    procedure UpdatePaymentRequestDetails(DocumentNo: Text; currentmaterialonsite: Decimal; prevmaterialonsite: Decimal; currentvop: Decimal; prevvopamount: Decimal; currentliquidatedDm: Decimal; prevliquidatedDm: Decimal; currentadvrecovery: Decimal; prevadvrecovery: Decimal);
    var
        MeasurementPaymentHeader: Record "Measurement &  Payment Header";
    begin
        MeasurementPaymentHeader.RESET;
        MeasurementPaymentHeader.SETRANGE("Document No.", DocumentNo);
        if MeasurementPaymentHeader.FINDFIRST() then begin
            //   MeasurementPaymentHeader."Current Materials on Site":=currentmaterialonsite;
            //   MeasurementPaymentHeader."Previous Material on Site":=prevmaterialonsite;
            //   MeasurementPaymentHeader."Current VOP Amount":=currentvop;
            //   MeasurementPaymentHeader."Previous VoP Amount":=prevvopamount;
            //   MeasurementPaymentHeader."Current Liquidated Damages":=currentliquidatedDm;
            //   MeasurementPaymentHeader."Previous Liquidated Damages":=prevliquidatedDm;
            // MeasurementPaymentHeader."Current Advance Recovery Amt":=currentadvrecovery;
            //     MeasurementPaymentHeader."Previous Liquidated Damages":=prevadvrecovery;
            MeasurementPaymentHeader.MODIFY();
        end;

    end;
}

