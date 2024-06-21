#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 50086 "Service Item Cards"
{
    PageType = Card;
    SourceTable = "Service Items";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Service Code";"Service Code")
                {
                    ApplicationArea = Basic;
                }
                field("Service Name";"Service Name")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account";"G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account Name";"G/L Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Capex;Capex)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10;Links)
            {
            }
            systempart(Control11;Outlook)
            {
            }
            systempart(Control12;MyNotes)
            {
            }
        }
    }

    actions
    {
    }
}

