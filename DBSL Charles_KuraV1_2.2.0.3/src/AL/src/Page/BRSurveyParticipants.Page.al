#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80350 "BR Survey Participants"
{
    PageType = List;
    SourceTable = "BR Survey Participant";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Target Respondent Type";"Target Respondent Type")
                {
                    ApplicationArea = Basic;
                }
                field("Participant ID";"Participant ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Response Due Date";"Response Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(Invited;Invited)
                {
                    ApplicationArea = Basic;
                }
                field("Date Invited";"Date Invited")
                {
                    ApplicationArea = Basic;
                }
                field("Time Invited";"Time Invited")
                {
                    ApplicationArea = Basic;
                }
                field("Invited By";"Invited By")
                {
                    ApplicationArea = Basic;
                }
                field("Survey Response ID";"Survey Response ID")
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

