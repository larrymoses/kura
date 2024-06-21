#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57166 "Archived Imprest Memos"
{
    ApplicationArea = Basic;
    CardPageID = "Archived Imprest Memo-p";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Archived = filter(true));
    UsageCategory = History;

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
                field(Project; Project)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Project Description"; "Project Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Objective; Objective)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Terms of Reference"; TermsText)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Subject; Subject)
                {
                    ApplicationArea = Basic;
                }
                field(Requestor; Requestor)
                {
                    ApplicationArea = Basic;
                }
                field("Requestor Name"; "Requestor Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
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

                    SetRange("No.", "No.");
                    Report.Run(57001, true, true, Rec);
                    Reset;
                end;
            }
            action(Unarchive)
            {
                ApplicationArea = Basic;
                Image = Archive;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Archived := false;
                    Modify;
                    Message('Imprest memo %1 has been unarchived successfully.', Rec."No.");
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
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            SetRange(Status, Status::Released);
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
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            SetRange(Status, Status::Released);
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
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
            SetRange(Status, Status::Released);

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
    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //   OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

