#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69744 "Question Group"
{
    PageType = List;
    SourceTable = "Hr Screening Qn Group";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Category";"Question Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Questions";"No. of Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Total Weight";"Total Weight")
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
            action("Template Line")
            {
                ApplicationArea = Basic;
                RunObject = Page "Application Submission Line";
                RunPageLink = "Line No."=field("Entry No.");
            }
        }
    }
}

