#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72431 "Material Test Template Lines"
{
    PageType = ListPart;
    SourceTable = "Material Test Template Line";

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
                field("Test Type";"Test Type")
                {
                    ApplicationArea = Basic;
                }
                field(" Description"; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage";"Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage";"End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Chainage Description";"Chainage Description")
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
                action("Material Test Template Passes")
                {
                    ApplicationArea = Basic;
                    Image = Addresses;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Material Test Template Passes";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Test Type"=field("Test Type");
                }
            }
        }
    }
}

