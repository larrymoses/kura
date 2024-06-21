#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69490 "Incident Severity Levels"
{
    CardPageID = "Incident Severity Level";
    PageType = List;
    SourceTable = "Incident Severity Level";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Reported Incidents";Rec."No. Of Reported Incidents")
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
