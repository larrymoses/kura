#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70218 "Purchase Contract Insurance"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where ("Document Type"=const("Blanket Order"));
        }
        field(3;"Insurance Type";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Insurance Type".Code;

            trigger OnValidate()
            begin
                InsuranceType.Reset;
                InsuranceType.SetRange(Code,"Insurance Type");
                if InsuranceType.FindSet then begin
                  Description:=InsuranceType.Description;
                  end;
            end;
        }
        field(4;"Policy Cover Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Contractor All Risk Insurance';
            OptionMembers = "Contractor All Risk Insurance";
        }
        field(5;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Policy Coverage (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Policy ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Insurance Company";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Expiry Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Expiry Norification Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;Expired;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(13;"Second Expiry Notification Dat";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","No.","Insurance Type","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        InsuranceType: Record "Insurance Type";
}

