#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72672 "Project Evalaution Sections"
{
    Caption = 'Project Evaluation Sections';
    CardPageID = "Project Evaluation Section";
    PageType = List;
    SourceTable = "Project Evaluation Section";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description;Description)
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

