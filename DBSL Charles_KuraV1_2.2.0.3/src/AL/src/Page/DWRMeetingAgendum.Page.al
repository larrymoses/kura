#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72455 "DWR Meeting Agendum"
{
    PageType = Card;
    SourceTable = "DWR Meeting Agenda";

    layout
    {
        area(content)
        {
            group(General)
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
    }
}

