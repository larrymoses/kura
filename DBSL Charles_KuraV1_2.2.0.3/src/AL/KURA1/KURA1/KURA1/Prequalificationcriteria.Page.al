#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75348 "Prequalification criteria"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Bid Score Requirement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Criteria Group ID";"Criteria Group ID")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Requirement";"Evaluation Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Type";"Rating Type")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Weight %";"Assigned Weight %")
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
            group(Line)
            {
                Caption = 'Line';
                action("Score Guide")
                {
                    ApplicationArea = Basic;
                    Image = CreditMemo;

                    trigger OnAction()
                    var
                        BidscoreGuide: Record "Bid Score Guide";
                        BidscoreGuides: Page "Bid Score Guide";
                    begin
                        TestField("Template ID");

                        BidscoreGuide.FilterGroup(2);
                        BidscoreGuide.SetRange("Template ID","Template ID");
                        BidscoreGuide.SetRange("Criteria Group ID","Criteria Group ID");
                        BidscoreGuide.SetRange("Requirement ID","Requirement ID");
                        BidscoreGuide.FilterGroup(0);
                        BidscoreGuides.SetTableview(BidscoreGuide);
                        BidscoreGuides.Editable :=true;
                        BidscoreGuides.Run;
                    end;
                }
            }
        }
    }
}

