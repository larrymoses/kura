#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56041 "Court Attendance Return Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Document registration";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Registration Entry No";"Registration Entry No")
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
                field("Prosecutor No.";"Prosecutor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Court Attendance Date";"Court Attendance Date")
                {
                    ApplicationArea = Basic;
                }
                field("Start time";"Start time")
                {
                    ApplicationArea = Basic;
                }
                field("End Time";"End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Exhibit produced in court";"Exhibit produced in court")
                {
                    ApplicationArea = Basic;
                }
                field("Outcome of Proceedings";"Outcome of Proceedings")
                {
                    ApplicationArea = Basic;
                }
                field("Next Court Date";"Court Date")
                {
                    ApplicationArea = Basic;
                }
                field("Next Cause of Action";"Next Cause of Action")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Counsel";"Accused Counsel")
                {
                    ApplicationArea = Basic;
                }
                field("Intrested Party Counsel";"Intrested Party Counsel")
                {
                    ApplicationArea = Basic;
                }
                field("Nature Of Application";"Nature Of Application")
                {
                    ApplicationArea = Basic;
                }
                field("Case ID";"Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Case Title";"Case Title")
                {
                    ApplicationArea = Basic;
                }
                field("Court Rank";"Court Rank")
                {
                    ApplicationArea = Basic;
                }
                field("Court Station";"Court Station")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Name";"Accused Name")
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
            systempart(Control21;Links)
            {
            }
            systempart(Control22;Notes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        RegistrationType:=Registrationtype::Return
    end;
}

