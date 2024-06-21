#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75459 "Bid Evaluation Scores"
{
    PageType = List;
    SourceTable = "Bid Evaluation Score Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bid No.";"Bid No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Criteria Group";"Criteria Group")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement ID";"Requirement ID")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Requirement";"Evaluation Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Type";"Rating Type")
                {
                    ApplicationArea = Basic;
                }
                field("Target Value/KPI";"Target Value/KPI")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty";"Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Response Value";"Response Value")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Response Actual Qty";"Bid Response Actual Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Score %";"Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Weight %";"Assigned Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Weighted Line Score";"Weighted Line Score")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Type";"Equipment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Perfomance Direction";"Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Scoring Document No.";"Bid Scoring Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Scoring Document Type";"Bid Scoring Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Results";"Evaluation Results")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";"Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field(Priority;Priority)
                {
                    ApplicationArea = Basic;
                }
                field("Contract Ref Clause";"Contract Ref Clause")
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

