#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69400 "OSH Framework"
{
    PageType = Card;
    SourceTable = 69400;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Organization Name"; "Organization Name")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Purpose"; "Primary Purpose")
                {
                    ApplicationArea = Basic;
                }
                field("OSH Policy No."; "OSH Policy No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group("OSH Statistics")
            {
                Caption = 'OSH Statistics';
                field("No. of OSH Mgt. Plans"; "No. of OSH Mgt. Plans")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Safe Work Permit Apps"; "No. of Safe Work Permit Apps")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Safe Work Compl Reports"; "No. of Safe Work Compl Reports")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Emergency Drill Reports"; "No. of Emergency Drill Reports")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Risk Incident Logs"; "No. of Risk Incident Logs")
                {
                    ApplicationArea = Basic;
                }
                field("No. of OSH Trainings"; "No. of OSH Trainings")
                {
                    ApplicationArea = Basic;
                }
                field("No. of OSH Meetings"; "No. of OSH Meetings")
                {
                    ApplicationArea = Basic;
                }
                field("No. of OSH Inspection Reports"; "No. of OSH Inspection Reports")
                {
                    ApplicationArea = Basic;
                }
                field("No. of OSH Imp. Status Reports"; "No. of OSH Imp. Status Reports")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Number Series")
            {
                Caption = 'Number Series';
                field("OSH Management Plan Nos."; "OSH Management Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Safe Work Permit Apps Nos."; "Safe Work Permit Apps Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Safe Work Compln Report Nos."; "Safe Work Compln Report Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Emergency Drill Report Nos."; "Emergency Drill Report Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Incident Report Nos."; "Risk Incident Report Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("OSH Training Nos."; "OSH Training Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("OSH Meeting Nos."; "OSH Meeting Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("OSH Inspection Report Nos."; "OSH Inspection Report Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("OSH Impl. Status Report Nos."; "OSH Impl. Status Report Nos.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Hazard Types")
            {
                ApplicationArea = Basic;
                Image = Bank;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Hazard Types";
            }
            action("Hazard Identification Methods")
            {
                ApplicationArea = Basic;
                Image = LiFo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Hazard Identification Methods";
            }
            action("Evacuation Events")
            {
                ApplicationArea = Basic;
                Image = "Event";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Evacuation Events";
            }
            action("Workplace Prohibited Items")
            {
                ApplicationArea = Basic;
                Image = Alerts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Workplace Prohibited Items";
            }
            action("Safety Equipment Categories")
            {
                ApplicationArea = Basic;
                Image = Category;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                // RunObject = Page "HSE Equipment Categorxies";
            }
            action("Safe Work Permit Types")
            {
                ApplicationArea = Basic;
                Image = Category;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Safe Work Permit Types";
            }
            action("Safety Workgroups")
            {
                ApplicationArea = Basic;
                Image = Group;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = false;
                // RunObject = Page "Safety Workgroups";
            }
            action("Rules & Regulations Templates")
            {
                ApplicationArea = Basic;
                Image = Template;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "OSH Rule Template Categories";
            }
            action("Safety Inspection Templates")
            {
                ApplicationArea = Basic;
                Image = Template;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Inspection Templates";
            }
            action("OSH Roles & Responsibilities")
            {
                ApplicationArea = Basic;
                Image = Route;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "HSE Role Members";
            }
            action("OSH Legal Instruments")
            {
                ApplicationArea = Basic;
                Caption = 'OSH Legal Instruments & Standards';
                Image = BarCode;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "OSH Legal Instruments";
            }
            action("Incident Severity Levels")
            {
                ApplicationArea = Basic;
                Image = Language;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Incident Severity Levels";
            }
            action("Incident Party Types")
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Incident Party Types";
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Primary Key", "Primary Key");
                    Report.Run(69400, true, true, Rec);
                end;
            }
        }
    }
}
