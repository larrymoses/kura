report 50018 "Fuel Budget"
{
    ApplicationArea = All;
    Caption = 'Fuel Budget';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/FuelBudget.rdl';
    dataset
    {
        dataitem(DimensionCodeBuffer; "Dimension Code Buffer")
        {
            RequestFilterFields = Code;
            column(Code;"Code")
            {
            }
            column(Name; Name)
            {
            }
            column(Amount; Amount)
            {
            }
            column(Totaling; Totaling)
            {
            }
            column(Period_Start;"Period Start")
            {
            }
            column(Period_End;"Period End")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
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
}
