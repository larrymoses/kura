#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69082 "HR Admin Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Job Cue";

    layout
    {
        area(content)
        {
            cuegroup("Active Employees By Category")
            {
                Caption = 'Active Employees By Category';
                field("Active Employees";"Active Employees")
                {
                    ApplicationArea = Basic;
                }
                field("Inactive Employees";"Inactive Employees")
                {
                    ApplicationArea = Basic;
                }
                field("Terminated Employees";"Terminated Employees")
                {
                    ApplicationArea = Basic;
                }

                actions
                {
                    action("New Employee")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Employee';
                        RunObject = Page "Education Backgrounds";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("Employee Leave Applications")
            {
                Caption = 'Employee Leave Applications';
                field("Posted Approved Leave";"Posted Approved Leave")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Documents E-mailed Log1";
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Reset;
        if not Get then begin
          Init;
          Insert;
        end;

        SetFilter("Date Filter",'>=%1',WorkDate);
    end;
}

