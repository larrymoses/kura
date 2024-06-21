#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69438 "Inspection Response Code"
{
    PageType = Card;
    SourceTable = 69417;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Response Type"; "Response Type")
                {
                    ApplicationArea = Basic;
                }
                field("Response Code"; "Response Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Score %"; "Score %")
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