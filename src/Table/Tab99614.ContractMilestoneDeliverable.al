table 99614 "Contract Milestone Deliverable"
{
    Caption = 'Contract Milestone Deliverable';
    LookupPageId ="Contract Milestone Deliverable";
    DrillDownPageId="Contract Milestone Deliverable";

    fields
    {
        field(1; "Contract No."; Code[20])
        {
            Editable =false;
            Caption = 'Contract No.';
             TableRelation = "Purchase Header"."No." where("Document Type" = const("Blanket Order"));
        }
        field(2; "Milestone Code"; Code[50])
        {
             Editable =false;
            Caption = 'Milestone Code';
            TableRelation = "Purchase Contract Milestone"."Milestone Code" where("No."=field("Contract No."));
            trigger OnValidate()
            var
            ContractMilestone: Record "Purchase Contract Milestone";
            begin
              ContractMilestone.Reset();
              ContractMilestone.SetRange("No.",Rec."Contract No.");
              ContractMilestone.SetRange("Milestone Code",Rec."Milestone Code");
              if ContractMilestone.FindFirst() then begin
                "Milestone Description" := ContractMilestone.Description;
              end;  
            end;
        }
        field(3; "Milestone Entry No."; Integer)
        {
            Caption = 'Milestone Entry No.';
             Editable =false;
        }
        field(4; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
             Editable =false;
        }
        field(5; Deliverable; Code[100])
        {
            Caption = 'Deliverable';
        }
        field(6; Description; Text[500])
        {
            Caption = 'Description';
        }
        field(7; "Delivered/Achieved"; Boolean)
        {
            Caption = 'Delivered/Achieved';
        }
        field(8; "Date Delivered/Achieved"; Date)
        {
            Caption = 'Date Delivered/Achieved';
        }
        field(9; "Contract Status"; Enum "Contract Status")
        {
             Editable =false;
            Caption = 'Contract Status';
            FieldClass =FlowField;
            CalcFormula = lookup("Purchase Header"."Contract Status" where("Document Type"=const("Blanket Order"),"No."=field("Contract No.")));
        }
        field(10; "Milestone Description"; Text[100])
        {
             Editable =false;
        }
    }
    keys
    {
        key(PK; "Contract No.", "Milestone Code", "Milestone Entry No.", "Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Deliverable: Record "Contract Milestone Deliverable";
    begin
        Deliverable.Reset();
        Deliverable.SetRange("Contract No.", Rec."Contract No.");
        Deliverable.SetRange("Milestone Code", Rec."Milestone Code");
        Deliverable.SetRange("Milestone Entry No.", Rec."Milestone Entry No.");
        if Deliverable.FindLast() then
            Rec."Entry No." := Deliverable."Entry No." + 1
        else
            Rec."Entry No." := 1;
    end;
}
