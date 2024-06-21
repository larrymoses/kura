#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57048 "Direct Voucher Header"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Receipts Header1";
    //SourceTableView = where(Posted = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                }
                field("Pay Mode"; "Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; "Cheque No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction No';
                }
                field("Cheque Date"; "Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field("Bank Code"; "Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field("Received From"; "Received From")
                {
                    ApplicationArea = Basic;
                }
                field("On Behalf Of"; "On Behalf Of")
                {
                    ApplicationArea = Basic;
                }
                field("Expense Account"; "Expense Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'Income Account';
                }
                field(Cashier; Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted Date"; "Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Posted Time"; "Posted Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By"; "Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000017; "Direct Voucher Lines")
            {
                SubPageLink = "Receipt No." = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000023; Outlook)
            {
            }
            systempart(Control1000000024; Notes)
            {
            }
            systempart(Control1000000025; MyNotes)
            {
            }
            systempart(Control1000000026; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Enabled = "No." <> '';
                Image = Dimensions;
                Promoted = false;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = false;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    ShowDocDim;
                    CurrPage.SaveRecord;
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    PaymentPost: Codeunit "Payments-Post";
                begin
                    /*
                    usersetup.GET(USERID);
                    IF usersetup."Post Receipts"=FALSE THEN
                    ERROR(Text0001);
                    usersetup.RESET;
                    IF usersetup."User ID"=Cashier THEN
                     ERROR('You cannot create and post the receipt, Alternative Cashier should post');
                     */
                    /*TESTFIELD("Expense Account");
                    PaymentPost.PostSalaryAdvance(Rec);*/

                    PaymentPost.PostDIV(Rec);

                end;
            }
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    SetRange("No.", "No.");
                    Report.Run(56003, true, true, Rec);
                end;
            }
        }
    }
}
