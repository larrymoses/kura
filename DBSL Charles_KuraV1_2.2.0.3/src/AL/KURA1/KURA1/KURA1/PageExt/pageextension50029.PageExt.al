#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50029 "pageextension50029" extends Budget
{
    actions
    {
        addafter(ReportTrialBalance)
        {

            action(ReportTrialBalance1)
            {
                ApplicationArea = Suite;
                Caption = 'Trial Balance/Budget KURA';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'View budget details for the specified period.';

                trigger OnAction()
                begin
                    REPORT.Run(REPORT::"Trial Balance KURA");
                end;
            }
        }
        //Unsupported feature: Code Modification on ""Delete Budget"(Action 1102601003).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DeleteBudget;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ERROR('You are not allowed to delete a budget');
        DeleteBudget;
        */
        //end;
    }

    var
        AccountingPeriod: Record "Accounting Period";
        StartingDateFilter: Text;
        EndindDateFilter: Text;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF GLAccBudgetBuf.GETFILTER("Global Dimension 1 Filter") <> '' THEN
      GlobalDim1Filter := GLAccBudgetBuf.GETFILTER("Global Dimension 1 Filter");
    IF GLAccBudgetBuf.GETFILTER("Global Dimension 2 Filter") <> '' THEN
    #4..33

    PeriodType := PeriodType::Month;
    IncomeBalanceGLAccFilter := IncomeBalanceGLAccFilter::"Income Statement";
    IF DateFilter = '' THEN
      ValidateDateFilter(FORMAT(CALCDATE('<-CY>',TODAY)) + '..' + FORMAT(CALCDATE('<CY>',TODAY)));

    FindPeriod('');
    MATRIX_GenerateColumnCaptions(MATRIX_Step::Initial);

    UpdateMatrixSubform;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..36
    IF DateFilter = '' THEN BEGIN
      StartingDateFilter:='07/01/2021';
      EndindDateFilter:='06/30/2022';
      //ValidateDateFilter(FORMAT(CALCDATE('<-CY>',TODAY)) + '..' + FORMAT(CALCDATE('<CY>',TODAY)));
      ValidateDateFilter(StartingDateFilter+'..'+EndindDateFilter);
    END;
    #40..43
    */
    //end;
}

