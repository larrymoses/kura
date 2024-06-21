#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57145 "Petty Cash Requisition"
{

    CardPageID = "Petty Cash Requisitons";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Petty Cash"),
                            Status = filter(Open | "Pending Approval"),
                            Posted = const(false));


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
                    Editable = false;
                    Visible = false;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
            }
            systempart(Control1000000020; Links)
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
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57003, true, true, Rec);
                    Rec.SetRange("No.");
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //Fred RC
        //SETRANGE("Created By",USERID);
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts Administrator" then
            Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        //Fred RC
        //SETRANGE("Created By",USERID);
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts Administrator" then
            Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        //Live := TRUE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //Live := TRUE;
    end;

    trigger OnOpenPage()
    begin
        // SETRANGE("Created By",USERID);

        //Fred RC
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts Administrator" then
            Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

