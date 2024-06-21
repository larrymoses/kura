#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95229 "Entrance Meeting Agenda Line"
{
    PageType = ListPart;
    SourceTable = "Entrance Meeting Agenda";

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
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement ID";"Engagement ID")
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
                field("Estimate Time (Minutes)";"Estimate Time (Minutes)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Discussed Items";"No. of Discussed Items")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Discussed Items")
                {
                    ApplicationArea = Basic;
                    Image = ItemAvailabilitybyPeriod;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Entrance Meeting Summaries";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Document No."=field("Document No."),
                                  "Engagement ID"=field("Engagement ID"),
                                  "Agenda Code"=field("Agenda Code");
                }
                action(Attendance)
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Entrace Meeting Attendances";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Document No."=field("Document No."),
                                  "Engagement ID"=field("Engagement ID");
                }
            }
        }
    }
}

