#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65116 "Financial Year Code"
{
    Caption = 'Financial Year Code';
    PageType = List;
    SourceTable = "Financial Year Code";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("Starting Date";"Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Ending Date";"Ending Date")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Budget";"G/L Budget")
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

