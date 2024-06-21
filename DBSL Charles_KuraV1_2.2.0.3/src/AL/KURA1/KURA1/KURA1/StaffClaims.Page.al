#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57107 "Staff Claims"
{
    ApplicationArea = Basic;
    CardPageID = "Staff Claim";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type"=const("Staff Claim"),
                            Status=filter(Open|"Pending Approval"),
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
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name";"Account Name")
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
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount";"Total Amount")
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
        //SETRANGE("Created By",USERID);

        //Fred RC
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
          SetFilter(Status,'%1|%2',Status::Open,Status::"Pending Approval");
          SetRange("Payment Type","payment type"::"Staff Claim");
          SetRange("Document Type","document type"::"Staff Claims");
          end;
    end;

    trigger OnAfterGetRecord()
    begin
        //SETRANGE("Created By",USERID);

        //Fred RC
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
          SetFilter(Status,'%1|%2',Status::Open,Status::"Pending Approval");
          SetRange("Payment Type","payment type"::"Staff Claim");
          SetRange("Document Type","document type"::"Staff Claims");
          end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"Staff Claims";
    end;

    trigger OnOpenPage()
    begin
        //SETRANGE("Created By",USERID);

        //Fred RC
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
          SetFilter(Status,'%1|%2',Status::Open,Status::"Pending Approval");
          SetRange("Payment Type","payment type"::"Staff Claim");
          SetRange("Document Type","document type"::"Staff Claims");
          end;
    end;

    var
        UserSetup: Record "User Setup";
}

