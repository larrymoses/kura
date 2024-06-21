#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80036 "Strategy General Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "SPM General Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbers)
            {
                field("Corp Strategic Plan Nos"; Rec."Corp Strategic Plan Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Work Plan Nos"; Rec."Work Plan Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Functional Nos"; Rec."Functional Nos")
                {
                    ApplicationArea = Basic;
                }
                FIELD("Functional AWP Nos"; Rec."Functional AWP Nos") { ApplicationArea = BASIC; }
                field("Organizational PC Nos"; Rec."Organizational PC Nos")
                {
                    ApplicationArea = Basic;
                }
                field("PM Plans Nos"; Rec."PM Plans Nos")
                {
                    ApplicationArea = Basic;
                }
                field("PET Nos"; Rec."PET Nos")
                {
                    ApplicationArea = Basic;
                }
                field("PWork Plans"; Rec."PWork Plans")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate PC No. Series"; Rec."Corporate PC No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Functional PC No. Series"; Rec."Functional PC No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Individual Scorecard Nos"; Rec."Individual Scorecard Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Monitoring Nos"; Rec."Monitoring Nos")
                {
                    ApplicationArea = Basic;
                }
                field("PC Target Revision Voucher Nos"; Rec."PC Target Revision Voucher Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Daily Performance Diary Nos"; Rec."Daily Performance Diary Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Consolidation Nos"; Rec."Budget Consolidation Nos") { ApplicationArea = basic; }
                field("Performance Evaluation Nos"; Rec."Performance Evaluation Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Appeals No. Series"; Rec."Performance Appeals No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Improv Review Nos"; Rec."Performance Improv Review Nos")
                {
                    ApplicationArea = Basic;
                }
                field("policy  Nos"; Rec."policy  Nos")
                {
                    ApplicationArea = Basic;
                }
                field("PLog Nos"; Rec."PLog Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Workplan Revision No"; Rec."Workplan Revision No")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Setup)
            {
                field("Enable Performance Appeals"; Rec."Enable Performance Appeals")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Review Duration"; Rec."Review Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Review Description"; Rec."Review Description")
                {
                    ApplicationArea = Basic;
                }
                field("Appraisal Based On"; Rec."Appraisal Based On")
                {
                    ApplicationArea = Basic;
                }
                field("Allow Loading of  CSP"; Rec."Allow Loading of  CSP")
                {
                    ApplicationArea = Basic;
                }
                field("Allow Loading of JD"; Rec."Allow Loading of JD")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

