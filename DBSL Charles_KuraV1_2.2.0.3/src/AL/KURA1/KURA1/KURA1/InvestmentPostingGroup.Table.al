#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54013 "Investment Posting Group"
{
    DrillDownPageID = "Investment Posting Group";
    LookupPageID = "Investment Posting Group";

    fields
    {
        field(1;"Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;Description;Text[30])
        {
        }
        field(3;"Investment Cost Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(4;"Investment Revaluation Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(5;"Investment Income Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(6;"Ledger Code";Code[10])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(7;"Gain/Loss on Disposal Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(8;"Capital Reserve Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(9;"Mortgage Arrears Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(10;"Revaluation Gain/Loss";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(11;"Commissions Ac";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(12;"Security Cost Ac";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(13;"Other Cost Ac";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(14;"Dividend Receivable AC";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(15;"Dividend Income AC";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(16;"Withholding Tax Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(17;"Unit Trust Members A/c";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(18;"Interest Receivable Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

