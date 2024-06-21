#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70225 "Bid Security Return Line"
{
    DrillDownPageID = "IFP Tender Committee";
    LookupPageID = "IFP Tender Committee";

    fields
    {
        field(1;"Document No";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Claim/Forfeiture,Released/Returned ';
            OptionMembers = "Claim/Forfeiture","Released/Returned ";
        }
        field(3;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Bid Security ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid_Contract Security Register"."No." where ("Form of Security"=field("Form of Security"));

            trigger OnValidate()
            begin
                Bid_ContractSecurityRegister.Reset;
                Bid_ContractSecurityRegister.SetRange("No.","Bid Security ID");
                if Bid_ContractSecurityRegister.FindSet then begin
                  "Vendor No.":=Bid_ContractSecurityRegister."Vendor No.";
                  "Form of Security":=Bid_ContractSecurityRegister."Form of Security";
                  "Issuer/Guarantor Name":=Bid_ContractSecurityRegister."Issuer/Guarantor Name";
                  "Security Amount (LCY)":=Bid_ContractSecurityRegister."Security Amount (LCY)";
                  end;
            end;
        }
        field(5;"Return Reason Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Security Close Code".Code;
        }
        field(6;"Form of Security";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Security Types".Code;
        }
        field(7;"Vendor No.";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(8;"Issuer/Guarantor Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Security Amount (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Date Closed";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"IFS Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
    }

    keys
    {
        key(Key1;"Document No","Document Type","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //BidSecurityClosureVoucher.RESET;
        //BidSecurityClosureVoucher.SETRANGE("Document No","Document No");
        //IF BidSecurityClosureVoucher.FINDSET THEN
          //"IFS Code":=BidSecurityClosureVoucher."IFS Code";
    end;

    var
        Bid_ContractSecurityRegister: Record "Bid_Contract Security Register";
        BidSecurityClosureVoucher: Record "Bid Security Closure Voucher";
}

