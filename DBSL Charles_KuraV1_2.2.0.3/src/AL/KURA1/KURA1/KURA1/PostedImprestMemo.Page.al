#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57041 "Posted Imprest Memo"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = filter(Released),
                            Posted = const(true));

    layout
    {
        area(content)
        {
            group("Imprest Request Memo")
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
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                }
                field(Objective; ObjText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS(Objective);
                        Objective.CREATEINSTREAM(ObjInstr);
                        Obj.READ(ObjInstr);
                        
                        IF ObjText<>FORMAT(TOR) THEN
                        BEGIN
                         CLEAR(Objective);
                         CLEAR(Obj);
                         Obj.ADDTEXT(ObjText);
                         Objective.CREATEOUTSTREAM(ObjOutStr);
                         Obj.WRITE(ObjOutStr);
                        END;*/

                    end;
                }
                field("Terms of Reference"; TORText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS("Terms of Reference");
                        "Terms of Reference".CREATEINSTREAM(Instr);
                        TOR.READ(Instr);
                        
                        IF TORText<>FORMAT(TOR) THEN
                        BEGIN
                         CLEAR("Terms of Reference");
                         CLEAR(TOR);
                         TOR.ADDTEXT(TORText);
                         "Terms of Reference".CREATEOUTSTREAM(OutStr);
                         TOR.WRITE(OutStr);
                        END;
                        */

                    end;
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Total Subsistence Allowance"; Rec."Total Subsistence Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Total Fuel Costs"; Rec."Total Fuel Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Total Maintenance Costs"; Rec."Total Maintenance Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Total Casuals Cost"; Rec."Total Casuals Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Total Other Costs"; Rec."Total Other Costs")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                      part("Attached Documents1"; "Document Attachment Factbox1")
                {
                    ApplicationArea = All;
                    Caption = 'Attachment';
                    SubPageLink = "Table ID" = CONST(57008), "No." = FIELD("No.");//, "Document Type" = CONST(0);
                                                                                  // SystemCreatedBy = field(SystemCreatedBy);

                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job  Task"; Rec."Job  Task")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Travel Details")
            {
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = Basic;
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000020; "Safari Team")
            {
                Editable = false;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Person);
            }
            part("Fuel/Maintenance"; Fuel)
            {
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Machine);
            }
            part(Control1000000021; "Execution Plan")
            {
                SubPageLink = "Imprest Memo No." = field("No.");
            }
            part(Control1000000022; Casuals)
            {
                SubPageLink = "Imprest Memo No." = field("No.");
            }
            part(Control1000000023; "Other Costs")
            {
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
                    //      PaymentPost.PostImprestMemo(Rec);
                end;
            }
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
        }
    }

    trigger OnAfterGetRecord()
    begin
        Show := ((Rec.Status = Rec.Status::Released) and not Rec.Posted);

        /*CALCFIELDS("Terms of Reference",Objective);
        "Terms of Reference".CREATEINSTREAM(Instr);
        TOR.READ(Instr);
        TORText:=FORMAT(TOR);
        Objective.CREATEINSTREAM(ObjInstr);
        Obj.READ(ObjInstr);
        ObjText:=FORMAT(Obj);*/

    end;

    trigger OnOpenPage()
    begin
        Show := ((Rec.Status = Rec.Status::Released) and not Rec.Posted);
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

    local procedure SetControlAppearance()
    var
    //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

#pragma implicitwith restore

