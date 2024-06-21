#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57011 "Imprest Requisitions"
{
    ApplicationArea = Basic;
    CardPageID = "Imprest Requisition";
    PageType = List;
    DeleteAllowed = false;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Open | "Pending Approval"),
                            "Archive Document" = filter(false));
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
                field("Imprest Amount"; "Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
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
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Surrendered; Surrendered)
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Deadline"; "Imprest Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Memo No"; "Imprest Memo No")
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
                Visible = false;

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
        /*IF UserSetup.GET(USERID) THEN BEGIN
        IF UserSetup."Post Requisition" =FALSE THEN
        SETRANGE("Created By",USERID);
        END;*/
        //Fred RC
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;

    end;

    trigger OnAfterGetRecord()
    begin
        /*IF UserSetup.GET(USERID) THEN BEGIN
        IF UserSetup."Post Requisition" =FALSE THEN
        SETRANGE("Created By",USERID);
        END;
        */
        //Fred RC
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Imprest Type" := "imprest type"::"Project Imprest";
        "Payment Type" := "payment type"::Imprest;
        "Document Type" := "document type"::Imprest;
    end;

    trigger OnOpenPage()
    begin
        /*IF UserSetup.GET(USERID) THEN BEGIN
        IF UserSetup."Post Requisition" =FALSE THEN
        //SETRANGE("Created By",USERID);
        END;
        */
        //Fred RC
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;

    end;

    var
        UserSetup: Record "User Setup";
}

