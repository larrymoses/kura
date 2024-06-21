#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69453 "HSE Plan Legal Registers"
{
    CardPageID = "HSE Plan Legal Register";
    PageType = List;
    SourceTable = 69426;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID"; "Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Legal Instrument ID"; "Legal Instrument ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Instrument Type"; "Instrument Type")
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
