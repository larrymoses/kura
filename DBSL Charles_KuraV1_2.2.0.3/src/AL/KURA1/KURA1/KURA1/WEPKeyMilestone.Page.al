#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72266 "WEP Key Milestone"
{
    PageType = List;
    SourceTable = "WEP Key Milestone";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Milestone Code";"Milestone Code")
                {
                    ApplicationArea = Basic;
                }
                field(Descrption;Descrption)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Certificate Type";"Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                }
                field("Payment %";"Payment %")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Amount (LCY)";"Planned Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Due Date";"Due Date")
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

