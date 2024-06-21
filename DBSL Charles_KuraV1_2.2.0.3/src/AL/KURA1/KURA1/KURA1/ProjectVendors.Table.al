#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72209 "Project Vendors"
{

    fields
    {
        field(1;"Contract No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Vendor Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Sub Contractor,Assignee,Main Contractor';
            OptionMembers = " ","Sub Contractor",Assignee,"Main Contractor";
        }
        field(3;"Vendor No";Code[20])
        {
            Caption = 'Contractor No';
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if Vendor.Get("Vendor No") then
                  "Vendor Name":=Vendor.Name;
            end;
        }
        field(4;Current;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Vendor Name";Text[250])
        {
            Caption = 'Contractor Name';
            DataClassification = ToBeClassified;
        }
        field(6;"E-mail Address";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Scope of Subcontracting";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Start Chainage(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"End Chainage(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Contract No","Vendor No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vendor: Record Vendor;
}

