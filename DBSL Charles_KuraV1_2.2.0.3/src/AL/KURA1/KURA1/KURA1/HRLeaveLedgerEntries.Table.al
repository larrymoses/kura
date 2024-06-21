
Table 69215 "HR Leave Ledger Entries"
{
    Caption = 'Leave Ledger Entry';
    DrillDownPageID = "Hr Leave Ledger Entries";
    LookupPageID = "Hr Leave Ledger Entries";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Leave Period"; Code[20])
        {
            Caption = 'Leave Period';
               Editable =false;
        }
        field(3; Closed; Boolean)
        {
            Caption = 'Closed';
               Editable =false;
        }
        field(4; "Staff No."; Code[20])
        {
            Caption = 'Staff No.';
               Editable =false;
            TableRelation = Employee."No.";
        }
        field(5; "Staff Name"; Text[70])
        {
            Caption = 'Staff Name';
               Editable =false;
        }
        field(6; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
               Editable =false;
        }
        field(7; "Leave Entry Type"; Option)
        {
            Caption = 'Leave Entry Type';
               Editable =false;
            OptionCaption = 'Positive,Negative,Reimbursement';
            OptionMembers = Positive,Negative,Reimbursement;
        }
        field(8; "Leave Approval Date"; Date)
        {
            Caption = 'Leave Approval Date';
        }
        field(9; "Document No."; Code[20])
        {
            Caption = 'Document No.';
               Editable =false;
        }
        field(10; "External Document No."; Code[20])
        {
            Caption = 'External Document No.';
               Editable =false;
        }
        field(11; "Job ID"; Code[100])
        {
               Editable =false;
        }
        field(12; "Job Group"; Code[20])
        {
               Editable =false;
        }
        field(13; "Contract Type"; Code[20])
        {
               Editable =false;
        }
        field(14; "No. of days"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'No. of days';
               Editable =false;
        }
        field(15; "Leave Start Date"; Date)
        {
               Editable =false;
        }
        field(16; "Leave Posting Description"; Text[200])
        {
            Caption = 'Leave Posting Description';
               Editable =false;
        }
        field(17; "Leave End Date"; Date)
        {
               Editable =false;
        }
        field(18; "Leave Return Date"; Date)
        {
               Editable =false;
        }
        field(20; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
               Editable =false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(21; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
               Editable =false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(22; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
               Editable =false;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(23; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User;
            //This property is currently not supported
            //TestTableRelation = false;
               Editable =false;

            trigger OnLookup()
            var
                LoginMgt: Codeunit "User Management";
            begin
                // LoginMgt.LookupUserID("User ID");
            end;
        }
        field(24; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
               Editable =false;
        }
        field(25; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
               Editable =false;
        }
        field(26; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
               Editable =false;
        }
        field(27; "Index Entry"; Boolean)
        {
            Caption = 'Index Entry';
               Editable =false;
        }
        field(28; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
               Editable =false;
        }
        field(29; "Leave Recalled No."; Code[20])
        {
               Editable =false;
            Caption = 'Leave Application No.';
            // TableRelation = "HR Leave Applications"."Application Code" where ("Employee No"=field("Staff No."),
            //                                                                   Status=const("7"));
        }
        field(30; "Leave Type"; Code[20])
        {
            TableRelation = "HR Leave Types".Code;
               Editable =false;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
        field(481; "Recalled Leave"; Boolean)
        {
            DataClassification = ToBeClassified;
               Editable =false;
        }
        field(482; Duplicate; Boolean)
        {
            DataClassification = ToBeClassified;
               Editable =false;
        }
        field(483; TotalEntries; Integer)
        {
            CalcFormula = count("HR Leave Ledger Entries" where("Document No." = field("Document No.")));
            FieldClass = FlowField;
               Editable =false;
        }
        field(484; Reversed; Boolean)
        {
            DataClassification = ToBeClassified;
               Editable =false;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Leave Period", "Posting Date")
        {
            SumIndexFields = "No. of days";
        }
        key(Key3; "Leave Period", Closed, "Posting Date")
        {
            SumIndexFields = "No. of days";
        }
        key(Key4; "Staff No.", "Leave Period", Closed, "Posting Date")
        {
            SumIndexFields = "No. of days";
        }
        key(Key5; "Staff No.", Closed, "Posting Date")
        {
        }
        key(Key6; "Posting Date", "Leave Entry Type", "Staff No.")
        {
            SumIndexFields = "No. of days";
        }
        key(Key7; "Staff No.")
        {
            SumIndexFields = "No. of days";
        }
        key(Key8; "Leave Entry Type", "Staff No.", "Leave Type", Closed)
        {
            SumIndexFields = "No. of days";
        }
        key(Key9; "Leave Entry Type", "Staff No.", Closed)
        {
            Enabled = false;
            SumIndexFields = "No. of days";
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Leave Period", "Staff No.", "Staff Name", "Posting Date")
        {
        }
    }

    var
        DimMgt: Codeunit DimensionManagement;


    procedure ShowDimensions()
    begin
        DimMgt.ShowDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', TableCaption, "Entry No."));
    end;
}

