#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54009 "Receipts and Payment Types"
{
    //  DrillDownPageID = UnknownPage54043;
    //  LookupPageID = UnknownPage54043;

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(4; Type; Option)
        {
            OptionMembers = " ",Receipt,Payment;
        }
        field(5; "VAT Chargeable"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(6; "Withholding Tax Chargeable"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(7; "VAT Code"; Code[20])
        {
            TableRelation = "Tarriff Codes";
        }
        field(8; "Withholding Tax Code"; Code[20])
        {
            TableRelation = "Tarriff Codes";
        }
        field(9; "Default Grouping"; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(10; "G/L Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(11; "Show Sub ledger"; Option)
        {
            OptionCaption = 'No,Yes';
            OptionMembers = No,Yes;
        }
        field(12; "Investment Type"; Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage,"Unit Trust";
        }
        field(13; "FA Posting Type"; Option)
        {
            Caption = 'FA Posting Type';
            OptionCaption = ' ,Acquisition Cost,Depreciation,Write-Down,Appreciation,Custom 1,Custom 2,Disposal,Maintenance';
            OptionMembers = " ","Acquisition Cost",Depreciation,"Write-Down",Appreciation,"Custom 1","Custom 2",Disposal,Maintenance;
        }
        field(14; "Investment Transcation Type"; Option)
        {
            OptionMembers = " ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,Principal;
        }
        field(15; "No. Of Units Required"; Boolean)
        {
        }
        field(16; "Calculate Interest"; Boolean)
        {
        }
        field(17; "Schedule Mandatory"; Boolean)
        {
        }
        field(18; "Calculate Broker Commission"; Boolean)
        {
        }
        field(19; "Calculate Withholding Tax"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

