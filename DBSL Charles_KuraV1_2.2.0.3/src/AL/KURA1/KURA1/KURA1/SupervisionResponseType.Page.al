#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72561 "Supervision Response Type"
{
    PageType = Card;
    SourceTable = "Supervision Response Type";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Supervisor";"Primary Supervisor")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Default Resp. Options";"No. of Default Resp. Options")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control9;"Supervision Response Options")
            {
                SubPageLink = "Response Type ID"=field(Code);
            }
        }
    }

    actions
    {
    }
}
