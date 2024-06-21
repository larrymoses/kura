#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 57021 "Regional Payment Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Regional Payment Voucher.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(payments; payments)
        {
            DataItemTableView = where("Payment Type" = const("Payment Voucher"));
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.", Date, "Cheque No", "Bank Code", Payee;
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax; CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite; CompanyInfo."Home Page")
            {
            }
            column(No_Payments; payments."No.")
            {
            }
            column(Date_Payments; Format(payments.Date))
            {
            }
            column(PaymentsNarration; payments."Payment Narration")
            {
            }
            column(Type_Payments; payments.Type)
            {
            }
            column(JobNo_Payments; payments.Project)
            {
            }
            column(ProjectDescription_Payments; payments."Project Description")
            {
            }
            column(BankName_Payments; payments."Bank Name")
            {
            }
            column(PayMode_Payments; payments."Pay Mode")
            {
            }
            column(ChequeNo_Payments; payments."Cheque No")
            {
            }
            column(ChequeDate_Payments; payments."Cheque Date")
            {
            }
            column(BankCode_Payments; payments."Bank Code")
            {
            }
            column(Payee_Payments; payments.Payee)
            {
            }
            column(Onbehalfof_Payments; payments."On behalf of")
            {
            }
            column(CreatedBy_Payments; payments."Created By")
            {
            }
            column(JobDescription_Payments; payments."Job Description")
            {
            }
            column(Posted_Payments; payments.Posted)
            {
            }
            column(PostedBy_Payments; payments."Posted By")
            {
            }
            column(PostedDate_Payments; payments."Posted Date")
            {
            }
            column(GlobalDimension1Code_Payments; payments."Shortcut Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Payments; payments."Shortcut Dimension 2 Code")
            {
            }
            column(TimePosted_Payments; payments."Time Posted")
            {
            }
            column(TotalAmount_Payments; payments."Total Amount")
            {
            }
            column(PayingBankAccount_Payments; payments."Paying Bank Account")
            {
            }
            column(SourceBankAccNo_Payments; payments."Source Bank Acc No.")
            {
            }
            column(Status_Payments; payments.Status)
            {
            }
            column(PaymentType_Payments; payments."Payment Type")
            {
            }
            column(Currency_Payments; payments.Currency)
            {
            }
            column(NoSeries_Payments; payments."No. Series")
            {
            }
            column(AccountType_Payments; payments."Account Type")
            {
            }
            column(AccountNo_Payments; payments."Account No.")
            {
            }
            column(AccountName_Payments; payments."Account Name")
            {
            }
            column(ImprestAmount_Payments; payments."Imprest Amount")
            {
            }
            column(Surrendered_Payments; payments.Surrendered)
            {
            }
            column(AppliesToDocNo_Payments; payments."Applies- To Doc No.")
            {
            }
            column(PettyCashAmount_Payments; payments."Petty Cash Amount")
            {
            }
            column(OriginalDocument_Payments; payments."Original Document")
            {
            }
            column(PVCreationDateTime_Payments; payments."PV Creation DateTime")
            {
            }
            column(PVCreatorID_Payments; payments."PV Creator ID")
            {
            }
            column(RemainingAmount_Payments; payments."Remaining Amount")
            {
            }
            column(ReceiptCreated_Payments; payments."Receipt Created")
            {
            }
            column(ImprestDeadline_Payments; payments."Imprest Deadline")
            {
            }
            column(ImprestSurrenderDate_Payments; payments."Surrender Date")
            {
            }
            column(DateFilter_Payments; payments."Date Filter")
            {
            }
            column(ImprestType_Payments; payments."Imprest Type")
            {
            }
            column(ProjectBudget_Payments; payments."Project Budget")
            {
            }
            column(UsageCosts_Payments; payments."Actual Project Costs")
            {
            }
            column(TotalCommitments_Payments; payments."Total Budget Commitments")
            {
            }
            column(AvailableFunds_Payments; payments."Available Funds")
            {
            }
            column(Job_Payments; payments.Job)
            {
            }
            column(JobTaskNo_Payments; payments."Job Task No")
            {
            }
            column(Number_In_Words; NumberText[1])
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
            column(Edirector; UserSetup4."Employee Name")
            {
            }
            column(EDDate; ApproverDate[5])
            {
            }
            column(ED_Signature; UserSetup4.Picture)
            {
            }
            column(FApprover; UserSetup5."Employee Name")
            {
            }
            column(FADate; ApproverDate[6])
            {
            }
            column(FA_Signature; UserSetup5.Picture)
            {
            }
            dataitem("PV Lines"; "PV Lines")
            {
                DataItemLink = No = field("No.");
                column(ReportForNavId_1000000024; 1000000024)
                {
                }
                column(No_PVLines; "PV Lines".No)
                {
                }
                column(LineNo_PVLines; "PV Lines"."Line No")
                {
                }
                column(Date_PVLines; "PV Lines".Date)
                {
                }
                column(AccountType_PVLines; "PV Lines"."Account Type")
                {
                }
                column(AccountNo_PVLines; "PV Lines"."Account No")
                {
                }
                column(AccountName_PVLines; "PV Lines"."Account Name")
                {
                }
                column(Description_PVLines; "PV Lines".Description)
                {
                }
                column(PayeeBankAccountNumber_PVLines; "PV Lines"."Payee Bank Account Number")
                {
                }
                column(PayeeBankName_PVLines; "PV Lines"."Payee Bank Name")
                {
                }
                column(PayeeBankBranchCode_PVLines; "PV Lines"."Payee Bank Branch Code")
                {
                }
                column(VendorBankName_PVLines; "PV Lines"."Vendor Bank Name")
                {
                }
                column(PayeeAccountName_PVLines; "PV Lines"."Payee Bank Name")
                {
                }
                column(Amount_PVLines; "PV Lines".Amount)
                {
                }
                column(Posted_PVLines; "PV Lines".Posted)
                {
                }
                column(PostedDate_PVLines; "PV Lines"."Posted Date")
                {
                }
                column(PostedTime_PVLines; "PV Lines"."Posted Time")
                {
                }
                column(GlobalDimension1Code_PVLines; "PV Lines"."Shortcut Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_PVLines; "PV Lines"."Shortcut Dimension 2 Code")
                {
                }
                column(AppliestoDocNo_PVLines; "PV Lines"."Applies to Doc. No")
                {
                }
                column(VATCode_PVLines; "PV Lines"."VAT Code")
                {
                }
                column(WTaxCode_PVLines; "PV Lines"."W/Tax Code")
                {
                }
                column(RetentionCode_PVLines; "PV Lines"."Retention Code1")
                {
                }
                column(AdvanceRecovery_PVLines; "PV Lines"."Advance Recovery")
                {
                }
                column(VATAmount_PVLines; "PV Lines"."VAT Withheld Amount")
                {
                }
                column(WTaxAmount_PVLines; "PV Lines"."W/Tax Amount")
                {
                }
                column(RetentionAmount_PVLines; "PV Lines"."Retention  Amount")
                {
                }
                column(NetAmount_PVLines; "PV Lines"."Net Amount")
                {
                }
                column(WTVATCode_PVLines; "PV Lines"."W/T VAT Code")
                {
                }
                column(WTVATAmount_PVLines; "PV Lines"."W/T VAT Amount")
                {
                }
                column(VoteItem_PVLines; "PV Lines"."Vote Item")
                {
                }
                column(VoteAmount_PVLines; "PV Lines"."Vote Amount")
                {
                }
                column(ActualtoDate_PVLines; "PV Lines"."Actual to Date")
                {
                }
                column(Commitments_PVLines; "PV Lines".Commitments)
                {
                }
                column(VoteItemDesc_PVLines; "PV Lines"."Vote Item Desc.")
                {
                }
                column(BankName; BankName)
                {
                }
                column(PayeeBankBranchCode; PayeeBankBranchCode)
                {
                }
                column(PayeeBankAccountNumber; PayeeBankAccountNumber)
                {
                }
                column(SupervisionCost_PVLines; "PV Lines"."Obligation WHT")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if "PV Lines"."Account Type" = "PV Lines"."account type"::Vendor then begin
                        BankName := "PV Lines"."Payee Bank Name";
                        PayeeBankBranchCode := "PV Lines"."Payee Bank Branch Code";
                        PayeeBankAccountNumber := "PV Lines"."Payee Bank Account Number";
                    end
                    else begin
                        BankName := payments."Employee Ban Account Name";
                        PayeeBankBranchCode := payments."Employee Bank Brach Code";
                        PayeeBankAccountNumber := payments."Employee Bank Account Number";
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //Ushindi
                /*
                CheckReport.InitTextVariable();
                CheckReport.FormatNoText(NumberText,TTotal,'');
                */
                payments.CalcFields("Total Net Amount");
                PaymentMgt.InitTextVariable;
                PaymentMgt.FormatNoText(NumberText, payments."Total Net Amount", CurrencyCodeText);
                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 57000);
                ApprovalEntries.SetRange("Document No.", payments."No.");
                //ApprovalEntries.SETRANGE(Approval."Document Type","Purchase Header"."Document Type"::"Purchase Requisition");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                //ApprovalEntries.SETFILTER(Status,'<>%1',ApprovalEntries.Status::Canceled);
                if ApprovalEntries.Find('-') then begin
                    //i:=0;
                    repeat
                        //i:=i+1;
                        //IF i=2 THEN BEGIN
                        if ApprovalEntries."Sequence No." = 1 then begin
                            Approver1[1] := ApprovalEntries."Sender ID";

                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver1[1]) then
                                UserSetup.CalcFields(Picture);
                            Approver1[2] := ApprovalEntries."Last Modified By User ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver1[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;



                        // IF i=3 THEN
                        // BEGIN
                        if ApprovalEntries."Sequence No." = 2 then begin
                            Approver1[3] := ApprovalEntries."Approver ID";

                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver1[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;

                        //IF i= 4 THEN
                        if ApprovalEntries."Sequence No." = 3 then begin
                            Approver1[4] := ApprovalEntries."Approver ID";

                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver1[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;

                        //IF i=5 THEN
                        if ApprovalEntries."Sequence No." = 4 then begin
                            Approver1[5] := ApprovalEntries."Approver ID";
                            ApproverDate[5] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup4.Get(Approver1[5]) then
                                UserSetup4.CalcFields(Picture);
                        end;

                        //IF i=6 THEN
                        begin
                            Approver1[6] := ApprovalEntries."Approver ID";
                            ApproverDate[6] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup5.Get(Approver1[6]) then
                                UserSetup5.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;

            end;

            trigger OnPreDataItem()
            begin
                payments.CalcFields(payments."Bank Name", payments."Project Description");
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

    trigger OnInitReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        CheckReport: Report Check;
        NumberText: array[2] of Text[80];
        TTotal: Decimal;
        PaymentMgt: Codeunit 57000;
        CurrencyCodeText: Code[10];
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        Approver1: array[10] of Code[50];
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        UserSetup4: Record "User Setup";
        UserSetup5: Record "User Setup";
        BankName: Text[250];
        PayeeBankBranchCode: Text;
        PayeeBankAccountNumber: Text;
}

