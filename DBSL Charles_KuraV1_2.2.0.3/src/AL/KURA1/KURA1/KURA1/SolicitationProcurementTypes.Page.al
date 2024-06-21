#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75005 "Solicitation Procurement Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Solictation Procurement Type";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Solicitation Type";"Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Procument Type";"Procument Type")
                {
                    ApplicationArea = Basic;
                }
                field("Strict Purchase Limits";"Strict Purchase Limits")
                {
                    ApplicationArea = Basic;
                }
                field("Min Purchase Value (LCY)";"Min Purchase Value (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Max Purchase Value (LCY)";"Max Purchase Value (LCY)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9;Outlook)
            {
            }
            systempart(Control10;Notes)
            {
            }
            systempart(Control11;MyNotes)
            {
            }
            systempart(Control12;Links)
            {
            }
        }
    }

    actions
    {
    }
}

