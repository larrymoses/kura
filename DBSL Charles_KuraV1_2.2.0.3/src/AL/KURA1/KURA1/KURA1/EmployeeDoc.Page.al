#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69149 "Employee Doc"
{
    PageType = List;
    SourceTable = "Document Link";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Description";"Document Description")
                {
                    ApplicationArea = Basic;
                }
                field(Attachement;Attachement)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000005;Notes)
            {
            }
            systempart(Control1000000006;MyNotes)
            {
            }
            systempart(Control1000000007;Links)
            {
            }
        }
    }

    actions
    {
    }
}

