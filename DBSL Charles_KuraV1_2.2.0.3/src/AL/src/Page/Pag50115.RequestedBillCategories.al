page 50115 "Requested Bill Categories"
#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable


{
    PageType = ListPart;
    SourceTable = "Contractor Request Task";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Type"; Rec."Job Task Type")
                {
                    ApplicationArea = Basic;
                }
                field("Schedule (Total Cost)"; Rec."Schedule (Total Cost)")
                {
                    ApplicationArea = Basic;
                }
                field("Schedule (Total Price)"; Rec."Schedule (Total Price)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Contract (Total Cost)"; Rec."Contract (Total Cost)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Contract (Invoiced Cost)"; Rec."Contract (Invoiced Cost)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Usage (Total Cost)"; Rec."Usage (Total Cost)")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining (Total Cost)"; Rec."Remaining (Total Cost)")
                {
                    ApplicationArea = Basic;
                }
                field("This Certificate Amount"; Rec."This Certificate Amount")
                {
                    ApplicationArea = Basic;
                    DecimalPlaces = 0 : 15;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Bill Items")
                {
                    ApplicationArea = Basic;
                    Caption = 'Requested Bill Items';
                    Image = AvailableToPromise;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Requested Bill Items";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No."),
                                  "Job No." = field("Job No."),
                                  "Job Task No." = field("Job Task No.");
                }
            }
        }
    }
}

#pragma implicitwith restore

