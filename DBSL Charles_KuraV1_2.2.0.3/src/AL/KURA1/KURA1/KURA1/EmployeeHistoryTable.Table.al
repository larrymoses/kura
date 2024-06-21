#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69112 "Employee History Table"
{
    Caption = 'Employee Ledger Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee;
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(4; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Hired,Promotion,Demotion,Training,Fired,Exit';
            OptionMembers = Hired,Promotion,Demotion,Training,Fired,"Exit";
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                //  UserMgt.LookupUserID("User ID");
            end;
        }
        field(8; "Job ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Application Table";
        }
        field(9; "Job Description"; Text[250])
        {
            CalcFormula = lookup(Positions."Job Title" where("Position ID" = field("Job ID")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        MustHaveSameSignErr: label 'must have the same sign as remaining amount';
        MustNotBeLargerErr: label 'must not be larger than remaining amount';
}

