#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69014 "Loan Products Setup"
{
    Editable = true;
    RefreshOnActivate = true;
    SourceTable = "Loan Product Type";

    layout
    {
        area(content)
        {
            field("Code"; Code)
            {
                ApplicationArea = Basic;
            }
            field(Description; Description)
            {
                ApplicationArea = Basic;
            }
            field("Interest Rate"; "Interest Rate")
            {
                ApplicationArea = Basic;
            }
            field("Interest Calculation Method"; "Interest Calculation Method")
            {
                ApplicationArea = Basic;
            }
            field("No Series"; "No Series")
            {
                ApplicationArea = Basic;
            }
            field("No of Instalment"; "No of Instalment")
            {
                ApplicationArea = Basic;
            }
            field("Loan No Series"; "Loan No Series")
            {
                ApplicationArea = Basic;
            }
            field(Rounding; Rounding)
            {
                ApplicationArea = Basic;
            }
            field("Rounding Precision"; "Rounding Precision")
            {
                ApplicationArea = Basic;
            }
            field("Loan Category"; "Loan Category")
            {
                ApplicationArea = Basic;
            }
            field("Calculate Interest"; "Calculate Interest")
            {
                ApplicationArea = Basic;
            }
            field("Interest Deduction Code"; "Interest Deduction Code")
            {
                ApplicationArea = Basic;
            }
            field("Deduction Code"; "Deduction Code")
            {
                ApplicationArea = Basic;
            }
            field(Internal; Internal)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    var
    // WshShell: Automation WshShell;
}

