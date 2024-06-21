#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75385 "IFS Cancellation Card"
{
    PageType = Card;
    SourceTable = "Standard Purchase Code";

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
                field("Tender Name";"Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Cancel Reason Code";"Cancel Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Cancellation Secret Code";"Cancellation Secret Code")
                {
                    ApplicationArea = Basic;
                }
                field("Cancelled By";"Cancelled By")
                {
                    ApplicationArea = Basic;
                }
                field("Cancellation Date";"Cancellation Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6;Outlook)
            {
            }
            systempart(Control7;Notes)
            {
            }
            systempart(Control8;MyNotes)
            {
            }
            systempart(Control9;Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Cancel Tender")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Cancelled Successfully');
                end;
            }
        }
    }
}

