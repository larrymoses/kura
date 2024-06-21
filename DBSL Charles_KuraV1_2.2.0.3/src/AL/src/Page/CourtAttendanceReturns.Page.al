#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56040 "Court Attendance Returns"
{
    ApplicationArea = Basic;
    CardPageID = "Court Attendance Return Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Document registration";
    SourceTableView = where(RegistrationType=const(Return));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Registration Entry No";"Registration Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Case ID";"Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Next Court Date";"Court Date")
                {
                    ApplicationArea = Basic;
                }
                field("Prosecutor No.";"Prosecutor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Next Cause of Action";"Next Cause of Action")
                {
                    ApplicationArea = Basic;
                }
                field("Court Attendance Date";"Court Attendance Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Court Attendance Date';
                }
                field("Start time";"Start time")
                {
                    ApplicationArea = Basic;
                }
                field("End Time";"End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Before Type";"Before Type")
                {
                    ApplicationArea = Basic;
                }
                field("Before Name";"Before Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created";"Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created";"Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20;Outlook)
            {
            }
            systempart(Control21;Notes)
            {
            }
            systempart(Control22;Links)
            {
            }
        }
    }

    actions
    {
    }
}

