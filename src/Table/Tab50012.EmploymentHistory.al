table 50012 "Employment History"
{
    Caption = 'Employment History';
  

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation =Employee;
        }
        field(2; Institution; Text[100])
        {
            Caption = 'Institution';
        }
        field(3; "Employment Terms"; Enum "Employment Terms")
        {
            Caption = 'Employment Terms';
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(6; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(7; "Current Organization"; Boolean)
        {
          
        }
        field(8; "Job Position"; Code[50])
        {
          TableRelation ="Company Positions"."Position ID";
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
     }
    keys
    {
        key(PK; "Employee No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        History: Record "Employment History";
    begin
        History.Reset();
        History.SetRange("Employee No.", Rec."Employee No.");
        if History.FindLast() then
            Rec."Line No." := History."Line No." + 1 else
            Rec."Line No." := 1;

    end;
}
