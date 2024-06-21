#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57028 "Approved Imprest Surrenders"
{
    ApplicationArea = Basic;
    CardPageID = "Approved Imprest Surrender";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const(Surrender),
                            Status = filter(Released),
                            Posted = const(false),
                            Surrendered = const(false),
                            "Archive Document" = const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; "Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; "Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; "Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Amount"; "Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Deadline"; "Imprest Deadline")
                {
                    ApplicationArea = Basic;
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
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Reset;
                    SetRange("No.", "No.");
                    Report.Run(57002, true, true);
                    Reset;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin


        //Fred Rc
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            //SETRANGE("Created By",USERID);
        end;

        // IF UserSetup.GET(USERID) THEN BEGIN
        //  IF UserSetup."post surrender" = TRUE THEN BEGIN
        //    RESET;
        //    SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        //    //SETRANGE("Document Type","Document Type"::Surrender);
        //    SETRANGE("Payment Type","Payment Type"::Surrender);
        //    SETRANGE(Status,Status::Released);
        //    END;
        //  END;
    end;

    trigger OnAfterGetRecord()
    begin
        //Fred RC
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            //SETRANGE("Created By",USERID);
        end;

        // IF UserSetup.GET(USERID) THEN BEGIN
        //  IF UserSetup."post surrender" = TRUE THEN BEGIN
        //    RESET;
        //    SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        //    //SETRANGE("Document Type","Document Type"::Surrender);
        //    SETRANGE("Payment Type","Payment Type"::Surrender);
        //    SETRANGE(Status,Status::Released);
        //    END;
        //  END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Imprest Type" := "imprest type"::"Project Imprest";
    end;

    trigger OnOpenPage()
    begin
        //Fred RC
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts Administrator" then
                SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            //SETRANGE("Created By",USERID);
        end;

        // IF UserSetup.GET(USERID) THEN BEGIN
        //  IF UserSetup."post surrender" = TRUE THEN BEGIN
        //    RESET;
        //    SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        //    //SETRANGE("Document Type","Document Type"::Surrender);
        //    SETRANGE("Payment Type","Payment Type"::Surrender);
        //    SETRANGE(Status,Status::Released);
        //    END;
        //  END;
    end;

    var
        UserSetup: Record "User Setup";
}

