enum 50010 "Commitment Document Type"
{
    Extensible = true;
      value(0; " ")
    {
        Caption = '';
    }
    value(1; LPO)
    {
        Caption = 'Purchase Order';
    }
    value(2; "Service Order")
    {
        Caption = 'Service Order';
    }
     value(3; Imprest)
    {
        Caption = 'Imprest Memo';
    }
     value(4; Payroll)
    {
        Caption = 'Payroll';
    }
    value(5; PRN)
    {
        Caption = 'Purchase Requisition';
    }
     value(6; "Imprest Requisition")
    {
        Caption = 'Imprest Requisition';
    }
     value(7; Payment)
    {
        Caption = 'Payment';
    }
}
