#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80005 "Quarterly Reporting Periods"
{
    PageType = List;
    SourceTable = "Quarterly Reporting Periods";

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
                field("Year Code";"Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Reporting Start Date";"Reporting Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reporting End Date";"Reporting End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Current Year?";"Current Year?")
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

