#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57199 "AIE Fund Transfers Released"
{
    ApplicationArea = Basic;
    CardPageID = "AIE Fund Transfer Card";
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Inter Bank Transfer";
    SourceTableView = where("Document Type" = filter("AIE Funds Transfer"),
                            "Approval Status" = filter(Released),
                            "AIE Posted" = filter(false));
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
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code"; "Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Region Name"; "Region Name")
                {
                    ApplicationArea = Basic;
                }
                field("Region Trasnsfered To"; "Region Trasnsfered To")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Originating Trans. Voucher No"; "Originating Trans. Voucher No")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Amount(LCY)"; "Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("From Doc Number"; "From Doc Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Effect Suggestion")
            {
                ApplicationArea = Basic;
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."Document Type", Rec."document type"::"AIE Funds Transfer");
                    Rec.SetRange(Rec."Approval Status", Rec."approval status"::Released);
                    Rec.SetRange(Rec.Suggested, false);
                    SelectedRecords := Rec.Count;
                    Rec.SetRange(Rec.Select, true);
                    if SelectedRecords = 0 then
                        Error(Text0002);
                    if Confirm(Text0001, true, SelectedRecords) then begin
                        TransferFrom.Reset;
                        TransferFrom.SetRange(TransferFrom.Select, true);
                        TransferFrom.SetRange(TransferFrom.Suggested, false);
                        TransferFrom.SetRange(TransferFrom."Document Type", TransferFrom."document type"::"AIE Funds Transfer");
                        TransferFrom.SetRange(TransferFrom."Approval Status", TransferFrom."approval status"::Released);
                        if TransferFrom.Find('-') then begin
                            repeat

                                TransFromLines.Reset;
                                TransFromLines.SetRange(TransFromLines."Document Type", TransferFrom."Document Type");
                                TransFromLines.SetRange(TransFromLines."Document No", TransferFrom."Document No");
                                if TransFromLines.Find('-') then begin
                                    repeat
                                        ;
                                        ObjInterBTLine.Reset;
                                        ObjInterBTLine.SetRange(ObjInterBTLine."Document Type", ObjInterBTLine."document type"::"InterBank Requisition Voucher");
                                        if ObjInterBTLine.FindLast then
                                            LineNo := ObjInterBTLine."Line No" + 1000;
                                        TransferTo.Init;
                                        TransferTo."Line No" := LineNo;
                                        TransferTo."Document Type" := TransferFrom."From Document Type";
                                        TransferTo."Document No" := TransferFrom."From Doc Number";
                                        TransferTo.Amount := TransFromLines.Amount;
                                        TransferTo."Bank Account No" := TransFromLines."Bank Account No";
                                        TransferTo."Bank Account Name" := TransFromLines."Bank Account Name";
                                        TransferTo.Description := TransFromLines.Description;
                                        TransferTo."Dimension Set ID" := TransFromLines."Dimension Set ID";
                                        TransferTo."Amount(LCY)" := TransFromLines."Amount(LCY)";
                                        TransferTo."Activity Description" := TransFromLines."Activity Description";
                                        TransferTo."Shortcut Dimension 3 Code" := TransFromLines."Shortcut Dimension 3 Code";
                                        TransferTo."Shortcut Dimension 1 Code" := TransFromLines."Shortcut Dimension 1 Code";
                                        TransferTo."Shortcut Dimension 2 Code" := TransFromLines."Shortcut Dimension 2 Code";
                                        TransferTo."Responsibility Center" := TransFromLines."Responsibility Center";
                                        TransferTo."Receivable Account(Region)" := TransFromLines."Receivable Account(Region)";
                                        TransferTo."Payment Reference" := TransFromLines."Payment Reference";
                                        TransferTo."Department Code" := TransFromLines."Department Code";
                                        TransferTo.Insert(true);
                                    // END;
                                    until TransFromLines.Next = 0;
                                    TransferFrom.Suggested := true;
                                    TransferFrom.Modify;
                                    Message('Suggestions from %1 Inserted', TransferFrom."Document No");
                                end;
                            until TransferFrom.Next = 0;
                        end;
                        //CurrPage.CLOSE;
                    end;
                end;
            }
            action("AIE Report")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                // RunObject = Report "AIE Report";
            }
            action("Post AIE")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    TestField("Approval Status", "approval status"::Released);
                    "AIE Posted" := true;
                    Modify(true);
                    Message('AIE %1 has been posted successfully', "Document No");
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;

        if UserSetup.Get(UserId) then begin
            if not UserSetup."View AIE" then
                Error('You do not the permission to view AIEs');
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;

        if UserSetup.Get(UserId) then begin
            if not UserSetup."View AIE" then
                Error('You do not the permission to view AIEs');
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"AIE Funds Transfer";
    end;

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        end;

        if UserSetup.Get(UserId) then begin
            if not UserSetup."View AIE" then
                Error('You do not the permission to view AIEs');
        end;
    end;

    var
        UserSetup: Record "User Setup";
        TransferTo: Record "Inter Bank Transfer Line";
        TransferFrom: Record "Inter Bank Transfer";
        Text0001: label 'Are you sure you want to transfer the selected %1  lines to AIE?';
        Text0002: label 'No Record Selected';
        SelectedRecords: Integer;
        TransFromLines: Record "Inter Bank Transfer Line";
        ObjInterBTLine: Record "Inter Bank Transfer Line";
        LineNo: Integer;
}

