#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75387 "IFS Appeal Card"
{
    PageType = Document;
    SourceTable = "IFS Appeal Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Notice of Award No.";"Notice of Award No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code";"IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No";"Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bidder Name";"Awarded Bidder Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bid Response No";"Bid Response No")
                {
                    ApplicationArea = Basic;
                }
                field("Award Tender Sum Inc Taxes";"Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                }
                field("Appeal Date";"Appeal Date")
                {
                    ApplicationArea = Basic;
                }
                field(Decision;Decision)
                {
                    ApplicationArea = Basic;
                }
                field("Reason for Appeal";"Reason for Appeal")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Date of Approval";"Date of Approval")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Bidders";"No. of Bidders")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("ITC Issuance Date";"ITC Issuance Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Verdict";"Date of Verdict")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control18;"IFS Appeal Lines")
            {
                SubPageLink = "Document No"=field(No);
            }
        }
        area(factboxes)
        {
            systempart(Control14;Outlook)
            {
            }
            systempart(Control15;Notes)
            {
            }
            systempart(Control16;MyNotes)
            {
            }
            systempart(Control17;Links)
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
                Image = Post;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    TestField(Decision);
                    Procurement.FnPostAppeal(Rec);

                    Message('Posted Successfully');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type:=Type::IFS;
    end;

    var
        IFSAppealEntry: Record "IFS Appeal Entry";
        Procurement: Codeunit "Procurement Processing";
}

