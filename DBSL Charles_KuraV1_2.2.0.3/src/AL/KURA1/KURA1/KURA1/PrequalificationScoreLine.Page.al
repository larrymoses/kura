#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75188 "Prequalification Score Line"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = ListPart;
    SourceTable = "Prequalification Score Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evaluation Requirement";"Evaluation Requirement")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Criteria Group";"Criteria Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Rating Type";"Rating Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Response Value";"Response Value")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Findings';
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Remarks';
                }
                field("Bid Response Actual Qty";"Bid Response Actual Qty")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Target Value";"Target Value")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Target Qty";"Target Qty")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Score %";"Score %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Assigned Weight %";"Assigned Weight %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Weighted Line Score";"Weighted Line Score")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Evaluation Results";"Evaluation Results")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Desired Perfomance Direction";"Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Bid Evaluation Score Guide")
                {
                    ApplicationArea = Basic;
                    Image = AllLines;
                    Promoted = true;
                    RunObject = Page "Bid Evaluation Score Guide";
                    RunPageLink = "Template ID"=field("Rating Template ID"),
                                  "Criteria Group ID"=field("Criteria Group"),
                                  "Requirement ID"=field("Checklist ID");
                }
            }
        }
    }
}

