#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57021 "Petty Cash Surrenders"
{
    ApplicationArea = Basic;
    CardPageID = "Petty Cash Surrender";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type"=const("Petty Cash Surrender"),
                            Status=filter(Released|Open|"Pending Approval"),
                            Surrendered=const(false),
                            Posted=const(false));
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
                }
                field("Cheque Date";"Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account";"Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(Payee;Payee)
                {
                    ApplicationArea = Basic;
                }
                field(Currency;Currency)
                {
                    ApplicationArea = Basic;
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
                }
                field("Posted By";"Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Date";"Posted Date")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Petty Cash Amount";"Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Type";"Payment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Petty Cash Amount Spent";"Actual Petty Cash Amount Spent")
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
            action("Petty Cash Surrender")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetRange("No.","No.");
                    Report.Run(57012,true,true,Rec);
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
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter")
          end;
    end;

    trigger OnAfterGetRecord()
    begin
        //Fred RC
        //SETRANGE("Created By",USERID);
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter")
          end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        //"Payment Type":="Payment Type"::"Petty Cash Surrender";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Payment Type":="Payment Type"::"Petty Cash Surrender";
    end;

    trigger OnOpenPage()
    begin
        //Fred RC
        //SETRANGE("Created By",USERID);
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter")
          end;
    end;

    var
        UserSetup: Record "User Setup";
}
