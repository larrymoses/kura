#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72211 "Contract Currency"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Currency Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(4;"Percentage of Total Payment(%)";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange("No.","Document No");
                if PurchaseHeader.FindSet then
                  begin
                    "Amount(LCY)":=ROUND("Percentage of Total Payment(%)"/100*PurchaseHeader."Contract Sum",0.01,'>');
                  end;

                TotalPercentage:=0;
                ContractCurrency.Reset;
                ContractCurrency.SetRange("Document No","Document No");
                if ContractCurrency.FindSet then
                  repeat
                    TotalPercentage:=TotalPercentage+ContractCurrency."Percentage of Total Payment(%)";
                  until ContractCurrency.Next=0;

                // IF ContractCurrency."Percentage of Total Payment(%)" > 100 THEN
                //  ERROR('Maximum percentage for the whole contract should not exceed 100');
            end;
        }
        field(5;"Exchange Rate";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Amount:="Exchange Rate"*"Amount(LCY)";
            end;
        }
        field(6;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Amount(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PurchaseHeader: Record "Purchase Header";
        ContractCurrency: Record "Contract Currency";
        TotalPercentage: Decimal;
}

