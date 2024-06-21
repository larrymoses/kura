#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72734 "Road Camps Lines"
{
    PageType = ListPart;
    SourceTable = "Road Camps Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Camp No";"Camp No")
                {
                    ApplicationArea = Basic;
                }
                field("Camp Name";"Camp Name")
                {
                    ApplicationArea = Basic;
                }
                field("Parcel Number";"Parcel Number")
                {
                    ApplicationArea = Basic;
                }
                field("Physical Location";"Physical Location")
                {
                    ApplicationArea = Basic;
                }
                field("Approximate Size(Ha.)";"Approximate Size(Ha.)")
                {
                    ApplicationArea = Basic;
                }
                field(County;County)
                {
                    ApplicationArea = Basic;
                }
                field("Layout/Spatial Reference";"Layout/Spatial Reference")
                {
                    ApplicationArea = Basic;
                }
                field("Web GIS URL";"Web GIS URL")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
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

