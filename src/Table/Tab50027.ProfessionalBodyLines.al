/// <summary>
/// Table Professional Body Lines (ID 50027).
/// </summary>
table 50027 "Professional Body Lines"
{
    Caption = 'Professional Body Lines';
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
        field(3; "Professional Body No."; Code[20])
        {
            Caption = 'Professional Body No.';
            TableRelation = "Professional Bodies";

            trigger OnValidate()
            var
                ProfBodies: Record "Professional Bodies";
            begin
                if "Professional Body No." <> '' then begin
                    ProfBodies.Get("Professional Body No.");
                    "Professional Body Name" := ProfBodies.Name;
                    ProfBodies.CalcFields("Total Fees Payable");
                    "Amount (Fees)" := ProfBodies."Total Fees Payable";
                end else begin
                    "Professional Body Name" := '';
                end;
            end;
        }
        field(4; "Professional Body Name"; Text[250])
        {
            Caption = 'Professional Body Name';
            Editable = false;
        }
        field(5; "Amount (Fees)"; Decimal)
        {
            Caption = 'Amount (Fees)';
            Editable = false;
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
        ProfBodyLines: Record "Professional Body Lines";
    begin
        ProfBodyLines.Reset();
        ProfBodyLines.SetRange("Document No.", Rec."Document No.");
        if ProfBodyLines.FindSet() then
            "Line No." := ProfBodyLines."Line No." + 1;
    end;
}
