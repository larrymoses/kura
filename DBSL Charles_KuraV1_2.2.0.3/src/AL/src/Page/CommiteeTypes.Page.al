#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69654 "Commitee Types"
{
    ApplicationArea = Basic;
    CardPageID = "Commitee Type";
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Committee Type";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("Functional Classification";"Functional Classification")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Title of Appointing Officer";"Title of Appointing Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Non-Staff Allowed";"Non-Staff Allowed")
                {
                    ApplicationArea = Basic;
                }
                field("Minimim No. of Members";"Minimim No. of Members")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Appointments Made";"No. of Appointments Made")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12;Outlook)
            {
            }
            systempart(Control13;Notes)
            {
            }
            systempart(Control14;MyNotes)
            {
            }
            systempart(Control15;Links)
            {
            }
        }
    }

    actions
    {
    }
}

