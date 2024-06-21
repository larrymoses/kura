#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80334 "Business Research Template"
{
    PageType = Card;
    SourceTable = "Business Research Template";

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
                field("Survey Type";"Survey Type")
                {
                    ApplicationArea = Basic;
                }
                field("Business Research Category";"Business Research Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Target Respondent Type";"Target Respondent Type")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate";"Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department";"Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control11;"BR Template Line")
            {
                SubPageLink = "Template ID"=field("Template ID");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("BR Template Section")
            {
                ApplicationArea = Basic;
                Image = SNInfo;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "BR Template Section";
                RunPageLink = "Template ID"=field("Template ID");
            }
        }
    }
}

