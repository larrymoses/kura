#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70054 "Contract Milestones"
{
    PageType = List;
    SourceTable = "Contract Milestones";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Milestone No";"Milestone No")
                {
                    ApplicationArea = Basic;
                }
                field("Milestone Description";"Milestone Description")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Date of Approval";"Date of Approval")
                {
                    ApplicationArea = Basic;
                }
                field("Approved By";"Approved By")
                {
                    ApplicationArea = Basic;
                }
                field("LPO Generated";"LPO Generated")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
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
                    ContMngtHeader.Reset;
                    ContMngtHeader.SetRange(Code,"Contract Header");
                    ContMngtHeader.SetRange("Requires Milestone",true);
                    if ContMngtHeader.Find('-') then begin

                        TenderRec.Reset;
                        TenderRec.SetRange(No,ContMngtHeader."Tender No");
                        if TenderRec.Find('-') then begin

                        if PurchReq.Get(TenderRec."Requisition No")  then
                        if PurchReq.Status = PurchReq.Status::Released then begin

                          if Confirm('Are u sure u want to generate Orders for the selected Vendor(s)',true) then begin
                          //IF USERID = PurchReq."Assigned User ID" THEN
                           PurchReq.CreatePurchaseOrder(PurchReq)
                          //ELSE ERROR( 'User %1 has not been assigned permission to generate Purchase Order for this requisition',USERID);
                          end else exit;

                        end else Error(Text000);

                        end else Error('There is no tender document attached to this contract');

                    end;
                end;
            }
        }
    }

    var
        PurchReq: Record "Requisition Header1";
        TenderRec: Record "Procurement Request";
        Text000: label 'The Status has to be Released';
        Text001: label 'A Purchase Order has already been created for this Requisition';
        ContMngtHeader: Record "Contract Management Header";
}

