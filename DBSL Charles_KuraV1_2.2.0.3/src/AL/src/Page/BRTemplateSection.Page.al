#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80336 "BR Template Section"
{
    PageType = List;
    SourceTable = "BR Template Section";

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
    }
}

