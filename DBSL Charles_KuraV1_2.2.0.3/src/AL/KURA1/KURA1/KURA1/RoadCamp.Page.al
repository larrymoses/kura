#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72733 "Road Camp"
{
    PageType = Card;
    SourceTable = "Road Camps Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region Name";"Region Name")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Staff No";"Assigned Staff No")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Staff Name";"Assigned Staff Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date Time";"Created Date Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control11;"Road Camps Lines")
            {
                SubPageLink = "Document No"=field("Document No");
            }
        }
    }

    actions
    {
    }
}

