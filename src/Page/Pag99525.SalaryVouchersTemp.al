
page 99525 "Salary Vouchers Temp"
{
    ApplicationArea = All;
    Caption = 'Salary Vouchers Temp';
    PageType = List;
    SourceTable = "Payroll HeaderT";
    UsageCategory = Lists;
    CardPageId = "Salary Voucher Temp";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                 field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Net Pay"; Rec."Net Pay")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}

