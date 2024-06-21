#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72094 "Works Contract Line"
{

    fields
    {
        field(1; "Header No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Contract No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";

            trigger OnValidate()
            begin
                //  if PurchaseHeader.Get("Contract No") then
                ///  "Contract Name":=PurchaseHeader.Description;
            end;
        }
        field(3; "Contract Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Percentage This Month"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Cum.  Percentage This Month"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Header No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PurchaseHeader: Record "Purchase Header";
}

