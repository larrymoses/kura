/// <summary>
/// Table Board Disciplinary Committee (ID 50008).
/// </summary>
table 50008 "Board Disciplinary Committee"
{
    Caption = 'Board Disciplinary Committee';
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
        field(3; Code; Code[50])
        {
            Caption = 'Code';
            NotBlank = true;
            TableRelation = "Non-Employee Disciplinary Com.";

            trigger OnValidate()
            var
                Committee: Record "Non-Employee Disciplinary Com.";
            begin
                if Rec.Code = xRec.Code then
                    exit;
                
                Committee.Reset();
                Committee.SetRange(Code, Code);
                if Committee.Find('-') then
                    Names:= Committee.Names;
            end;
        }
        field(4; Names; Text[100])
        {
            Caption = 'Names';
        }
        field(5; Role; Option)
        {
            Caption = 'Role';
            OptionCaption = ' ,Chairmain,Secretary,Member';
            OptionMembers = " ",Chairmain,Secretary,Member;
        }
        field(6; Remarks; Text[250])
        {
            Caption = 'Remarks';
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
    var
        Committee: Record "Board Disciplinary Committee";
    begin
        Committee.Reset();
        Committee.SetRange("Document No.", Rec."Document No.");
        if Committee.FindLast() then
            "Line No." := Committee."Line No." + 1;
    end;
}
