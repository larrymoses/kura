#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72139 "Legislation Register"
{
    PageType = Card;
    SourceTable = "Legislation Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Legislation ID";"Legislation ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Overview;Overview)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Functional Classification";"Functional Classification")
                {
                    ApplicationArea = Basic;
                }
                field("Gazette Supplement No.";"Gazette Supplement No.")
                {
                    ApplicationArea = Basic;
                }
                field("National Assembly Bill No.";"National Assembly Bill No.")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Amendments";"No. of Amendments")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Clauses/Sections";"No. of Clauses/Sections")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Subsections";"No. of Subsections")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Schedules";"No. of Schedules")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control15;"Legislation Ammendment")
            {
                Caption = 'Legislation Ammendvoment';
                SubPageLink = "Legislation ID"=field("Legislation ID");
                Visible = false;
            }
            part(Control16;"Legislation Part")
            {
                Caption = 'Legislation Sections/Clauses';
                SubPageLink = "Legislation ID"=field("Legislation ID");
            }
            part(Control17;"Legislation Part Schedules")
            {
                Caption = 'Legislation Schedules';
                SubPageLink = "Legislation ID"=field("Legislation ID");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Ammendments)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = AddToHome;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Legislation Ammendment";
                RunPageLink = "Legislation ID"=field("Legislation ID");
                RunPageMode = View;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Work In Progress. We are updating the system shortly');
                end;
            }
        }
    }
}

