#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56030 "Complaints set-ups"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Complaints set-ups";
    UsageCategory = Lists;

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
                field(Type;Type)
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
            systempart(Control7;Outlook)
            {
            }
            systempart(Control8;Notes)
            {
            }
            systempart(Control9;Links)
            {
            }
        }
    }

    actions
    {
    }
}

