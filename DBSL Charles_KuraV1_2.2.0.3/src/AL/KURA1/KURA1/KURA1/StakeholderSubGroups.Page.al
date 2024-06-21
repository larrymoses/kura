#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80007 "Stakeholder Sub-Groups"
{
    PageType = List;
    SourceTable = "Stakeholder Sub-Group";

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
                field("Stakeholder Group";"Stakeholder Group")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Stakeholders";"No. of Stakeholders")
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

