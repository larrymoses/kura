pageextension 50147 "Accountant Role Ext" extends "Accountant Role Center"
{
    actions
    {
        addafter("Cost Accounting")
        {

            group("Payment Vouchers")
            {
                action("Payment Voucher List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Voucher List';
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Payments Vouchers";
                }
                action("Approved Payment Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Payment Voucher List';
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Approved Payment Vouchers";
                }
            }
            action(Retention)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Retention List';
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page Retentions;
                RunPageLink = Posted=const(false);
            }
               action(PostedRetention)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Retention List';
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page Retentions;
                RunPageLink = Posted=const(true);
            }

        }
        addafter(Action16)
        {
            group("Casuals")
            {
                action("Pay Periods")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Pay Periods';
                    Image = Employee;
                    RunObject = Page "Pay Period Temp";
                }
                action("Casual Employees")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Casual Employees';
                    Image = Employee;
                    RunObject = Page "Temporary Employees List";
                }
                action("Casual Earnings")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Casual Earnings';
                    Image = Invoice;
                    RunObject = Page "Earnings Temp";
                }
                action("Casual Deductions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Casual Deductions';
                    Image = PriceAdjustment;
                    RunObject = Page "Deductions Temp";
                }
                action("Bracket Tables")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bracket Tables';
                    Image = Table;
                    RunObject = Page "Casual Bracket Tables";
                }
                action("Posting Groups")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posting Groups';
                    Image= Group;
                    RunObject = Page "Employee Posting Group T List";
                }
                action("Salary Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Salary Vouchers';
                    Image = Table;
                    RunObject = Page "Salary Vouchers Temp";
                }
                group(CasualReports)
                {
                    Caption = 'Reports';

                }
            }
        }
    }
}
