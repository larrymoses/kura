#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72245 "Project Document Template"
{
    PageType = Card;
    SourceTable = "Project Document Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control7;"Project Document Template Line")
            {
                SubPageLink = "Template ID"=field("Template ID");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Project Document Types")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Documents;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Project Document Types";
                RunPageLink = Code=field("Template ID");
            }
        }
    }
}

