page 60015 "Request for PC Sum Lines"
{
    Caption = 'Request for PC Sum Lines';
    PageType = ListPart;
    SourceTable = "Request for PC Sum Lines";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Bill No.";Rec."Bill No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item No."; Rec."Bill Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item No. field.';
                }
                field("Bill Item Description"; Rec."Bill Item Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item Description field.';
                }
                field("Job Planning Line No."; Rec."Job Planning Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Planning Line No. field.';
                }
                field("Billed Quantity"; Rec."Billed Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Billed Quantity field.';
                }
                field("Requested Quantity"; Rec."Requested Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Quantity field.';
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rate field.';
                }
                field("Total Requested Amount"; Rec."Total Requested Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Requested Amount field.';
                }
            }
        }
    }
}
