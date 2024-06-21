#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70023 "Bidder Mandatory Requirements"
{
    PageType = Card;
    SourceTable = "Bidder Mandatory Requirements";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Company Name";"Company Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Complied;Complied)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field("Evaluater User Id";"Evaluater User Id")
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

