#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

Page 72258 "Project Meeting Summary"
{
    PageType = List;
    SourceTable = "Project Meeting Summary";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Meeting ID"; Rec."Meeting ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Agenda Item No."; Rec."Agenda Item No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Item Discussed"; Rec."Item Discussed")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Summary Notes"; Rec."Summary Notes")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                    Caption = 'Issues Raised';
                }
                field("Task Description"; Rec."Task Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Action';
                    MultiLine = true;
                }
                field("Responsibility Category"; Rec."Responsibility Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Task Owner ID"; Rec."Task Owner ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; Rec."Contractor No")
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
            action("Project Meeting Action Point")
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Meeting Action Point";
                RunPageLink = "Meeting ID" = field("Meeting ID");
                Visible = false;
            }
        }
    }
}



