#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72432 "Material Test Template Passes"
{
    CardPageID = "Material Test Template Pass";
    PageType = List;
    SourceTable = "Material Test Template Pass";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; "Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Test Type"; "Test Type")
                {
                    ApplicationArea = Basic;
                }
                field("Checklist ID"; "Checklist ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
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
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                  //  DMSManagement.UploadAIEAttchmentDocuments("Template ID 'Material Test Template', RecordId, d,'');
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
}

