#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57022 "Institutional Actns Amount"
{

    fields
    {
        field(1;"Investment Code";Code[20])
        {
            NotBlank = true;
            TableRelation = "Investment Asset";

            trigger OnValidate()
            begin
                  if Investment.Get("Investment Code") then
                  Name:=Investment.Description;
            end;
        }
        field(2;Name;Text[230])
        {
            Editable = false;
        }
        field(3;Date;Date)
        {
        }
        field(4;Type;Option)
        {
            NotBlank = true;
            OptionMembers = " ",Dividend,"Share Split",Revaluation,Bonus;
        }
        field(5;Posted;Boolean)
        {
        }
        field(6;Amount;Decimal)
        {
            DecimalPlaces = 2:8;
        }
        field(7;"Old Ratio";Decimal)
        {
        }
        field(8;"New Ratio";Decimal)
        {
        }
        field(9;"Current Market Price";Decimal)
        {
        }
        field(10;"Books Closure Date";Date)
        {

            trigger OnValidate()
            begin
                Date:="Books Closure Date";
            end;
        }
        field(11;"Payment Date";Date)
        {
        }
        field(12;"Payment posted";Boolean)
        {
        }
        field(13;"Document No";Code[50])
        {
            TableRelation = "Budget Commitment";
        }
        field(14;"Fund Code";Code[50])
        {
            TableRelation = "Fund Code";
        }
        field(15;"Custodian Code";Code[50])
        {
            TableRelation = "Custodian Code";
        }
        field(16;"Check to Post";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;Date,"Investment Code",Type,"Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Investment: Record "Investment Asset";
}

