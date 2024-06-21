#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57040 "Posted Imprest Memos"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Imprest Memo";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Posted = const(true),
                            Status = filter(Released));
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
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Accounts User" = false then
                SetRange("User ID", UserId);
        end;

        //FRed RC
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        /*
        CALCFIELDS("Terms of Reference");
        "Terms of Reference".CREATEINSTREAM(Instr);
        TOR.READ(Instr);
        TOR.GETSUBTEXT(TermsText,1) ;
        */
        if UserSetup.Get(UserId) then begin
            if UserSetup."Accounts User" = false then
                SetRange("User ID", UserId);
        end;

        //FRed RC
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;

    end;

    trigger OnOpenPage()
    begin
        /*
        CALCFIELDS("Terms of Reference");
        "Terms of Reference".CREATEINSTREAM(Instr);
        TOR.READ(Instr);
        TOR.GETSUBTEXT(TermsText,1) ;
        */
        if UserSetup.Get(UserId) then begin
            if UserSetup."Accounts User" = false then
                SetRange("User ID", UserId);
        end;

        //FRed RC
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;

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
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

