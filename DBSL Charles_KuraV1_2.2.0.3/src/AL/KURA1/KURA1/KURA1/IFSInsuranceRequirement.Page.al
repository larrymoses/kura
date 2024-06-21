#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75127 "IFS Insurance Requirement"
{
    PageType = List;
    SourceTable = "IFS Insurance Requirement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IFS Code";"IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Type";"Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Cover Type";"Policy Cover Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Policy Coverage (LCY)";"Minimum Policy Coverage (LCY)")
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

