#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70102 "Asset Disposals List"
{
    CardPageID = "Asset Disposal Card";
    PageType = List;
    SourceTable = "Asset Disposal";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Disposal No";"Disposal No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Asset Code";"Asset Code")
                {
                    ApplicationArea = Basic;
                }
                field("Language Code (Default)";"Language Code (Default)")
                {
                    ApplicationArea = Basic;
                }
                field(Attachement;Attachement)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Code";"Committee Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Asset Name";"Asset Name")
                {
                    ApplicationArea = Basic;
                }
                field("Valuation Amount";"Valuation Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Recommendations";"Committee Recommendations")
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

