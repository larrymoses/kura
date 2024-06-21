pageextension 50140 PostedPurchaseReceipt extends "Posted Purchase Receipt"
{
    actions{
        addafter("&Print")
        {
           action("Print GRN")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = Suite;

                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetRange("No.",Rec."No.");
                    REPORT.Run(REPORT::"Good Receive Note_PROC",true,true,Rec);
                    Rec.Reset();
                end;
            } 
        }
    }
}
