page 99994 "CRM Setups"
{
    PageType = Card;
    SourceTable = "CRM Setups";
    ApplicationArea=All;
    UsageCategory = Documents;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Company's Stakeholders No."; Rec."Company's Stakeholders No.")
                {
                    ApplicationArea = BasicHr;
                }
                field("Security Incidence No."; Rec."Security Incidence No.")
                {
                    ApplicationArea = BasicHr;
                }
                field("Staff Checkin No."; Rec."Staff Checkin No.")
                {
                    ApplicationArea = BasicHr;
                }
                field("Vehicles Checkin No."; Rec."Vehicles Checkin No.")
                {
                    ApplicationArea = BasicHr;
                }
                field("Gaurd Attendance Reg No."; Rec."Gaurd Attendance Reg No.")
                {
                    ApplicationArea = BasicHr;
                }
                field("External Security No."; Rec."External Security No.")
                {
                    ApplicationArea = BasicHr;
                }
                field("Service Charter No."; Rec."Service Charter No.")
                {
                    ApplicationArea = BasicHr;
                }
            }
            group("Corporate Function Reminders")
            {
                Caption = 'Corporate Function Reminders';
                field("Reminder 1 Period"; Rec."Reminder 1 Period")
                {
                    ApplicationArea = BasicHr;
                }
                field("Reminder 2 Period"; Rec."Reminder 2 Period")
                {
                    ApplicationArea = BasicHr;
                }
                field("Reminder 3 Period"; Rec."Reminder 3 Period")
                {
                    ApplicationArea = BasicHr;
                }
            }
        }
    }

    actions
    {
    }
}



