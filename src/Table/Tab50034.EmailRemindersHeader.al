/// <summary>
/// Table HR Reminders Setup (ID 50034).
/// </summary>
table 50034 "Email Reminders Header"
{
    Caption = 'Email Reminders Header';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Custom Email Reminders";
    LookupPageId = "Custom Email Reminders";
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Comments; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Last Date Modified"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        ERRecepients.Reset();
        ERRecepients.SetRange("Document No.", Rec."No.");
        ERRecepients.DeleteAll();

        ERLines.Reset();
        ERLines.SetRange("Document No.", Rec."No.");
        ERLines.DeleteAll();
    end;

    trigger OnInsert()
    begin
        SetLastModifiedDate();
    end;

    trigger OnModify()
    begin
        SetLastModifiedDate();
    end;

    trigger OnRename()
    begin
        SetLastModifiedDate();
    end;

    var
        ERRecepients: Record "Email Reminder Recepients";
        ERLines: Record "Email Reminder Lines";

    local procedure SetLastModifiedDate()
    begin
        "Last Date Modified" := Today;
        "User ID" := UserId;
    end;
}
