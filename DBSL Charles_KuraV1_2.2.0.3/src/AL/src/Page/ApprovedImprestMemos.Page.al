#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57038 "Approved Imprest Memos"
{
    ApplicationArea = Basic;
    CardPageID = "Imprest Memo-p";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = filter(Released),
                            Posted = const(false),
                            Archived = filter(false));
    UsageCategory = Lists;

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
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Terms of Reference"; TermsText)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000012; Notes)
            {
            }
            systempart(Control1000000013; MyNotes)
            {
            }
            systempart(Control1000000014; Links)
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

                trigger OnAction()
                begin
                    //Ushindi changes

                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57001, true, true, Rec);
                    Rec.Reset;
                end;
            }
            action(Archive)
            {
                ApplicationArea = Basic;
                Image = Archive;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Archived := true;
                    Rec.Modify;
                    Message('Imprest memo %1 has been archived successfully.', Rec."No.");
                    CurrPage.Close();
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //Fred RC
        if UserSetup.Get(UserId) then begin
            //SETRANGE("User ID",USERID);
            if not UserSetup."Accounts Administrator" then
            Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            Rec.SetRange(Status, Rec.Status::Released);
        end;

        // //Check Account User
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."Accounts User" = TRUE THEN BEGIN
        // RESET;
        // SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        // END;
        // END;
    end;

    trigger OnAfterGetRecord()
    begin
        /*
        CALCFIELDS("Terms of Reference");
        "Terms of Reference".CREATEINSTREAM(Instr);
        TOR.READ(Instr);
        TOR.GETSUBTEXT(TermsText,1) ;
        */
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."Accounts User"=FALSE THEN
        // SETRANGE("User ID",USERID);
        // END

        //Fred RC
        //SETRANGE("User ID",USERID);
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts Administrator" then
            Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            Rec.SetRange(Status, Rec.Status::Released);
        end;

        //Fred RC

        // IF UserSetup.GET(USERID) THEN BEGIN
        // SETRANGE("User ID",USERID);
        // SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        // END;

        //Check Account User
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."Accounts User" = TRUE THEN BEGIN
        // RESET;
        // SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        // END;
        // END;

    end;

    trigger OnOpenPage()
    begin
        /*
        CALCFIELDS("Terms of Reference");
        "Terms of Reference".CREATEINSTREAM(Instr);
        TOR.READ(Instr);
        TOR.GETSUBTEXT(TermsText,1) ;
        */
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."Accounts User"=FALSE THEN
        // SETRANGE("User ID",USERID);
        // END

        //Fred RC
        //SETRANGE("User ID",USERID);
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Accounts Administrator" then
                Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            Rec.SetRange(Status, Rec.Status::Released);

        end;

        //Check Account User
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."Accounts User" = TRUE THEN BEGIN
        // RESET;
        // SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        // END;
        // END;

    end;

    var
        Instr: InStream;
        TOR: BigText;
        Outstr: OutStream;
        TermsText: Text;
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        SalesRec: Record "Sales Header";
        OpenApprovalEntriesExist: Boolean;
        UserSetup: Record "User Setup";

    local procedure SetControlAppearance()
    var
    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

#pragma implicitwith restore

