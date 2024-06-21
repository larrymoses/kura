#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75282 "Notice of Award Lines"
{
    PageType = ListPart;
    SourceTable = "Bid Tabulation Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder No";"Bidder No")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name";"Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Register No.";"Pre-bid Register No.")
                {
                    ApplicationArea = Basic;
                }
                field("Attended Pre-bid Conference";"Attended Pre-bid Conference")
                {
                    ApplicationArea = Basic;
                }
                field("Prebid Conference Date";"Prebid Conference Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Register No.";"Bid Opening Register No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date";"Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Late Bid (Opening Stage)";"Late Bid (Opening Stage)")
                {
                    ApplicationArea = Basic;
                }
                field("Withdrawn Bid (Opening Stage)";"Withdrawn Bid (Opening Stage)")
                {
                    ApplicationArea = Basic;
                }
                field("Withdrawal Notice No";"Withdrawal Notice No")
                {
                    ApplicationArea = Basic;
                }
                field("Succesful Bid (Opening Stage)";"Succesful Bid (Opening Stage)")
                {
                    ApplicationArea = Basic;
                }
                field("Preliminary Evaluation Date";"Preliminary Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Responsive Bid";"Responsive Bid")
                {
                    ApplicationArea = Basic;
                }
                field("Technical Evaluation Date";"Technical Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Weighted Tech Score %";"Weighted Tech Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Passed Tech Evaluation";"Passed Tech Evaluation")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Remarks";"Final Evaluation Remarks")
                {
                    ApplicationArea = Basic;
                    //Length = 50;
                    //MultiLine = true;
                }
                field("Tech Evaluation Ranking";"Tech Evaluation Ranking")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluated Bid Price";"Final Evaluated Bid Price")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Evaluation Date";"Financial Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Weighted Financial Score %";"Weighted Financial Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Evaluation Ranking";"Financial Evaluation Ranking")
                {
                    ApplicationArea = Basic;
                }
                field("Aggregate Weighted Score %";"Aggregate Weighted Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Aggregate Ranking";"Aggregate Ranking")
                {
                    ApplicationArea = Basic;
                }
                field("Due Dilgence Date";"Due Dilgence Date")
                {
                    ApplicationArea = Basic;
                }
                field("Corrected Bid Price (C=A+B)";"Corrected Bid Price (C=A+B)")
                {
                    ApplicationArea = Basic;
                }
                field("Due Diligence Rating";"Due Diligence Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Unconditional Disc Amount (E)";"Unconditional Disc Amount (E)")
                {
                    ApplicationArea = Basic;
                }
                field("Corrected & Disc Bid Price";"Corrected & Disc Bid Price")
                {
                    ApplicationArea = Basic;
                }
                field("Any Additional Adjustments (G)";"Any Additional Adjustments (G)")
                {
                    ApplicationArea = Basic;
                }
                field("Any Priced Deviations (H))";"Any Priced Deviations (H))")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Evaluation Comm Rem";"Financial Evaluation Comm Rem")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Committee Recomm";"Evaluation Committee Recomm")
                {
                    ApplicationArea = Basic;
                }
                field("Read-out Bid Price (A)";"Read-out Bid Price (A)")
                {
                    ApplicationArea = Basic;
                }
                field("Arithmetic Corrections (B)";"Arithmetic Corrections (B)")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Result";"Bid Opening Result")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Committee Remarks";"Bid Opening Committee Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Preliminary Evaluation Reg";"Preliminary Evaluation Reg")
                {
                    ApplicationArea = Basic;
                }
                field("Preliminary Evaluation Outcome";"Preliminary Evaluation Outcome")
                {
                    ApplicationArea = Basic;
                }
                field("Preminary Evaluation Committee";"Preminary Evaluation Committee")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Finance Register";"Bid Opening Finance Register")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date (Financial)";"Bid Opening Date (Financial)")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Eval Register No";"Financial Eval Register No")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Reporting)
            {
            action("Print Regret Letter")
            {
                ApplicationArea = Basic;
                Image = PrintAttachment;
                Promoted = true;
                PromotedCategory = "Report";
                trigger OnAction()
                var
                    BidTabulationLine: Record "Bid Tabulation Line";
                begin
                    BidTabulationLine.Reset;
                    BidTabulationLine.SetRange("Tabulation ID", Rec."Tabulation ID");
                    BidTabulationLine.SetRange("Bidder No", Rec."Bidder No");
                    Report.Run(Report::"IFS Regret Letter", true, false, BidTabulationLine);
                end;
            }
            }
        }
    }
}

