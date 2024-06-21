table 99616 "Contract Termination"
{
    Caption = 'Contract Termination';


    fields
    {
        field(1; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            trigger OnValidate()
            var
                PurchaseHeader: Record "Purchase Header";
            begin
                PurchaseHeader.Reset();
                PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::"Blanket Order");
                PurchaseHeader.SetRange("No.", Rec."Contract No.");
                if PurchaseHeader.FindFirst() then begin
                    Rec.Description := PurchaseHeader.Description;
                    Rec."Contract Start Date" := PurchaseHeader."Contract Start Date";
                    Rec."Contract End Date" := PurchaseHeader."Contract End Date";
                    Rec. "Contractor No." := PurchaseHeader."Buy-from Vendor No.";
                    Rec."Contractor Name" := PurchaseHeader."Buy-from Vendor Name";
                end;
            end;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Contract Start Date"; Date)
        {

        }
        field(4; "Contract End Date"; Date)
        {

        }
        field(5; "Approval Status"; Enum "App Status")
        {

        }
        field(6; "Contractor No."; Code[20])
        {

        }
        field(7; "Contractor Name"; Text[100])
        {

        }
        field(8; "Termination Date"; Date)
        {
            
        }
    }
    keys
    {
        key(PK; "Contract No.")
        {
            Clustered = true;
        }
    }
}
