#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54000 "Expected Interest1"
{

    fields
    {
        field(1;"Investment No";Code[20])
        {
            TableRelation = "Investment Asset";

            trigger OnValidate()
            begin
                if Equity.Get("Investment No") then
                begin
                 "Ledger Code":=Equity."Custodian Code";

                end;
            end;
        }
        field(2;"Expected Interest Date";Date)
        {
            NotBlank = true;
        }
        field(3;"Expected Interest Amount";Decimal)
        {
        }
        field(4;Received;Boolean)
        {

            trigger OnValidate()
            begin
                if "Received Amount"="Net Amount" then
                Received:=true;
            end;
        }
        field(5;Type;Option)
        {
            OptionMembers = Interest,Bonus,Dividend,"Share Split";
        }
        field(6;"Received Amount";Decimal)
        {
            FieldClass = Normal;
        }
        field(7;"Principal Amount";Decimal)
        {
        }
        field(8;"Principal Amount + Interest";Decimal)
        {
        }
        field(9;"Tax Benefit";Decimal)
        {
        }
        field(10;"Interest Subsidy";Decimal)
        {
        }
        field(11;Posted;Boolean)
        {
        }
        field(12;"No. Of Days";Integer)
        {
        }
        field(13;"Old Ratio";Decimal)
        {
        }
        field(14;"New Ratio";Decimal)
        {

            trigger OnValidate()
            begin
                if Equity.Get("Investment No") then
                begin
                if Type=Type::"Share Split" then begin
                 Equity.SetRange(Equity."Date Filter",0D,"Expected Interest Date");
                 Equity.CalcFields(Equity."No.Of Units");
                 if "Old Ratio"<>0 then
                 "New No. of Units":=("New Ratio"/"Old Ratio")*Equity."No.Of Units"

                end;
                if Type=Type::Bonus then begin
                 Equity.SetRange(Equity."Date Filter",0D,"Expected Interest Date");
                 Equity.CalcFields(Equity."No.Of Units");
                 if "Old Ratio"<>0 then begin
                // "New No. of Units":=("New Ratio"/"Old Ratio")*Equity."No.Of Units"
                   "Bonus Units":=("New Ratio"/"Old Ratio")*Equity."No.Of Units";
                "New No. of Units":="Bonus Units"+Equity."No.Of Units"

                   end;
                end;

                end;
            end;
        }
        field(15;"New No. of Units";Decimal)
        {
            Editable = false;
        }
        field(16;"Ledger Code";Code[10])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(17;"Whtax Amount";Decimal)
        {
        }
        field(18;"Net Amount";Decimal)
        {
        }
        field(19;"Rate %";Decimal)
        {
        }
        field(20;"End Date";Date)
        {
        }
        field(21;"Year Start";Integer)
        {
        }
        field(22;"Year End";Integer)
        {
        }
        field(23;"InvestmentNo filter";Code[20])
        {
        }
        field(24;"Bonus Units";Decimal)
        {
            Editable = false;
        }
        field(25;Locked;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Investment No","Expected Interest Date",Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Equity: Record "Investment Asset";
}

