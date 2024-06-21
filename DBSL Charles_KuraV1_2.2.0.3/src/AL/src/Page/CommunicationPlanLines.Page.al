#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95007 "Communication Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Communication Plan Line";
    SourceTableView = where(Category = filter(Meeting));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
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
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;
                }
                field("Default Meeting Medium"; Rec."Default Meeting Medium")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Owner"; Rec."Primary Owner")
                {
                    ApplicationArea = Basic;
                    Caption = 'Convener';
                }
                field("First Meeting Date"; Rec."First Meeting Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Target Stakeholders"; Rec."No. of Target Stakeholders")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Planned Meetings"; Rec."No. of Planned Meetings")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Meetings Held"; Rec."No. of Meetings Held")
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
                Caption = '&Meeting Details';
                Image = RollUpCosts;
                action("Comm Plan Meeting Schedules")
                {
                    ApplicationArea = Basic;
                    Caption = 'Detailed Meeting Schedule';
                    Image = RollUpCosts;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Comm Plan Meeting Schedules";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  Category = field(Category);
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
                action("Project Meeting Template")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Meeting Template';
                    Image = MakeOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Project Meeting Types";
                    RunPageLink = Code = field("Communication Type");
                    RunPageMode = View;
                }
            }
        }
    }
}

#pragma implicitwith restore

