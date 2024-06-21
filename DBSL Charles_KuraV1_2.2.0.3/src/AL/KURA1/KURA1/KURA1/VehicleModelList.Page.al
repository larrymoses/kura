#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59004 "Vehicle Model List"
{
    CardPageID = "Vehicle Model Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Vehicle Model";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Make;Make)
                {
                    ApplicationArea = Basic;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'Mode';
                }
                field(Description;Description)
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

