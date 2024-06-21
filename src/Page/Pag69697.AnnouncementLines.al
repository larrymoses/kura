#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69697 "Announcement Lines"
{
    PageType = ListPart;
    SourceTable = "Vacancy Announcement Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Sourcing Method"; Rec."Sourcing Method")
                {
                    ApplicationArea = Basic;
                    OptionCaption = ',Recruitment Agency,Direct Hire';
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Openings"; Rec."No. of Openings")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ApplicationArea = Basic;
                }
                field("Work Location Details"; Rec."Work Location Details")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Application Closing Date"; Rec."Application Closing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Closing  Time"; Rec."Application Closing  Time")
                {
                    ApplicationArea = Basic;
                }
                field("Line Budget Cost (LCY)"; Rec."Line Budget Cost (LCY)")
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
            group("Related Information")
            {
                action("Position Requirements")
                {
                    ApplicationArea = Basic;
                    Image = Register;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Requirements";
                    RunPageLink = "Document No." = field("Vacancy ID");
                }
                action("Vacancy Substitutes")
                {
                    ApplicationArea = Basic;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Substitutes";
                    RunPageLink = "Document No." = field("Vacancy ID");
                }
                action("Position Responsibilities")
                {
                    ApplicationArea = Basic;
                    Image = ReceiveLoaner;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Responsibilities";
                    RunPageLink = "Document No." = field("Vacancy ID");
                }
                action("Position Work Condition")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenter;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Work Condition";
                    RunPageLink = "Document No" = field("Vacancy ID");
                }
            }
        }
    }
}

#pragma implicitwith restore

