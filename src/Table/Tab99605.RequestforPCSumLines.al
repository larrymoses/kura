table 99605 "Request for PC Sum Lines"
{
    Caption = 'Request for PC Sum Lines';
    DataClassification = OrganizationIdentifiableInformation;

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
        field(3; "Project ID"; Code[20])
        {
            Caption = 'Project ID';
        }
        field(4; "Bill Item No."; Code[20])
        {
            TableRelation = "Job Planning Line"."No." where("Job No." = field("Project ID"), "Job Task No." = field("Bill No."));
            trigger OnValidate()
            var
                JobPlanningLine: Record "Job Planning Line";
            begin
                JobPlanningLine.Reset();
                JobPlanningLine.SetRange("Job No.", Rec."Project ID");
                JobPlanningLine.SetRange("Job Task No.", Rec."Bill No.");
                JobPlanningLine.SetRange("No.", Rec."Bill Item No.");
                if JobPlanningLine.FindFirst() then begin
                    Rec."Bill Item No." := JobPlanningLine."Bill Item No";
                    Rec."Bill Item Description" := JobPlanningLine.Description;
                    Rec.Validate("Billed Quantity", JobPlanningLine.Quantity);
                    Rec.Validate(Rate, JobPlanningLine."Planned Rate Amount");
                end;
            end;
        }
        field(5; "Job Planning Line No."; Integer)
        {
            Caption = 'Job Planning Line No.';
            TableRelation = "Job Planning Line"."Line No." where("Job No." = field("Project ID"), "Job Task No." = field("Bill No."));
            trigger OnValidate()
            var
                JobPlanningLine: Record "Job Planning Line";
            begin
                JobPlanningLine.Reset();
                JobPlanningLine.SetRange("Job No.", Rec."Project ID");
                JobPlanningLine.SetRange("Line No.", Rec."Job Planning Line No.");
                if JobPlanningLine.FindFirst() then begin
                    Rec."Bill Item No." := JobPlanningLine."Bill Item No";
                    Rec."Bill Item Description" := JobPlanningLine.Description;
                    Rec.Validate("Billed Quantity", JobPlanningLine.Quantity);
                    Rec.Validate(Rate, JobPlanningLine."Planned Rate Amount");
                end;
            end;
        }
        field(6; "Bill Item Description"; Text[200])
        {
            Caption = 'Bill Item Description';
        }
        field(7; "Billed Quantity"; Decimal)
        {
            Editable = false;
            Caption = 'Billed Quantity';
            trigger OnValidate()
            begin
                "Total Requested Amount" := "Billed Quantity" * Rate;
            end;
        }
        field(8; "Requested Quantity"; Decimal)
        {
            Caption = 'Requested Quantity';
        }
        field(9; Rate; Decimal)
        {
            Editable = false;
            Caption = 'Rate';
            trigger OnValidate()
            begin
                "Total Requested Amount" := "Billed Quantity" * Rate;
            end;
        }
        field(10; "Total Requested Amount"; Decimal)
        {
            Caption = 'Total Requested Amount';
        }
          field(19; "Document Type"; Enum "PC Document Type")
        {

        }
        field(20; "Bill No."; Code[20])
        {
            TableRelation = "Job Planning Line"."Job Task No." where("Job No." = field("Project ID"));
        }
    }
    keys
    {
        key(PK; "Document No.", "Document Type","Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        PCSumLines: Record "Request for PC Sum Lines";
    begin
        PCSumLines.Reset();
        PCSumLines.SetRange("Document No.", Rec."Document No.");
        if PCSumLines.FindLast() then
            Rec."Line No." := PCSumLines."Line No." + 1
        else
            Rec."Line No." := 1;

        PCSumExpense.Reset();
        PCSumExpense.SetRange("Document No.", Rec."Document No.");
        if PCSumExpense.FindFirst() then begin
            Rec."Project ID" := PCSumExpense."Project ID";
            //Rec.
        end;
    end;

    var
        PCSumExpense: Record "Request for PC sum Expensing";
}
