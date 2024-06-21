#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72463 "DWR Meeting Attendances"
{
    CardPageID = "DWR Meeting Attendance";
    PageType = List;
    SourceTable = "DWR Meeting Attendance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Attendee Type";"Attendee Type")
                {
                    ApplicationArea = Basic;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Name";"Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = Basic;
                }
                field("Representative Email";"Representative Email")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Tel No";"Representative Tel No")
                {
                    ApplicationArea = Basic;
                }
                field("Notified on Email";"Notified on Email")
                {
                    ApplicationArea = Basic;
                }
                field("Date/Time Notified";"Date/Time Notified")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No";"Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan ID";"Work Execution Plan ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        DailyWorkRecord.Reset;
        DailyWorkRecord.SetRange(DailyWorkRecord."Document No.","Document No.");
        if DailyWorkRecord.FindSet then begin
          "Project ID":=DailyWorkRecord."Project ID";
           "Contractor No":=DailyWorkRecord."Contractor No.";
           "Work Execution Plan ID":=DailyWorkRecord."Work Execution Programme ID";
           end;
    end;

    var
        DailyWorkRecord: Record "Daily Work Record";
}

