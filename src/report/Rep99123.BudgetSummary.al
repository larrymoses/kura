report 99123 "Budget Summary"
{
    ApplicationArea = All;
    Caption = 'Budget Summary';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/BudgetSummary.rdl';
    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(No_; "No.")
            {

            }
            column(Name; Name)
            {

            }
            column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group")
            {

            }
            column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
            {

            }
            column(VAT_Prod__Posting_Group; "VAT Prod. Posting Group")
            {

            }
            column(VAT_Bus__Posting_Group; "VAT Bus. Posting Group")
            {

            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {

            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {

            }
            column(Global_Dimension_3_Code; "Global Dimension 3 Code")
            {

            }
            column(BudgetedAmount; BudgetedAmount)
            {

            }
            column(ActualSpent; ActualSpent)
            {

            }

            column(CommittedAmount; CommittedAmount)
            {

            }
            column(AvailableAmount; AvailableAmount)
            {

            }
            trigger OnPreDataItem()
            begin
                if AccountNo <> '' then
                    SetRange("No.", AccountNo);
            end;

            trigger OnAfterGetRecord()
            begin
                BudgetedAmount := 0;
                ActualSpent := 0;
                CommittedAmount := 0;
                AvailableAmount := 0;
                GLSetup.Get();

                //Budgeted Amount
                BudgetEntry.Reset();
                if FinancialYear <> '' then
                    BudgetEntry.SetRange(BudgetEntry."Budget Name", FinancialYear);
                BudgetEntry.SetRange(BudgetEntry."G/L Account No.", "No.");
                if Global_Dimension_1_Code <> '' then
                    BudgetEntry.SetRange(BudgetEntry."Global Dimension 1 Code", Global_Dimension_1_Code);
                if Global_Dimension_2_Code <> '' then
                    BudgetEntry.SetRange(BudgetEntry."Global Dimension 2 Code", Global_Dimension_2_Code);
                IF Shortcut_Dimension_3_Code <> '' then
                    BudgetEntry.SetRange(BudgetEntry."Shortcut Dimension 3 Code", Shortcut_Dimension_3_Code);
                if BudgetEntry.FindFirst() then begin
                    BudgetEntry.CalcSums(Amount);
                    BudgetedAmount := BudgetEntry.Amount;
                end;
                //Budgeted Amount
                //Committed Amount
                CommitmentEntries.Reset();
                CommitmentEntries.SetRange("Account No.", "No.");
                if FinancialYear <> '' then
                    CommitmentEntries.SETRANGE("Budget Year", FinancialYear);
                if Global_Dimension_1_Code <> '' then
                    CommitmentEntries.SetRange("Global Dimension 1 Code", Global_Dimension_1_Code);
                if Global_Dimension_2_Code <> '' then
                    CommitmentEntries.SetRange("Global Dimension 2 Code", Global_Dimension_2_Code);
                IF Shortcut_Dimension_3_Code <> '' then
                    CommitmentEntries.SetRange("Shortcut Dimension 3 Code", Shortcut_Dimension_3_Code);
                if CommitmentEntries.FindSet() then begin
                    repeat
                        CommittedAmount := CommittedAmount + CommitmentEntries."Committed Amount";
                    until CommitmentEntries.next() = 0;
                end;
                //Committed Amount
                //Actual Spent
                GLEntry.Reset;
                GLEntry.SetRange(GLEntry."G/L Account No.", "No.");
                if Global_Dimension_1_Code <> '' then
                    GLEntry.SetRange("Global Dimension 1 Code", Global_Dimension_1_Code);
                if Global_Dimension_2_Code <> '' then
                    GLEntry.SetRange("Global Dimension 2 Code", Global_Dimension_2_Code);
                IF Shortcut_Dimension_3_Code <> '' then
                    GLEntry.SetRange("Shortcut Dimension 3 Code", Shortcut_Dimension_3_Code);
                if GLEntry.Findset() then begin
                    repeat
                        if FinancialYear <> '' then begin
                            if CustomFunction.GetBudgetYear(GLEntry."Posting Date") = FinancialYear then
                                ActualSpent := ActualSpent + GLEntry.Amount;
                        end else
                            ActualSpent := ActualSpent + GLEntry.Amount;
                    until GLEntry.next() = 0
                end;
                AvailableAmount := BudgetedAmount - (ActualSpent + CommittedAmount);
                //Actual Spent
                CompanyInfo.get();
                CompanyInfo.CalcFields(Picture);
                FormatAddr.GetCompanyAddr("Global Dimension 1 Code", ResponsibilityCenter, CompanyInfo, CompanyAddr);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                field("G/L Account"; AccountNo)
                {
                    Caption = 'G/L Account';
                    ApplicationArea = All;
                    TableRelation = "G/L Account"."No.";
                }
                field(FinancialYear; FinancialYear)
                {
                    ApplicationArea = All;
                    TableRelation = "G/L Budget Name".Name;
                }
                field(Global_Dimension_1_Code; Global_Dimension_1_Code)
                {
                    ApplicationArea = All;
                    CaptionClass = '1,1,1';
                    Caption = 'Global Dimension 1 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
                }
                field(Global_Dimension_2_Code; Global_Dimension_2_Code)
                {
                    ApplicationArea = All;
                    CaptionClass = '1,1,2';
                    Caption = 'Global Dimension 2 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
                }
                field(Shortcut_Dimension_3_Code; Shortcut_Dimension_3_Code)
                {
                    ApplicationArea = All;
                    CaptionClass = '1,2,3';
                    Caption = 'Shortcut Dimension 3 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        ActualSpent: Decimal;
        BudgetedAmount: Decimal;
        CommittedAmount: Decimal;
        AvailableAmount: Decimal;
        Global_Dimension_1_Code: Code[20];
        Global_Dimension_2_Code: Code[20];
        Shortcut_Dimension_3_Code: Code[20];
        CustomFunction: Codeunit "Custom Function";
        GLEntry: Record "G/L Entry";
        GLSetup: Record "General Ledger Setup";
        CommitmentEntries: Record "Commitment Entries";
        FinancialYear: Code[10];
        BudgetEntry: Record "G/L Budget Entry";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        ResponsibilityCenter: Record "Responsibility Center";
        AccountNo: Code[20];

}
