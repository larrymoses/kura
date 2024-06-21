#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70119 "Generate Evaluation Matrix"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Generate Evaluation Matrix.rdlc';

    dataset
    {
        dataitem("Bid Opening Register";"Bid Opening Register")
        {
            RequestFilterFields = "IFS Code";
            column(ReportForNavId_1; 1)
            {
            }
            column(Code_BidOpeningRegister;"Bid Opening Register".Code)
            {
            }
            column(IFSCode_BidOpeningRegister;"Bid Opening Register"."IFS Code")
            {
            }
            column(Description_BidOpeningRegister;"Bid Opening Register".Description)
            {
            }
            column(TenderName_BidOpeningRegister;UpperCase("Bid Opening Register"."Tender Name"))
            {
            }
            dataitem("Bid Opening Register Line";"Bid Opening Register Line")
            {
                DataItemLink = Code=field(Code),"IFS Code"=field("IFS Code");
                column(ReportForNavId_10; 10)
                {
                }
                column(Code_BidOpeningRegisterLine;"Bid Opening Register Line".Code)
                {
                }
                column(VendorNo_BidOpeningRegisterLine;"Bid Opening Register Line"."Vendor No.")
                {
                }
                column(IFSCode_BidOpeningRegisterLine;"Bid Opening Register Line"."IFS Code")
                {
                }
                column(BidderName_BidOpeningRegisterLine;UpperCase("Bid Opening Register Line"."Bidder Name"))
                {
                }
                column(BidNo_BidOpeningRegisterLine;"Bid Opening Register Line"."Bid No.")
                {
                }
                column(Rank_BidOpeningRegisterLine;"Bid Opening Register Line".Rank)
                {
                }
                column(AssignedBidNo_BidOpeningRegisterLine;"Bid Opening Register Line"."Assigned Bid No.")
                {
                }
                column(AutoAssignedNo_BidOpeningRegisterLine;"Bid Opening Register Line"."Auto Assigned No")
                {
                }
            }
            dataitem("Bid Evaluation Register";"Bid Evaluation Register")
            {
                DataItemLink = "IFS Code"=field("IFS Code");
                RequestFilterFields = "Evaluation Type";
                column(ReportForNavId_19; 19)
                {
                }
                column(Code_BidEvaluationRegister;"Bid Evaluation Register".Code)
                {
                }
                column(EvaluationType_BidEvaluationRegister;"Bid Evaluation Register"."Evaluation Type")
                {
                }
                column(EvaluatorCategory_BidEvaluationRegister;"Bid Evaluation Register"."Evaluator Category")
                {
                }
                column(IFSCode_BidEvaluationRegister;"Bid Evaluation Register"."IFS Code")
                {
                }
                column(BidScoringDocumentNo_BidEvaluationRegister;"Bid Evaluation Register"."Bid Scoring Document No.")
                {
                }
                dataitem("Bid Evaluation Score Entry";"Bid Evaluation Score Entry")
                {
                    DataItemLink = Code=field(Code);
                    column(ReportForNavId_5; 5)
                    {
                    }
                    column(RequirementID_BidEvaluationScoreEntry;"Bid Evaluation Score Entry"."Requirement ID")
                    {
                    }
                    column(EvaluationRequirement_BidEvaluationScoreEntry;"Bid Evaluation Score Entry"."Evaluation Requirement")
                    {
                    }
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }
}

