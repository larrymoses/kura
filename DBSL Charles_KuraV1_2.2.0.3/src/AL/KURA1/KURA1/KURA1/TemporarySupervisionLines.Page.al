
Page 72530 "Temporary Supervision Lines"
{
    DeleteAllowed = true;
    PageType = ListPart;
    SourceTable = "Temporary Supervision Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bill No';
                }
                field("Plan Line No"; Rec."Plan Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item No"; Rec."Bill Item No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bill Description';
                    Editable = false;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Caption = 'Identification No';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Scheduled Date of Delivery"; Rec."Scheduled Date of Delivery")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                }
                field("Provision Type"; Rec."Provision Type")
                {
                    ApplicationArea = Basic;
                }
                field("Reversion Type"; Rec."Reversion Type")
                {
                    ApplicationArea = Basic;
                }
                field("Acknowledgement Details"; Rec."Acknowledgement Details")
                {
                    ApplicationArea = Basic;
                }
                field("Acknowledgement Date"; Rec."Acknowledgement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Acknowledgment By"; Rec."Acknowledgment By")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}



