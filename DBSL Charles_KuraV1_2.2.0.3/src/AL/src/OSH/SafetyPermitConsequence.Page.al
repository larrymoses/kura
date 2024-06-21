#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69418 "Safety Permit Consequence"
{
    PageType = Card;
    SourceTable = 69409;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Permit Type"; "Permit Type")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; "Line No.")
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
    }
}
