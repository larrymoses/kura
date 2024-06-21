#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70031 "Procurement Request Lines"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Procurement Request Lines";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Procurement Plan"; "Procurement Plan")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Item"; "Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price"; "Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Budget Line"; "Budget Line")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Category"; "Supplier Category")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No"; "Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field(Select; Select)
                {
                    ApplicationArea = Basic;
                }
                field(Ordered; Ordered)
                {
                    ApplicationArea = Basic;
                }
                field(Activity; Activity)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Generate Purchase Order")
            {
                ApplicationArea = Basic;
                Caption = 'Generate Purchase Order';
                Image = CreateBinContent;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ProcReq.Reset;
                    ProcReq.SetRange(No, "Requisition No");
                    if ProcReq.Find('-') then begin

                        ProcReq.TestField("Requisition No");

                        if ProcReq."Generate Multiple LPO" then begin

                            if Confirm('Are you sure you want to generate Purchase Order for the selected Vendor No ' + "Vendor No" + '?', true) then begin



                                PurchReq.Reset;
                                PurchReq.SetRange("No.", ProcReq."Requisition No");
                                if PurchReq.FindSet then begin

                                    NoOfVendors := 0;
                                    ProcReqLines.Reset;
                                    ProcReqLines.SetRange("Document No.", ProcReq."Requisition No");
                                    //ProcReqLines.SETRANGE(Select,TRUE);
                                    if ProcReqLines.Find('-') then begin
                                        repeat
                                            NoOfVendors := NoOfVendors + 1
                                        until ProcReqLines.Next = 0;
                                    end;

                                    ProcReqLines.Reset;
                                    ProcReqLines.SetRange("Document No.", ProcReq."Requisition No");
                                    //ProcReqLines.SETRANGE(Select,TRUE);
                                    if ProcReqLines.Find('-') then begin
                                        repeat
                                            TestField("Vendor No");
                                            TestField("Supplier Category");

                                        // PurchReq.CreatePurchaseOrderProcMethodLines(ProcReqLines,"Requisition No");

                                        until ProcReqLines.Next = 0;
                                    end;
                                end;
                                //END  ELSE ERROR( 'User %1 has not been assigned permission to generate Purchase Order for this requisition',USERID);
                            end else
                                exit;



                        end else
                            Error('This function is only used when Generate LPO is Checked!');
                    end;
                end;
            }
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category8;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                // trigger OnAction()
                // var
                //     DocumentAttachmentDetails: Page "Document Attachment Details";
                //     RecRef: RecordRef;
                // begin
                //     RecRef.GetTable(Rec);
                //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                //     DocumentAttachmentDetails.RunModal;
                // end;
            }
        }
    }

    var
        ProcReq: Record "Procurement Request";
        PurchReq: Record "Purchase Header";
        ProcReqLines: Record "Purchase Line";
        //filecu: Codeunit "File Management";
        filename: Text;
        PURCHSETUP: Record "Purchases & Payables Setup";
        Lineno: Integer;
        RequsitionManager: Codeunit "Requisition Management";
        UserSetup: Record "User Setup";
        Text004: label 'Do you want to proceed and perform the selected action on the purchase requisition lines?';
        NoOfVendors: Decimal;
}

