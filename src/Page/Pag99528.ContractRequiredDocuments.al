page 99528 "Contract Required Documents"
{
    ApplicationArea = All;
    Caption = 'Contract Required Documents';
    PageType = List;
    SourceTable = "Contract Required Documents";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document Type";Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Description";Rec."Document Description")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Guidelines/Instruction";Rec."Guidelines/Instruction")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
