#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 56003 "Receipt"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Receipt.rdlc';

    dataset
    {
        dataitem("Receipt Header"; "Receipts Header1")
        {
            RequestFilterFields = "No.", Date;
            column(ReportForNavId_3632; 3632)
            {
            }
            column(CAshier; "Receipt Header".Cashier)
            {
            }
            column(DocumentNo_ReceiptHeader; "Receipt Header"."Document No")
            {
            }
            column(ChequeNo_ReceiptHeader; "Receipt Header"."Cheque No")
            {
            }
            column(ReceiptNo; "Receipt Header"."No.")
            {
            }
            column(OnBehalfOf_ReceiptHeader; "Receipt Header"."On Behalf Of")
            {
            }
            column(Received_From; "Receipt Header"."Received From")
            {
            }
            column(Date; "Receipt Header".Date)
            {
            }
            column(Picture; CompanyInfo.Picture)
            {
            }
            column(Address_1; CompanyInfo.Address)
            {
            }
            column(Address_2; CompanyInfo."Address 2")
            {
            }
            column(City; CompanyInfo.City)
            {
            }
            column(Phone_No; CompanyInfo."Phone No.")
            {
            }
            column(Phone_No2; CompanyInfo."Phone No. 2")
            {
            }
            column(Donor; Donor)
            {
            }
            column(Project; Project)
            {
            }
            column(TotAmountHeader; "Receipt Header".Amount)
            {
            }
            column(StrCopyText; StrCopyText)
            {
            }
            column(PreparedBy; UserSetup."Employee Name")
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup1."Employee Name")
            {
            }
            column(DateApproved; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            dataitem("Receipt Line"; "Receipt Lines1")
            {
                DataItemLink = "Receipt No." = field("No.");
                DataItemTableView = sorting("Receipt No.", "Line No") order(ascending);
                column(ReportForNavId_7160; 7160)
                {
                }
                column(Description; "Receipt Line"."Account Name")
                {
                }
                column(Amount; "Receipt Line".Amount)
                {
                }
                column(NumberText; NumberText[1])
                {
                }
                column(Description_ReceiptLine; "Receipt Line".Description)
                {
                }

                trigger OnPostDataItem()
                begin
                    /*
                    CheckReport.InitTextVariable;
                    CheckReport.InitTextVariable;
                    CheckReport.FormatNoText(NumberText,TotAmount,'');
                    CheckReport.FormatNoText(NumberText,TotAmount,'');
                     */

                end;

                trigger OnPreDataItem()
                begin
                    //MESSAGE(FORMAT(Amount));
                    TotAmount := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin

                CompanyInfo.Get;
                CompanyInfo.CalcFields(CompanyInfo.Picture);

                "Receipt Header".CalcFields("Receipt Header".Amount);
                TotAmount := "Receipt Header".Amount;

                CheckReport.InitTextVariable;
                CheckReport.FormatNoText(NumberText, "Receipt Header".Amount, CurrencyCodeText);

                //Fred Approvals
                //Ushindi....12/07/16
                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 56007);
                ApprovalEntries.SetRange(ApprovalEntries."Document No.", "Receipt Header"."No.");
                ApprovalEntries.SetRange(ApprovalEntries.Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver[1]) then
                                UserSetup.CalcFields(Picture);

                            //Approver[2]:=ApprovalEntries."Approver ID";
                            Approver[2] := ApprovalEntries."Last Modified By User ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;

                        if i = 2 then begin
                            Approver[3] := ApprovalEntries."Last Modified By User ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;

                        if i = 3 then begin
                            Approver[4] := ApprovalEntries."Last Modified By User ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;
            end;
        }
    }

    requestpage
    {

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

    var
        Chq__Slip_No_CaptionLbl: label 'Chq./Slip No.';
        DescriptionCaptionLbl: label 'Description';
        No_CaptionLbl: label 'No.';
        Received_fromCaptionLbl: label 'Received from';
        Currency_CaptionLbl: label 'Currency:';
        VATCaptionLbl: label 'VAT';
        DateCaptionLbl: label 'Date';
        DepartmentCaptionLbl: label 'Department';
        TotalCaptionLbl: label 'Total';
        Signature___________________Lbl: label '..................................';
        Amount_Incl__VATCaptionLbl: label 'Amount Incl. VAT';
        You_were_served_by_CaptionLbl: label 'You were served by:';
        TimeCaptionLbl: label 'Time';
        Amount_in_wordsCaptionLbl: label 'Amount in words';
        VAT_Amount_CaptionLbl: label 'VAT Amount:';
        Amount_Excl_VATCaptionLbl: label 'Amount Excl VAT';
        Signature_CaptionLbl: label 'Signature:';
        CompanyInfo: Record "Company Information";
        objLogos: Record "Company Information";
        CheckReport: Codeunit 57000;
        NumberText: array[2] of Text;
        TotAmount: Decimal;
        Donor: Text;
        Project: Text;
        DimVal: Record "Dimension Value";
        StrCopyText: Text;
        CurrencyCodeText: Code[10];
        ApprovalEntries: Record "Approval Entry";
        "1stapprover": Text[30];
        "2ndapprover": Text[30];
        i: Integer;
        "1stapproverdate": DateTime;
        "2ndapproverdate": DateTime;
        UserRec: Record "User Setup";
        UserRecApp1: Record "User Setup";
        UserRecApp2: Record "User Setup";
        UserRecApp3: Record "User Setup";
        "3rdapprover": Text[30];
        "3rdapproverdate": DateTime;
        UserSetup: Record "User Setup";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
}

