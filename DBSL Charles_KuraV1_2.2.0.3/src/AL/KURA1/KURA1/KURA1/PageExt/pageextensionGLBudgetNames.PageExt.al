

PageExtension 50033 "pageextension50033" extends "G/L Budget Names"
{



    layout
    {
        addafter(Description)
        {
            field("Start Date"; Rec."Start Date")
            {
                ApplicationArea = Basic;
            }
            field("End Date"; Rec."End Date")
            {
                ApplicationArea = Basic;
            }
            field("Budget Type"; Rec."Budget Type")
            {
                ApplicationArea = Basic;
            }
            field("Original Budget"; Rec."Original Budget")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addafter(ReportTrialBalance)
        {
            action("Supplementary/Original")
            {
                ApplicationArea = Suite;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.SetRange(Name, Rec.Name);
                    Report.Run(57008, true, false, Rec);
                end;
            }
        }
    }
}



