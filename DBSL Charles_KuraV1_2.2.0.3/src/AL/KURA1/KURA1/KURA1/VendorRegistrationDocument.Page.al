#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75015 "Vendor Registration Document"
{
    PageType = List;
    SourceTable = "Vendor Registration Document";

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
                field("Global Requirement";"Global Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Special Group Requirement";"Special Group Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor (Works Requirement)";"Contractor (Works Requirement)")
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

