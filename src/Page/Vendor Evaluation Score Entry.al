page 75450 "Vendor Evaluation Score Entry"
{
    PageType = List;
    SourceTable = "Vendor Evaluation Score Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code;Rec.Code)
                {
                    ApplicationArea =Basic;
                }
                field("Vendor No.";Rec."Vendor No.")
                {
                    ApplicationArea =Basic;
                }
                field("Requirement ID";Rec."Requirement ID")
                {
                    ApplicationArea =Basic;
                }
                field("Evaluation Requirement";Rec."Evaluation Requirement")
                {
                    ApplicationArea =Basic;
                }
                field("Score %";Rec."Score %")
                {
                    ApplicationArea =Basic;
                }
                field("Response Value";Rec."Response Value")
                {
                    ApplicationArea =Basic;
                }
                field(Scores;Rec.Scores)
                {
                    ApplicationArea =Basic;
                }
                field("Scores Remarks";Rec."Scores Remarks")
                {
                    ApplicationArea =Basic;
                }
                field("Evaluation Results";Rec."Evaluation Results")
                {
                    ApplicationArea =Basic;
                }
                field(Remarks;Rec.Remarks)
                {
                    ApplicationArea =Basic;
                }
                field("Criteria Group ID";Rec."Criteria Group ID")
                {
                    ApplicationArea =Basic;
                }
                field("Criteria Description";Rec."Criteria Description")
                {
                    ApplicationArea =Basic;
                }
                
            }
        }
    }

    actions
    {
    }
}

