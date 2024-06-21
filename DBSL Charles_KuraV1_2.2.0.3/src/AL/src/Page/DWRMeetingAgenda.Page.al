#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72454 "DWR Meeting Agenda"
{
    CardPageID = "DWR Meeting Agendum";
    PageType = List;
    SourceTable = "DWR Meeting Agenda";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Agenda Code";"Agenda Code")
                {
                    ApplicationArea = Basic;
                }
                field("Agenda Description";"Agenda Description")
                {
                    ApplicationArea = Basic;
                }
                field(Owner;Owner)
                {
                    ApplicationArea = Basic;
                }
                field("Estimate Time (Minutes)";"Estimate Time (Minutes)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Agenda Summaries")
            {
                ApplicationArea = Basic;
                Image = AmountByPeriod;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "DWR Meeting Summaries";
                RunPageLink = "Document No."=field("Document No."),
                              "Line No."=field("Line No."),
                              "Agenda Code"=field("Agenda Code");
            }
        }
    }
}

