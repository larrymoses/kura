#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72101 "Compliance Documents Card"
{
    PageType = Card;
    SourceTable = "Compliance Documents";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Document;Document)
                {
                    ApplicationArea = Basic;
                }
                field(Appendix;Appendix)
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

