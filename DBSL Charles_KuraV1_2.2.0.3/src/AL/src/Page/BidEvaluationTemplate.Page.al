#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75051 "Bid Evaluation Template"
{
    Caption = 'Evaluation Templates';
    ApplicationArea = Basic;
    CardPageID = "Bid Evaluation Template Card";
    Editable = false;
    PageType = List;
    SourceTable = "Bid Scoring Template";
    UsageCategory = Tasks;
    PopulateAllFields =true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("Template type";"Template type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Default Procurement Type";"Default Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Total Preliminary Checks Score";"Total Preliminary Checks Score")
                {
                    ApplicationArea = Basic;
                }
                field("Total Technical Evaluation %";"Total Technical Evaluation %")
                {
                    ApplicationArea = Basic;
                }
                field("Total Financial Evaluation";"Total Financial Evaluation")
                {
                    ApplicationArea = Basic;
                }
                field("Total Assigned Score/Weight %";"Total Assigned Score/Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Default YES Bid Rating Score %";"Default YES Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                }
                field("NO Bid Rating Response Value";"NO Bid Rating Response Value")
                {
                    ApplicationArea = Basic;
                }
                field("Default NO Bid Rating Score %";"Default NO Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                }
                field("1-POOR Option Text Bid Score %";"1-POOR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("2-FAIR Option Text Bid Score %";"2-FAIR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("3-GOOD Option Text Bid Score %";"3-GOOD Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("4-VERY GOOD  Text Bid Score %";"4-VERY GOOD  Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("5-EXCELLENT Text Bid Score %";"5-EXCELLENT Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date";"Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time";"Created Time")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type";"Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11;Outlook)
            {
            }
            systempart(Control12;Notes)
            {
            }
            systempart(Control13;MyNotes)
            {
            }
            systempart(Control14;Links)
            {
            }
            chartpart("Q5402-01";"Q5402-01")
            {
            }
        }
    }

    actions
    {
    }
}

