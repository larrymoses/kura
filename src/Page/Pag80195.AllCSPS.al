#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80195 "All CSPS"
{
    CardPageID = "All CSP CARD";
    Editable = false;
    PageType = List;
    SourceTable = "Corporate Strategic Plans";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Theme";"Primary Theme")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Framework";"Strategy Framework")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Duration (Years)";"Duration (Years)")
                {
                    ApplicationArea = Basic;
                }
                field("Vision Statement";"Vision Statement")
                {
                    ApplicationArea = Basic;
                }
                field("Mission Statement";"Mission Statement")
                {
                    ApplicationArea = Basic;
                }
                field("Implementation Status";"Implementation Status")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
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

