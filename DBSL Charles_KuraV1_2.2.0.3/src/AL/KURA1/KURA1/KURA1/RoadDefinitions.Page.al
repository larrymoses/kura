#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72052 "Road Definitions"
{
    CardPageID = "Road Definition Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Road Definition";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Properties Of Link';
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Link Name";"Link Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class";"Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage(Km)";"Start Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(Km)";"End Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Link Length(Km)";"Link Length(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Surface Type";"Surface Type")
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

