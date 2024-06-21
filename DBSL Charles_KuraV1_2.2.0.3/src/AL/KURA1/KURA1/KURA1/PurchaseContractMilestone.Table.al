#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70220 "Purchase Contract Milestone"
{
    LookupPageId ="Purchase Contract Milestone";
    DrillDownPageId= "Purchase Contract Milestone";
    fields
    {
        field(1; "Document Type"; Option)
        {
            
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "No."; Code[20])
        {
            
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Blanket Order"));
        }
        field(3; "Milestone Code"; Code[50])
        {
            
        }
        field(4; Description; Text[100])
        {
            
        }
        field(5; "Payment Instalment Code"; Code[50])
        {
            
            TableRelation = "Purchase Contract Payment Term"."Instalment Code" where("No." = field("No."));
        }
        field(6; "Entry No"; Integer)
        {
            AutoIncrement = true;
            
        }
        field(7; "Start Date"; Date)
        {
            
        }
        field(8; "End Date"; Date)
        {
            
        }
        field(9; "Milestone Deliverables"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Contract Milestone Deliverable" where("Contract No."=field("No."),"Milestone Code"=field("Milestone Code")));
        }
        field(10; "Date Notified"; Date)
        {
            
        }
        field(11; Select; Boolean)
        {
            
        }
        field(12; "No of IPCs"; Integer)
        {
            CalcFormula = count("Measurement &  Payment Header" where("Milestone Code" = field("Milestone Code")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Milestone Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

