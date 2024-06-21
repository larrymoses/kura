#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57005 "Posted Payment Vouchers"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Payment Voucherss";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Payment Voucher"),
                            Posted = const(true),
                            Status = const(Released));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Wthheld six %"; Rec."VAT Wthheld six %")
                {
                    ApplicationArea = All;
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = All;
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Payment Voucher")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                      trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        ResponsibilityCenter: Record "Responsibility Center";
                        PV: Record payments;
                    begin
                        if UserSetup.Get(UserId) then begin
                            if ResponsibilityCenter.Get(UserSetup."Responsibility Center") then begin
                                if ResponsibilityCenter.HQ then begin
                                     PV.Reset();
                                    PV.SetRange("No.", Rec."No.");
                                    Report.Run(Report::"Payment Voucher", true, true, PV)
                                end else begin
                                    PV.Reset();
                                    PV.SetRange("No.", Rec."No.");
                                    Report.Run(Report::"Regional Payment Voucher", true, true, PV);
                                end;
                            end;
                        end else begin
                            if ResponsibilityCenter.Get(Rec."Responsibility Center") then begin
                                if ResponsibilityCenter.HQ then begin
                                    PV.Reset();
                                    PV.SetRange("No.", Rec."No.");
                                    Report.Run(Report::"Payment Voucher", true, true, PV)
                                end else begin
                                    PV.Reset();
                                    PV.SetRange("No.", Rec."No.");
                                    Report.Run(Report::"Regional Payment Voucher", true, true, PV);
                                end;
                            end;
                        end;
                    end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts Administrator" then
                Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts Administrator" then
                Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts Administrator" then
                Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

