
Page 72695 "Open Site Instruction SubPage"
{
    Caption = 'Payment Details';
    PageType = ListPart;
    SourceTable = "Site Instructions Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract No"; Rec."Contract No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("BoQ Category Code"; Rec."BoQ Category Code")
                {
                    ApplicationArea = Basic;
                }
                field("BoQ Item Line No."; Rec."BoQ Item Line No.")
                {
                    ApplicationArea = Basic;
                }
                 field("BoQ Item No."; Rec."BoQ Item No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                 field("BoQ Category Description"; Rec."BoQ Category Description")
                {
                    ApplicationArea = Basic;
                }
               
                
                 field("Start Chainage";Rec."Start Chainage")
                {
                     ApplicationArea = Basic;
                }
                field("End Chainage";Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Chainage Description";Rec."Chainage Description")
                {

                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
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



