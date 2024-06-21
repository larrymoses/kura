#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56053 "Applicant category setup"
{
    PageType = List;
    SourceTable = "Applicant category setup";

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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6;Notes)
            {
            }
            systempart(Control7;MyNotes)
            {
            }
            systempart(Control8;Links)
            {
            }
        }
    }

    actions
    {
    }
}

