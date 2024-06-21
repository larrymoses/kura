#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72571 "Supervision Template Cat Lines"
{
    PageType = ListPart;
    SourceTable = "Supervision Template Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Category ID";"Category ID")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Requirements";"No. of Requirements")
                {
                    ApplicationArea = Basic;
                }
                field("Total Weight";"Total Weight")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                action("Supervision Template Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supervision Template Lines';
                    Image = Line;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Supervision Template Lines";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Template ID"=field("Template ID"),
                                  "Category ID"=field("Category ID");
                }
            }
        }
    }
}

