#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57110 "Approved Staff Claims"
{
    ApplicationArea = Basic;
    CardPageID = "Aprroved Staff Claim";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Staff Claim"),
                            Status = filter(Released),
                            Posted = const(false),
                            banked = const(false),
                            "Archive Document" = const(false)
                            );
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select; Select)
                {
                    ApplicationArea = Basic;
                }
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Name"; "Account Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payee';
                    Editable = false;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By"; "Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted Date"; "Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Amount"; "Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            systempart(Control1000000020; Links)
            {
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
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
                    SetRange("No.", "No.");
                    Report.Run(57003, true, true, Rec);
                    SetRange("No.");
                end;
            }
            action("Banked Staff Claim")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Payments.Reset;
                    Payments.SetRange(Select, true);
                    Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
                    if Payments.Find('-') then begin
                        repeat
                            Payments.banked := true;
                            Payments.Modify;
                        until Payments.Next = 0;
                    end;
                    Message('Banked Successfully');
                end;
            }
            action("Archive Document")
            {
                ApplicationArea = Basic;
                Image = Archive;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    UserSetup.Reset;
                    UserSetup.SetRange("User ID", UserId);
                    UserSetup.SetRange("Archive Document", true);
                    if UserSetup.Find('-') then begin
                        SetRange("No.", "No.");
                        "Archive Document" := true;
                        Modify;
                    end else
                        Error('You don''t have rights to archive finance documents,Contact System administrator');
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //SETRANGE("Created By",USERID);

        //FRed RC
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            SetRange(Status, Status::Released);
            SetRange("Payment Type", "payment type"::"Staff Claim");
            SetRange("Document Type", "document type"::"Staff Claims");
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        //SETRANGE("Created By",USERID);

        //FRed RC
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            SetRange(Status, Status::Released);
            SetRange("Payment Type", "payment type"::"Staff Claim");
            SetRange("Document Type", "document type"::"Staff Claims");
        end;
    end;

    trigger OnOpenPage()
    begin
        //SETRANGE("Created By",USERID);

        //FRed RC
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            SetRange(Status, Status::Released);
            SetRange("Payment Type", "payment type"::"Staff Claim");
            SetRange("Document Type", "document type"::"Staff Claims");
        end;
    end;

    var
        Payments: Record payments;
        UserSetup: Record "User Setup";
}

