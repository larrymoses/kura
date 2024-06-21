#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75170 "RFI Responsibility Center"
{
    PageType = List;
    SourceTable = "RFI Responsibility Center";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Responsibility Center ID";"Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Code';
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Region';
                }
                field("Constituency Code";"Constituency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Constituency;Constituency)
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

