#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54019 "Money Market List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Money Markets listings";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Issue No";"Issue No")
                {
                    ApplicationArea = Basic;
                }
                field("Issue Date";"Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Date";"Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tenure (Years)";"Tenure (Years)")
                {
                    ApplicationArea = Basic;
                }
                field("Coupon Rate";"Coupon Rate")
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

