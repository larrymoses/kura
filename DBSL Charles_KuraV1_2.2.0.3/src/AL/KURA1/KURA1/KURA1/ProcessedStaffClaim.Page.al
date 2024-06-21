#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57132 "Processed Staff Claim"
{
    Editable = false;
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type"=const("Staff Claim"),
                            "Payment processed"=const(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Project;Project)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job No.';
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = true;
                }
                field("Project Description";"Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                }
                field("Job Task Name";"Job Task Name")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                }
                field("Account Type";"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name";"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Payee;Payee)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Payment Narration";"Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Department Name";"Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code";"Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Unit  Name";"Unit  Name")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount";"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting Date";"Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By";"Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Date";"Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000021;"Staff Claim Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No=field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019;Notes)
            {
            }
            systempart(Control1000000020;Links)
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
                    RunPageLink = "Table Name"=const(56000),
                                  "No."=field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        ShowDocDim;
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

                        ApprovalEntries.Setfilters(Database::payments,7,"No.");
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
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                       //   ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;

                    trigger OnAction()
                    begin
                      //  ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    end;
                }
                separator(Action1000000043)
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


                        SetRange("No.","No.");
                        Report.Run(57011,true,true,Rec)
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
                    Visible = false;

                    trigger OnAction()
                    var
                   //     ReleasePurchDoc: Codeunit "Release Purchase Document";
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
                     //   ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                          //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000036)
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
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                       // PaymentsPost.PostStaffClaims(Rec);
                    end;
                }
                action("Process Payments")
                {
                    ApplicationArea = Basic;
                    Image = Payment;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        //add pv from claims
                        //added on 27/04/2017
                        usersetup.Get(UserId);
                        usersetup.TestField(usersetup."Process Claims",usersetup."Process Claims"=true);
                        if Confirm(Text004,false,"No.") then begin
                        if "Payment processed"=false then
                        begin
                            Claimheaders.Reset;
                            Claimheaders.SetRange(Claimheaders."No.","No.");
                            if Claimheaders.Find('-') then
                            begin

                              //get the no. series
                              CashMgt.Reset;
                              if CashMgt.Find('-') then
                              begin
                                  Noseries := CashMgt."PV Nos";
                              end;

                              pvheaders.Init;
                              pvheaders."No.":=NoSeriesMgt.GetNextNo(Noseries,pvheaders.Date,true);
                              pvheaders.Project:=Project;
                              pvheaders."Project Description":="Project Description";
                              pvheaders.Date:=Today;
                              pvheaders."Created By":=UserId;
                              pvheaders.Payee:=Payee;
                              pvheaders."On behalf of":=Claimheaders."Account Name";
                              pvheaders."Payment Narration":="Payment Narration";
                              pvheaders."Shortcut Dimension 1 Code":="Shortcut Dimension 1 Code";
                              pvheaders."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
                              pvheaders."Shortcut Dimension 3 Code":="Shortcut Dimension 3 Code";
                              pvheaders."Created By" := UserId;
                              pvheaders.Insert;
                              Claimlines.Reset;
                              Claimlines.SetRange(Claimlines.No,Claimheaders."No.");
                              if Claimlines.Find('-') then
                              begin
                                repeat
                                  pvlines.Init;
                                  pvlines.No := pvheaders."No.";
                                  pvlines."Line No" := Claimlines."Line No";
                                  pvlines.Type:='CUSTOMER A';
                                  pvlines."Account Type":=Claimheaders."Account Type";
                                  pvlines."Account No":=Claimheaders."Account No.";
                                  pvlines."Account Name":=Claimheaders."Account Name";
                                  pvlines."Applies to Doc. No":=Claimheaders."No.";
                                  pvlines.Amount:=Claimlines.Amount;
                                  pvlines."Net Amount":=Claimlines.Amount;
                                        pvlines.Insert;
                                until Claimlines.Next=0;
                              end;
                              pvheaders."Payment processed":=true;
                              Claimheaders."Payment processed":=true;
                              Claimheaders.Modify;
                              end;
                             Message('Payment voucher for the staff calim No. %1 has been processed, Kindly send it for approval',"No.");
                        end else
                        Error('The payment for claim No. %1 has already been processed.',Claimheaders."No.");
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Payment Type":="payment type"::"Staff Claim";
        "Account Type":="account type"::Customer;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
       // PaymentsPost: Codeunit "Payments-Post";
        pvlines: Record "PV Lines";
        pvheaders: Record payments;
        Claimlines: Record "PV Lines";
        Claimheaders: Record payments;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CashMgt: Record "Cash Management Setup";
        Noseries: Code[20];
        Text004: label 'Are you sure you want to process a payment voucher for staff claim No. %1?';
        usersetup: Record "User Setup";

    local procedure SetControlAppearance()
    var
    //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
    //    OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

