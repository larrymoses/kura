#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 57012 "Petty Cash Surrender"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Petty Cash Surrender.rdlc';

    dataset
    {
        dataitem(payments; payments)
        {
            DataItemTableView = where("Payment Type" = filter("Petty Cash" | "Petty Cash Surrender"));
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
            column(SurrenderDate_Payments; payments."Surrender Date")
            {
            }
            column(Date_Payments; payments.Date)
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
            column(GlobalDimension3Code_Payments; payments."Shortcut Dimension 3 Code")
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
            column(PaymentNarration_Payments; payments."Payment Narration")
            {
            }
            column(SurrenderedBy; SurrenderedBy)
            {
            }
            column(Surrendered_Signature; UserSetup5.Picture)
            {
            }
            column(PostedByName; PostedByName)
            {
            }
            column(PostedBySignature; UserSetup4.Picture)
            {
            }
            column(Number_In_Words; NumberText[1])
            {
            }
            column(PreparedBy; Approver[1])
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; Approver[2])
            {
            }
            column(DateApproved; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; Approver[3])
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; Approver[4])
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
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
            dataitem("Petty Cash Lines"; "Petty Cash Lines")
            {
                DataItemLink = No = field("No.");
                column(ReportForNavId_7; 7)
                {
                }
                column(No_PVLines; "Petty Cash Lines".No)
                {
                }
                column(LineNo_PVLines; "Petty Cash Lines"."Line No")
                {
                }
                column(AccountType_PVLines; "Petty Cash Lines"."Account Type")
                {
                }
                column(AccountNo_PVLines; "Petty Cash Lines"."Account No")
                {
                }
                column(AccountName_PVLines; "Petty Cash Lines"."Account Name")
                {
                }
                column(Description_PVLines; "Petty Cash Lines".Description)
                {
                }
                column(Amount_PVLines; "Petty Cash Lines".Amount)
                {
                }
                column(GlobalDimension1Code_PVLines; "Petty Cash Lines"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_PVLines; "Petty Cash Lines"."Global Dimension 2 Code")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin

                PaymentMgt.InitTextVariable;
                PaymentMgt.FormatNoText(NumberText, "Total Amount", CurrencyCodeText);



                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 57000);
                ApprovalEntries.SetRange("Document No.", payments."No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver[1]) then
                                UserSetup.CalcFields(Picture);

                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            Approver[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;

                //Posted BY- Muraya
                UserSetup4.Reset;
                UserSetup4.SetRange("User ID", payments."Posted By");
                if UserSetup4.Find('-') then begin
                    UserSetup4.CalcFields(Picture);
                    PostedByName := UserSetup."Employee Name";
                end;
                UserSetup5.Reset;
                UserSetup5.SetRange("User ID", payments."Surrendered By");
                if UserSetup5.Find('-') then begin
                    UserSetup5.CalcFields(Picture);
                    SurrenderedBy := UserSetup."Employee Name";
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
        Approver: array[10] of Code[30];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        PostedByName: Text;
        UserSetup4: Record "User Setup";
        UserSetup5: Record "User Setup";
        SurrenderedBy: Text;
}

