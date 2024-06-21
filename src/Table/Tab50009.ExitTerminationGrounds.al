/// <summary>
/// Table Exit Termination Grounds (ID 50009).
/// </summary>
table 50009 "Exit Termination Grounds"
{
    Caption = 'Exit Termination Grounds';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Document No."; Code[50])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Grounds for termination"; Code[20])
        {
            Caption = 'Grounds for termination';
            TableRelation = "Grounds for Termination";

            trigger OnValidate()
            var
                TermiGrounds: Record "Grounds for Termination";
            begin
                if "Grounds for termination" <> '' then begin
                    TermiGrounds.Get("Grounds for termination");
                    Description := TermiGrounds.Description;
                end else begin
                    Description := '';
                end;
            end;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; Comments; Text[500])
        {
            Caption = 'Comments';
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        ExitTermiGrounds.Reset();
        ExitTermiGrounds.SetRange("Document No.", Rec."Document No.");
        if ExitTermiGrounds.FindLast() then begin
            "Line No." := ExitTermiGrounds."Line No." + 1;
        end;
    end;

    var
        ExitTermiGrounds: Record "Exit Termination Grounds";
}
