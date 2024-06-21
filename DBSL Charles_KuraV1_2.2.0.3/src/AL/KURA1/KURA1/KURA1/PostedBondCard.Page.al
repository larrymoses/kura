#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54018 "Posted Bond Card"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Bond Calculator";

    layout
    {
        area(content)
        {
            group("Intial Info")
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("FXD No";"FXD No")
                {
                    ApplicationArea = Basic;
                }
                field("System Bond No";"System Bond No")
                {
                    ApplicationArea = Basic;
                }
                field("Face Value";"Face Value")
                {
                    ApplicationArea = Basic;
                }
                field("Original Term";"Original Term")
                {
                    ApplicationArea = Basic;
                }
                field("Coupon Rate";"Coupon Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Nominal Amount (Cost)";"Nominal Amount (Cost)")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Input Details")
            {
                field("Settlement Date";"Settlement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Yield(input)";"Yield(input)")
                {
                    ApplicationArea = Basic;
                }
                field("Dirty Price/per value";"Dirty Price/per value")
                {
                    ApplicationArea = Basic;
                }
                field("% commission";"% commission")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Dates)
            {
                field("Issue Date";"Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Date";"Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field("Next Coupon";"Next Coupon")
                {
                    ApplicationArea = Basic;
                }
                field("Last Coupon";"Last Coupon")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Stastistical Information")
            {
                field("Set to Next";"Set to Next")
                {
                    ApplicationArea = Basic;
                }
                field("Last to next";"Last to next")
                {
                    ApplicationArea = Basic;
                }
                field("Last to set";"Last to set")
                {
                    ApplicationArea = Basic;
                }
                field("Average unpaid coupons";"Average unpaid coupons")
                {
                    ApplicationArea = Basic;
                }
                field("Unpaid Coupon";"Unpaid Coupon")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Bond Analysis")
            {
                field("Market Rate";"Market Rate")
                {
                    ApplicationArea = Basic;
                }
                field(Frequency;Frequency)
                {
                    ApplicationArea = Basic;
                }
                field("Day Basis";"Day Basis")
                {
                    ApplicationArea = Basic;
                }
                field("Accrued Interest";"Accrued Interest")
                {
                    ApplicationArea = Basic;
                }
                field("Clean Price";"Clean Price")
                {
                    ApplicationArea = Basic;
                }
                field("Bond Consideration";"Bond Consideration")
                {
                    ApplicationArea = Basic;
                }
                field(Commission;Commission)
                {
                    ApplicationArea = Basic;
                }
                field("Net Amount Receivable";"Net Amount Receivable")
                {
                    ApplicationArea = Basic;
                }
                field("Book value for the Bond";"Book value for the Bond")
                {
                    ApplicationArea = Basic;
                }
                field("Accrued Interest 2";"Accrued Interest 2")
                {
                    ApplicationArea = Basic;
                }
                field("Loss/Profit on sale of bond";"Loss/Profit on sale of bond")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(ReOpen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to reopen this transaction?')=true then begin
                      Posted:=false;
                      Modify;
                    end;
                end;
            }
        }
    }
}

