#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75164 "Supplier Rating Group"
{
    PageType = List;
    SourceTable = "Supplier Rating Group";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal Template ID";"Appraisal Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Template Type";"Template Type")
                {
                    ApplicationArea = Basic;
                }
                field("Criteria Group";"Criteria Group")
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
            }
        }
    }

    actions
    {
    }
}

