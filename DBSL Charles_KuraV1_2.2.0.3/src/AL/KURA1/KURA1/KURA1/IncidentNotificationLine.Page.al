#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72090 "Incident Notification Line"
{
    PageType = ListPart;
    SourceTable = "Incident Notification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                }
                field(Caller;Caller)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No";"Phone No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Date Of Incident";"Date Of Incident")
                {
                    ApplicationArea = Basic;
                }
                field("Time of Incident";"Time of Incident")
                {
                    ApplicationArea = Basic;
                }
                field("Road Chainage";"Road Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Road Location";"Road Location")
                {
                    ApplicationArea = Basic;
                }
                field("Information Resource";"Information Resource")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Incident";"Nature of Incident")
                {
                    ApplicationArea = Basic;
                }
                field("Location Of Incident";"Location Of Incident")
                {
                    ApplicationArea = Basic;
                }
                field("Condition of Accident Vehicles";"Condition of Accident Vehicles")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Injured People";"No. Of Injured People")
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

