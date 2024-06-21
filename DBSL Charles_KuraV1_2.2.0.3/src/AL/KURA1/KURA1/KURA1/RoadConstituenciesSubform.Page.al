#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72771 "Road Constituencies Subform"
{
    PageType = ListPart;
    SourceTable = "Road Constituency";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Constituency Code";"Constituency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Name";"Constituency Name")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage(KM)";"Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(KM)";"End Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Chainage Description";"Chainage Description")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Notes";"Additional Notes")
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

