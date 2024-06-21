#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70237 "External Supplier Voucher Line"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Supplier No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"KRA PIN";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Primary Email";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Telephone No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Procurement Category ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code;
        }
        field(7;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(8;"Supplier Name";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ExternalSupplierVoucher.Reset;
        ExternalSupplierVoucher.SetRange(ExternalSupplierVoucher."Document No","Document No");
        if ExternalSupplierVoucher.FindSet then
          "Procurement Category ID":=ExternalSupplierVoucher."Procurement  Category ID";
    end;

    var
        ExternalSupplierVoucher: Record "External Supplier Voucher";
}

