#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69778 "Ability Responses"
{
    ApplicationArea = Basic;
    CardPageID = "Test Response Card";
    Editable = false;
    PageType = List;
    SourceTable = "Ability Test Response";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Response ID";"Response ID")
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test Invitation No.";"Ability Test Invitation No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Test ID";"Test ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead HR Officer";"Lead HR Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate No.";"Candidate No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name";"First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name";"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name";"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Test Start Time";"Test Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Test End Time";"Test End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Total No. of Questions";"Total No. of Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Total No. of Pass Questions";"Total No. of Pass Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test Pass Score %";"Ability Test Pass Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Response Status";"Response Status")
                {
                    ApplicationArea = Basic;
                }
                field("Application No.";"Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("Test Date";"Test Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control22;Outlook)
            {
            }
            systempart(Control23;Notes)
            {
            }
            systempart(Control24;MyNotes)
            {
            }
            systempart(Control25;Links)
            {
            }
        }
    }

    actions
    {
    }
}

