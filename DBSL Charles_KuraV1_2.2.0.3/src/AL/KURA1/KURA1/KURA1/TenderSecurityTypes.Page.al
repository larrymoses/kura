#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75108 "Tender Security Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Tender Security Types";
    UsageCategory = Administration;

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
                field("Security Type";"Security Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Security";"Nature of Security")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Filed Securities";"No. of Filed Securities")
                {
                    ApplicationArea = Basic;
                }
                field("Filed Securities Value (LCY)";"Filed Securities Value (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Forfeited Securities";"No. of Forfeited Securities")
                {
                    ApplicationArea = Basic;
                }
                field("Forfeited Securities Value LCY";"Forfeited Securities Value LCY")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Released Securities";"No. of Released Securities")
                {
                    ApplicationArea = Basic;
                }
                field("Released Securities Value LCY";"Released Securities Value LCY")
                {
                    ApplicationArea = Basic;
                }
                field(BLocked;BLocked)
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

