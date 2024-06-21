#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57014 "Approved Imprest Requisitions"
{
    ApplicationArea = Basic;
    CardPageID = "Approved Imprest Requisition";
    Editable = true;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Released),
                            Posted = const(false),
                            "Send for Posting" = const(false),
                            banked = const(false),
                            "Archive Document" = const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }

                field("Employee Bank Account Name"; Rec."Employee Ban Account Name")
                {
                    ApplicationArea = basic;
                }
                field("Employee Bank Account Code"; Rec."Employee Bank Account Code")
                {
                    ApplicationArea = basic;
                }
                field("Employee Bank Account Number"; Rec."Employee Bank Account Number")
                {
                    ApplicationArea = basic;
                }
                field("Employee Bank Brach Code"; Rec."Employee Bank Brach Code")
                {
                    ApplicationArea = basic;
                }

                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Job; Rec.JobNo)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
            }
            systempart(Control1000000016; Links)
            {
            }
        }
    }

    actions
    {
        area(reporting)
        {
        }
        area(navigation)
        {
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("Banked Imprest Requisition")
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
                        Payments.SetRange("Payment Type", Payments."payment type"::Imprest);
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
                            Payments.Reset;
                            Payments.SetRange("Document Type", Rec."document type"::Imprest);
                            Payments.SetRange("No.", Rec."No.");
                            if Payments.FindFirst then begin
                                repeat
                                    Payments."Archive Document" := true;
                                    Payments.Modify;
                                until Payments.Next = 0;
                            end;
                        end else
                            Error('You don''t have rights to archive finance documents,Contact System administrator');
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."Post Requisition" =FALSE THEN
        // SETRANGE("Created By",USERID);
        // END;

        //Fred RC
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts Administrator" then
                Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."Post Requisition" =FALSE THEN
        // SETRANGE("Created By",USERID);
        // END;

        //Fred RC
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts Administrator" then
                Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
    end;

    trigger OnOpenPage()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."Post Requisition" =FALSE THEN
        // SETRANGE("Created By",USERID);
        // END;

        //Fred RC
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts Administrator" then
                Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    var
        UserSetup: Record "User Setup";
        Payments: Record payments;
}

#pragma implicitwith restore

