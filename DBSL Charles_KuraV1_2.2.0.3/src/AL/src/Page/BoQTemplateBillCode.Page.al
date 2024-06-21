#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72187 "BoQ Template Bill Code"
{
    PageType = Card;
    SourceTable = "BoQ Template Bill Code";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("BoQ Template Code";"BoQ Template Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Category Code";"Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Begin-Total Job Task No.";"Begin-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("End-Total Job Task No.";"End-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Bill Activities";"No. of Bill Activities")
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

