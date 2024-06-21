#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95157 "Audit Template Procedure"
{
    PageType = Card;
    SourceTable = "Audit Template Procedure";

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
    }
}

