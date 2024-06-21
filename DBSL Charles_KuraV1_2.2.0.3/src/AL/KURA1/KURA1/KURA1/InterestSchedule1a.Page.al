#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54014 "Interest Schedule1a"
{
    PageType = List;
    SourceTable = "Expected Interest1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Investment No";"Investment No")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Coupon Start Date";"Expected Interest Date")
                {
                    ApplicationArea = Basic;
                }
                field("Coupon Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Year Start";"Year Start")
                {
                    ApplicationArea = Basic;
                }
                field("Year End";"Year End")
                {
                    ApplicationArea = Basic;
                }
                field("Rate %";"Rate %")
                {
                    ApplicationArea = Basic;
                }
                field("Expected Interest Amount";"Expected Interest Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Whtax Amount";"Whtax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Net Amount";"Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Principal Amount + Interest";"Principal Amount + Interest")
                {
                    ApplicationArea = Basic;
                }
                field(Received;Received)
                {
                    ApplicationArea = Basic;
                }
                field("Received Amount";"Received Amount")
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

