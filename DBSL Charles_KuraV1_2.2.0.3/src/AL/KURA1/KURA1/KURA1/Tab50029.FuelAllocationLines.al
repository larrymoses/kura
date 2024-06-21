/// <summary>
/// Table Fuel Allocation Lines (ID 50029).
/// </summary>
table 50029 "Fuel Allocation Lines"
{
    Caption = 'Fuel Allocation Lines';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Card No."; Code[20])
        {
            Caption = 'Card No.';

            trigger OnValidate()
            var
                FuelCard: Record "Fuel Card";
            begin
                if "Card No." <> '' then begin
                    FuelCard.Get("Card No.");
                    "Fuel Card No." := FuelCard."Fuel Card No.";
                end else begin
                    "Fuel Card No." := '';
                end;
            end;
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Allocated Amount';
        }
        field(5; "Fuel Card No."; Code[20])
        {
            Caption = 'Fuel Card No.';
            Editable = false;
        }
        field(6; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        FuelAllocationLines: Record "Fuel Allocation Lines";
    begin
        FuelAllocationLines.Reset();
        FuelAllocationLines.SetRange("Document No.", Rec."Document No.");
        if FuelAllocationLines.FindSet() then
            FuelAllocationLines."Line No." := FuelAllocationLines."Line No." + 1;
    end;
}
