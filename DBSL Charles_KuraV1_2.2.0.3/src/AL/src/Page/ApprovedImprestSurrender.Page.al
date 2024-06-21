#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57029 "Approved Imprest Surrender"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = filter(Surrender),
                            Status = filter(Released),
                            Posted = const(false),
                            Surrendered = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
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
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Name';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Section Name';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Location Name';
                    Visible = false;
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Amount Spent"; Rec."Actual Amount Spent")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Cash Receipt Amount"; Rec."Cash Receipt Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Job; Rec.JobNo)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            part(Control1000000017; "Imprest Surrender Lines")
            {
                Editable = true;
                SubPageLink = No = field("No.");
            }
        }
        area(factboxes)
        {
            part("Attached Documents1"; "Document Attachment Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachment';
                SubPageLink = "Table ID" = CONST(57000), "No." = FIELD("No.");//, "Document Type" = CONST(0);
                                                                              // SystemCreatedBy = field(SystemCreatedBy);

            }
            systempart(Control1000000015; Notes)
            {
            }
            systempart(o; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
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

                        ApprovalEntries.Setfilters(Database::payments, 7, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                separator(Action1000000037)
                {
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57005, true, true, Rec)
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
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
                        //ReleasePurchDoc.PerformManualRelease(Rec);
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
                        Rec.TestField("Reasons to Reopen");
                        ReOpenPayment.PerformManualReopen(Rec);
                    end;
                }
                separator(Action1000000031)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        rec."Posting Date" := Today;
                        Rec.TestField(Posted, false);
                        GLEntry.Reset;
                        GLEntry.SetRange(GLEntry."Document No.", Rec."No.");
                        GLEntry.SetRange(GLEntry.Reversed, false);
                        if GLEntry.FindSet then
                            Error(TXT0001, Rec."No.");

                        usersetup.Get(UserId);
                        if usersetup."post surrender" = false then
                            Error('You do not have sufficient rights to Post An Imprest Surrender! Please! contact System Administrator for Assistance.');
                        PaymentPost."Post ImprestSurrender"(Rec);
                        Committment.ImprestUnCommittment(Rec);



                        //Create Staff Claim Incase Excess Spend
                        Rec.CalcFields("Remaining Amount");
                        if Rec."Remaining Amount" < 0 then begin
                            if Confirm('Are you sure you want to create a staff claim for the excess amount?', false) = true then begin
                                CashMgt.Get;
                                //Insert Staff Claim Header
                                ObjPayments.Init;
                                ObjPayments.TransferFields(Rec);
                                ObjPayments."No." := NoSeriesManagement.GetNextNo(CashMgt."Staff Claim Nos.", Today, true);
                                ObjPayments."Document Type" := ObjPayments."document type"::"Staff Claims";
                                ObjPayments.Posted := false;
                                ObjPayments."Payment Type" := ObjPayments."payment type"::"Staff Claim";
                                ObjPayments.Status := ObjPayments.Status::Released;
                                ObjPayments."Posted By" := '';
                                ObjPayments."Posted Date" := 0D;
                                ObjPayments.Insert(true);

                                //Insert Staff Claim Lines
                                ImprestLines.Reset;
                                ImprestLines.SetRange(ImprestLines.No, Rec."No.");
                                if ImprestLines.FindSet(true) then
                                    repeat
                                        ObjPVLines.Init;
                                        //ObjPVLines.TRANSFERFIELDS(ImprestLines);
                                        ObjPVLines.No := Rec."No.";
                                        ObjPVLines."Line No" := ObjPVLines.Count + 1;
                                        ObjPVLines.Amount := Abs(Rec."Remaining Amount");
                                        ObjPVLines.Validate(Amount);
                                        Message(Format(ObjPVLines.Amount));
                                        ObjPVLines."Type of Expense" := PVLines.Type;
                                        ObjPVLines.Description := PVLines."Transaction Name";
                                        ObjPVLines.Insert(true);
                                    until ImprestLines.Next = 0;
                            end
                            else
                                exit;
                            Message('Staff Claim %1 of amount %2 successfully created', ObjPayments."No.", Abs(Rec."Remaining Amount"));
                        end;
                        CurrPage.Close();
                    end;
                }
            }
            action("Archive Document")
            {
                ApplicationArea = Basic;
                Image = Archive;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    usersetup.Reset;
                    usersetup.SetRange("User ID", UserId);
                    usersetup.SetRange("Archive Document", true);
                    if usersetup.Find('-') then begin
                        Rec.SetRange("No.", Rec."No.");
                        Rec."Archive Document" := true;
                        Rec.Modify;
                    end else
                        Error('You don''t have rights to archive finance documents,Contact System administrator');
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::Surrender;
        Rec."Account Type" := Rec."account type"::Customer;
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Created By" := UserId;
    end;

    trigger OnOpenPage()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
    end;

    var
        PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        ShowAttach: Boolean;
        Committment: Codeunit "Procurement Processing";
        OpenApprovalEntriesExist: Boolean;
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        usersetup: Record "User Setup";
        ReOpenPayment: Codeunit Payments;
        CashMgt: Record "Cash Management Setup";
        ObjPayments: Record payments;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PVLines: Record "PV Lines";
        LineNo: Integer;
        ObjPVLines: Record "PV Lines";
        ImprestLines: Record "Imprest Lines";
        GLEntry: Record "G/L Entry";
        TXT0001: label 'The document %1 has already been posted.\\ Please contact finance department.';
}

#pragma implicitwith restore

