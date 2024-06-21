#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75024 "Procurement Template Card"
{
    PageType = Card;
    SourceTable = "Procurement Document Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type";"Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control11;"Procurement Doc Template Line")
            {
                SubPageLink = "Template ID"=field("Template ID");
            }
        }
        area(factboxes)
        {
            systempart(Control7;Outlook)
            {
            }
            systempart(Control8;Notes)
            {
            }
            systempart(Control9;MyNotes)
            {
            }
            systempart(Control10;Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup21)
            {
                action(Registration)
                {
                    ApplicationArea = Basic;
                    Image = RegisteredDocs;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Procurement Process"=filter(Registration);
                }
                action(Prequalification)
                {
                    ApplicationArea = Basic;
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Procurement Process"=filter(Prequalification);
                }
                action("EOI-Response")
                {
                    ApplicationArea = Basic;
                    Image = Return;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Procurement Process"=filter("EOI Response");
                }
                action("RFQ-Response")
                {
                    ApplicationArea = Basic;
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Procurement Process"=filter("RFQ Response");
                }
                action("ITT Response")
                {
                    ApplicationArea = Basic;
                    Image = BlanketOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Procurement Process"=filter("ITT Response");
                }
                action("Contract Issuance")
                {
                    ApplicationArea = Basic;
                    Image = ContractPayment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Procurement Process"=filter("Contract Issuance");
                }
                action("Contract Documents")
                {
                    ApplicationArea = Basic;
                    Image = ContractPayment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Procurement Process"=filter(Contract);
                }
                action("Purchase Requisition Notes")
                {
                    ApplicationArea = Basic;
                    Image = ContractPayment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Procurement Process"=filter("Purchase Requisition Notes");
                }
                action(Transactional)
                {
                    ApplicationArea = Basic;
                    Image = TransferFunds;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Procurement Process"=filter(Transactional);
                }
            }
        }
    }
}

