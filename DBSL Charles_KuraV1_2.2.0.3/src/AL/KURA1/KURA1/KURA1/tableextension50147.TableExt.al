#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50147 "tableextension50147" extends "Finance Cue"
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on ""Outstanding Vendor Invoices"(Field 33)".

        field(50001; "Posted Payment Vouchers"; Integer)
        {
            AccessByPermission = TableData payments = R;
            CalcFormula = count(payments where("Payment Type" = const("Payment Voucher"),
                                                Posted = const(true)));
            FieldClass = FlowField;
        }
        field(50002; "Approved Payment Vouchers"; Integer)
        {
            CalcFormula = count(payments where("Payment Type" = const("Payment Voucher"),
                                                Status = const(Released)));
            FieldClass = FlowField;
        }
        field(50003; "Pending Payment Vouchers"; Integer)
        {
            CalcFormula = count(payments where("Payment Type" = const("Payment Voucher"),
                                                Status = const("Pending Approval")));
            FieldClass = FlowField;
        }
        field(50004; "Approved Surrenders"; Integer)
        {
            CalcFormula = count(payments where("Payment Type" = const(Surrender),
                                                Status = const(Released),
                                                Posted = const(false)));
            FieldClass = FlowField;
        }
        field(50005; "pending Surrenders"; Integer)
        {
            CalcFormula = count(payments where("Payment Type" = const(Surrender),
                                                Status = const("Pending Approval")));
            FieldClass = FlowField;
        }
        field(50006; "Posted Surrenders"; Integer)
        {
            CalcFormula = count(payments where("Payment Type" = const(Surrender),
                                                Posted = const(true)));
            FieldClass = FlowField;
        }
        field(50007; "Customer with balance"; Integer)
        {
            CalcFormula = count(Customer where(Balance = filter(<> 0)));
            FieldClass = FlowField;
        }
        field(50008; "Vendors with Balance"; Integer)
        {
            CalcFormula = count(Vendor where(Balance = filter(<> 0)));
            FieldClass = FlowField;
        }
        field(50009; "Pending Fin Copyright Works"; Integer)
        {
            CalcFormula = count("Copyright Registration Table" where(Invoiced = const(false),
                                                                    Status = const(Pending)));
            FieldClass = FlowField;
        }
        field(50010; "Requests to Approve"; Integer)
        {
            CalcFormula = count("Approval Entry" where
                                                        (Status = filter(Open)));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
        }
        field(50011; "Requests Sent for Approval"; Integer)
        {
            CalcFormula = count("Approval Entry" where
                                                        (Status = filter(Open)));
            Caption = 'Requests Sent for Approval';
            FieldClass = FlowField;
        }
    }
    var
        USER: Record User;
}

