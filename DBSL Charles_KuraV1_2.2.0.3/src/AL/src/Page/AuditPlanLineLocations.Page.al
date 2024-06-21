#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95169 "Audit Plan Line Locations"
{
    CardPageID = "Audit Plan Line Location";
    PageType = List;
    SourceTable = "Audit Plan Line Location";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Plan ID";"Audit Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement Line No.";"Engagement Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Location ID";"Audit Location ID")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Audit Location";
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center ID";"Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Responsibility Center";
                }
                field("Audit Site Type";"Audit Site Type")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Person";"Contact Person")
                {
                    ApplicationArea = Basic;
                    TableRelation = Resource;
                }
                field("Primary Email";"Primary Email")
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No.";"Telephone No.")
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

