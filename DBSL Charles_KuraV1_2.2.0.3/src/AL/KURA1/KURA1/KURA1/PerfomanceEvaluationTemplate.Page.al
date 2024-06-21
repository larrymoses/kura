#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80046 "Perfomance Evaluation Template"
{
    PageType = Card;
    SourceTable = "Perfomance Evaluation Template";

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
                field("General Instructions";"General Instructions")
                {
                    ApplicationArea = Basic;
                }
                field("Global?";"Global?")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Responsibility Center";"Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Type";"Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Rating Model";"Performance Rating Model")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Rating Scale";"Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Proficiency Rating Scale";"Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Total Score Model";"Total Score Model")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Default Competency A_Template";"Default Competency A_Template")
                {
                    ApplicationArea = Basic;
                }
                field("General A_Questionnaire";"General A_Questionnaire")
                {
                    ApplicationArea = Basic;
                }
                field("Peer Reviewer FB_Questionnaire";"Peer Reviewer FB_Questionnaire")
                {
                    ApplicationArea = Basic;
                }
                field("Total Allocated Weight (%)";"Total Allocated Weight (%)")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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
            action("Performance Evaluation Weight")
            {
                ApplicationArea = Basic;
                Image = UnitConversions;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Performance Evaluation Weight";
                RunPageLink = "Per_Evaluation Template ID"=field(Code);
            }
        }
    }
}

