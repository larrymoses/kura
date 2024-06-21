#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72025 "Study Cost Benefit Analysis"
{
    PageType = List;
    SourceTable = "Study Cost Benefit Matrix";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Study ID";"Study ID")
                {
                    ApplicationArea = Basic;
                }
                field("Option ID";"Option ID")
                {
                    ApplicationArea = Basic;
                }
                field("Entry Type";"Entry Type")
                {
                    ApplicationArea = Basic;
                }
                field("Year code";"Year code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Amount/Value (LCY)";"Amount/Value (LCY)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Findings)
            {
                ApplicationArea = Basic;
                Caption = 'Findings';
                Image = Find;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Findings";
                RunPageLink = "Study ID"=field("Study ID");
            }
            action(Coclusions)
            {
                ApplicationArea = Basic;
                Caption = 'Coclusions';
                Image = Confirm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Conclusions";
                RunPageLink = "Study ID"=field("Study ID");
            }
            action(Recommendations)
            {
                ApplicationArea = Basic;
                Caption = 'Recommendations';
                Image = Register;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Recommendations";
                RunPageLink = "Study ID"=field("Study ID");
            }
            action(Sections)
            {
                ApplicationArea = Basic;
                Caption = 'Sections';
                Image = Segment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Sections";
                RunPageLink = "Study ID"=field("Study ID");
            }
        }
    }
}

