#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57167 "Archived Imprest Memo"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = filter(Released),
                            Posted = const(false));

    layout
    {
        area(content)
        {
            group("Imprest Request Memo")
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
                }
                field("Project Description"; "Project Description")
                {
                    ApplicationArea = Basic;
                }
                field(Objective; ObjText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;

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
                        end;
                    end;
                }
                field("Terms of Reference"; TORText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;

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
                        end;
                    end;
                }
                field(Requestor; Requestor)
                {
                    ApplicationArea = Basic;
                }
                field("Requestor Name"; "Requestor Name")
                {
                    ApplicationArea = Basic;
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
                field(Job; Job)
                {
                    ApplicationArea = Basic;
                }
                field("Job Name"; "Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job  Task"; "Job  Task")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Name"; "Job Task Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task Budget"; "Job Task Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task Remaining Amount"; "Job Task Remaining Amount")
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
                field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
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
                field("Funding Source"; "Funding Source")
                {
                    ApplicationArea = Basic;
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
            group("Travel Details")
            {
                Visible = false;
                field(From; From)
                {
                    ApplicationArea = Basic;
                }
                field(Destination; Destination)
                {
                    ApplicationArea = Basic;
                }
                field("Time Out"; "Time Out")
                {
                    ApplicationArea = Basic;
                }
                field("Journey Route"; "Journey Route")
                {
                    ApplicationArea = Basic;
                }
            }
            // part(Control1000000020;"Safari Team")
            // {
            //     Editable = false;
            //     SubPageLink = "Imprest Memo No."=field("No.");
            // }
            part("Fuel/Maintenance"; Fuel)
            {
                Editable = false;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Machine);
            }
            part(Control1000000021; "Execution Plan")
            {
                Editable = false;
                SubPageLink = "Imprest Memo No." = field("No.");
            }
            part(Control1000000022; Casuals)
            {
                Editable = false;
                SubPageLink = "Imprest Memo No." = field("No.");
            }
            part(Control1000000023; "Other Costs")
            {
                Editable = false;
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
            action(Post)
            {
                ApplicationArea = Basic;
                Enabled = Show;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //*Added to limit posting of a memo rights*David*
                    usersetup.Get(UserId);
                    if usersetup."Post Memo" = false then
                        Error('You do not have sufficient rights to Post An Imprest Memo! Please! contact System Administrator for Assistance.');
                    //  PaymentPost.PostImprestMemo(Rec);
                end;
            }
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

    trigger OnAfterGetRecord()
    begin
        Show := ((Status = Status::Released) and not Posted);

        CalcFields("Terms of Reference", Objective);
        "Terms of Reference".CreateInstream(Instr);
        TOR.Read(Instr);
        TORText := Format(TOR);


        Objective.CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    trigger OnOpenPage()
    begin
        Show := ((Status = Status::Released) and not Posted);
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
        usersetup: Record "User Setup";

    local procedure SetControlAppearance()
    var
    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //   OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

