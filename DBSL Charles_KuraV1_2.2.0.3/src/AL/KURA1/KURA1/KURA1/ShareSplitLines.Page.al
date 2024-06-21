#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57081 "Share Split Lines"
{
    PageType = List;
    SourceTable = "Split Lines";

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
                field("Expected Interest Date";"Expected Interest Date")
                {
                    ApplicationArea = Basic;
                }
                field("Principal Amount";"Principal Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Principal Amount + Interest";"Principal Amount + Interest")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Benefit";"Tax Benefit")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Days";"No. Of Days")
                {
                    ApplicationArea = Basic;
                }
                field("Old Ratio";"Old Ratio")
                {
                    ApplicationArea = Basic;
                }
                field("New Ratio";"New Ratio")
                {
                    ApplicationArea = Basic;
                }
                field("Bonus Units";"Bonus Units")
                {
                    ApplicationArea = Basic;
                }
                field("Header No";"Header No")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type:=Type::"Share Split";
    end;
}

