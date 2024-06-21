#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57071 "Posted Petty Cash Vouchers"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Petty Cash Voucher";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type"=const("Petty Cash"),
                            Status=const(Released),
                            Posted=const(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode";"Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No";"Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Cheque Date";"Cheque Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Paying Bank Account";"Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(Payee;Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount";"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Currency;Currency)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posted By";"Posted By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posted Date";"Posted Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019;Notes)
            {
            }
            systempart(Control1000000020;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Petty Cash Voucher")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetRange("No.","No.");
                    Report.Run(57003,true,true,Rec);
                    SetRange("No.");
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //Fred RC
        //SETRANGE("Created By",USERID);
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
          end;
    end;

    trigger OnAfterGetRecord()
    begin
        //Fred RC
        //SETRANGE("Created By",USERID);
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
          end;
    end;

    trigger OnOpenPage()
    begin
        //Fred RC
        //SETRANGE("Created By",USERID);
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
          end;
    end;

    var
        UserSetup: Record "User Setup";
}

