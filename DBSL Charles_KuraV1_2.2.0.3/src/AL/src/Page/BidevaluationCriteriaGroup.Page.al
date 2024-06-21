#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75269 "Bid evaluation Criteria Group"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Bid Evaluation Criteria Group";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Criteria Group ID";"Criteria Group ID")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Type";"Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Total Weight %";"Total Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("No of Scored Criteria Groups";"No of Scored Criteria Groups")
                {
                    ApplicationArea = Basic;
                }
                field("No of Criteria Croups";"No of Criteria Croups")
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

