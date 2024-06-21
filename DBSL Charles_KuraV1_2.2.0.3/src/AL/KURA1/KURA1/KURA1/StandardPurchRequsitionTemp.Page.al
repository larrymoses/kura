#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75234 "Standard Purch Requsition Temp"
{
    PageType = Card;
    SourceTable = "Purchase Requisition Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
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
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Effective Start Date";"Effective Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";"Currency Code")
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
            }
            part(Control22;"BoQ Template Line1")
            {
                Caption = 'Requisition Lines';
                SubPageLink = "BoQ Template ID"=field(Code);
            }
        }
        area(factboxes)
        {
            systempart(Control17;Outlook)
            {
            }
            systempart(Control18;Notes)
            {
            }
            systempart(Control19;MyNotes)
            {
            }
            systempart(Control20;Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup10)
            {
                action("Purchase requisitions")
                {
                    ApplicationArea = Basic;
                    Image = ReviewWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Open Purchase Requisitions";
                    RunPageLink = "Document Type"=const("Purchase Requisition"),
                                  "Requisition Template ID"=field(Code);
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Template Type":="template type"::Standard;
    end;
}

