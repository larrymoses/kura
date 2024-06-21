#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 57004 "Imprest Requisition"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Imprest Requisition.rdlc';

    dataset
    {
        dataitem(payments; payments)
        {
            DataItemTableView = where("Payment Type" = const(Imprest));
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.", Date, "Cheque No", "Bank Code", Payee;
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(EmployeeMobileNo_Payments; payments."Employee Mobile No")
            {
            }
            column(EmployeeBankAccountCode_Payments; payments."Employee Bank Account Code")
            {
            }
            column(EmployeeBanAccountName_Payments; payments."Employee Ban Account Name")
            {
            }
            column(EmployeeBankBrachCode_Payments; payments."Employee Bank Brach Code")
            {
            }
            column(EmployeeBankBranchName_Payments; payments."Employee Bank Branch Name")
            {
            }
            column(EmployeeBankAccountNumber_Payments; payments."Employee Bank Account Number")
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
            column(VoteItem_Payments; payments."Vote Item")
            {
            }
            column(VoteAmount_Payments; payments."Vote Amount")
            {
            }
            column(Commitments_Payments; payments.Commitments)
            {
            }
            column(ActualAmount_Payments; payments."Actual Amount")
            {
            }
            column(AvailableAmount_Payments; payments."Available Amount")
            {
            }
            column(No_Payments; payments."No.")
            {
            }
            column(DestinationName_Payments; payments."Destination Name")
            {
            }
            column(Date_Payments; Format(payments.Date, 0, 4))
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
            column(JobDescription_Payments; payments."Project Description")
            {
            }
            column(ImprestMemoNo_Payments; payments."Imprest Memo No")
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
            column(CreatedBySignature; CreatorUserSetup.Picture)
            {

            }
            column(CreatorName; CreatorName)
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
            column(ImprestBankAccountNo_Payments; payments."Imprest Bank Account Number")
            {
            }
            column(ImprestBankName_Payments; payments."Imprest Bank Name")
            {
            }
            column(PaymentNarration_Payments; payments."Payment Narration")
            {
            }
            column(ImprestBankBranchName_Payments; payments."Imprest Bank Branch Name")
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
            column(Number_In_Words; NumberText[1])
            {
            }
            column(JobGroup_Payments; payments."Job Group")
            {
            }
            column(strCopyText; strCopyText)
            {
            }
            dataitem("Imprest Lines"; "Imprest Lines")
            {
                DataItemLink = No = field("No.");
                DataItemTableView = sorting(No, "Line No");
                column(ReportForNavId_1000000024; 1000000024)
                {
                }
                column(No_ImprestLines; "Imprest Lines".No)
                {
                }
                column(LineNo_ImprestLines; "Imprest Lines"."Line No")
                {
                }
                column(AccountType_ImprestLines; "Imprest Lines"."Account Type")
                {
                }
                column(AccountNo_ImprestLines; "Imprest Lines"."Account No.")
                {
                }
                column(AccountName_ImprestLines; "Imprest Lines"."Account Name")
                {
                }
                column(Description_ImprestLines; "Imprest Lines".Description)
                {
                }
                column(Amount_ImprestLines; "Imprest Lines".Amount)
                {
                }
                column(AppliestoDocNo_ImprestLines; "Imprest Lines"."Applies- to Doc. No.")
                {
                }
                column(GlobalDimension1Code_ImprestLines; "Imprest Lines"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_ImprestLines; "Imprest Lines"."Global Dimension 2 Code")
                {
                }
                column(ActualSpent_ImprestLines; "Imprest Lines"."Actual Spent")
                {
                }
                column(RemainingAmount_ImprestLines; "Imprest Lines"."Remaining Amount")
                {
                }
                column(Committed_ImprestLines; "Imprest Lines".Committed)
                {
                }
                column(AdvanceType_ImprestLines; "Imprest Lines"."Advance Type")
                {
                }
                column(CurrencyCode_ImprestLines; "Imprest Lines"."Currency Code")
                {
                }
                column(CurrencyFactor_ImprestLines; "Imprest Lines"."Currency Factor")
                {
                }
                column(AmountLCY_ImprestLines; "Imprest Lines"."Amount LCY")
                {
                }
                column(ExpenseType_ImprestLines; "Imprest Lines"."Expense Type")
                {
                }
                column(WorkType_ImprestLines; "Imprest Lines"."Work Type")
                {
                }
                column(ResourceNo_ImprestLines; "Imprest Lines"."Resource No.")
                {
                }
                column(TaskNo_ImprestLines; "Imprest Lines"."Task No.")
                {
                }
                column(JobTaskDescription_ImprestLines; "Imprest Lines"."Job Task Description")
                {
                }
                column(Project_ImprestLines; "Imprest Lines".Project)
                {
                }
                column(DueDate_ImprestLines; "Imprest Lines"."Due Date")
                {
                }
                column(ImprestHolder_ImprestLines; "Imprest Lines"."Imprest Holder")
                {
                }
                column(ConvertedAmount; ConvertedAmount)
                {

                }
                column(JobNo_ImprestLines; "Imprest Lines"."Job No.")
                {
                }
                column(Purpose_ImprestLines; "Imprest Lines".Purpose)
                {
                }
                column(BudgetaryControlAC_ImprestLines; "Imprest Lines"."Budgetary Control A/C")
                {
                }
                column(Destination_ImprestLines; "Imprest Lines".Destination)
                {
                }
                column(DailyRate_ImprestLines; "Imprest Lines"."Daily Rate")
                {
                }
                column(NoofDays_ImprestLines; "Imprest Lines"."No. of Days")
                {
                }
                column(Subsistence_ImprestLines; "Imprest Lines".Subsistence)
                {
                }
                column(JobTaskNo_ImprestLines; "Imprest Lines"."Job Task No.")
                {
                }
                column(JobQuantity_ImprestLines; "Imprest Lines"."Job Quantity")
                {
                }
                column(Status_ImprestLines; "Imprest Lines".Status)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                "Imprest Lines".Validate("No. of Days");
                PaymentMgt.InitTextVariable;
                PaymentMgt.FormatNoText(NumberText, "Imprest Amount", CurrencyCodeText);
                if CreatorUserSetup.Get("Created By") then begin
                    CreatorUserSetup.CalcFields(Picture);
                    CreatorName := CreatorUserSetup."Employee Name";
                end;
                //daudi
                if payments."No. Printed" = 0 then
                    strCopyText := 'ORIGINAL'
                else
                    if payments."No. Printed" = 1 then
                        strCopyText := 'DUPLICATE'
                    else
                        if payments."No. Printed" > 2 then
                            strCopyText := 'TRIPLICATE';

                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 57000);
                ApprovalEntries.SetRange("Document No.", payments."No.");
                //ApprovalEntries.SETRANGE(Approval."Document Type","Purchase Header"."Document Type"::"Purchase Requisition");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                //ApprovalEntries.SETFILTER(Status,'<>%1',ApprovalEntries.Status::Canceled);
                if ApprovalEntries.Find('-') then begin
                    repeat
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
                        if ApprovalEntries."Sequence No." = 2 then begin
                            Approver1[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver1[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if ApprovalEntries."Sequence No." = 3 then begin
                            Approver1[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver1[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                        if ApprovalEntries."Sequence No." = 4 then begin
                            Approver1[5] := ApprovalEntries."Approver ID";
                            ApproverDate[5] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup4.Get(Approver1[5]) then
                                UserSetup4.CalcFields(Picture);
                        end;
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

            trigger OnPostDataItem()
            begin
                if CurrReport.Preview = false then begin
                    payments."No. Printed" := payments."No. Printed" + 1;
                    payments.Modify;
                    Message('%1', payments."No. Printed")
                end;
            end;

            trigger OnPreDataItem()
            begin
                payments.CalcFields(payments."Bank Name", payments."Project Description", payments."Imprest Amount");
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
        Approver1: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        CreatorUserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        UserSetup4: Record "User Setup";
        i: Integer;
        strCopyText: Text;
        UserSetup5: Record "User Setup";
        CreatorName: Text;
}

