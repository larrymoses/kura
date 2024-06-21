#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75043 "RFI Category Requirement"
{
    PageType = List;
    SourceTable = "RFI Category Requirement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Category ID";"Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Code";"Requirement Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";"Requirement Type")
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

