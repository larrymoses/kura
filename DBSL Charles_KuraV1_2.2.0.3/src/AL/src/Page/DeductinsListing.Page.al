#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69021 "Deductins Listing"
{
    Editable = false;
    PageType = List;
    SourceTable = DeductionsX;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Code";"Insurance Code")
                {
                    ApplicationArea = Basic;
                }
                field(Block;Block)
                {
                    ApplicationArea = Basic;
                }
                field("Non-Cash Benefit";"Non-Cash Benefit")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Limit Percentage";"Pension Limit Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Limit Amount";"Pension Limit Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Applies to All";"Applies to All")
                {
                    ApplicationArea = Basic;
                }
                field("Show on Master Roll";"Show on Master Roll")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Scheme Code";"Pension Scheme Code")
                {
                    ApplicationArea = Basic;
                }
                field("Main Deduction Code";"Main Deduction Code")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Code";"Institution Code")
                {
                    ApplicationArea = Basic;
                }
                field("Show on Payslip Information";"Show on Payslip Information")
                {
                    ApplicationArea = Basic;
                }
                field("Voluntary Percentage";"Voluntary Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Balance Type";"Balance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Calculation Method";"Calculation Method")
                {
                    ApplicationArea = Basic;
                }
                field("Flat Amount";"Flat Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount";"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Deduct From Pension";"Deduct From Pension")
                {
                    ApplicationArea = Basic;
                }
                field("Calculate Excess Pension";"Calculate Excess Pension")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

