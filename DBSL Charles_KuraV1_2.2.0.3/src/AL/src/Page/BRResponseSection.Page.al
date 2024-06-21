#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80353 "BR Response Section"
{
    PageType = ListPart;
    SourceTable = "BR Response Section";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Survey Response ID";"Survey Response ID")
                {
                    ApplicationArea = Basic;
                }
                field("Section Code";"Section Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Section Completion Instruction";"Section Completion Instruction")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Questions";"No. of Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Total Weight %";"Total Weight %")
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
            action("BR Response Question")
            {
                ApplicationArea = Basic;
                Image = Questionaire;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "BR Response Question";
                RunPageLink = "Survey Response ID"=field("Survey Response ID"),
                              "Section Code"=field("Section Code");
            }
        }
    }
}

