#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75323 "Security Return Voucher Card"
{
    SourceTable = "Bid Security Closure Voucher";

    layout
    {
        area(content)
        {
            group(Control1)
            {
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("IFS Code"; "IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; "Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Closed Securities Total Value"; "Closed Securities Total Value")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
            }
            part(Control17; "Bid Security Return Line")
            {
                SubPageLink = "Document No" = field("Document No"),
                              "Document Type" = field("Document Type");
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
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Process;
                Visible = mtr;

                trigger OnAction()
                begin
                    ReturnLine.Reset;
                    ReturnLine.SetRange("Document No", "Document No");
                    if ReturnLine.FindSet then begin
                        repeat
                            Bid_ContractSec.Reset;
                            Bid_ContractSec.SetRange("No.", ReturnLine."Bid Security ID");
                            if Bid_ContractSec.FindSet then
                                Bid_ContractSec."Security Closure Date" := ReturnLine."Date Closed";
                            Bid_ContractSec."Security Closure Type" := ReturnLine."Document Type";
                            Bid_ContractSec."Security Closure Voucher No." := ReturnLine."Document No";
                            Bid_ContractSec."Reason Code" := ReturnLine."Return Reason Code";
                            Bid_ContractSec.Modify(true);
                        until ReturnLine.Next = 0;
                    end;
                    Posted := true;
                    "Posted By" := UserId;
                    "Posted Date" := Today;
                    Modify(true);
                    Message('Submitted Successfully');
                end;
            }
            group(ActionGroup23)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Enabled = Status = Status::open;
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //      ReleasePurchDoc.ReleaseTSRV(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Status <> Status::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //    ReleasePurchDoc.ReopenTSRV(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        mtr := false;
        if Status = Status::Released then
            mtr := true;
    end;

    trigger OnOpenPage()
    begin
        mtr := false;
        if Status = Status::Released then
            mtr := true;
    end;

    var
        Bid_ContractSec: Record "Bid_Contract Security Register";
        ReturnLine: Record "Bid Security Return Line";
        mtr: Boolean;
}

