#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57195 "Inter Bank Req. Posted"
{
    ApplicationArea = Basic;
    CardPageID = "Inter Bank  Requisition";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Inter Bank Transfer";
    SourceTableView = where("Receipt Posted"=filter(true),
                            "Disbursement Posted"=filter(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Source Bank Account No";"Source Bank Account No")
                {
                    ApplicationArea = Basic;
                }
                field("Source Bank Account Name";"Source Bank Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Destination Bank Account No";"Destination Bank Account No")
                {
                    ApplicationArea = Basic;
                }
                field("Destination Bank Name";"Destination Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Direct Transfer";"Direct Transfer")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code";"Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Region Name";"Region Name")
                {
                    ApplicationArea = Basic;
                }
                field("Branch Code";"Branch Code")
                {
                    ApplicationArea = Basic;
                }
                field("Branch Name";"Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Code";"Constituency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Name";"Constituency Name")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Originating Trans. Voucher No";"Originating Trans. Voucher No")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Amount(LCY)";"Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Disbursement Posted";"Disbursement Posted")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt Posted";"Receipt Posted")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date";"Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date";"Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time";"Created Time")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
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
            action("Print AIE")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = PrintAcknowledgement;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Document No","Document No");
                    if FindSet then
                      Report.Run(59100,true,false,Rec);
                    Reset;
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"InterBank Requisition Voucher";
    end;
}

