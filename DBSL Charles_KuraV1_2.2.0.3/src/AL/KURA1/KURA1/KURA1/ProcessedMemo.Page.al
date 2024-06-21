#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57134 "Processed  Memo"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = const(Released),
                            Posted = const(false));

    layout
    {
        area(content)
        {
            group("Imprest Request Memo")
            {
                Editable = false;
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Project; Project)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Promoted;
                    ShowMandatory = true;
                    Visible = false;
                }
                field("Project Description"; "Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field(Subject; Subject)
                {
                    ApplicationArea = Basic;
                }
                field(Objective; ObjText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        CalcFields(Objective);
                        Objective.CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Objective);
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Objective.CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("Terms of Reference"; TORText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;

                    trigger OnValidate()
                    begin

                        CalcFields("Terms of Reference");
                        "Terms of Reference".CreateInstream(Instr);
                        TOR.Read(Instr);

                        if TORText <> Format(TOR) then begin
                            Clear("Terms of Reference");
                            Clear(TOR);
                            TOR.AddText(TORText);
                            "Terms of Reference".CreateOutstream(OutStr);
                            TOR.Write(OutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Raised By';
                    Editable = false;
                }
                field(Requestor; Requestor)
                {
                    ApplicationArea = Basic;
                }
                field("Requestor Name"; "Requestor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 5 Code"; "Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Code:';
                    Visible = false;
                }
                field("Destination Name"; "Destination Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Imprest Naration"; "Imprest Naration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Narations';
                }
                field("Total Subsistence Allowance"; "Total Subsistence Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Total Fuel Costs"; "Total Fuel Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Total Maintenance Costs"; "Total Maintenance Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Total Casuals Cost"; "Total Casuals Cost")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Total Other Costs"; "Total Other Costs")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Unit  Name"; "Unit  Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Division Name"; "Division Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Budget"; "Project Budget")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Actual Project Costs"; "Actual Project Costs")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("PO Commitments"; "PO Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Store Requisition Commitments"; "Store Requisition Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Imprest Application Commitment"; "Imprest Application Commitment")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Total Budget Commitments"; "Total Budget Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            group(Reasons)
            {
                Caption = 'Reasons';
                field("Reason to Reopen"; "Reason to Reopen")
                {
                    ApplicationArea = Basic;
                }
            }
            // part(Control1000000020;"Safari Team")
            // {
            //     Editable = not OpenApprovalEntriesExist;
            //     SubPageLink = "Imprest Memo No."=field("No."),
            //                   Type=const(Person);
            // }
            part("Fuel/Maintenance"; Fuel)
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Machine);
            }
            part(Control1000000021; "Execution Plan")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                Visible = false;
            }
            part(Control1000000022; Casuals)
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                Visible = false;
            }
            part(Control1000000023; "Other Costs")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000017; Notes)
            {
            }
            systempart(Control1000000018; MyNotes)
            {
            }
            systempart(Control1000000019; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = false;

                trigger OnAction()
                begin
                    //Daudi
                    //check if the requester is part of the team
                    ProjectTeam.Reset;
                    ProjectTeam.SetRange(ProjectTeam."No.", Requestor);
                    if ProjectTeam.FindFirst = false then
                        Error(Text001);

                    // if ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(Rec) then
                    //   ApprovalsMgmt.OnSendImpMemoForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = false;

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OnCancelImpMemoApprovalRequest(Rec);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Enabled = Show;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    // PaymentPost.PostImprestMemo(Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //Ushindi changes
                    if Status <> Status::Released then
                        Error(Text002);
                    if Status = Status::Released then begin
                        SetRange("No.", "No.");
                        Report.Run(57001, true, true, Rec);
                        Reset;
                    end;
                end;
            }
            action("Create Imprest")
            {
                ApplicationArea = Basic;
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //add pv from claims
                    //added on 27/04/2017
                    Usersetup.Get(UserId);
                    Usersetup.TestField(Usersetup."Process Claims", Usersetup."Process Claims" = true);
                    if Confirm(Text004, false, "No.") then begin
                        Memoheaders.Reset;
                        Memoheaders.SetRange(Memoheaders."No.", "No.");
                        if Memoheaders.Find('-') then begin

                            SafariMembers.Reset;
                            SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
                            SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
                            if SafariMembers.Find('-') then
                            //BEGIN
                            //IF SafariMembers.Type = SafariMembers.Type::Person THEN
                            begin
                                repeat
                                    //get the no. series
                                    CashMgt.Reset;
                                    if CashMgt.Find('-') then begin
                                        Noseries := CashMgt."Imprest Nos";
                                    end;

                                    LineNo := 1000;
                                    Imprestheaders.Init;
                                    Imprestheaders."No." := NoSeriesMgt.GetNextNo(Noseries, Imprestheaders.Date, true);
                                    Imprestheaders.Date := Today;
                                    Imprestheaders."Account Type" := Imprestheaders."account type"::Customer;
                                    Imprestheaders."Account No." := SafariMembers."No.";
                                    Imprestheaders."Account Name" := SafariMembers.Name;
                                    Imprestheaders."Payment Type" := Imprestheaders."payment type"::Imprest;

                                    //add the userid of the safari members
                                    Usersetup.Reset;
                                    Usersetup.SetRange("Resource No", Imprestheaders."Account No.");
                                    if Usersetup.Find('-') then begin
                                        Imprestheaders."Created By" := Usersetup."User ID";
                                    end;

                                    Imprestheaders."Travel Date" := Memoheaders."Start Date";
                                    Imprestheaders."Document Type" := Imprestheaders."document type"::Imprest;
                                    Imprestheaders."Imprest Memo No" := Memoheaders."No.";
                                    Imprestheaders."On behalf of" := SafariMembers.Name;
                                    Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 1 Code");
                                    Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 2 Code");
                                    Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 3 Code");
                                    Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 4 Code");
                                    Imprestheaders.Insert;


                                    Imprestlines.Init;
                                    Imprestlines."Line No" := LineNo;
                                    Imprestlines.No := Imprestheaders."No.";
                                    Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                    Imprestlines."Account No." := SafariMembers."G/L Account";
                                    Imprestlines.Validate(Imprestlines."Account No.");
                                    Imprestlines.Purpose := SafariMembers."Work Type";
                                    Imprestlines.Amount := SafariMembers.Entitlement;
                                    Imprestlines.Insert;
                                    LineNo := LineNo + 10;

                                    if SafariMembers."Project Lead" = true then begin
                                        ProjectTeam.Reset;
                                        ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", "No.");
                                        ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
                                        if ProjectTeam.Find('-') then
                                        //IF ProjectTeam.Type = ProjectTeam.Type::Machine THEN
                                        begin
                                            repeat
                                                Imprestlines.Init;
                                                Imprestlines."Line No" := LineNo;
                                                Imprestlines.No := Imprestheaders."No.";
                                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                                Imprestlines."Account No." := ProjectTeam."G/L Account";
                                                Imprestlines.Validate(Imprestlines."Account No.");
                                                Imprestlines.Purpose := ProjectTeam."Work Type";
                                                Imprestlines.Amount := ProjectTeam."Expected Maintenance Cost";
                                                Imprestlines.Insert;
                                                LineNo := LineNo + 10;

                                            until ProjectTeam.Next = 0;
                                        end;

                                        Othercost.Reset;
                                        Othercost.SetRange(Othercost."Imprest Memo No.", "No.");
                                        if Othercost.Find('-') then begin
                                            repeat
                                                Imprestlines.Init;
                                                Imprestlines."Line No" := LineNo;
                                                Imprestlines.No := Imprestheaders."No.";
                                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                                Imprestlines."Account No." := Othercost."No.";
                                                Imprestlines.Validate(Imprestlines."Account No.");
                                                Imprestlines.Purpose := Othercost."Required For";
                                                Imprestlines.Amount := Othercost."Line Amount";
                                                Imprestlines.Insert;
                                                LineNo := LineNo + 10;

                                            until Othercost.Next = 0;
                                        end;
                                    end;

                                until SafariMembers.Next = 0;
                            end;

                            Memoheaders."Imprest Created" := true;
                            Memoheaders."Date converted" := Today;
                            Memoheaders."Time converted" := Time;
                            Memoheaders."Converted By" := UserId;
                            Memoheaders.Modify;

                        end;
                        Message('Imprest (s) for the imprest memo No. %1 has been processed, Kindly send for approval', "No.");
                    end else
                        Error('The payment for claim No. %1 has already been processed.', Memoheaders."No.");
                    //END;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    ApprovalEntries.Setfilters(Database::"Imprest Memo", 6, "No.");
                    ApprovalEntries.Run;
                end;
            }
        }
        area(navigation)
        {
            action("Re&lease")
            {
                ApplicationArea = Basic;
                Caption = 'Re&lease';
                Image = ReleaseDoc;
                ShortCutKey = 'Ctrl+F9';

                trigger OnAction()
                var
                // ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    Releasememo.PerformManualRelease(Rec);
                end;
            }
            action("Re&open")
            {
                ApplicationArea = Basic;
                Caption = 'Re&open';
                Image = ReOpen;

                trigger OnAction()
                var
                // ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    //added on 20/04/2016
                    Usersetup.Get(UserId);
                    Usersetup.TestField(Usersetup."Reopen Document", Usersetup."Reopen Document" = true);
                    TestField("Reason to Reopen");
                    ReopenMemo.PerformManualReopen(Rec);

                    //added on 20/04/2016
                    //increase frequency of reopening to be only once
                    if "Frequency of Reopen" > 0 then begin
                        Error('The memo already reopened you can only reopen once');
                    end else begin
                        "Frequency of Reopen" := 1;
                        "Reopened by" := UserId;
                        "Reopened Date" := CurrentDatetime;
                        Modify;
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Show := ((Status = Status::Released));
        SetControlAppearance;
        CalcFields("Terms of Reference", Objective);
        "Terms of Reference".CreateInstream(Instr);
        TOR.Read(Instr);
        TORText := Format(TOR);


        Objective.CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Imprest Memo";
    end;

    trigger OnOpenPage()
    begin
        Show := ((Status = Status::Released));
        SetControlAppearance;
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        // PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        Show: Boolean;
        TOR: BigText;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        ProjectTeam: Record "Project Members";
        Text001: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        Text002: label 'The Imprest Memo must be fully approved before printing';
        ReopenMemo: Codeunit "Imprest Memo";
        memo: Record "Imprest Memo";
        Releasememo: Codeunit "Imprest Memo";
        Usersetup: Record "User Setup";
        Imprestlines: Record "Imprest Lines";
        Imprestheaders: Record payments;
        Memolines: Record "PV Lines";
        Memoheaders: Record "Imprest Memo";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CashMgt: Record "Cash Management Setup";
        Noseries: Code[20];
        Text004: label 'Are you sure you want to create imprest for memo No. %1?';
        SafariMembers: Record "Project Members";
        Othercost: Record "Other Costs";
        LineNo: Integer;

    local procedure SetControlAppearance()
    var
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        // OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

