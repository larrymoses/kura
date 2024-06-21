#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69447 "HSE Plans"
{
    // CardPageID = "HSE Plan";
    Editable = false;
    PageType = List;
    SourceTable = "HSE Plan";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Plan Type"; Rec."Plan Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Safety Rules&Regulations Temp"; Rec."Safety Rules&Regulations Temp")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Mission"; Rec."Primary Mission")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Safety Manager"; Rec."Overall Safety Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
                field("No. of OSH Management Plans"; Rec."No. of OSH Management Plans")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Safe Work Permit App"; Rec."No. of Safe Work Permit App")
                {
                    ApplicationArea = Basic;
                }
                field("No.of Safe Work Completion rep"; Rec."No.of Safe Work Completion rep")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Emergency Drill Reports"; Rec."No. of Emergency Drill Reports")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Risk Incident Logs"; Rec."No. of Risk Incident Logs")
                {
                    ApplicationArea = Basic;
                }
                field("No. of OSH Trainings"; Rec."No. of OSH Trainings")
                {
                    ApplicationArea = Basic;
                }
                field("No. of OSH Meetings"; Rec."No. of OSH Meetings")
                {
                    ApplicationArea = Basic;
                }
                field("No. of OSH Inspection Reports"; Rec."No. of OSH Inspection Reports")
                {
                    ApplicationArea = Basic;
                }
                field("No. of OSH Imp Status Reports"; Rec."No. of OSH Imp Status Reports")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Risk Incidents"; Rec."No. of Risk Incidents")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Financial Impact (LCY)"; Rec."Actual Financial Impact (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Delay/Disruption (Days)"; Rec."Actual Delay/Disruption (Days)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual No. Injured Persons"; Rec."Actual No. Injured Persons")
                {
                    ApplicationArea = Basic;
                }
                field("Actual No. of Fatalities"; Rec."Actual No. of Fatalities")
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
