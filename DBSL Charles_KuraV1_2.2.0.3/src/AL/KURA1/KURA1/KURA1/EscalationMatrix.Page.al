#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56122 "Escalation Matrix"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "ICT Helpdesk Escalation Matrix";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Officer Name";"Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Reports To Officer Name";"Reports To Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Category Head";"Category Head")
                {
                    ApplicationArea = Basic;
                }
                field("Category Code";"Category Code")
                {
                    ApplicationArea = Basic;
                }
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

