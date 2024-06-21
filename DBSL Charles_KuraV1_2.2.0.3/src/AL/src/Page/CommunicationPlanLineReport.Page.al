#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95002 "Communication Plan Line Report"
{
    PageType = ListPart;
    SourceTable = "Communication Plan Line";
    SourceTableView = where(Category = filter("Status Report"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    Visible = false;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    Visible = false;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Communication Type"; Rec."Communication Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Submission Period"; Rec."Submission Period")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Submission Date"; Rec."Planned Submission Date")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Submission Date"; Rec."Actual Submission Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Target Stakeholders"; Rec."No. of Target Stakeholders")
                {
                    ApplicationArea = Basic;
                }
                field("Default Report Medium"; Rec."Default Report Medium")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Project Reports"; Rec."No. of Project Reports")
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
            group("Line Function")
            {
                Caption = '&Reporting Details';
                Image = RollUpCosts;
                action("Comm Plan Meeting Schedules")
                {
                    ApplicationArea = Basic;
                    Caption = 'Detailed Meeting Schedules';
                    Image = RollUpCosts;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Comm Plan Meeting Schedules";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  Category = field(Category);
                    Visible = false;
                }
                action("Comm Plan Line Stakeholders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Target Stakeholders';
                    Image = SpecialOrder;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Comm Plan Line Stakeholders";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  Category = field(Category);
                }
            }
        }
    }
}

#pragma implicitwith restore

