/// <summary>
/// Table Email Reminder Recepients (ID 50035).
/// </summary>
table 50035 "Email Reminder Recepients"
{
    Caption = 'Email Reminder Recepients';
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
        field(3; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee where(Status = filter(Active));

            trigger OnValidate()
            begin
                if "Employee No." <> '' then begin
                    Emp.Get("Employee No.");
                    "Employee Name" := Emp.FullName();
                    "Employee Email" := Emp."E-Mail";
                end else begin
                    "Employee Name" := '';
                    "Employee Email" := '';
                end;
            end;
        }
        field(4; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            Editable = false;
        }
        field(5; "Employee Email"; Text[80])
        {
            Caption = 'Employee Email';
            ExtendedDatatype = EMail;
        }
        field(6; "Recepient Type"; Option)
        {
            Caption = 'Recepient Type';
            OptionMembers = ,Main,CC,BCC;
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
    begin
        ERRecepients.Reset();
        ERRecepients.SetRange("Document No.", Rec."Document No.");
        if ERRecepients.FindLast() then
            "Line No." := ERRecepients."Line No." + 1;
    end;

    var
        ERRecepients: Record "Email Reminder Recepients";
        Emp: Record Employee;
}
