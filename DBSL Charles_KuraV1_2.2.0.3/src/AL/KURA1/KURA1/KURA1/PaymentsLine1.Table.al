#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54020 "Payments Line1"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
        }
        field(2; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(3; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const(Customer)) Customer
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const("Bank Account")) "Bank Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const("IC Partner")) "IC Partner";
        }
        field(4; Description; Text[50])
        {
        }
        field(5; "PV No"; Code[20])
        {
        }
        field(6; "Business Source"; Option)
        {
            OptionCaption = ' ,Direct,Facultative';
            OptionMembers = " ","1","2";
        }
        field(7; "Business Line"; Option)
        {
            OptionCaption = ' ,COM,COM-MOU,PLS,PLS-MOU';
            OptionMembers = " ","1","2","3","4";
        }
        field(8; "Business Class"; Code[10])
        {
        }
        field(9; Department; Code[20])
        {
        }
        field(10; "Investment Code"; Code[20])
        {
        }
        field(11; "Type of Investment"; Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage;
        }
        field(12; "Deposit No."; Code[20])
        {
        }
        field(13; "Deposit Slip"; Boolean)
        {
        }
        field(14; "Cheque Type"; Code[10])
        {
            //     TableRelation = Table50120;
        }
        field(15; "Drawer Bank Name"; Text[20])
        {
        }
        field(16; "Drawer Branch Name"; Text[20])
        {
        }
        field(17; "No. Of Units"; Decimal)
        {
        }
        field(18; Payee; Text[50])
        {
        }
        field(19; "Expected Receipt date"; Date)
        {
        }
        field(20; "Investment Transcation Type"; Option)
        {
            OptionMembers = " ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses;
        }
        field(21; Amount; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "PV No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

