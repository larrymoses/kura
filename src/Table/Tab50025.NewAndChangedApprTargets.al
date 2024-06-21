/// <summary>
/// Table NewAndChangedApprTargets (ID 50025).
/// </summary>
table 50025 NewAndChangedApprTargets
{
    Caption = 'NewAndChangedApprTargets';
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
        field(3; Target; Text[550])
        {
            Caption = 'Targets (Changed / Added)';
        }
        field(4; "Results Achieved"; Decimal)
        {
            Caption = 'Results Achieved';

            trigger OnValidate()
            begin
                if "Target Qty" <> 0 then
                    "Performance Appraisal" := ("Results Achieved"/"Target Qty") * 100;
            end;
        }
        field(5; "Performance Appraisal"; Decimal)
        {
            Caption = 'Performance Score';
            Editable = false;
        }
        field(6; Reasons; Text[550])
        {
            Caption = 'Reasons';
        }
        field(7; "Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
            
            trigger OnValidate()
            begin
                if "Results Achieved" <> 0 then
                    "Performance Appraisal" := ("Results Achieved"/"Target Qty") * 100;
            end;
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
        Targets: Record NewAndChangedApprTargets;
    begin
        Targets.Reset();
        Targets.SetRange("Document No.", Rec."Document No.");
        if Targets.FindLast() then
            "Line No." := Targets."Line No." + 1;
    end;
}
