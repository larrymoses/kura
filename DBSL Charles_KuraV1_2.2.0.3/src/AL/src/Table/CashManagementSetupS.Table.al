#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56006 "Cash Management  SetupS"
{

    fields
    {
        field(1;"Primary Key";Code[10])
        {
        }
        field(2;"Payment Voucher Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(3;"Imprest Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(4;"Imprest Surrender Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(5;"Petty Cash Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(6;"Receipt Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(7;"Post VAT";Boolean)
        {
        }
        field(8;"Rounding Type";Option)
        {
            OptionCaption = 'Up,Nearest,Down';
            OptionMembers = Up,Nearest,Down;
        }
        field(9;"Rounding Precision";Decimal)
        {
        }
        field(10;"Imprest Limit";Decimal)
        {
        }
        field(11;"Imprest Due Date";DateFormula)
        {
        }
        field(12;"Default Imprest Posting Group";Code[20])
        {
            TableRelation = "Customer Posting Group";
        }
        field(50000;"PV Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50001;"Imprest Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50002;"Petty Cash Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50003;"Receipt Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50004;"Current Budget";Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(50005;"Current Budget Start Date";Date)
        {
        }
        field(50006;"Current Budget End Date";Date)
        {
        }
        field(50007;"File Directory";Text[100])
        {
        }
        field(50008;"Change Request No.";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50009;"Share Top Up Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50010;"AIE Nos";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

