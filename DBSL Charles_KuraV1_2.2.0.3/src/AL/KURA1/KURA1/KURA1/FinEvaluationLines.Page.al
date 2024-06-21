#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75465 "Fin Evaluation Lines"
{
    Caption = 'Finance Evaluation';
    PageType = List;
    SourceTable = "Fin Evaluation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bid No";"Bid No")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name";"Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluated Tender Sum";"Evaluated Tender Sum")
                {
                    ApplicationArea = Basic;
                }
                field("Escalated Tender Sum";"Escalated Tender Sum")
                {
                    ApplicationArea = Basic;
                }
                field("Escalation %";"Escalation %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10;Outlook)
            {
            }
            systempart(Control11;Notes)
            {
            }
            systempart(Control12;MyNotes)
            {
            }
            systempart(Control13;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Calculate Escalated Amount")
            {
                ApplicationArea = Basic;
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Escalation Percentage";
                Visible = false;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // PurchaseLine.RESET;
        // PurchaseLine.SETRANGE("Document No.","Bid No");
        // PurchaseLine.SETRANGE("Document Type",PurchaseLine."Document Type"::Quote);
        // PurchaseLine.SETRANGE(Escalated,TRUE);
        // IF PurchaseLine.FINDSET THEN BEGIN
        //  PurchaseLine.CALCSUMS(Amount);
        //  PurchaseLine.CALCSUMS("Escalaleted Amount");
        //  "Escalated Tender Sum":=(("Evaluated Tender Sum"-PurchaseLine.Amount)+PurchaseLine."Escalaleted Amount");
        //  MODIFY(TRUE);
        //  //  VALIDATE("Escalated Tender Sum");
        //   // END;
        // END;
         Validate("Bid No");
         Validate("Bidder No");
         Modify(true);
    end;

    trigger OnOpenPage()
    begin
         //IF "Bid No"<>'' THEN BEGIN
        // PurchaseLine.RESET;
        // PurchaseLine.SETRANGE("Document No.","Bid No");
        // PurchaseLine.SETRANGE("Document Type",PurchaseLine."Document Type"::Quote);
        // PurchaseLine.SETRANGE(Escalated,TRUE);
        // IF PurchaseLine.FINDSET THEN BEGIN
        //  PurchaseLine.CALCSUMS(Amount);
        //  PurchaseLine.CALCSUMS("Escalaleted Amount");
        //  "Escalated Tender Sum":=(("Evaluated Tender Sum"-PurchaseLine.Amount)+PurchaseLine."Escalaleted Amount");
        //  MODIFY(TRUE);
        //  //  VALIDATE("Escalated Tender Sum");
        //   // END;
        // END;
         //END;
         Validate("Bid No");
         Validate("Bidder No");
         Modify(true);
    end;

    var
        PurchaseLine: Record "Purchase Line";
}

