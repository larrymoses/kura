#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70050 "Purchases Types"
{
    PageType = List;
    SourceTable = "Purchases Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Purchase Type";"Purchase Type")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Type Description";"Purchase Type Description")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000006;Notes)
            {
            }
            systempart(Control1000000007;MyNotes)
            {
            }
            systempart(Control1000000008;Links)
            {
            }
        }
    }

    actions
    {
    }
}

