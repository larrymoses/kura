#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75161 "Bid Evaluation Score Entry"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = ListPart;
    SourceTable = "Bid Evaluation Score Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Evaluation Requirement"; Rec."Evaluation Requirement")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Criteria Group"; Rec."Criteria Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                }
                field("Contract Ref Clause"; Rec."Contract Ref Clause")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Response Value"; Rec."Response Value")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Findings';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation  Remarks';
                    MultiLine = true;
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Quantity';
                    Editable = false;
                    visible = false;
                }
                field("Bid Response Actual Qty"; Rec."Bid Response Actual Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Actual Quantity';
                    visible = false;
                }
                field("Target Value/KPI"; Rec."Target Value/KPI")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Score %"; Rec."Score %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Assigned Weight %"; Rec."Assigned Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Weighted Line Score"; Rec."Weighted Line Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Evaluation Results"; Rec."Evaluation Results")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No Of Pages"; Rec."No Of Pages")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Compliance Certificate"; Rec."Tax Compliance Certificate")
                {
                    ApplicationArea = Basic;
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
                    RunPageLink = "Template ID" = field("Bid Scoring Document No."),
                                  "Criteria Group ID" = field("Criteria Group"),
                                  "Requirement ID" = field("Requirement ID");
                }
            }
        }
    }
}

#pragma implicitwith restore

