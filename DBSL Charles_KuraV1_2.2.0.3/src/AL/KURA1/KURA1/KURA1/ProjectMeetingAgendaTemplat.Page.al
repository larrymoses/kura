#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72251 "Project Meeting Agenda Templat"
{
    ApplicationArea = Basic;
    CardPageID = "Project Meeting Agenda Temp";
    PageType = ListPart;
    SourceTable = "Project Meeting Agenda Temp";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Meeting Type";"Project Meeting Type")
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
                field("No. of Agenda Items";"No. of Agenda Items")
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
            group("Project Meeting Agenda Templat")
            {
                Caption = '&Line';
                Image = AddAction;
                action("Agenda  Templates")
                {
                    ApplicationArea = Basic;
                    Image = AddAction;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Project Meeting Agenda Templat";
                    RunPageLink = "Project Meeting Type"=field("Project Meeting Type"),
                                  "Agenda Code"=field("Agenda Code");
                }
            }
        }
    }
}

