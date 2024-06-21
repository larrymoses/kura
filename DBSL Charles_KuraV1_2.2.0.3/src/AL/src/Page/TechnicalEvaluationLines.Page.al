#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 75464 "Technical Evaluation Lines"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Bid Evaluation Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bid No."; Rec."Bid No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Technical Evaluation  Decision"; Rec."Technical Evaluation  Decision")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Evaluation Entries")
            {
                ApplicationArea = Basic;
                Image = JobRegisters;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                //The property 'PromotedOnly' can only be set if the property 'Promoted' is set to 'true'
                //PromotedOnly = true;
                RunObject = Page "Bid Evaluation Scores";
                RunPageLink = Code = field(Code);
            }
        }
    }
}
