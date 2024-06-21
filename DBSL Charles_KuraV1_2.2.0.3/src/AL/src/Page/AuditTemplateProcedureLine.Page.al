#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95231 "Audit Template Procedure Line"
{
    PageType = ListPart;
    SourceTable = "Audit Template Procedure";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Objective ID";"Audit Objective ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Procedure ID";"Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Reccomm Audit Test Meth";"No. Of Reccomm Audit Test Meth")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Comments";"No. Of Comments")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Risks";"No. of Audit Risks")
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
                action("Procedure Test")
                {
                    ApplicationArea = Basic;
                    Image = AbsenceCategory;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Template Procedure Tests";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Audit Objective ID"=field("Audit Objective ID"),
                                  "Audit Procedure ID"=field("Audit Procedure ID");
                }
                action("Procedure Comment")
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Temp Procedure Comments";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Audit Objective ID"=field("Audit Objective ID"),
                                  "Audit Procedure ID"=field("Audit Procedure ID");
                }
                action("Procedure Risk")
                {
                    ApplicationArea = Basic;
                    Image = Alerts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Template Default Risks";
                    RunPageLink = "Template ID"=field("Template ID");
                }
                action("Procedure Control")
                {
                    ApplicationArea = Basic;
                    Image = Aging;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Temp Procedure Controls";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Audit Objective ID"=field("Audit Objective ID"),
                                  "Audit Procedure ID"=field("Audit Procedure ID");
                }
            }
        }
    }
}

